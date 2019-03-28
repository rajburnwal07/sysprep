### Upgrade from WAR to WAR

# echo "***********************************************************************************************"
# read -p "Provide ISO Location. i.e: /home/cb/CB_10.0.iso /home/cb/: "  iso_location
# echo "iso_location: $iso_location!"

iso_location=/home/DF2WAR/CB_10.0
#iso_name=CB_10.0

################### Initializing variables ###################
SYNERGY_HOME="/usr/share/tomcat/webapps/eas"
CATALINA_HOME="/usr/share/tomcat"
WAR_FOLDERNAME="qzpjxk"
BASEDIR="/home/cb/"
Compare_War_location="/home/Compare_War"
BACKUP_DIRECTORY_NAME=$(date "+%d.%m.%Y-%H.%M.%S")
compare_list="branding;css;images;plugins;resources;lib"
app_name="eas"
##############################################################

################### Get ISO Name ############################
for f in `ls $iso_location/ISO/Portal/*.zip`; do echo " "; done
temp="${f##*/}"
iso_name=${temp%.*}
echo "ISO Name: $iso_name"
##############################################################

echo "Extracting Portal"
unzip -o $iso_location/ISO/Portal/$iso_name.zip -d $iso_location/ISO/Portal/

cd "$iso_location/ISO/Portal/$iso_name/webapps/"
unzip -o order.zip
if [ "$?" != "0" ]; then
    echo "[Error] order.zip unzip failed!"
    exit 1
fi

mv "$iso_location/ISO/Portal/$iso_name/webapps/order.war" "$app_name.war"
if [ "$?" != "0" ]; then
    echo "[Error] rename failed!"
    exit 1
fi

echo "Stopping Tomcat"
service tomcat stop
# sleep 30
service tomcat status

#****************** Taking Backup War/ESCM-DataFiles *********************#
echo "Taking Backup War/ESCM-DataFiles"
mkdir -p "/home/BACKUP/$BACKUP_DIRECTORY_NAME"
cp -r "$SYNERGY_HOME" "/home/BACKUP/$BACKUP_DIRECTORY_NAME/"

mv "$SYNERGY_HOME.war" "/home/BACKUP/$BACKUP_DIRECTORY_NAME/"

cp -r "$CATALINA_HOME/ESCM-DataFiles/" "/home/BACKUP/$BACKUP_DIRECTORY_NAME/"
if [ "$?" != "0" ]; then
    echo "[Error] copy failed!"
   exit 1
fi
#*******************************************************************#

#******************Merging ESCM-DataFiles & New War*********************#
echo "Merging ESCM-DataFiles & New WAR"
rm -rf "$Compare_War_location"
mkdir -p /home/Compare_War/{Old_War,New_War}
mkdir -p $Compare_War_location/Old_War/WEB-INF
mkdir -p $Compare_War_location/New_War/WEB-INF
cd $Compare_War_location

echo "Copying $compare_list from Old WAR"
export IFS=";"
for word in $compare_list; do
if [ "$word" == "lib" ]; then
    echo "Copying $word"
	cp -r "$SYNERGY_HOME/WEB-INF/$word" "$Compare_War_location/Old_War/WEB-INF/"
else
   echo "Copying $word"
   cp -r "$SYNERGY_HOME/$word" "$Compare_War_location/Old_War/"
fi
done

echo Removing Exsisting WAR
rm -rf "$SYNERGY_HOME" 
rm -rf "$SYNERGY_HOME.war"

echo "Copying WAR to SYNERGY_HOME"
cp "$iso_location/ISO/Portal/$iso_name/webapps/$app_name.war" "$CATALINA_HOME/webapps/"

echo Extracting New War
cd "$CATALINA_HOME/webapps/"
ls
unzip -o "$app_name.war" -d "$app_name"

echo "Copying $compare_list from New WAR"
export IFS=";"
for word in $compare_list; do
if [ "$word" == "lib" ]; then
    echo "Copying $word"
	cp -r "$SYNERGY_HOME/WEB-INF/$word" "$Compare_War_location/New_War/WEB-INF/"
else
   echo "Copying $word"
   cp -r "$SYNERGY_HOME/$word" "$Compare_War_location/New_War/"
fi
done

echo "Copy latest Branding folder to existing WAR before merging"
echo yes | cp -fru "$Compare_War_location/New_War/branding/." "$Compare_War_location/Old_War/branding/"


echo Copy JAVA file for comparing
cp "$iso_location/ISO/Utilities/CITools/lib/CompareFile.class" "$Compare_War_location"

echo Comparing for extracting the Delta-WAR
cd "$Compare_War_location"
java CompareFile "$Compare_War_location/Old_War" "$Compare_War_location/New_War"

echo Merging Delta WAR with the existing customized WAR
export IFS=";"
for word in $compare_list; do
if [ "$word" == "lib" ]; then
    echo "Copying $word"
	echo yes | cp -fru "$Compare_War_location/New_War/WEB-INF/$word/." "$Compare_War_location/Old_War/WEB-INF/$word"
else
   echo "Copying $word"
   echo yes | cp -fru "$Compare_War_location/New_War/$word/." "$Compare_War_location/Old_War/$word"
fi
done

echo Copy Merged WAR to SYNERGY_HOME location
export IFS=";"
for word in $compare_list; do
if [ "$word" == "lib" ]; then
    echo "Copying $word"
	echo yes | cp -fru "$Compare_War_location/Old_War/WEB-INF/$word/." "$SYNERGY_HOME/WEB-INF/$word/"
else
   echo "Copying $word"
   echo yes | cp -fru "$Compare_War_location/Old_War/$word/." "$SYNERGY_HOME/$word/"
fi
done
#*******************************************************************#

#****************** Removing ESCM-DataFiles Content ************************#
export IFS=";"
for word in $compare_list; do
    echo "Removing $word"
	rm -rf "$CATALINA_HOME/ESCM-DataFiles/$word" 
done

#*******************************************************************#

#************************Starting Tomcat ***************************#
echo "Starting Tomcat"
service tomcat start

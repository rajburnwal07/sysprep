# echo "***********************************************************************************************"
# read -p "Provide ISO Location. i.e: /home/cb/CB_10.0.iso /home/cb/: "  iso_location
# echo "iso_location: $iso_location!"

iso_location=/home/DF2WAR/CB_10.0
#iso_name=CB_10.0

################### Get ISO Name ############################
for f in `ls $iso_location/ISO/Portal/*.zip`; do echo " "; done
temp="${f##*/}"
iso_name=${temp%.*}
echo "ISO Name: $iso_name"
##############################################################

echo "Extracting Portal"
unzip $iso_location/ISO/Portal/$iso_name.zip -d $iso_location/ISO/Portal/

cd "$iso_location/ISO/Portal/$iso_name/webapps/"
unzip order.zip
if [ "$?" != "0" ]; then
    echo "[Error] order.zip unzip failed!"
    exit 1
fi

################### Initializing variables ###################
SYNERGY_HOME="/usr/share/tomcat/webapps/eas"
CATALINA_HOME="/usr/share/tomcat"
WAR_FOLDERNAME="qzpjxk"
BASEDIR="/home/cb/"
Compare_War_location="/home/Compare_War"
BACKUP_DIRECTORY_NAME=$(date "+%d.%m.%Y-%H.%M.%S")
##############################################################

echo "Stopping Tomcat"
service tomcat stop
# sleep 30
service tomcat status

#****************** Taking Backup War/ESCM-DataFiles *********************#
echo "Taking Backup War/ESCM-DataFiles"
mkdir -p "/home/BACKUP/$BACKUP_DIRECTORY_NAME"
mv "$SYNERGY_HOME" "/home/BACKUP/$BACKUP_DIRECTORY_NAME/"

mv "$SYNERGY_HOME.war" "/home/BACKUP/$BACKUP_DIRECTORY_NAME/"

cp -r "$CATALINA_HOME/ESCM-DataFiles/" "/home/BACKUP/$BACKUP_DIRECTORY_NAME/"
if [ "$?" != "0" ]; then
    echo "[Error] copy failed!"
   exit 1
fi
#*******************************************************************#

#******************Merging ESCM-DataFiles & New War*********************#
echo "Merging ESCM-DataFiles & New War"
rm -rf "$Compare_War_location"
mkdir -p /home/Compare_War/{DF_WAR_Struct,New_War}
cd $Compare_War_location
ls
cp -r "$CATALINA_HOME/ESCM-DataFiles/branding" "$Compare_War_location/DF_WAR_Struct/"
cp -r "$CATALINA_HOME/ESCM-DataFiles/css" "$Compare_War_location/DF_WAR_Struct/"
cp -r "$CATALINA_HOME/ESCM-DataFiles/images" "$Compare_War_location/DF_WAR_Struct/"
cp -r "$CATALINA_HOME/ESCM-DataFiles/plugins" "$Compare_War_location/DF_WAR_Struct/"
cp -r "$CATALINA_HOME/ESCM-DataFiles/resources" "$Compare_War_location/DF_WAR_Struct/"
mkdir -p $Compare_War_location/DF_WAR_Struct/WEB-INF
cp -r "$CATALINA_HOME/ESCM-DataFiles/lib" "$Compare_War_location/DF_WAR_Struct/WEB-INF/"

cp "$iso_location/ISO/Portal/$iso_name/webapps/order.war" "$Compare_War_location/New_War/"

echo Extracting New War
cd "$Compare_War_location/New_War/"
ls
unzip "$Compare_War_location/New_War/order.war"
rm -rf "$Compare_War_location/New_War/order.war"

echo "Copy latest Branding folder to existing WAR before merging"
rsync -r "$Compare_War_location/New_War/branding/" "$Compare_War_location/DF_WAR_Struct/branding/"

echo Remove the files/dir if any not needed for merging
rm -rf "$Compare_War_location/New_War/branding"
rm -rf "$Compare_War_location/New_War/jquery-ui"
rm -rf "$Compare_War_location/New_War/js"
rm -rf "$Compare_War_location/New_War/META-INF"
rm -rf "$Compare_War_location/New_War/reports"
rm -rf "$Compare_War_location/New_War/synergy-DataSource.groovy"
rm -rf "$Compare_War_location/New_War/synergy-Config.groovy"
rm -rf "$Compare_War_location/New_War/synergy.properties"
rm -rf "$Compare_War_location/New_War/WEB-INF/classes"
rm -rf "$Compare_War_location/New_War/WEB-INF/grails-app/views"
rm -rf "$Compare_War_location/New_War/WEB-INF/plugins"
rm -rf "$Compare_War_location/New_War/WEB-INF/spring"
rm -rf "$Compare_War_location/New_War/WEB-INF/templates"
rm -rf "$Compare_War_location/New_War/WEB-INF/tld"
rm -rf "$Compare_War_location/New_War/WEB-INF/applicationContext.xml"
rm -rf "$Compare_War_location/New_War/WEB-INF/grails.xml"
rm -rf "$Compare_War_location/New_War/WEB-INF/sitemesh.xml"

echo Copy JAVA file to remote nodes for comparing
cp "$iso_location/ISO/Utilities/CITools/lib/CompareFile.class" "$Compare_War_location"

echo Executing the JAVA command for extracting the Delta-WAR
cd "$Compare_War_location"
java CompareFile "$Compare_War_location/DF_WAR_Struct" "$Compare_War_location/New_War"

echo Merging Delta WAR with the existing customized WAR
rsync -r "$Compare_War_location/New_War/" "$Compare_War_location/DF_WAR_Struct/"
#*******************************************************************#

#****************** Copy WAR to SYNERGY_HOME ************************#
echo Removing Exsisting Files
rm -rf "$SYNERGY_HOME" 
rm -rf "$SYNERGY_HOME.war"

rm -rf "$CATALINA_HOME/ESCM-DataFiles/branding"
rm -rf "$CATALINA_HOME/ESCM-DataFiles/css"
rm -rf "$CATALINA_HOME/ESCM-DataFiles/i18n"
rm -rf "$CATALINA_HOME/ESCM-DataFiles/images"
rm -rf "$CATALINA_HOME/ESCM-DataFiles/plugins"
rm -rf "$CATALINA_HOME/ESCM-DataFiles/resources"
rm -rf "$CATALINA_HOME/ESCM-DataFiles/lib"
rm -rf "$CATALINA_HOME/ESCM-DataFiles/unused_files"

echo Copying WAR
cp "$iso_location/ISO/Portal/$iso_name/webapps/order.war" "$CATALINA_HOME/webapps/"
if [ "$?" != "0" ]; then
    echo "[Error] order.zip copy failed!"
    exit 1
fi

mv "$CATALINA_HOME/webapps/order.war" "$SYNERGY_HOME.war"
if [ "$?" != "0" ]; then
    echo "[Error] rename failed!"
    exit 1
fi
#*******************************************************************#

#************************Starting Tomcat ***************************#
echo "Starting Tomcat"
service tomcat start
sleep 5m

echo "Stoping Tomcat"
service tomcat stop
sleep 30

echo Copy Merged WAR to synergy_home location
rsync -r "$Compare_War_location/DF_WAR_Struct/" "$SYNERGY_HOME/"

echo "Starting Tomcat"
service tomcat start

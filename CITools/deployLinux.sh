#!/bin/bash

# echo "***********************************************************************************************"
# read -p "Provide Order.zip Location. i.e: /home/DF2WAR/CB_10.0/ISO/Portal/CB_10.0/webapps/: "  order_location
# echo "order_location: $order_location"

# order_location=/home/Deployment/CB_10.0/webapps/order.zip
order_location=$1

################### User variables ###################
SYNERGY_HOME="/usr/share/tomcat/webapps/escm"
CATALINA_HOME="/usr/share/tomcat"

##############################################################

################### Initializing variables ###################
Compare_War_location="/home/Compare_War"
BACKUP_DIRECTORY_NAME=$(date "+%d.%m.%Y-%H.%M.%S")
compare_list="branding;css;images;plugins;resources;lib"
##############################################################


#****************** Taking Backup War/ESCM-DataFiles Function *********************#
backup(){
    echo "Taking Backup War/ESCM-DataFiles"
	mkdir -p "/home/BACKUP/$BACKUP_DIRECTORY_NAME"
	cp -r "$SYNERGY_HOME" "/home/BACKUP/$BACKUP_DIRECTORY_NAME/"

	mv "$SYNERGY_HOME.war" "/home/BACKUP/$BACKUP_DIRECTORY_NAME/"

	cp -r "$CATALINA_HOME/ESCM-DataFiles/" "/home/BACKUP/$BACKUP_DIRECTORY_NAME/"
	if [ "$?" != "0" ]; then
		echo "[Error] copy failed!"
		exit 1
	fi
}
#*******************************************************************#

#****************** Copying ESCM-DataFiles For Merging Function *********************#
df_copy(){
	rm -rf "$Compare_War_location/DF_WAR_Struct"
	mkdir -p $Compare_War_location/DF_WAR_Struct
	mkdir -p $Compare_War_location/DF_WAR_Struct/WEB-INF
	echo "Copying $compare_list from ESCM-DataFiles"
	export IFS=";"
	for word in $compare_list; do
	if [ "$word" == "lib" ]; then
		echo "Copying $word"
		cp -r "$CATALINA_HOME/ESCM-DataFiles/$word" "$Compare_War_location/DF_WAR_Struct/WEB-INF/"
	else
	   echo "Copying $word"
	   cp -r "$CATALINA_HOME/ESCM-DataFiles/$word" "$Compare_War_location/DF_WAR_Struct/"
	fi
	done
}
#*******************************************************************#

#****************** Copying Old WAR For Merging Function *********************#
old_war_copy(){
	rm -rf "$Compare_War_location/old_war"
	mkdir -p $Compare_War_location/old_war
	mkdir -p $Compare_War_location/old_war/WEB-INF
	echo "Copying old $compare_list from SYNERGY_HOME"
	export IFS=";"
	for word in $compare_list; do
	if [ "$word" == "lib" ]; then
		echo "Copying $word"
		cp -r "$SYNERGY_HOME/WEB-INF/$word" "$Compare_War_location/old_war/WEB-INF/"
	else
	   echo "Copying $word"
	   cp -r "$SYNERGY_HOME/$word" "$Compare_War_location/old_war/"
	fi
	done
}
#*******************************************************************#

#****************** Copying New WAR For Merging Function *********************#
new_war_copy(){
	echo Removing Exsisting WAR
	rm -rf "$SYNERGY_HOME" 
	rm -rf "$SYNERGY_HOME.war"
	rm -rf "$Compare_War_location/new_war"
	mkdir -p $Compare_War_location/new_war
	mkdir -p $Compare_War_location/new_war/WEB-INF
	echo $PWD
	cp "$war_location/order.war" "$SYNERGY_HOME.war"
				if [ "$?" != "0" ]; then
					echo "[Error] rename failed!"
					exit 1
				fi
	rm -rf "$war_location/order.war"
	echo Extracting New WAR
	unzip -o "$SYNERGY_HOME.war" -d "$SYNERGY_HOME"
	
	echo "Copying New $compare_list from SYNERGY_HOME"
	export IFS=";"
	for word in $compare_list; do
	if [ "$word" == "lib" ]; then
		echo "Copying $word"
		cp -r "$SYNERGY_HOME/WEB-INF/$word" "$Compare_War_location/new_war/WEB-INF/"
	else
	   echo "Copying $word"
	   cp -r "$SYNERGY_HOME/$word" "$Compare_War_location/new_war/"
	fi
	done
}
#*******************************************************************#

#****************** Merging ESCM-DataFiles/Old WAR & New War Function *********************#
compare_folder(){
	echo Copy JAVA file for comparing
	cp "$war_location/lib/CompareFile.class" "$Compare_War_location"
	
	local source_dir=$1
	local dest_dir=$2
	echo Source Folder: $source_dir
	echo Destination Folder: $dest_dir
	
	echo "Copy latest Branding folder to existing WAR before merging"
	echo yes | cp -fru "$dest_dir/branding/." "$source_dir/branding/"
	
	echo "Removing Branding folder from New War"
	rm -rf "$dest_dir/branding"
  
	echo Comparing for extracting the Delta-WAR
	cd "$Compare_War_location"
	java CompareFile "$source_dir" "$dest_dir"
	
	echo Merging Delta WAR with the existing customized WAR
	export IFS=";"
	for word in $compare_list; do
	if [ "$word" == "lib" ]; then
		if [ -d "$dest_dir/WEB-INF/$word" ]; then
			echo "Copying $word"
			echo yes | cp -fru "$dest_dir/WEB-INF/$word/." "$source_dir/WEB-INF/$word"
		fi
	else
		if [ -d "$dest_dir/$word" ]; then
			echo "Copying $word"
			echo yes | cp -fru "$dest_dir/$word/." "$source_dir/$word"
		fi
	fi
	done

	echo Copy Merged WAR to SYNERGY_HOME location
	export IFS=";"
	for word in $compare_list; do
	if [ "$word" == "lib" ]; then
		if [ -d "$source_dir/WEB-INF/$word" ]; then
			echo "Copying $word"
			echo yes | cp -fru "$source_dir/WEB-INF/$word/." "$SYNERGY_HOME/WEB-INF/$word/"
		fi
	else
		if [ -d "$source_dir/$word" ]; then
		   echo "Copying $word"
		   echo yes | cp -fru "$source_dir/$word/." "$SYNERGY_HOME/$word/"
		fi
	fi
	done
}
#*******************************************************************#

#****************** Removing ESCM-DataFiles Content Function *********************#
rm_df(){
	export IFS=";"
	for word in $compare_list; do
		if [ -d "$CATALINA_HOME/ESCM-DataFiles/$word" ]; then
			echo "Removing $word"
			rm -rf "$CATALINA_HOME/ESCM-DataFiles/$word"
		fi
	done
}
#*******************************************************************#

###### Taking Decision {Fresh, Upgrade:DF2War, War2War} #######

if [ -d "$CATALINA_HOME/ESCM-DataFiles" ]; then     ##Checking ESCM-DataFiles exist
  if [ ! -d "$SYNERGY_HOME" ]; then                ##Checking SYNERGY_HOME not exist
    echo "Fresh Deployment"
    flag=1
  else
    if [ -d "$CATALINA_HOME/ESCM-DataFiles/branding" ]; then      ##Checking images,lib,css inside ESCM-DataFiles exist
		  echo "ESCM-DataFiles to WAR Upgrade"
      flag=2
    else
		  echo "WAR to WAR Upgrade"
      flag=3
    fi
  fi  
else
	echo "ESCM-DataFiles doesn't exist, Place ESCM-DataFiles under $CATALINA_HOME/ location"
  exit 0
fi
echo "flag: $flag"
##############################################################

########################## Extract zip #######################
echo "Extracting Order.zip"
war_location="$(dirname "$0")"
echo "war_location $war_location"
unzip -o "$order_location" -d $war_location
if [ "$?" != "0" ]; then
    echo "[Error] order.zip unzip failed!"
    exit 1
fi
##############################################################

###### Deploying according to flag value #######
case "$flag" in                 ## case responds to flag
            "1" )
                echo "Fresh Deployment"
				cp "$war_location/order.war" "$SYNERGY_HOME.war"
				if [ "$?" != "0" ]; then
					echo "[Error] rename failed!"
					exit 1
				fi
				rm -rf "$war_location/order.war"
                break                    
                ;;
            "2" )         
                echo "ESCM-DataFiles to WAR Upgrade"
				backup
				df_copy
				new_war_copy
				compare_folder "$Compare_War_location/DF_WAR_Struct" "$Compare_War_location/new_war"
				rm_df
                break
                ;;
            "3" )
                echo "WAR to WAR Upgrade"
				backup
				old_war_copy
				new_war_copy
				compare_folder "$Compare_War_location/old_war" "$Compare_War_location/new_war"
                break
                ;;
esac
echo "Deployment Completed, proceed for next steps."
exit 0
##############################################################


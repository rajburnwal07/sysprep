#!/bin/bash

# echo "***********************************************************************************************"
# read -p "Provide Order.zip Location. i.e: /home/DF2WAR/CB_10.0/ISO/Portal/CB_10.0/webapps/: "  order_location
# echo "order_location: $order_location"

# order_location=/home/Deployment/CB_10.0/webapps/order.zip
order_location=$1
echo order_location: $order_location

################### User variables ###################
SYNERGY_HOME="/usr/share/tomcat/webapps/escm"
CATALINA_HOME="/usr/share/tomcat"

##############################################################

################### Initializing variables ###################
Compare_War_location="./Compare_War"
BACKUP_DIRECTORY_NAME=$(date "+%d.%m.%Y-%H.%M.%S")
Backup_location=./BACKUP/$BACKUP_DIRECTORY_NAME
compare_list="branding;css;images;plugins;resources;lib;i18n"
##############################################################

#****************** Fresh Deploy War/ESCM-DataFiles Function *********************#
fresh(){
    echo "Deploying WAR"
	echo "war_location $war_location"
	cp "$war_location/order.war" "$SYNERGY_HOME.war"
	if [ "$?" != "0" ]; then
		echo "[Error] WAR Deploy failed!"
		exit 1
	fi
	rm -rf "$war_location/order.war"
	echo "Deployment ESCM-DataFiles"
	cp -r "$DataFiles_location/ESCM-DataFiles" "$CATALINA_HOME/"
	if [ "$?" != "0" ]; then
		echo "[Error] ESCM-DataFiles Deploy failed!"
		exit 1
	fi
}
#*******************************************************************#


#****************** Taking Backup War/ESCM-DataFiles Function *********************#
backup(){
    echo "Taking Backup War/ESCM-DataFiles"
	mkdir -p "$Backup_location"
	if [ "$?" != "0" ]; then
		echo "[Error] $Backup_location directory creation failed!"
		exit 1
	fi
	
	cp -r "$SYNERGY_HOME" "$Backup_location/"
	if [ "$?" != "0" ]; then
		echo "[Error] Backup failed!"
		exit 1
	fi

	cp "$SYNERGY_HOME.war" "$Backup_location/"
	if [ "$?" != "0" ]; then
		echo "[Error] Backup failed!"
		exit 1
	fi

	cp -r "$CATALINA_HOME/ESCM-DataFiles/" "$Backup_location/"
	if [ "$?" != "0" ]; then
		echo "[Error] Backup failed!"
		exit 1
	fi
}
#*******************************************************************#

#****************** Restore War/ESCM-DataFiles Function *********************#
restore(){
    echo "Restoring to previous state"
	cp -r "$Backup_location/$appname" "$CATALINA_HOME/webapps/"
	if [ "$?" != "0" ]; then
		echo "[Error] Restore failed!"
		echo "Proceed for manual restore from location $Backup_location"
		exit 1
	fi

	cp "$Backup_location/$appname.war" "$CATALINA_HOME/webapps/"
	if [ "$?" != "0" ]; then
		echo "[Error] Restore failed!"
		echo "Proceed for manual restore from location $Backup_location"
		exit 1
	fi

	cp -r "$Backup_location/ESCM-DataFiles/." "$CATALINA_HOME/ESCM-DataFiles/"
	if [ "$?" != "0" ]; then
		echo "[Error] Restore failed!"
		echo "Proceed for manual restore from location $Backup_location"
		exit 1
	fi
}
#*******************************************************************#

#****************** Copying ESCM-DataFiles For Merging Function *********************#
df_copy(){
	echo "Copying ESCM-DataFiles For Merging"
	rm -rf "$Compare_War_location/DF_WAR_Struct"
	mkdir -p $Compare_War_location/DF_WAR_Struct
	mkdir -p $Compare_War_location/DF_WAR_Struct/WEB-INF/grails-app/i18n
	echo "Copying $compare_list from ESCM-DataFiles"
	export IFS=";"
	for word in $compare_list; do
	if [ "$word" == "lib" ]; then
		echo "Copying $word"
		cp -r "$CATALINA_HOME/ESCM-DataFiles/$word" "$Compare_War_location/DF_WAR_Struct/WEB-INF/"
		if [ "$?" != "0" ]; then
			echo "[Error] Copy failed!"
			exit 1
		fi
	elif [ "$word" == "i18n" ]; then
		echo "Copying $word"
		cp -r "$CATALINA_HOME/ESCM-DataFiles/$word" "$Compare_War_location/DF_WAR_Struct/WEB-INF/grails-app/"
		if [ "$?" != "0" ]; then
			echo "[Error] Copy failed!"
			exit 1
		fi
	else
		echo "Copying $word"
		cp -r "$CATALINA_HOME/ESCM-DataFiles/$word" "$Compare_War_location/DF_WAR_Struct/"
		if [ "$?" != "0" ]; then
			echo "[Error] Copy failed!"
			exit 1
		fi
	fi
	done
	##cp "$CATALINA_HOME/ESCM-DataFiles/i18n/messages.properties" "$Compare_War_location/DF_WAR_Struct/WEB-INF/grails-app/i18n"
	cp "$SYNERGY_HOME/WEB-INF/web.xml" "$Compare_War_location"
}
#*******************************************************************#

#****************** Copying Old WAR For Merging Function *********************#
old_war_copy(){
	echo "Copying Old WAR For Merging"
	rm -rf "$Compare_War_location/old_war"
	mkdir -p $Compare_War_location/old_war
	mkdir -p $Compare_War_location/old_war/WEB-INF/grails-app/i18n
	echo "Copying old $compare_list from SYNERGY_HOME"
	export IFS=";"
	for word in $compare_list; do
	if [ "$word" == "lib" ]; then
		echo "Copying $word"
		cp -r "$SYNERGY_HOME/WEB-INF/$word" "$Compare_War_location/old_war/WEB-INF/"
		if [ "$?" != "0" ]; then
			echo "[Error] Copy failed!"
			exit 1
		fi
	elif [ "$word" == "i18n" ]; then
		echo "Copying $word"
		cp -r "$SYNERGY_HOME/WEB-INF/grails-app/$word" "$Compare_War_location/old_war/WEB-INF/grails-app/"
		if [ "$?" != "0" ]; then
			echo "[Error] Copy failed!"
			exit 1
		fi
	else
	   echo "Copying $word"
	   cp -r "$SYNERGY_HOME/$word" "$Compare_War_location/old_war/"
	   if [ "$?" != "0" ]; then
			echo "[Error] Copy failed!"
			exit 1
		fi
	fi
	done
	##cp "$SYNERGY_HOME/WEB-INF/grails-app/i18n/messages.properties" "$Compare_War_location/old_war/WEB-INF/grails-app/i18n"
	cp "$SYNERGY_HOME/WEB-INF/web.xml" "$Compare_War_location"
}
#*******************************************************************#

#****************** Copying New WAR For Merging Function *********************#
new_war_copy(){
	echo "Copying New WAR For Merging"
	echo Removing Exsisting WAR
	rm -rf "$SYNERGY_HOME"
	if [ "$?" != "0" ]; then
		echo "[Error] remove failed!"
		restore
	fi
	rm -rf "$SYNERGY_HOME.war"
	if [ "$?" != "0" ]; then
		echo "[Error] remove failed!"
		restore
	fi
	rm -rf "$Compare_War_location/new_war"
	mkdir -p $Compare_War_location/new_war
	mkdir -p $Compare_War_location/new_war/WEB-INF/grails-app/i18n
	echo $PWD
	cp "$war_location/order.war" "$SYNERGY_HOME.war"
	if [ "$?" != "0" ]; then
		echo "[Error] New WAR Copy failed!"
		restore
	fi
	rm -rf "$war_location/order.war"
	echo Extracting New WAR
	unzip -o "$SYNERGY_HOME.war" -d "$SYNERGY_HOME"
	if [ "$?" != "0" ]; then
		echo "[Error] Unzip failed!"
		restore
	fi
	
	echo "Copying New $compare_list from SYNERGY_HOME"
	export IFS=";"
	for word in $compare_list; do
	if [ "$word" == "lib" ]; then
		echo "Copying $word"
		cp -r "$SYNERGY_HOME/WEB-INF/$word" "$Compare_War_location/new_war/WEB-INF/"
		if [ "$?" != "0" ]; then
			echo "[Error] Copying failed!"
			restore
		fi
	elif [ "$word" == "lib" ]; then
		echo "Copying $word"
		cp -r "$SYNERGY_HOME/WEB-INF/grails-app/$word" "$Compare_War_location/new_war/WEB-INF/grails-app/"
		if [ "$?" != "0" ]; then
			echo "[Error] Copying failed!"
			restore
		fi
	else
	   echo "Copying $word"
	   cp -r "$SYNERGY_HOME/$word" "$Compare_War_location/new_war/"
	   if [ "$?" != "0" ]; then
			echo "[Error] Copying failed!"
			restore
		fi
	fi
	done
	##cp "$SYNERGY_HOME/WEB-INF/grails-app/i18n/messages.properties" "$Compare_War_location/new_war/WEB-INF/grails-app/i18n"
}
#*******************************************************************#

#****************** Merging ESCM-DataFiles/Old WAR & New War Function *********************#
compare_folder(){
	echo Comparing Folders
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
	if [ "$?" != "0" ]; then
		echo "[Error] Comparing failed!"
		restore
	fi
	
	echo Merging Delta WAR with the existing customized WAR
	export IFS=";"
	for word in $compare_list; do
	if [ "$word" == "lib" ]; then
		if [ -d "$dest_dir/WEB-INF/$word" ]; then
			echo "Copying $word"
			echo yes | cp -fru "$dest_dir/WEB-INF/$word/." "$source_dir/WEB-INF/$word"
			if [ "$?" != "0" ]; then
				echo "[Error] Merging failed!"
				restore
			fi
		fi
	elif [ "$word" == "i18n" ]; then
		if [ -d "$dest_dir/WEB-INF/grails-app/$word" ]; then
			echo "Copying $word"
			echo yes | cp -fru "$dest_dir/WEB-INF/grails-app/$word/." "$source_dir/WEB-INF/grails-app/$word"
			if [ "$?" != "0" ]; then
				echo "[Error] Merging failed!"
				restore
			fi
		fi
	else
		if [ -d "$dest_dir/$word" ]; then
			echo "Copying $word"
			echo yes | cp -fru "$dest_dir/$word/." "$source_dir/$word"
			if [ "$?" != "0" ]; then
				echo "[Error] Merging failed!"
				restore
			fi
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
			if [ "$?" != "0" ]; then
				echo "[Error] Merging failed!"
				restore
			fi
		fi
	elif [ "$word" == "i18n" ]; then
		if [ -d "$source_dir/WEB-INF/grails-app/$word" ]; then
			echo "Copying $word"
			echo yes | cp -fru "$source_dir/WEB-INF/grails-app/$word/." "$SYNERGY_HOME/WEB-INF/grails-app/$word/"
			if [ "$?" != "0" ]; then
				echo "[Error] Merging failed!"
				restore
			fi
		fi
	else
		if [ -d "$source_dir/$word" ]; then
		   echo "Copying $word"
		   echo yes | cp -fru "$source_dir/$word/." "$SYNERGY_HOME/$word/"
		   if [ "$?" != "0" ]; then
				echo "[Error] Merging failed!"
				restore
			fi
		fi
	fi
	done
	##cp -r "$Compare_War_location/old_war/WEB-INF/grails-app/i18n/messages.properties" "$SYNERGY_HOME/WEB-INF/grails-app/i18n" 
	cp "$Compare_War_location/web.xml" "$SYNERGY_HOME/WEB-INF/"
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
export IFS=";"
if [ -d "$CATALINA_HOME/ESCM-DataFiles" ]; then     ##Checking ESCM-DataFiles exist
    if [ -d "$CATALINA_HOME/ESCM-DataFiles/branding" ]; then      ##Checking images,lib,css inside ESCM-DataFiles exist
	##=============ESCM-DataFiles to WAR Upgrade::=============
		for word in $compare_list; do
			if [ -d "$CATALINA_HOME/ESCM-DataFiles/$word" ]; then
				echo "$word Found"
				flag=2
			else
				echo "$word Not Found"
				flag=0
				echo "Inconsistent ESCM-DataFiles"
				exit 1
			fi
		done
		
    else
	##=============WAR to WAR Upgrade::=============
		for word in $compare_list; do
			if [ ! -d "$CATALINA_HOME/ESCM-DataFiles/$word" ]; then
				echo "$word Not Found"
				flag=3
			else
				echo "$word Found"
				flag=0
				echo "Inconsistent ESCM-DataFiles"
				exit 1
			fi
		done
    fi
else
	##=============Fresh installation=============
	flag=1
fi
echo "Flag Value: $flag"

##############################################################

########################## Extract zip #######################
echo "Extracting Order.zip"
war_location="$(dirname "$0")"

if [ "$war_location" == "." ]; then
    war_location=$PWD
fi

echo "war_location $war_location"
unzip -o "$order_location/order.zip" -d "$war_location"
if [ "$?" != "0" ]; then
    echo "[Error] order.zip unzip failed!"
    exit 1
fi
cd "$order_location"
cd ..
DataFiles_location=$PWD
echo DataFiles_location: $DataFiles_location
############ Get APP Name from SYNERGY_HOME ##########
appname=${SYNERGY_HOME##*/}
echo App Name: $appname
##############################################################

###### Deploying according to flag value #######
case "$flag" in                 ## case responds to flag
            "1" )
                echo ============================ 
				echo =    Fresh Installation    =	 
				echo ============================
				fresh
                break                    
                ;;
            "2" )         
                echo ======================================= 
				echo =    ESCM-DataFiles to WAR Upgrade    =	 
				echo =======================================
				backup
				df_copy
				new_war_copy
				compare_folder "$Compare_War_location/DF_WAR_Struct" "$Compare_War_location/new_war"
				rm_df
                break
                ;;
            "3" )
                echo ============================
				echo =    WAR to WAR Upgrade    =	 
				echo ============================
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


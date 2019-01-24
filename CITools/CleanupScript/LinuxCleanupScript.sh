#------------- Initializing variables -------------#
#set the SYNERGY_HOME location as per your Tomcat setup
##SYNERGY_HOME="/usr/share/tomcat/webapps/cb"
SYNERGY_HOME=$1

#------------- Clean up jars in EAS4.5 -------------#	
FileToDelete_jars="$SYNERGY_HOME/WEB-INF/lib"
	if [ -d "$FileToDelete_jars" ]; then
		cd $FileToDelete_jars
		if [ -f "log4j-1.2.15.jar" ]; then rm -f "log4j-1.2.15.jar"; fi
		echo "Jar deleted successfully."
		cd /
	fi

#------------- Clean up black_theme folder in EAS4.5 -------------#
FileToDelete_css="$SYNERGY_HOME/css"
	if [ -d "$FileToDelete_css" ]; then
		cd $FileToDelete_css
		if [ -d "black_theme" ]; then rm -Rf "black_theme"; fi
		echo "Black_theme folder deleted successfully."
		cd /
	fi
	
#------------- Clean up plugins in EAS4.4_Patch1 -------------#
FileToDelete_plugins="$SYNERGY_HOME/plugins"
	if [ -d "$FileToDelete_plugins" ]; then
		cd $FileToDelete_plugins
		if [ -d "ckeditor-3.6.6.1.1" ]; then rm -Rf "ckeditor-3.6.6.1.1"; fi
		echo "ckeditor-3.6.6.1.1 plugin removed successfully."
		cd /
	fi
	
#------------- Clean up Jasper Reports in EAS4.1 -------------#
FileToDelete_jasper_report_jar="$SYNERGY_HOME/WEB-INF/lib"
	if [ -d "$FileToDelete_jasper_report_jar" ]; then
		cd $FileToDelete_jasper_report_jar
		if [ -f "jasperreports-4.7.0.jar" ]; then rm -f "jasperreports-4.7.0.jar"; fi
		if [ -f "jasperreports-applet-4.7.0.jar" ]; then rm -f "jasperreports-applet-4.7.0.jar"; fi
		if [ -f "jasperreports-fonts-4.7.0.jar" ]; then rm -f "jasperreports-fonts-4.7.0.jar"; fi
		if [ -f "jasperreports-javaflow-4.7.0.jar" ]; then rm -f "jasperreports-javaflow-4.7.0.jar"; fi
		if [ -f "iText-2.1.5.jar" ]; then rm -f "iText-2.1.5.jar"; fi
		if [ -f "itext-2.1.3.jar" ]; then rm -f "itext-2.1.3.jar"; fi
		if [ -f "antlr-2.7.6.jar" ]; then rm -f "antlr-2.7.6.jar"; fi
		if [ -f "commons-logging-1.0.3.jar" ]; then rm -f "commons-logging-1.0.3.jar"; fi
		if [ -f "bcprov-jdk14-138.jar" ]; then rm -f "bcprov-jdk14-138.jar"; fi
		echo "Jasper Report Jar removed successfully."
		cd /
	fi
	
#------------- Clean up images in EAS4.2 -------------#
FileToDelete_images="$SYNERGY_HOME/images"
	if [ -d "$FileToDelete_images" ]; then
		cd $FileToDelete_images
		if [ -f "Actions-im-user-icon.png" ]; then rm -f "Actions-im-user-icon.png"; fi
		if [ -f "adduser.png" ]; then rm -f "adduser.png"; fi
		if [ -f "apple-touch-icon.png" ]; then rm -f "apple-touch-icon.png"; fi
		if [ -f "apple-touch-icon-retina.png" ]; then rm -f "apple-touch-icon-retina.png"; fi
		if [ -f "arrows-asc.gif" ]; then rm -f "arrows-asc.gif"; fi
		if [ -f "arrows-desc.gif" ]; then rm -f "arrows-desc.gif"; fi
		if [ -f "bb_save_icon.png" ]; then rm -f "bb_save_icon.png"; fi
		if [ -f "BB-ajax-loading-circle-blue.gif" ]; then rm -f "BB-ajax-loading-circle-blue.gif"; fi
		if [ -f "bg.gif" ]; then rm -f "bg.gif"; fi
		if [ -f "bg-body.gif" ]; then rm -f "bg-body.gif"; fi
		if [ -f "bg-body_orderCustomer.png" ]; then rm -f "bg-body_orderCustomer.png"; fi
		if [ -f "bg-body11.png" ]; then rm -f "bg-body11.png"; fi
		if [ -f "broadsoft.jpg" ]; then rm -f "broadsoft.jpg"; fi
		if [ -f "btn-cancel.gif" ]; then rm -f "btn-cancel.gif"; fi
		if [ -f "btn-save.gif" ]; then rm -f "btn-save.gif"; fi
		if [ -f "btn-sprite.gif" ]; then rm -f "btn-sprite.gif"; fi
		if [ -f "button_french.png" ]; then rm -f "button_french.png"; fi
		if [ -f "button_light.png" ]; then rm -f "button_light.png"; fi
		if [ -f "cancel.png" ]; then rm -f "cancel.png"; fi
		if [ -f "catalog-body1.png" ]; then rm -f "catalog-body1.png"; fi
		if [ -f "change_password.png" ]; then rm -f "change_password.png"; fi
		if [ -f "check2.jpg" ]; then rm -f "check2.jpg"; fi
		if [ -f "check2.png" ]; then rm -f "check2.png"; fi
		if [ -f "closeBtn.png" ]; then rm -f "closeBtn.png"; fi
		if [ -f "ddn.png"  ]; then rm -f "ddn.png"; fi
		if [ -f "dn.png" ]; then rm -f "dn.png"; fi
		if [ -f "enchanted-lighthouse-100.jpg" ]; then rm -f "enchanted-lighthouse-100.jpg"; fi
		if [ -f "Exchange2010.jpg" ]; then rm -f "Exchange2010.jpg"; fi
		if [ -f "export.jpg" ]; then rm -f "export.jpg"; fi
		if [ -f "fhbg.gif" ]; then rm -f "fhbg.gif"; fi
		if [ -f "findicon.png" ]; then rm -f "findicon.png"; fi
		if [ -f "free-trial-icon.jpg" ]; then rm -f "free-trial-icon.jpg"; fi
		if [ -f "go_right_black.png" ]; then rm -f "go_right_black.png"; fi
		if [ -f "goback.gif" ]; then rm -f "goback.gif"; fi
		if [ -f "goback_black.gif" ]; then rm -f "goback_black.gif"; fi
		if [ -f "grails_logo.png" ]; then rm -f "grails_logo.png"; fi
		if [ -f "hand-cursor-black.png" ]; then rm -f "hand-cursor-black.png"; fi
		if [ -f "help.gif" ]; then rm -f "help.gif"; fi
		if [ -f "hl.png" ]; then rm -f "hl.png"; fi
		if [ -f "i18n.png" ]; then rm -f "i18n.png"; fi
		if [ -f "Iaas.jpg" ]; then rm -f "Iaas.jpg"; fi
		if [ -f "icon01.gif" ]; then rm -f "icon01.gif"; fi
		if [ -f "icon25.gif" ]; then rm -f "icon25.gif"; fi
		if [ -f "icon26.gif" ]; then rm -f "icon26.gif"; fi
		if [ -f "icon27.gif" ]; then rm -f "icon27.gif"; fi
		if [ -f "icon28.gif" ]; then rm -f "icon28.gif"; fi
		if [ -f "icon35.gif" ]; then rm -f "icon35.gif"; fi
		if [ -f "icon37.gif" ]; then rm -f "icon37.gif"; fi
		if [ -f "icon-search.gif" ]; then rm -f "icon-search.gif"; fi
		if [ -f "icon-search.png" ]; then rm -f "icon-search.png"; fi
		if [ -f "img-not-available.png" ]; then rm -f "img-not-available.png"; fi
		if [ -f "import.jpg" ]; then rm -f "import.jpg"; fi
		if [ -f "invoice.png" ]; then rm -f "invoice.png"; fi
		if [ -f "invoice1.png" ]; then rm -f "invoice1.png"; fi
		if [ -f "invoice2.png" ]; then rm -f "invoice2.png"; fi
		if [ -f "leftnav_btm.png" ]; then rm -f "leftnav_btm.png"; fi
		if [ -f "leftnav_midstretch.png" ]; then rm -f "leftnav_midstretch.png"; fi
		if [ -f "leftnav_top.png" ]; then rm -f "leftnav_top.png"; fi
		if [ -f "lock-small.png" ]; then rm -f "lock-small.png"; fi
		if [ -f "logo_out.png" ]; then rm -f "logo_out.png"; fi
		if [ -f "messaging.jpg" ]; then rm -f "messaging.jpg"; fi
		if [ -f "microsoftDatacenter.jpg" ]; then rm -f "microsoftDatacenter.jpg"; fi
		if [ -f "microsoftDynamics.jpg" ]; then rm -f "microsoftDynamics.jpg"; fi
		if [ -f "microsoftExchange.jpg" ]; then rm -f "microsoftExchange.jpg"; fi
		if [ -f "microsoftLync.jpg" ]; then rm -f "microsoftLync.jpg"; fi
		if [ -f "microsoftSharepoint.jpg" ]; then rm -f "microsoftSharepoint.jpg"; fi
		if [ -f "mozy.jpg" ]; then rm -f "mozy.jpg"; fi
		if [ -f "msg&colab.jpg" ]; then rm -f "msg&colab.jpg"; fi
		if [ -f "payflowpro.jpg" ]; then rm -f "payflowpro.jpg"; fi
		if [ -f "Personalize_back.png" ]; then rm -f "Personalize_back.png"; fi
		if [ -f "ppf_back.png" ]; then rm -f "ppf_back.png"; fi
		if [ -f "promo.png" ]; then rm -f "promo.png"; fi
		if [ -f "promo-back.png" ]; then rm -f "promo-back.png"; fi
		if [ -f "promo-icon1.png" ]; then rm -f "promo-icon1.png"; fi
		if [ -f "purchase.png" ]; then rm -f "purchase.png"; fi
		if [ -f "register.png" ]; then rm -f "register.png"; fi
		if [ -f "rpp_add.png" ]; then rm -f "rpp_add.png"; fi
		if [ -f "rpp_edit.png" ]; then rm -f "rpp_edit.png"; fi
		if [ -f "s1.gif" ]; then rm -f "s1.gif"; fi
		if [ -f "s2.gif" ]; then rm -f "s2.gif"; fi
		if [ -f "s3.gif" ]; then rm -f "s3.gif"; fi
		if [ -f "s4.gif" ]; then rm -f "s4.gif"; fi
		if [ -f "s5.gif" ]; then rm -f "s5.gif"; fi
		if [ -f "selectedmenubuttonbg.png" ]; then rm -f "selectedmenubuttonbg.png"; fi
		if [ -f "service.png" ]; then rm -f "service.png"; fi
		if [ -f "service-icon.png" ]; then rm -f "service-icon.png"; fi
		if [ -f "smartphones.jpg" ]; then rm -f "smartphones.jpg"; fi
		if [ -f "smartphones2.jpg" ]; then rm -f "smartphones2.jpg"; fi
		if [ -f "springsource.png" ]; then rm -f "springsource.png"; fi
		if [ -f "sugestion.png" ]; then rm -f "sugestion.png"; fi
		if [ -f "suggestedService.jpg" ]; then rm -f "suggestedService.jpg"; fi
		if [ -f "suggestion.png" ]; then rm -f "suggestion.png"; fi
		if [ -f "suggestionBox - Copy.jpg" ]; then rm -f "suggestionBox - Copy.jpg"; fi
		if [ -f "suggestionBox.jpg" ]; then rm -f "suggestionBox.jpg"; fi
		if [ -f "tick_man_for_blackTheme.png" ]; then rm -f "tick_man_for_blackTheme.png"; fi
		if [ -f "title.gif" ]; then rm -f "title.gif"; fi
		if [ -f "unlocked.png" ]; then rm -f "unlocked.png"; fi
		if [ -f "uup.png" ]; then rm -f "uup.png"; fi
		if [ -f "view.png" ]; then rm -f "view.png"; fi
		if [ -f "vmware.jpg" ]; then rm -f "vmware.jpg"; fi
		if [ -f "VO365.jpg" ]; then rm -f "VO365.jpg"; fi
		if [ -f "VOIP.jpg" ]; then rm -f "VOIP.jpg"; fi
		if [ -f "vps2.jpeg" ]; then rm -f "vps2.jpeg"; fi
		if [ -f "vps3.jpg" ]; then rm -f "vps3.jpg"; fi
		if [ -f "vps4.jpg" ]; then rm -f "vps4.jpg"; fi
		if [ -f "vps5.jpg" ]; then rm -f "vps5.jpg"; fi
		if [ -f "vps6.jpg" ]; then rm -f "vps6.jpg"; fi
		if [ -f "vps7.jpg" ]; then rm -f "vps7.jpg"; fi
		if [ -f "vps8.jpg" ]; then rm -f "vps8.jpg"; fi
		if [ -f "wbg.gif" ]; then rm -f "wbg.gif"; fi
	fi
	
	if [ -d "$FileToDelete_images/orderstatusicon" ]; then
		cd "$FileToDelete_images/orderstatusicon"
		if [ -f "downgradependingapproval.gif" ]; then rm -f "downgradependingapproval.gif"; fi
		if [ -f "pendingapproval.gif" ]; then rm -f "pendingapproval.gif"; fi
		if [ -f "provisioned.jpg" ]; then rm -f "provisioned.jpg"; fi
		if [ -f "provisioning.jpg" ]; then rm -f "provisioning.jpg"; fi
		if [ -f "resumed.jpg" ]; then rm -f "resumed.jpg"; fi
		if [ -f "resuming.jpg" ]; then rm -f "resuming.jpg"; fi
		if [ -f "toberesumed.jpg" ]; then rm -f "toberesumed.jpg"; fi
		if [ -f "updatependingapproval.gif" ]; then rm -f "updatependingapproval.gif"; fi
		if [ -f "upgradependingapproval.gif" ]; then rm -f "upgradependingapproval.gif"; fi
	fi
	
	if [ -d "$FileToDelete_images/order_actions" ]; then
		cd "$FileToDelete_images/order_actions"
		if [ -f "downgrade_disabled.png" ]; then rm -f "downgrade_disabled.png"; fi
		if [ -f "mui_edit.png" ]; then rm -f "mui_edit.png"; fi
		if [ -f "mui_order_histry_disabled.png" ]; then rm -f "mui_order_histry_disabled.png"; fi
		if [ -f "mui_undo_lastChange.png" ]; then rm -f "mui_undo_lastChange.png"; fi
		if [ -f "upgrade_disabled.png" ]; then rm -f "upgrade_disabled.png"; fi
		if [ -f "upgrade_old.png" ]; then rm -f "upgrade_old.png"; fi
	fi
	
	if [ -d "$FileToDelete_images/images" ]; then
		cd "$FileToDelete_images/images"
		if [ -f "cloud_large.jpg" ]; then rm -f "cloud_large.jpg"; fi
		if [ -f "cloud_medium.jpg" ]; then rm -f "cloud_medium.jpg"; fi
		if [ -f "cloud_small.jpg" ]; then rm -f "cloud_small.jpg"; fi
		if [ -f "Iaas.jpg" ]; then rm -f "Iaas.jpg"; fi
		if [ -f "messaging.jpg" ]; then rm -f "messaging.jpg"; fi
		if [ -f "microsoft_large.jpg" ]; then rm -f "microsoft_large.jpg"; fi
		if [ -f "microsoft_medium.jpg" ]; then rm -f "microsoft_medium.jpg"; fi
		if [ -f "microsoft_small.jpg" ]; then rm -f "microsoft_small.jpg"; fi
		if [ -f "microsoftDynamics_large.jpg" ]; then rm -f "microsoftDynamics_large.jpg"; fi
		if [ -f "microsoftDynamics_medium.jpg" ]; then rm -f "microsoftDynamics_medium.jpg"; fi
		if [ -f "microsoftDynamics_small.jpg" ]; then rm -f "microsoftDynamics_small.jpg"; fi
		if [ -f "microsoftExchange_large.jpg" ]; then rm -f "microsoftExchange_large.jpg"; fi
		if [ -f "microsoftExchange_medium.jpg" ]; then rm -f "microsoftExchange_medium.jpg"; fi
		if [ -f "microsoftExchange_small.jpg" ]; then rm -f "microsoftExchange_small.jpg"; fi
		if [ -f "microsoftLync_large.jpg" ]; then rm -f "microsoftLync_large.jpg"; fi
		if [ -f "microsoftLync_medium.jpg" ]; then rm -f "microsoftLync_medium.jpg"; fi
		if [ -f "microsoftLync_small.jpg" ]; then rm -f "microsoftLync_small.jpg"; fi
		if [ -f "microsoftSharepoint_large.jpg" ]; then rm -f "microsoftSharepoint_large.jpg"; fi
		if [ -f "microsoftSharepoint_medium.jpg" ]; then rm -f "microsoftSharepoint_medium.jpg"; fi
		if [ -f "microsoftSharepoint_small.jpg" ]; then rm -f "microsoftSharepoint_small.jpg"; fi
		if [ -f "mozy_large.jpg" ]; then rm -f "mozy_large.jpg"; fi
		if [ -f "mozy_medium.jpg" ]; then rm -f "mozy_medium.jpg"; fi
		if [ -f "mozy_small.jpg" ]; then rm -f "mozy_small.jpg"; fi
		if [ -f "smartPhones_large.jpg" ]; then rm -f "smartPhones_large.jpg"; fi
		if [ -f "smartPhones_medium.jpg" ]; then rm -f "smartPhones_medium.jpg"; fi
		if [ -f "smartPhones_small.jpg" ]; then rm -f "smartPhones_small.jpg"; fi
		if [ -f "vmWare_large.jpg" ]; then rm -f "vmWare_large.jpg"; fi
		if [ -f "vmWare_medium.jpg" ]; then rm -f "vmWare_medium.jpg"; fi
		if [ -f "vmWare_small.jpg" ]; then rm -f "vmWare_small.jpg"; fi
		if [ -f "voip_large.jpg" ]; then rm -f "voip_large.jpg"; fi
		if [ -f "voip_medium.jpg" ]; then rm -f "voip_medium.jpg"; fi
		if [ -f "voip_small.jpg" ]; then rm -f "voip_small.jpg"; fi
	fi
	
	if [ -d "$FileToDelete_images/offerimages" ]; then
		cd "$FileToDelete_images/offerimages"
		if [ -f "cloud_large.jpg" ]; then rm -f "cloud_large.jpg"; fi
		if [ -f "cloud_medium.jpg" ]; then rm -f "cloud_medium.jpg"; fi
		if [ -f "cloud_small.jpg" ]; then rm -f "cloud_small.jpg"; fi
		if [ -f "Iaas.jpg" ]; then rm -f "Iaas.jpg"; fi
		if [ -f "messaging.jpg" ]; then rm -f "messaging.jpg"; fi
		if [ -f "microsoft_large.jpg" ]; then rm -f "microsoft_large.jpg"; fi
		if [ -f "microsoft_medium.jpg" ]; then rm -f "microsoft_medium.jpg"; fi
		if [ -f "microsoft_small.jpg" ]; then rm -f "microsoft_small.jpg"; fi
		if [ -f "microsoftDynamics_large.jpg" ]; then rm -f "microsoftDynamics_large.jpg"; fi
		if [ -f "microsoftDynamics_medium.jpg" ]; then rm -f "microsoftDynamics_medium.jpg"; fi
		if [ -f "microsoftDynamics_small.jpg" ]; then rm -f "microsoftDynamics_small.jpg"; fi
		if [ -f "microsoftExchange_large.jpg" ]; then rm -f "microsoftExchange_large.jpg"; fi
		if [ -f "microsoftExchange_medium.jpg" ]; then rm -f "microsoftExchange_medium.jpg"; fi
		if [ -f "microsoftExchange_small.jpg" ]; then rm -f "microsoftExchange_small.jpg"; fi
		if [ -f "microsoftLync_large.jpg" ]; then rm -f "microsoftLync_large.jpg"; fi
		if [ -f "microsoftLync_medium.jpg" ]; then rm -f "microsoftLync_medium.jpg"; fi
		if [ -f "microsoftLync_small.jpg" ]; then rm -f "microsoftLync_small.jpg"; fi
		if [ -f "microsoftSharepoint_large.jpg" ]; then rm -f "microsoftSharepoint_large.jpg"; fi
		if [ -f "microsoftSharepoint_medium.jpg" ]; then rm -f "microsoftSharepoint_medium.jpg"; fi
		if [ -f "microsoftSharepoint_small.jpg" ]; then rm -f "microsoftSharepoint_small.jpg"; fi
		if [ -f "mozy_large.jpg" ]; then rm -f "mozy_large.jpg"; fi
		if [ -f "mozy_medium.jpg" ]; then rm -f "mozy_medium.jpg"; fi
		if [ -f "mozy_small.jpg" ]; then rm -f "mozy_small.jpg"; fi
		if [ -f "smartPhones_large.jpg" ]; then rm -f "smartPhones_large.jpg"; fi
		if [ -f "smartPhones_medium.jpg" ]; then rm -f "smartPhones_medium.jpg"; fi
		if [ -f "smartPhones_small.jpg" ]; then rm -f "smartPhones_small.jpg"; fi
		if [ -f "vmWare_large.jpg" ]; then rm -f "vmWare_large.jpg"; fi
		if [ -f "vmWare_medium.jpg" ]; then rm -f "vmWare_medium.jpg"; fi
		if [ -f "vmWare_small.jpg" ]; then rm -f "vmWare_small.jpg"; fi
		if [ -f "voip_large.jpg" ]; then rm -f "voip_large.jpg"; fi
		if [ -f "voip_medium.jpg" ]; then rm -f "voip_medium.jpg"; fi
		if [ -f "voip_small.jpg" ]; then rm -f "voip_small.jpg"; fi
		cd /
		echo "EAS Images removed successfully."
	fi


#------------- Clean up Modern UI images in EAS4.2 -------------#
FileToDelete_modern_ui_images="$SYNERGY_HOME/css/modern_ui/images"
	if [ -d "$FileToDelete_modern_ui_images" ]; then
		cd $FileToDelete_modern_ui_images
		if [ -f "Actions-im-user-icon.png" ]; then rm -f "Actions-im-user-icon.png"; fi
		if [ -f "adduser.png" ]; then rm -f "adduser.png"; fi
		if [ -f "arrows-asc.gif" ]; then rm -f "arrows-asc.gif"; fi
		if [ -f "arrows-desc.gif" ]; then rm -f "arrows-desc.gif"; fi
		if [ -f "bg.gif" ]; then rm -f "bg.gif"; fi
		if [ -f "bg_login.png" ]; then rm -f "bg_login.png"; fi
		if [ -f "bg-accordion.gif" ]; then rm -f "bg-accordion.gif"; fi
		if [ -f "bg-body.gif" ]; then rm -f "bg-body.gif"; fi
		if [ -f "bg-body.png" ]; then rm -f "bg-body.png"; fi
		if [ -f "bg-body_orderCustomer.png" ]; then rm -f "bg-body_orderCustomer.png"; fi
		if [ -f "bg-body11.png" ]; then rm -f "bg-body11.png"; fi
		if [ -f "bg-heading.gif" ]; then rm -f "bg-heading.gif"; fi
		if [ -f "bg-heading02.gif" ]; then rm -f "bg-heading02.gif"; fi
		if [ -f "bg-nav-arrow.gif" ]; then rm -f "bg-nav-arrow.gif"; fi
		if [ -f "bg-nav-l.gif" ]; then rm -f "bg-nav-l.gif"; fi
		if [ -f "bg-nav-r.gif" ]; then rm -f "bg-nav-r.gif"; fi
		if [ -f "broadsoft.jpg" ]; then rm -f "broadsoft.jpg"; fi
		if [ -f "btn-cancel.gif" ]; then rm -f "btn-cancel.gif"; fi
		if [ -f "btn-save.gif" ]; then rm -f "btn-save.gif"; fi
		if [ -f "btn-sprite.gif" ]; then rm -f "btn-sprite.gif"; fi
		if [ -f "button_french.png" ]; then rm -f "button_french.png"; fi
		if [ -f "catalog-body1.png" ]; then rm -f "catalog-body1.png"; fi
		if [ -f "change_password.png" ]; then rm -f "change_password.png"; fi
		if [ -f "check2.png" ]; then rm -f "check2.png"; fi
		if [ -f "ddn.png" ]; then rm -f "ddn.png"; fi
		if [ -f "dn.png" ]; then rm -f "dn.png"; fi
		if [ -f "exchange_server1.jpg" ]; then rm -f "exchange_server1.jpg"; fi
		if [ -f "Exchange1.jpg" ]; then rm -f "Exchange1.jpg"; fi
		if [ -f "Exchange2010.jpg" ]; then rm -f "Exchange2010.jpg"; fi
		if [ -f "exit.png" ]; then rm -f "exit.png"; fi
		if [ -f "favicon1.ico" ]; then rm -f "favicon1.ico"; fi
		if [ -f "fhbg.gif" ]; then rm -f "fhbg.gif"; fi
		if [ -f "free-trial-icon.jpg" ]; then rm -f "free-trial-icon.jpg"; fi
		if [ -f "go_right_black.png" ]; then rm -f "go_right_black.png"; fi
		if [ -f "goback.gif" ]; then rm -f "goback.gif"; fi
		if [ -f "goback_black.gif" ]; then rm -f "goback_black.gif"; fi
		if [ -f "hand-cursor-black.png" ]; then rm -f "hand-cursor-black.png"; fi
		if [ -f "help.gif" ]; then rm -f "help.gif"; fi
		if [ -f "hl.png" ]; then rm -f "hl.png"; fi
		if [ -f "i18n.png" ]; then rm -f "i18n.png"; fi
		if [ -f "Iaas.jpg" ]; then rm -f "Iaas.jpg"; fi
		if [ -f "icon01.gif" ]; then rm -f "icon01.gif"; fi
		if [ -f "icon25.gif" ]; then rm -f "icon25.gif"; fi
		if [ -f "icon26.gif" ]; then rm -f "icon26.gif"; fi
		if [ -f "icon27.gif" ]; then rm -f "icon27.gif"; fi
		if [ -f "icon28.gif" ]; then rm -f "icon28.gif"; fi
		if [ -f "icon35.gif" ]; then rm -f "icon35.gif"; fi
		if [ -f "icon37.gif" ]; then rm -f "icon37.gif"; fi
		if [ -f "icon-search.gif" ]; then rm -f "icon-search.gif"; fi
		if [ -f "icon-search.png" ]; then rm -f "icon-search.png"; fi
		if [ -f "img-not-available.png" ]; then rm -f "img-not-available.png"; fi
		if [ -f "invoice.png" ]; then rm -f "invoice.png"; fi
		if [ -f "invoice1.png" ]; then rm -f "invoice1.png"; fi
		if [ -f "leftnav_btm.png" ]; then rm -f "leftnav_btm.png"; fi
		if [ -f "leftnav_midstretch.png" ]; then rm -f "leftnav_midstretch.png"; fi
		if [ -f "leftnav_top.png" ]; then rm -f "leftnav_top.png"; fi
		if [ -f "line.gif" ]; then rm -f "line.gif"; fi
		if [ -f "load.png" ]; then rm -f "load.png"; fi
		if [ -f "lock-small.png" ]; then rm -f "lock-small.png"; fi
		if [ -f "login.png" ]; then rm -f "login.png"; fi
		if [ -f "logo_ws_hyper.jpg" ]; then rm -f "logo_ws_hyper.jpg"; fi
		if [ -f "logo1.png" ]; then rm -f "logo1.png"; fi
		if [ -f "manage.png" ]; then rm -f "manage.png"; fi
		if [ -f "messaging.jpg" ]; then rm -f "messaging.jpg"; fi
		if [ -f "microsoftDatacenter.jpg" ]; then rm -f "microsoftDatacenter.jpg"; fi
		if [ -f "microsoftDynamics.jpg" ]; then rm -f "microsoftDynamics.jpg"; fi
		if [ -f "microsoftExchange.jpg" ]; then rm -f "microsoftExchange.jpg"; fi
		if [ -f "microsoftLync.jpg" ]; then rm -f "microsoftLync.jpg"; fi
		if [ -f "mozy.jpg" ]; then rm -f "mozy.jpg"; fi
		if [ -f "msg&colab.jpg" ]; then rm -f "msg&colab.jpg"; fi
		if [ -f "no_image21.jpg" ]; then rm -f "no_image21.jpg"; fi
		if [ -f "payflowpro.jpg" ]; then rm -f "payflowpro.jpg"; fi
		if [ -f "pbar-ani1.gif" ]; then rm -f "pbar-ani1.gif"; fi
		if [ -f "purchase.png" ]; then rm -f "purchase.png"; fi
		if [ -f "register.png" ]; then rm -f "register.png"; fi
		if [ -f "s1.gif" ]; then rm -f "s1.gif"; fi
		if [ -f "s2.gif" ]; then rm -f "s2.gif"; fi
		if [ -f "s3.gif" ]; then rm -f "s3.gif"; fi
		if [ -f "s4.gif" ]; then rm -f "s4.gif"; fi
		if [ -f "s5.gif" ]; then rm -f "s5.gif"; fi
		if [ -f "selectedmenubuttonbg.png" ]; then rm -f "selectedmenubuttonbg.png"; fi
		if [ -f "smartphones.jpg" ]; then rm -f "smartphones.jpg"; fi
		if [ -f "smartphones2.jpg" ]; then rm -f "smartphones2.jpg"; fi
		if [ -f "sugestion.png" ]; then rm -f "sugestion.png"; fi
		if [ -f "suggestedService.jpg" ]; then rm -f "suggestedService.jpg"; fi
		if [ -f "suggestion.png" ]; then rm -f "suggestion.png"; fi
		if [ -f "suggestionBox - Copy.jpg" ]; then rm -f "suggestionBox - Copy.jpg"; fi
		if [ -f "suggestionBox.jpg" ]; then rm -f "suggestionBox.jpg"; fi
		if [ -f "tick_man_for_blackTheme.png" ]; then rm -f "tick_man_for_blackTheme.png"; fi
		if [ -f "title.gif" ]; then rm -f "title.gif"; fi
		if [ -f "unlocked.png" ]; then rm -f "unlocked.png"; fi
		if [ -f "uup.png" ]; then rm -f "uup.png"; fi
		if [ -f "view.png" ]; then rm -f "view.png"; fi
		if [ -f "vmware.jpg" ]; then rm -f "vmware.jpg"; fi
		if [ -f "VO365.jpg" ]; then rm -f "VO365.jpg"; fi
		if [ -f "VOIP.jpg" ]; then rm -f "VOIP.jpg"; fi
		if [ -f "vps2.jpeg" ]; then rm -f "vps2.jpeg"; fi
		if [ -f "vps3.jpg" ]; then rm -f "vps3.jpg"; fi
		if [ -f "vps4.jpg" ]; then rm -f "vps4.jpg"; fi
		if [ -f "vps5.jpg" ]; then rm -f "vps5.jpg"; fi
		if [ -f "vps6.jpg" ]; then rm -f "vps6.jpg"; fi
		if [ -f "vps7.jpg" ]; then rm -f "vps7.jpg"; fi
		if [ -f "vps8.jpg" ]; then rm -f "vps8.jpg"; fi
		if [ -f "wbg.gif" ]; then rm -f "wbg.gif"; fi
	fi
	
	if [ -d "$FileToDelete_modern_ui_images/images" ]; then
		cd "$FileToDelete_modern_ui_images/images"
		if [ -f "cloud_large.jpg" ]; then rm -f "cloud_large.jpg"; fi
		if [ -f "cloud_medium.jpg" ]; then rm -f "cloud_medium.jpg"; fi
		if [ -f "cloud_small.jpg" ]; then rm -f "cloud_small.jpg"; fi
		if [ -f "Iaas.jpg" ]; then rm -f "Iaas.jpg"; fi
		if [ -f "messaging.jpg" ]; then rm -f "messaging.jpg"; fi
		if [ -f "microsoft_large.jpg" ]; then rm -f "microsoft_large.jpg"; fi
		if [ -f "microsoft_medium.jpg" ]; then rm -f "microsoft_medium.jpg"; fi
		if [ -f "microsoft_small.jpg" ]; then rm -f "microsoft_small.jpg"; fi
		if [ -f "microsoftDynamics_large.jpg" ]; then rm -f "microsoftDynamics_large.jpg"; fi
		if [ -f "microsoftDynamics_medium.jpg" ]; then rm -f "microsoftDynamics_medium.jpg"; fi
		if [ -f "microsoftDynamics_small.jpg" ]; then rm -f "microsoftDynamics_small.jpg"; fi
		if [ -f "microsoftExchange_large.jpg" ]; then rm -f "microsoftExchange_large.jpg"; fi
		if [ -f "microsoftExchange_medium.jpg" ]; then rm -f "microsoftExchange_medium.jpg"; fi
		if [ -f "microsoftExchange_small.jpg" ]; then rm -f "microsoftExchange_small.jpg"; fi
		if [ -f "microsoftLync_large.jpg" ]; then rm -f "microsoftLync_large.jpg"; fi
		if [ -f "microsoftLync_medium.jpg" ]; then rm -f "microsoftLync_medium.jpg"; fi
		if [ -f "microsoftLync_small.jpg" ]; then rm -f "microsoftLync_small.jpg"; fi
		if [ -f "microsoftSharepoint_large.jpg" ]; then rm -f "microsoftSharepoint_large.jpg"; fi
		if [ -f "microsoftSharepoint_medium.jpg" ]; then rm -f "microsoftSharepoint_medium.jpg"; fi
		if [ -f "microsoftSharepoint_small.jpg" ]; then rm -f "microsoftSharepoint_small.jpg"; fi
		if [ -f "mozy_large.jpg" ]; then rm -f "mozy_large.jpg"; fi
		if [ -f "mozy_medium.jpg" ]; then rm -f "mozy_medium.jpg"; fi
		if [ -f "mozy_small.jpg" ]; then rm -f "mozy_small.jpg"; fi
		if [ -f "smartPhones_large.jpg" ]; then rm -f "smartPhones_large.jpg"; fi
		if [ -f "smartPhones_medium.jpg" ]; then rm -f "smartPhones_medium.jpg"; fi
		if [ -f "smartPhones_small.jpg" ]; then rm -f "smartPhones_small.jpg"; fi
		if [ -f "vmWare_large.jpg" ]; then rm -f "vmWare_large.jpg"; fi
		if [ -f "vmWare_medium.jpg" ]; then rm -f "vmWare_medium.jpg"; fi
		if [ -f "vmWare_small.jpg" ]; then rm -f "vmWare_small.jpg"; fi
		if [ -f "voip_large.jpg" ]; then rm -f "voip_large.jpg"; fi
		if [ -f "voip_medium.jpg" ]; then rm -f "voip_medium.jpg"; fi
		if [ -f "voip_small.jpg" ]; then rm -f "voip_small.jpg"; fi
	fi
	
	if [ -d "$FileToDelete_modern_ui_images/orderstatusicon" ]; then
		cd "$FileToDelete_modern_ui_images/orderstatusicon"
		if [ -f "downgradependingapproval.gif" ]; then rm -f "downgradependingapproval.gif"; fi
		if [ -f "pendingapproval.gif" ]; then rm -f "pendingapproval.gif"; fi
		if [ -f "provisioned.jpg" ]; then rm -f "provisioned.jpg"; fi
		if [ -f "provisioning.jpg" ]; then rm -f "provisioning.jpg"; fi
		if [ -f "resumed.jpg" ]; then rm -f "resumed.jpg"; fi
		if [ -f "resuming.jpg" ]; then rm -f "resuming.jpg"; fi
		if [ -f "toberesumed.jpg" ]; then rm -f "toberesumed.jpg"; fi
		if [ -f "updatependingapproval.gif" ]; then rm -f "updatependingapproval.gif"; fi
		if [ -f "upgradependingapproval.gif" ]; then rm -f "upgradependingapproval.gif"; fi
		cd /
		echo "EAS Modern UI images removed successfully."
	fi

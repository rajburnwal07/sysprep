@echo off
title EAS_Cleanup_script

rem #------------- Initializing variables -------------#
::echo Press ENTER to run the script......
::set/p "xx= "


rem #------------- Clean up jars in EAS4.5 -------------#
SET FileToDelete_jar="%SYNERGY_HOME%\WEB-INF\lib"
	if exist %FileToDelete_jar% (
		cd /d "%FileToDelete_jar%" 
		IF EXIST "log4j-1.2.15.jar" del /F "log4j-1.2.15.jar" else echo
		cd /
		echo "Jar removed successfully."
	)

rem #------------- Clean up black_theme CSS folder in EAS4.5 -------------#	
SET FolderToDelete_css="%SYNERGY_HOME%\css"
	if exist %FolderToDelete_css% (
		cd /d "%FolderToDelete_css%"
		IF EXIST "black_theme" rd /S /Q "black_theme" else echo
		cd /
		echo "Black_theme folder deleted successfully."
	)
	
rem #------------- Clean up Jasper Reports in EAS4.1 -------------#
SET FileToDelete_jasper_report_jar="%SYNERGY_HOME%\WEB-INF\lib"
	if exist %FileToDelete_jasper_report_jar% (
		cd /d "%FileToDelete_jasper_report_jar%" 
		IF EXIST "jasperreports-4.7.0.jar" del /F "jasperreports-4.7.0.jar" else echo
		IF EXIST "jasperreports-applet-4.7.0.jar" del /F "jasperreports-applet-4.7.0.jar" else echo
		IF EXIST "jasperreports-fonts-4.7.0.jar" del /F "jasperreports-fonts-4.7.0.jar" else echo
		IF EXIST "jasperreports-javaflow-4.7.0.jar" del /F "jasperreports-javaflow-4.7.0.jar" else echo
		IF EXIST "iText-2.1.5.jar" del /F "iText-2.1.5.jar" else echo
		IF EXIST "itext-2.1.3.jar" del /F "itext-2.1.3.jar" else echo
		IF EXIST "antlr-2.7.6.jar" del /F "antlr-2.7.6.jar" else echo	
rem #------------- Clean up jars in EAS4.4 -------------#
		IF EXIST "commons-logging-1.0.3.jar" del /F "commons-logging-1.0.3.jar" else echo
		IF EXIST "bcprov-jdk14-138.jar" del /F "bcprov-jdk14-138.jar" else echo
		cd /
		echo "Jasper Report Jar removed successfully."
	)
	
rem #------------- Clean up plugins in EAS4.4_Patch1 -------------#
SET FileToDelete_plugins="%SYNERGY_HOME%\plugins"
	if exist %FileToDelete_plugins% (
		cd /d "%FileToDelete_plugins%" 
		IF EXIST "ckeditor-3.6.6.1.1" del /F "ckeditor-3.6.6.1.1" else echo
		cd /
		echo "ckeditor-3.6.6.1.1 plugin removed successfully."
	)
	
rem #------------- Clean up images in EAS4.2 -------------#
SET FileToDelete_images="%SYNERGY_HOME%\images"
	if exist %FileToDelete_images% (
		cd /d "%FileToDelete_images%"
		IF EXIST "Actions-im-user-icon.png" del /F "Actions-im-user-icon.png" else echo
		IF EXIST "adduser.png" del /F "adduser.png" else echo
		IF EXIST "apple-touch-icon.png" del /F "apple-touch-icon.png" else echo
		IF EXIST "apple-touch-icon-retina.png" del /F "apple-touch-icon-retina.png" else echo
		IF EXIST "arrows-asc.gif" del /F "arrows-asc.gif" else echo
		IF EXIST "arrows-desc.gif" del /F "arrows-desc.gif" else echo
		IF EXIST "bb_save_icon.png" del /F "bb_save_icon.png" else echo
		IF EXIST "BB-ajax-loading-circle-blue.gif" del /F "BB-ajax-loading-circle-blue.gif" else echo
		IF EXIST "bg.gif" del /F "bg.gif" else echo
		IF EXIST "bg-body.gif" del /F "bg-body.gif" else echo
		IF EXIST "bg-body_orderCustomer.png" del /F "bg-body_orderCustomer.png" else echo
		IF EXIST "bg-body11.png" del /F "bg-body11.png" else echo
		IF EXIST "broadsoft.jpg" del /F "broadsoft.jpg" else echo
		IF EXIST "btn-cancel.gif" del /F "btn-cancel.gif" else echo
		IF EXIST "btn-save.gif" del /F "btn-save.gif" else echo
		IF EXIST "btn-sprite.gif" del /F "btn-sprite.gif" else echo
		IF EXIST "button_french.png" del /F "button_french.png" else echo
		IF EXIST "button_light.png" del /F "button_light.png" else echo
		IF EXIST "cancel.png" del /F "cancel.png" else echo
		IF EXIST "catalog-body1.png" del /F "catalog-body1.png" else echo
		IF EXIST "change_password.png" del /F "change_password.png" else echo
		IF EXIST "check2.jpg" del /F "check2.jpg" else echo
		IF EXIST "check2.png" del /F "check2.png" else echo
		IF EXIST "closeBtn.png" del /F "closeBtn.png" else echo
		IF EXIST "ddn.png"  del /F "ddn.png" else echo
		IF EXIST "dn.png" del /F "dn.png" else echo
		IF EXIST "enchanted-lighthouse-100.jpg" del /F "enchanted-lighthouse-100.jpg" else echo
		IF EXIST "Exchange2010.jpg" del /F "Exchange2010.jpg" else echo
		IF EXIST "export.jpg" del /F "export.jpg" else echo
		IF EXIST "fhbg.gif" del /F "fhbg.gif" else echo
		IF EXIST "findicon.png" del /F "findicon.png" else echo
		IF EXIST "free-trial-icon.jpg" del /F "free-trial-icon.jpg" else echo
		IF EXIST "go_right_black.png" del /F "go_right_black.png" else echo
		IF EXIST "goback.gif" del /F "goback.gif" else echo
		IF EXIST "goback_black.gif" del /F "goback_black.gif" else echo
		IF EXIST "grails_logo.png" del /F "grails_logo.png" else echo
		IF EXIST "hand-cursor-black.png" del /F "hand-cursor-black.png" else echo
		IF EXIST "help.gif" del /F "help.gif" else echo
		IF EXIST "hl.png" del /F "hl.png" else echo
		IF EXIST "i18n.png" del /F "i18n.png" else echo
		IF EXIST "Iaas.jpg" del /F "Iaas.jpg" else echo
		IF EXIST "icon01.gif" del /F "icon01.gif" else echo
		IF EXIST "icon25.gif" del /F "icon25.gif" else echo
		IF EXIST "icon26.gif" del /F "icon26.gif" else echo
		IF EXIST "icon27.gif" del /F "icon27.gif" else echo
		IF EXIST "icon28.gif" del /F "icon28.gif" else echo
		IF EXIST "icon35.gif" del /F "icon35.gif" else echo
		IF EXIST "icon37.gif" del /F "icon37.gif" else echo
		IF EXIST "icon-search.gif" del /F "icon-search.gif" else echo
		IF EXIST "icon-search.png" del /F "icon-search.png" else echo
		IF EXIST "img-not-available.png" del /F "img-not-available.png" else echo
		IF EXIST "import.jpg" del /F "import.jpg" else echo
		IF EXIST "invoice.png" del /F "invoice.png" else echo
		IF EXIST "invoice1.png" del /F "invoice1.png" else echo
		IF EXIST "invoice2.png" del /F "invoice2.png" else echo
		IF EXIST "leftnav_btm.png" del /F "leftnav_btm.png" else echo
		IF EXIST "leftnav_midstretch.png" del /F "leftnav_midstretch.png" else echo
		IF EXIST "leftnav_top.png" del /F "leftnav_top.png" else echo
		IF EXIST "lock-small.png" del /F "lock-small.png" else echo
		IF EXIST "logo_out.png" del /F "logo_out.png" else echo
		IF EXIST "messaging.jpg" del /F "messaging.jpg" else echo
		IF EXIST "microsoftDatacenter.jpg" del /F "microsoftDatacenter.jpg" else echo
		IF EXIST "microsoftDynamics.jpg" del /F "microsoftDynamics.jpg" else echo
		IF EXIST "microsoftExchange.jpg" del /F "microsoftExchange.jpg" else echo
		IF EXIST "microsoftLync.jpg" del /F "microsoftLync.jpg" else echo
		IF EXIST "microsoftSharepoint.jpg" del /F "microsoftSharepoint.jpg" else echo
		IF EXIST "mozy.jpg" del /F "mozy.jpg" else echo
		IF EXIST "msg&colab.jpg" del /F "msg&colab.jpg" else echo
		IF EXIST "payflowpro.jpg" del /F "payflowpro.jpg" else echo
		IF EXIST "Personalize_back.png" del /F "Personalize_back.png" else echo
		IF EXIST "ppf_back.png" del /F "ppf_back.png" else echo
		IF EXIST "promo.png" del /F "promo.png" else echo
		IF EXIST "promo-back.png" del /F "promo-back.png" else echo
		IF EXIST "promo-icon1.png" del /F "promo-icon1.png" else echo
		IF EXIST "purchase.png" del /F "purchase.png" else echo
		IF EXIST "register.png" del /F "register.png" else echo
		IF EXIST "rpp_add.png" del /F "rpp_add.png" else echo
		IF EXIST "rpp_edit.png" del /F "rpp_edit.png" else echo
		IF EXIST "s1.gif" del /F "s1.gif" else echo
		IF EXIST "s2.gif" del /F "s2.gif" else echo
		IF EXIST "s3.gif" del /F "s3.gif" else echo
		IF EXIST "s4.gif" del /F "s4.gif" else echo
		IF EXIST "s5.gif" del /F "s5.gif" else echo
		IF EXIST "selectedmenubuttonbg.png" del /F "selectedmenubuttonbg.png" else echo
		IF EXIST "service.png" del /F "service.png" else echo
		IF EXIST "service-icon.png" del /F "service-icon.png" else echo
		IF EXIST "smartphones.jpg" del /F "smartphones.jpg" else echo
		IF EXIST "smartphones2.jpg" del /F "smartphones2.jpg" else echo
		IF EXIST "springsource.png" del /F "springsource.png" else echo
		IF EXIST "sugestion.png" del /F "sugestion.png" else echo
		IF EXIST "suggestedService.jpg" del /F "suggestedService.jpg" else echo
		IF EXIST "suggestion.png" del /F "suggestion.png" else echo
		IF EXIST "suggestionBox - Copy.jpg" del /F "suggestionBox - Copy.jpg" else echo
		IF EXIST "suggestionBox.jpg" del /F "suggestionBox.jpg" else echo
		IF EXIST "tick_man_for_blackTheme.png" del /F "tick_man_for_blackTheme.png" else echo
		IF EXIST "title.gif" del /F "title.gif" else echo
		IF EXIST "unlocked.png" del /F "unlocked.png" else echo
		IF EXIST "uup.png" del /F "uup.png" else echo
		IF EXIST "view.png" del /F "view.png" else echo
		IF EXIST "vmware.jpg" del /F "vmware.jpg" else echo
		IF EXIST "VO365.jpg" del /F "VO365.jpg" else echo
		IF EXIST "VOIP.jpg" del /F "VOIP.jpg" else echo
		IF EXIST "vps2.jpeg" del /F "vps2.jpeg" else echo
		IF EXIST "vps3.jpg" del /F "vps3.jpg" else echo
		IF EXIST "vps4.jpg" del /F "vps4.jpg" else echo
		IF EXIST "vps5.jpg" del /F "vps5.jpg" else echo
		IF EXIST "vps6.jpg" del /F "vps6.jpg" else echo
		IF EXIST "vps7.jpg" del /F "vps7.jpg" else echo
		IF EXIST "vps8.jpg" del /F "vps8.jpg" else echo
		IF EXIST "wbg.gif" del /F "wbg.gif" else echo
	)
	
	if exist %FileToDelete_images%\orderstatusicon (
		cd /d "%FileToDelete_images%\orderstatusicon"
		IF EXIST "downgradependingapproval.gif" del /F "downgradependingapproval.gif" else echo
		IF EXIST "pendingapproval.gif" del /F "pendingapproval.gif" else echo
		IF EXIST "provisioned.jpg" del /F "provisioned.jpg" else echo
		IF EXIST "provisioning.jpg" del /F "provisioning.jpg" else echo
		IF EXIST "resumed.jpg" del /F "resumed.jpg" else echo
		IF EXIST "resuming.jpg" del /F "resuming.jpg" else echo
		IF EXIST "toberesumed.jpg" del /F "toberesumed.jpg" else echo
		IF EXIST "updatependingapproval.gif" del /F "updatependingapproval.gif" else echo
		IF EXIST "upgradependingapproval.gif" del /F "upgradependingapproval.gif" else echo
	)
	
	if exist %FileToDelete_images%\order_actions (
		cd /d "%FileToDelete_images%\order_actions"
		IF EXIST "downgrade_disabled.png" del /F "downgrade_disabled.png" else echo
		IF EXIST "mui_edit.png" del /F "mui_edit.png" else echo
		IF EXIST "mui_order_histry_disabled.png" del /F "mui_order_histry_disabled.png" else echo
		IF EXIST "mui_undo_lastChange.png" del /F "mui_undo_lastChange.png" else echo
		IF EXIST "upgrade_disabled.png" del /F "upgrade_disabled.png" else echo
		IF EXIST "upgrade_old.png" del /F "upgrade_old.png" else echo
	)
	
	if exist %FileToDelete_images%\images (
		cd /d "%FileToDelete_images%\images"
		IF EXIST "cloud_large.jpg" del /F "cloud_large.jpg" else echo
		IF EXIST "cloud_medium.jpg" del /F "cloud_medium.jpg" else echo
		IF EXIST "cloud_small.jpg" del /F "cloud_small.jpg" else echo
		IF EXIST "Iaas.jpg" del /F "Iaas.jpg" else echo
		IF EXIST "messaging.jpg" del /F "messaging.jpg" else echo
		IF EXIST "microsoft_large.jpg" del /F "microsoft_large.jpg" else echo
		IF EXIST "microsoft_medium.jpg" del /F "microsoft_medium.jpg" else echo
		IF EXIST "microsoft_small.jpg" del /F "microsoft_small.jpg" else echo
		IF EXIST "microsoftDynamics_large.jpg" del /F "microsoftDynamics_large.jpg" else echo
		IF EXIST "microsoftDynamics_medium.jpg" del /F "microsoftDynamics_medium.jpg" else echo
		IF EXIST "microsoftDynamics_small.jpg" del /F "microsoftDynamics_small.jpg" else echo
		IF EXIST "microsoftExchange_large.jpg" del /F "microsoftExchange_large.jpg" else echo
		IF EXIST "microsoftExchange_medium.jpg" del /F "microsoftExchange_medium.jpg" else echo
		IF EXIST "microsoftExchange_small.jpg" del /F "microsoftExchange_small.jpg" else echo
		IF EXIST "microsoftLync_large.jpg" del /F "microsoftLync_large.jpg" else echo
		IF EXIST "microsoftLync_medium.jpg" del /F "microsoftLync_medium.jpg" else echo
		IF EXIST "microsoftLync_small.jpg" del /F "microsoftLync_small.jpg" else echo
		IF EXIST "microsoftSharepoint_large.jpg" del /F "microsoftSharepoint_large.jpg" else echo
		IF EXIST "microsoftSharepoint_medium.jpg" del /F "microsoftSharepoint_medium.jpg" else echo
		IF EXIST "microsoftSharepoint_small.jpg" del /F "microsoftSharepoint_small.jpg" else echo
		IF EXIST "mozy_large.jpg" del /F "mozy_large.jpg" else echo
		IF EXIST "mozy_medium.jpg" del /F "mozy_medium.jpg" else echo
		IF EXIST "mozy_small.jpg" del /F "mozy_small.jpg" else echo
		IF EXIST "smartPhones_large.jpg" del /F "smartPhones_large.jpg" else echo
		IF EXIST "smartPhones_medium.jpg" del /F "smartPhones_medium.jpg" else echo
		IF EXIST "smartPhones_small.jpg" del /F "smartPhones_small.jpg" else echo
		IF EXIST "vmWare_large.jpg" del /F "vmWare_large.jpg" else echo
		IF EXIST "vmWare_medium.jpg" del /F "vmWare_medium.jpg" else echo
		IF EXIST "vmWare_small.jpg" del /F "vmWare_small.jpg" else echo
		IF EXIST "voip_large.jpg" del /F "voip_large.jpg" else echo
		IF EXIST "voip_medium.jpg" del /F "voip_medium.jpg" else echo
		IF EXIST "voip_small.jpg" del /F "voip_small.jpg" else echo
	)
	
	if exist %FileToDelete_images%\offerimages (
		cd /d "%FileToDelete_images%\offerimages"
		IF EXIST "cloud_large.jpg" del /F "cloud_large.jpg" else echo
		IF EXIST "cloud_medium.jpg" del /F "cloud_medium.jpg" else echo
		IF EXIST "cloud_small.jpg" del /F "cloud_small.jpg" else echo
		IF EXIST "Iaas.jpg" del /F "Iaas.jpg" else echo
		IF EXIST "messaging.jpg" del /F "messaging.jpg" else echo
		IF EXIST "microsoft_large.jpg" del /F "microsoft_large.jpg" else echo
		IF EXIST "microsoft_medium.jpg" del /F "microsoft_medium.jpg" else echo
		IF EXIST "microsoft_small.jpg" del /F "microsoft_small.jpg" else echo
		IF EXIST "microsoftDynamics_large.jpg" del /F "microsoftDynamics_large.jpg" else echo
		IF EXIST "microsoftDynamics_medium.jpg" del /F "microsoftDynamics_medium.jpg" else echo
		IF EXIST "microsoftDynamics_small.jpg" del /F "microsoftDynamics_small.jpg" else echo
		IF EXIST "microsoftExchange_large.jpg" del /F "microsoftExchange_large.jpg" else echo
		IF EXIST "microsoftExchange_medium.jpg" del /F "microsoftExchange_medium.jpg" else echo
		IF EXIST "microsoftExchange_small.jpg" del /F "microsoftExchange_small.jpg" else echo
		IF EXIST "microsoftLync_large.jpg" del /F "microsoftLync_large.jpg" else echo
		IF EXIST "microsoftLync_medium.jpg" del /F "microsoftLync_medium.jpg" else echo
		IF EXIST "microsoftLync_small.jpg" del /F "microsoftLync_small.jpg" else echo
		IF EXIST "microsoftSharepoint_large.jpg" del /F "microsoftSharepoint_large.jpg" else echo
		IF EXIST "microsoftSharepoint_medium.jpg" del /F "microsoftSharepoint_medium.jpg" else echo
		IF EXIST "microsoftSharepoint_small.jpg" del /F "microsoftSharepoint_small.jpg" else echo
		IF EXIST "mozy_large.jpg" del /F "mozy_large.jpg" else echo
		IF EXIST "mozy_medium.jpg" del /F "mozy_medium.jpg" else echo
		IF EXIST "mozy_small.jpg" del /F "mozy_small.jpg" else echo
		IF EXIST "smartPhones_large.jpg" del /F "smartPhones_large.jpg" else echo
		IF EXIST "smartPhones_medium.jpg" del /F "smartPhones_medium.jpg" else echo
		IF EXIST "smartPhones_small.jpg" del /F "smartPhones_small.jpg" else echo
		IF EXIST "vmWare_large.jpg" del /F "vmWare_large.jpg" else echo
		IF EXIST "vmWare_medium.jpg" del /F "vmWare_medium.jpg" else echo
		IF EXIST "vmWare_small.jpg" del /F "vmWare_small.jpg" else echo
		IF EXIST "voip_large.jpg" del /F "voip_large.jpg" else echo
		IF EXIST "voip_medium.jpg" del /F "voip_medium.jpg" else echo
		IF EXIST "voip_small.jpg" del /F "voip_small.jpg" else echo
		cd /
		echo "EAS Images removed successfully."
	)
	
rem #------------- Clean up Modern UI images in EAS4.2 -------------#
SET FileToDelete_modern_ui_images="%SYNERGY_HOME%\css\modern_ui\images"
	if exist %FileToDelete_modern_ui_images% (
		cd /d "%FileToDelete_modern_ui_images%"
		IF EXIST "Actions-im-user-icon.png" del /F "Actions-im-user-icon.png" else echo
		IF EXIST "adduser.png" del /F "adduser.png" else echo
		IF EXIST "arrows-asc.gif" del /F "arrows-asc.gif" else echo
		IF EXIST "arrows-desc.gif" del /F "arrows-desc.gif" else echo
		IF EXIST "bg.gif" del /F "bg.gif" else echo
		IF EXIST "bg_login.png" del /F "bg_login.png" else echo
		IF EXIST "bg-accordion.gif" del /F "bg-accordion.gif" else echo
		IF EXIST "bg-body.gif" del /F "bg-body.gif" else echo
		IF EXIST "bg-body.png" del /F "bg-body.png" else echo
		IF EXIST "bg-body_orderCustomer.png" del /F "bg-body_orderCustomer.png" else echo
		IF EXIST "bg-body11.png" del /F "bg-body11.png" else echo
		IF EXIST "bg-heading.gif" del /F "bg-heading.gif" else echo
		IF EXIST "bg-heading02.gif" del /F "bg-heading02.gif" else echo
		IF EXIST "bg-nav-arrow.gif" del /F "bg-nav-arrow.gif" else echo
		IF EXIST "bg-nav-l.gif" del /F "bg-nav-l.gif" else echo
		IF EXIST "bg-nav-r.gif" del /F "bg-nav-r.gif" else echo
		IF EXIST "broadsoft.jpg" del /F "broadsoft.jpg" else echo
		IF EXIST "btn-cancel.gif" del /F "btn-cancel.gif" else echo
		IF EXIST "btn-save.gif" del /F "btn-save.gif" else echo
		IF EXIST "btn-sprite.gif" del /F "btn-sprite.gif" else echo
		IF EXIST "button_french.png" del /F "button_french.png" else echo
		IF EXIST "catalog-body1.png" del /F "catalog-body1.png" else echo
		IF EXIST "change_password.png" del /F "change_password.png" else echo
		IF EXIST "check2.png" del /F "check2.png" else echo
		IF EXIST "ddn.png" del /F "ddn.png" else echo
		IF EXIST "dn.png" del /F "dn.png" else echo
		IF EXIST "exchange_server1.jpg" del /F "exchange_server1.jpg" else echo
		IF EXIST "Exchange1.jpg" del /F "Exchange1.jpg" else echo
		IF EXIST "Exchange2010.jpg" del /F "Exchange2010.jpg" else echo
		IF EXIST "exit.png" del /F "exit.png" else echo
		IF EXIST "favicon1.ico" del /F "favicon1.ico" else echo
		IF EXIST "fhbg.gif" del /F "fhbg.gif" else echo
		IF EXIST "free-trial-icon.jpg" del /F "free-trial-icon.jpg" else echo
		IF EXIST "go_right_black.png" del /F "go_right_black.png" else echo
		IF EXIST "goback.gif" del /F "goback.gif" else echo
		IF EXIST "goback_black.gif" del /F "goback_black.gif" else echo
		IF EXIST "hand-cursor-black.png" del /F "hand-cursor-black.png" else echo
		IF EXIST "help.gif" del /F "help.gif" else echo
		IF EXIST "hl.png" del /F "hl.png" else echo
		IF EXIST "i18n.png" del /F "i18n.png" else echo
		IF EXIST "Iaas.jpg" del /F "Iaas.jpg" else echo
		IF EXIST "icon01.gif" del /F "icon01.gif" else echo
		IF EXIST "icon25.gif" del /F "icon25.gif" else echo
		IF EXIST "icon26.gif" del /F "icon26.gif" else echo
		IF EXIST "icon27.gif" del /F "icon27.gif" else echo
		IF EXIST "icon28.gif" del /F "icon28.gif" else echo
		IF EXIST "icon35.gif" del /F "icon35.gif" else echo
		IF EXIST "icon37.gif" del /F "icon37.gif" else echo
		IF EXIST "icon-search.gif" del /F "icon-search.gif" else echo
		IF EXIST "icon-search.png" del /F "icon-search.png" else echo
		IF EXIST "img-not-available.png" del /F "img-not-available.png" else echo
		IF EXIST "invoice.png" del /F "invoice.png" else echo
		IF EXIST "invoice1.png" del /F "invoice1.png" else echo
		IF EXIST "leftnav_btm.png" del /F "leftnav_btm.png" else echo
		IF EXIST "leftnav_midstretch.png" del /F "leftnav_midstretch.png" else echo
		IF EXIST "leftnav_top.png" del /F "leftnav_top.png" else echo
		IF EXIST "line.gif" del /F "line.gif" else echo
		IF EXIST "load.png" del /F "load.png" else echo
		IF EXIST "lock-small.png" del /F "lock-small.png" else echo
		IF EXIST "login.png" del /F "login.png" else echo
		IF EXIST "logo_ws_hyper.jpg" del /F "logo_ws_hyper.jpg" else echo
		IF EXIST "logo1.png" del /F "logo1.png" else echo
		IF EXIST "manage.png" del /F "manage.png" else echo
		IF EXIST "messaging.jpg" del /F "messaging.jpg" else echo
		IF EXIST "microsoftDatacenter.jpg" del /F "microsoftDatacenter.jpg" else echo
		IF EXIST "microsoftDynamics.jpg" del /F "microsoftDynamics.jpg" else echo
		IF EXIST "microsoftExchange.jpg" del /F "microsoftExchange.jpg" else echo
		IF EXIST "microsoftLync.jpg" del /F "microsoftLync.jpg" else echo
		IF EXIST "mozy.jpg" del /F "mozy.jpg" else echo
		IF EXIST "msg&colab.jpg" del /F "msg&colab.jpg" else echo
		IF EXIST "no_image21.jpg" del /F "no_image21.jpg" else echo
		IF EXIST "payflowpro.jpg" del /F "payflowpro.jpg" else echo
		IF EXIST "pbar-ani1.gif" del /F "pbar-ani1.gif" else echo
		IF EXIST "purchase.png" del /F "purchase.png" else echo
		IF EXIST "register.png" del /F "register.png" else echo
		IF EXIST "s1.gif" del /F "s1.gif" else echo
		IF EXIST "s2.gif" del /F "s2.gif" else echo
		IF EXIST "s3.gif" del /F "s3.gif" else echo
		IF EXIST "s4.gif" del /F "s4.gif" else echo
		IF EXIST "s5.gif" del /F "s5.gif" else echo
		IF EXIST "selectedmenubuttonbg.png" del /F "selectedmenubuttonbg.png" else echo
		IF EXIST "smartphones.jpg" del /F "smartphones.jpg" else echo
		IF EXIST "smartphones2.jpg" del /F "smartphones2.jpg" else echo
		IF EXIST "sugestion.png" del /F "sugestion.png" else echo
		IF EXIST "suggestedService.jpg" del /F "suggestedService.jpg" else echo
		IF EXIST "suggestion.png" del /F "suggestion.png" else echo
		IF EXIST "suggestionBox - Copy.jpg" del /F "suggestionBox - Copy.jpg" else echo
		IF EXIST "suggestionBox.jpg" del /F "suggestionBox.jpg" else echo
		IF EXIST "tick_man_for_blackTheme.png" del /F "tick_man_for_blackTheme.png" else echo
		IF EXIST "title.gif" del /F "title.gif" else echo
		IF EXIST "unlocked.png" del /F "unlocked.png" else echo
		IF EXIST "uup.png" del /F "uup.png" else echo
		IF EXIST "view.png" del /F "view.png" else echo
		IF EXIST "vmware.jpg" del /F "vmware.jpg" else echo
		IF EXIST "VO365.jpg" del /F "VO365.jpg" else echo
		IF EXIST "VOIP.jpg" del /F "VOIP.jpg" else echo
		IF EXIST "vps2.jpeg" del /F "vps2.jpeg" else echo
		IF EXIST "vps3.jpg" del /F "vps3.jpg" else echo
		IF EXIST "vps4.jpg" del /F "vps4.jpg" else echo
		IF EXIST "vps5.jpg" del /F "vps5.jpg" else echo
		IF EXIST "vps6.jpg" del /F "vps6.jpg" else echo
		IF EXIST "vps7.jpg" del /F "vps7.jpg" else echo
		IF EXIST "vps8.jpg" del /F "vps8.jpg" else echo
		IF EXIST "wbg.gif" del /F "wbg.gif" else echo
	)
	
	if exist %FileToDelete_modern_ui_images%\images (
		cd /d "%FileToDelete_modern_ui_images%\images"
		IF EXIST "cloud_large.jpg" del /F "cloud_large.jpg" else echo
		IF EXIST "cloud_medium.jpg" del /F "cloud_medium.jpg" else echo
		IF EXIST "cloud_small.jpg" del /F "cloud_small.jpg" else echo
		IF EXIST "Iaas.jpg" del /F "Iaas.jpg" else echo
		IF EXIST "messaging.jpg" del /F "messaging.jpg" else echo
		IF EXIST "microsoft_large.jpg" del /F "microsoft_large.jpg" else echo
		IF EXIST "microsoft_medium.jpg" del /F "microsoft_medium.jpg" else echo
		IF EXIST "microsoft_small.jpg" del /F "microsoft_small.jpg" else echo
		IF EXIST "microsoftDynamics_large.jpg" del /F "microsoftDynamics_large.jpg" else echo
		IF EXIST "microsoftDynamics_medium.jpg" del /F "microsoftDynamics_medium.jpg" else echo
		IF EXIST "microsoftDynamics_small.jpg" del /F "microsoftDynamics_small.jpg" else echo
		IF EXIST "microsoftExchange_large.jpg" del /F "microsoftExchange_large.jpg" else echo
		IF EXIST "microsoftExchange_medium.jpg" del /F "microsoftExchange_medium.jpg" else echo
		IF EXIST "microsoftExchange_small.jpg" del /F "microsoftExchange_small.jpg" else echo
		IF EXIST "microsoftLync_large.jpg" del /F "microsoftLync_large.jpg" else echo
		IF EXIST "microsoftLync_medium.jpg" del /F "microsoftLync_medium.jpg" else echo
		IF EXIST "microsoftLync_small.jpg" del /F "microsoftLync_small.jpg" else echo
		IF EXIST "microsoftSharepoint_large.jpg" del /F "microsoftSharepoint_large.jpg" else echo
		IF EXIST "microsoftSharepoint_medium.jpg" del /F "microsoftSharepoint_medium.jpg" else echo
		IF EXIST "microsoftSharepoint_small.jpg" del /F "microsoftSharepoint_small.jpg" else echo
		IF EXIST "mozy_large.jpg" del /F "mozy_large.jpg" else echo
		IF EXIST "mozy_medium.jpg" del /F "mozy_medium.jpg" else echo
		IF EXIST "mozy_small.jpg" del /F "mozy_small.jpg" else echo
		IF EXIST "smartPhones_large.jpg" del /F "smartPhones_large.jpg" else echo
		IF EXIST "smartPhones_medium.jpg" del /F "smartPhones_medium.jpg" else echo
		IF EXIST "smartPhones_small.jpg" del /F "smartPhones_small.jpg" else echo
		IF EXIST "vmWare_large.jpg" del /F "vmWare_large.jpg" else echo
		IF EXIST "vmWare_medium.jpg" del /F "vmWare_medium.jpg" else echo
		IF EXIST "vmWare_small.jpg" del /F "vmWare_small.jpg" else echo
		IF EXIST "voip_large.jpg" del /F "voip_large.jpg" else echo
		IF EXIST "voip_medium.jpg" del /F "voip_medium.jpg" else echo
		IF EXIST "voip_small.jpg" del /F "voip_small.jpg" else echo
	)
	
	if exist %FileToDelete_modern_ui_images%\orderstatusicon (
		cd /d "%FileToDelete_modern_ui_images%\orderstatusicon"
		IF EXIST "downgradependingapproval.gif" del /F "downgradependingapproval.gif" else echo
		IF EXIST "pendingapproval.gif" del /F "pendingapproval.gif" else echo
		IF EXIST "provisioned.jpg" del /F "provisioned.jpg" else echo
		IF EXIST "provisioning.jpg" del /F "provisioning.jpg" else echo
		IF EXIST "resumed.jpg" del /F "resumed.jpg" else echo
		IF EXIST "resuming.jpg" del /F "resuming.jpg" else echo
		IF EXIST "toberesumed.jpg" del /F "toberesumed.jpg" else echo
		IF EXIST "updatependingapproval.gif" del /F "updatependingapproval.gif" else echo
		IF EXIST "upgradependingapproval.gif" del /F "upgradependingapproval.gif" else echo
		cd /
		echo "EAS Modern UI images removed successfully."
	)
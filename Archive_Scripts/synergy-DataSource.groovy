/*
 * #=============================================================================
 *  # Copyright (c) Ensim Corporation 2012 All Rights Reserved.
 *  #
 *  # This software is furnished under a license and may be used and copied
 *  # only  in  accordance  with  the  terms  of such  license and with the
 *  # inclusion of the above copyright notice. This software or any other
 *  # copies thereof may not be provided or otherwise made available to any
 *  # other person. No title to and ownership of the software is hereby
 *  # transferred.
 *  #
 *  # The information in this software is subject to change without notice
 *  # and  should  not be  construed  as  a commitment by Ensim Corporation.
 *  # Ensim assumes no responsibility for the use or  reliability  of its
 *  # software on equipment which is not supplied by Ensim.
 *  #=============================================================================
 */



import org.codehaus.groovy.grails.orm.hibernate.cfg.GrailsAnnotationConfiguration
import com.ensim.encryptDecrypt.Password

dataSource {
    /*
    Database dialect:
        org.hibernate.dialect.HSQLDialect
        org.hibernate.dialect.MySQLDialect
        org.hibernate.dialect.Oracle9Dialect
    */

    /*Please select your preferred DataBase vendor and uncomment only corresponding DB properties.
    Please do not change the value of 'hibernate.connection.driver_class' and 'hibernate.dialect' in any circumstances.
    Change the value of the other 3 properties according to your DB configuration.
    Use any one type of password either plaintext or encrypted password.
	To get the encrypted password execute "ESCMPasswordEncryption.jar" (attached in ESCM-ISO) specifying the plaintext password in the first argument.*/

    /******* Recommended  minPoolSize & maxPoolSize settings ********/
    //For Application server minPoolSize=50  maxPoolSize=100
    //For API server minPoolSize=5  maxPoolSize=100

    /*----------- For Oracle11gR2 -----------*/

    /*dialect = "org.hibernate.dialect.OracleDialect"
    driverClassName = "oracle.jdbc.driver.OracleDriver"
    username = "myUser"
    //password = "myPassword"
    password = Password.decrypt("myEncryptedPassword")
    url = "jdbc:oracle:thin:@//<IP or HostName>:<Port>/SID"*/

    /*----------- For MS SQL 2012 -----------*/
    /*dialect = "org.hibernate.dialect.SQLServer2008Dialect"
    driverClassName = "net.sourceforge.jtds.jdbc.Driver"
    username = "sa"
    password = "Independent12#"
    url = "jdbc:jtds:sqlserver://10.10.1.136:1433/perfload_db3;instance=sa"*/
	
	/*----------- For MS SQL 2012 -----------*/
    dialect = "org.hibernate.dialect.SQLServer2008Dialect"
    driverClassName = "net.sourceforge.jtds.jdbc.Driver"
    username = "EAS_SCHEMA"
    password = "Independent12#"
    url = "jdbc:jtds:sqlserver://10.10.1.81:1433/EAS_DB"
	

    /* ----------- For PostgreSQL -----------*/
    /*dialect = "org.hibernate.dialect.PostgreSQLDialect"
    driverClassName = "org.postgresql.Driver"
    username = "myUser"
    //password = "myPassword"
	password = Password.decrypt("myEncryptedPassword")
    url = "jdbc:postgresql://<IP or HostName>:<Port>/myDB"*/

    /*
	Other database configuration settings. Do not change unless you know what you are doing!
    See resources.groovy for additional configuration options
    */

    pooled = true
    configClass = GrailsAnnotationConfiguration.class
    dbCreate = "none"
    minPoolSize=50
    maxPoolSize=200
    maxIdleTime=1800

}

/* Entries for Payment Plugin */

/*dataSource_payflowproPluginDB {

    //----------- For Oracle11gR2 -----------
    dialect = "org.hibernate.dialect.OracleDialect"
    driverClassName = "oracle.jdbc.driver.OracleDriver"
    username = "<myUser>"
    //password = "<myPassword>"
    password = Password.decrypt("myEncryptedPassword")
    url = "jdbc:oracle:thin:@//<IP or HostName>:<Port>/<SID>"


    //----------- For MS SQL 2012 -----------
    dialect = "org.hibernate.dialect.SQLServer2008Dialect"
    driverClassName = "net.sourceforge.jtds.jdbc.Driver"
    username = "<myUser>"
    //password = "<myPassword>"
    password = Password.decrypt("myEncryptedPassword")
    url = "jdbc:jtds:sqlserver://<IP or HostName>:<Port>/<myDB>;instance=<Named instance>"


    //----------- For PostgreSQL -----------
    dialect = "org.hibernate.dialect.PostgreSQLDialect"
    driverClassName = "org.postgresql.Driver"
    username = "<myUser>"
    //password = "<myPassword>"
    password = Password.decrypt("myEncryptedPassword")
    url = "jdbc:postgresql://<IP or HostName>:<Port>/<myDB>"

    pooled = true
    configClass = GrailsAnnotationConfiguration.class
    dbCreate = "none"
}*/



/* ----------------End----------------- */

hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = true
    cache.provider_class = 'net.sf.ehcache.hibernate.EhCacheProvider'
}

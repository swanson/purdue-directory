<?php

//dir.php
//extracts directory contact info from purdue's ldap database, same
//as directory.purdue.edu -- but not so terrible; generates tagged XML
//for parsing and processing via iphone
//
//note: attribute keys are case-sensitive! 'homePhone' =/= 'homephone'
//
//ece495: vip -- gwiki iphone team, fall 2009
//copyright (c) 2009 matt swanson
//This work is licensed under a creative Commons 
//Attribution-Noncommercial 3.0 Unported License


//server specific settings
$ldap_host="ped.purdue.edu";
$base_dn="dc=purdue,dc=edu";

//obtain search query from url arguments; append * for wildcard
$lastname=$_REQUEST['ln']."*";
$firstname=$_REQUEST['fn']."*";

//create simple query filter; match lastname AND firstname
$filter="(&(sn=$lastname)(givenName=$firstname))";

//only grab what we need
$retrieve=array("cn", "mail", "homePhone", "homePostalAddress");

//connect to the host, port 389 for ldap (vs 636 for secured ldap)
$connect=ldap_connect($ldap_host, 389)
	or exit(">>CANT CONNECT TO LDAP SERVER<<");

//ensure we arent using ldap2 or some other outdated version
ldap_set_option($connect, LDAP_OPT_PROTOCOL_VERSION, 3);
//dont let server route us to some other ldap 
ldap_set_option($connect, LDAP_OPT_REFERRALS, 0);

//binding=authenticate; we can connect anonymously to purdue's ldap
$bind=ldap_bind($connect);

//perform lookup search on the ldap using our filter
$dataraw=ldap_search($connect, $base_dn, $filter)
	or exit(">>CANT SEARCH<<");

//extract query entries into an array
$data=ldap_get_entries($connect,$dataraw);

//generate xml header, if you dont NSXMLParser will yell
echo('<?xml version="1.0" encoding="ISO-8859-1"?>'."\n");
echo('<results>'."\n");

//step through query array; xml tag each field
for ($i=0; $i < $data["count"]; $i++){
	echo ('<person>'."\n");
	echo ('<name>'.$data[$i]["cn"][0].'</name>'."\n");
	echo ('<email>'.$data[$i]["mail"][0].'</email>'."\n");
	echo ('<phone>'.$data[$i]["homephone"][0].'</phone>'."\n");
	echo ('<addr>'.$data[$i]["homepostaladdress"][0].'</addr>'."\n");
	echo ('<univ>'.$data[$i]["purdueeduschool"][0]." (".$data[$i]["purdueeducampus"][0].")".'</univ>'."\n");
	echo ('</person>'."\n");
}

//close up xml
echo('</results>'."\n");

//unbind ldap connection; kills any operations that are still running 
//and closes connection
ldap_unbind($connect);
?>

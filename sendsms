<?php
/*
Author: Ewere Diagboya
Company: Wicee Solutions
Description: This API is built on three major SMS APIs in Nigera: 
SMSLIVE - smslive247.com
KullSMS - kullsms.com
Xwireless - xwireless.net

You are free to edit the code and use your own SMS API as you choose

For Complaints or Comments
Phone: 08066194746
Email: boya360@yahoo.com

*/

// Connect to the Database - create your own database connection
mysql_connect("localhost","root","");
mysql_select_db("smsdb");

/* 

Send Code

Get Parameters from URL Sent and Insert into the DB
No validation is really required
Just few to parse the correct information to the DB

Email, Password
*/

// Constant Definitions
define("ADEMAIL",$ad_email,true);
define("SUBAC",$sbact,true);
define("SUBPWD",$sbpwd,true);
define("SMSURL",$surl,true);

// Function to Send SMS
function sendsms ($email, $pwd, $nos, $from, $msg) 
{
// Login user before trying to send SMS and balance 
$sql = "SELECT *  FROM  members WHERE (email='$email' OR phone='$email') AND password=md5('$pwd')";
$runq = mysql_query($sql);
$rec = mysql_fetch_array($runq);
$tl = mysql_num_rows($runq);
$balance = $rec[bal];


if(!$runq)
{
echo "Server Error";
}
else
{
if ($tl == 1) {
// LOGIN SUCCESS
////////////////////////////////////////////
	
    $splitnos = substr($nos,0,-1);
		$splnos = explode(",", $splitnos);
		$totalnos = count($splnos);		
		
		
		foreach ($splnos as $recs) // Sending Loop
		{
			if ($balance > 0) // If balance is greater than 0 then user can send
			{
				// Send to Database
				$sqlq = "INSERT INTO msgs (`id` ,  `email` ,  `sender` ,  `to` ,  `msg` ,  `dnt`)  VALUES (NULL ,  '$email',  '$from',  '$recs',  

'$msg', NOW( ))";
				$runq = mysql_query($sqlq) or die("Server Error");
			

				// Update balance by deducting from original
				$sqlupd = "update members set bal=bal-1 where email='$email'";
				$runupd = mysql_query($sqlupd) or die("Server Error");
			
				$i++; // Increment Counter
			

				// Kull API
				$kemail = "your-kull-sms-email";
				$kpwd = "your-kullsms-password";
				$recss = "234" . substr($recs, 1);
			
				// Send SMS through KULLSMS API
// $s_sms = file('http://sms.kullsms.com/customer/bulksms/?username=nimoniks@gmail.com&password=kullsmspwd&message='. urlencode($msg) . '&sender=' . $from . 

'&mobiles=' . $recss );
		
				// Send SMS through SMSLive
				$ssms = file('http://www.smslive247.com/http/index.aspx?cmd=sendquickmsg&owneremail=' . ADEMAIL . '&subacct=' . SUBAC . '&subacctpwd=' 

. SUBPWD . '&message=' . rawurlencode($msg) . '&sender=' . rawurldecode($from) . '&sendto=' . rawurlencode($recs) . '&msgtype=0');
		
                // Send SMS through Xwireless
                $xusername = "your-username";
                $xpassword = "your-password";
                    //  $se_sms = file('http://smsc.xwireless.net/API/WebSMS/Http/v1.0a/index.php?username='. $xusername  .'&password='. $xpassword .'&sender=' . rawurldecode($from) . 

'&to=' . rawurlencode($recs) .'&message=' . rawurlencode($msg) . '&international=1&reqid=1&format={json|text}&route_id=<route+id>&sendondate=04-09-2012T03:16:11');
			
			
				// Give return
			//echo "<p>$i</p>";
			if ($i == $totalnos)
			{
				// Update balance 
				$sqlupd = "update members set bal=bal+1 where email='$email'";
				$runupd = mysql_query($sqlupd) or die("Server Error");
				echo "OK: " . $s_sms[0];
			}
			
			}
			else // If balance is equal to or greater than 0
			{
				echo "ER";
				break;
			}
		
		} // Sending Loop
		
}
else {
		echo "0"; // Login Failure
	}
}
}
?>

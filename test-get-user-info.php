<?php

session_start();
#$_SESSION['temp'] = "Value";

$ch = curl_init("http://localhost/users/info/".$_COOKIE['_codelearn-playground_session']);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);


$data = curl_exec($ch);
$json = json_decode($data);
#var_dump($json);
if (is_null($json->{'user_id'})) {
	echo "user not signed in ".$_SESSION['temp'];
}
else {
	echo "user id - ".$json->{'user_id'};
}
curl_close($ch);

?>

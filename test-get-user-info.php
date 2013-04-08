<?php

if (is_null($_COOKIE['login_user_token']) ) {
	echo "user not signed in";
}
else {
	$a = explode(",",$_COOKIE['login_user_token']);
	echo "user id - ".str_replace("[","",$a[1]);
}

?>

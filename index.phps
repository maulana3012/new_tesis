<?php
require_once "_lib/config.php";

$login_status = $login->cek_login();
if($login_status){
	header('Location:dasboard.php');
	exit();
}
else{
	include "login.php";
}
?>
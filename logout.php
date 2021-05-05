<?php
include_once "_lib/config.php";
if ($user->logout()) {
	$user->redirect('index.php');
}
?>
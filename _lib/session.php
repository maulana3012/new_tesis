<?php
session_start();
if (isset($_SESSION['USERID']) && $_SESSION['USERID'] === true) {
	header("location: halaman_super.php");
	exit;
}
?>
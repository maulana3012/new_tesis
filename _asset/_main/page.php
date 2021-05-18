<?php
if(isset($_GET['page'])) {
	$page = $_GET['page'];

switch ($page) {
	case 'Home':
		include "dasboard.php";
		break;
	case 'eForm':
		include "eform.php";
		break;
	case 'attendance':
		include "attendance.php";
		break;
	case 'Manage':
		include "Manage.php";
		break;

	default:
		echo"<center><h3>Maaf, Halaman tidak ditemukan</h3></center>";
		break;
}

}else {
	include "main.php";
}
?>
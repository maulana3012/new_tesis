<?php
if(isset($_GET['page'])) {
	$page = $_GET['page'];

switch ($page) {
	case 'Dasboard':
		include "main.php";
		break;
	case 'Input-Data':
		include "main.php";
		break;
	case 'Data-Trening':
		include "data-training.php";
		break;
	case 'Data-Testing':
		include "from_upload.php";
		break;
	case 'From Upload':
		include "from_upload.php";
		break;
	case 'Hasil':
		include "main.php";
		break;
	case 'Register':
		include "main.php";
		break;

	default:
		echo"<center><h3>Maaf, Halaman tidak ditemukan</h3></center>";
		break;
}

}else {
	include "main.php";
}
?>
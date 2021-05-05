<?php
if(isset($_GET['page'])) {
	$page = $_GET['page'];

switch ($page) {
	case 'Form_a1':
		include "form_a1.php";
		break;
	case 'Form_a2':
		include "form_a2.php";
		break;
	case 'Form_a3':
		include "form_a3.php";
		break;
	case 'Data-Testing':
		include "from_upload.php";
		break;
	case 'Backpropagation':
		include "main.php";
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
	include "form_a1.php";
}
?>
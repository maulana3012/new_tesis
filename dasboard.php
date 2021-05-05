<?php
include_once "_lib/config.php";
if(!$user->is_loggedin())
{
 $user->redirect('index.php');
}

$user_id = $_SESSION['user_session'];
$stmt = $db_con->prepare("SELECT * FROM tb_access_karyawan WHERE ID=:user_id");
$stmt->execute(array(":user_id"=>$user_id));
$userRow=$stmt->fetch(PDO::FETCH_ASSOC);
if ($userRow['STATUS'] == 1) {
  $Fnik         = $userRow['NIK'];
  $Ffullname    = $userRow['FULLNAME'];
  $Email        = $userRow['EMAIL'];
  $TmpPassword  = $userRow['TEMPORARY_PASSWORD'];
  $Password     = $userRow['PASSWORD'];
}else{
  session_destroy();
  $user->logout();
  echo "<script>alert('Waktu Anda Telah Habis Broo!'); window.location ='index.php'></script>";
}
?>
<!DOCTYPE html>
<html>
<head>
  <title>Face Recognition</title>
</head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<link rel="icon" type="image/png" href="_images/icons/favicon.ico"/>
<link rel="stylesheet" type="text/css" href="_asset/_fonts/fontawesome-free/css/all.min.css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="_asset/_css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="_asset/_css/mtech.css">
<link rel="stylesheet" type="text/css" href="_asset/_css/carousel.css">
<body>

<?php require_once "_asset/_main/top.php"; ?>
<div class="container-fluid">
<?php require_once "_asset/_main/page.php"; ?>
<?php require_once "_asset/_main/bottom.php"; ?>
</div>
<?php require_once "_asset/_main/modal.php"; ?>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
<script type="text/javascript" src="_asset/_js/bootstrap.min.js"></script>
<script type="text/javascript" src="_asset/_js/holder.min.js"></script>
</body>
</html>
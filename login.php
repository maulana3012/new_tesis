<?php
include_once "_lib/config.php";
if(!$user->cek_salah_login()){
	$error[] = "Mohon maaf Anda tidak dapat login lagi karena kesalahan login Anda terlalu banyak. Hubungi Administrator untuk informasi lebih lanjut";
}

if (isset($_POST['submit'])) {
	$fnik 	= $_POST['fnik'];
	$fpassword  = $_POST['fpassword'];

	if (empty($fnik)) {
		$error[] = "Please enter your Username ...!";
	}

	if (empty($fpassword)) {
		$error[] = "Please enter your Password ...!";
	}

	if (empty($error)) {
		if ($user->login($fnik, $fpassword)) {
			
			$expired = 0;
			if(isset($_POST['remember'])){
				if($_POST['remember'] = 1){
				}
			}

			if ($user->true_login($fnik, $expired)) {
				$user->redirect('dasboard.php');	
			}

		}else{
			$user->salah_login_action($fnik);
			$error[] = "Username atau password tersebut salah";
		}
	}else{
		$user->salah_login_action($fnik);
		$error[] = "Username atau password belum terdaftar";
	}
}

?>
<!DOCTYPE html>
<html>
<head>
	<title>Login Systen</title>
</head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<link rel="stylesheet" type="text/css" href="_asset/_vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="_asset/_fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="_asset/_fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<link rel="stylesheet" type="text/css" href="_asset/_vendor/animate/animate.css">
<link rel="stylesheet" type="text/css" href="_asset/_vendor/css-hamburgers/hamburgers.min.css">
<link rel="stylesheet" type="text/css" href="_asset/_vendor/animsition/css/animsition.min.css">
<link rel="stylesheet" type="text/css" href="_asset/_vendor/select2/select2.min.css">
<link rel="stylesheet" type="text/css" href="_asset/_vendor/daterangepicker/daterangepicker.css">
<link rel="stylesheet" type="text/css" href="_asset/_css/util.css">
<link rel="stylesheet" type="text/css" href="_asset/_css/main.css">
<link rel="stylesheet" type="text/css" href="_asset/_css/load.css">
<body>
<div class="preloader">
    <div class="loading">
      <img src="_asset/_images/loader.gif" width="200">
      <p style="font-size: 20px; font-weight: bold; margin-left: 20px;">Harap Tunggu ...</p>
    </div>
  </div>
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<form class="login100-form validate-form" action="" method="post">
					<span class="login100-form-title p-b-43">
						Login to continue
					</span>
					<?php
			            if(isset($error))
			            {
			               foreach($error as $error)
			               {
			                  ?>
			                  <div class="alert alert-danger">
			                      <i class="fa fa-exclamation-circle"></i> &nbsp; <?php echo $error; ?>
			                  </div>
			                  <?php
			               }
			            }
			        ?>
					<div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
						<input type="text" name="fnik" class="input100" required>
						<span class="focus-input100"></span>
						<span class="label-input100">Username</span>
					</div>
					
					
					<div class="wrap-input100 validate-input" data-validate="Password is required">
						<input type="password" name="fpassword" class="input100" required>
						<span class="focus-input100"></span>
						<span class="label-input100">Password</span>
					</div>

					<div class="flex-sb-m w-full p-t-3 p-b-32">
						<div class="contact100-form-checkbox">
							<input class="input-checkbox100" id="rmb" type="checkbox" name="remember" value="1">
							<label class="label-checkbox100" for="rmb">
								Remember me
							</label>
						</div>

						<div>
							<a href="#" class="txt1">
								Forgot Password?
							</a>
						</div>
					</div>
			

					<div class="container-login100-form-btn">
						<button type="submit" name="submit" class="login100-form-btn">Masuk</button>
					</div>
					
					<div class="text-center p-t-46 p-b-20">
						<span class="txt2">
							Creted By Muhamad Maulana Rachman - System V.1.0
						</span>
					</div>

				</form>

				<div class="login100-more" style="background-image: url('_asset/_images/background_FMD.png');">
				</div>
			</div>
		</div>
	</div>
</body>
<script src="_asset/_vendor/jquery/jquery-3.2.1.min.js"></script>
<script src="_asset/_vendor/animsition/js/animsition.min.js"></script>
<script src="_asset/_vendor/bootstrap/js/popper.js"></script>
<script src="_asset/_vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="_asset/_vendor/select2/select2.min.js"></script>
<script src="_asset/_vendor/daterangepicker/moment.min.js"></script>
<script src="_asset/_vendor/daterangepicker/daterangepicker.js"></script>
<script src="_asset/_vendor/countdowntime/countdowntime.js"></script>
<script src="_asset/_js/main.js"></script>
	<script>
    $(document).ready(function(){
    $(".preloader").fadeOut();
    })
    </script>
</html>
<?php
include_once "asset/_lib/config.php";

if(!$user->is_loggedin())
{
 $user->redirect('index.php');
}

if (isset($_GET['fid'])) {
  $fid = $_GET['fid'];
  $row = $user->data_image($fid);
  $num_of_rows = count($row);
}

?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
	<title></title>
</head>
<body>
	<div id="wrapper">
		<div id="content-wrapper" class="d-flex flex-column">
			<div id="content">
				<div class="container-fluid">
					<h1 class="h3 mb-2 text-gray-800">Image dataset with <i><b>Mask</b></i> or <i><b>Without Mask</b></i></h1>
					<hr class="sidebar-divider">
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">Dataset with <i><b>Mask</b></i> or <i><b>Without Mask</b></i></h6>
						</div>
						<div class="card-body">
							<div class="col-lg-12">

								<div class="row">
									<div class="col-lg-6">
										<div class="card">
											<div class="card-header">
												<h6 class="m-0 font-weight-bold text-primary">Image Without <i><b>Mask</b></i></h6>
												<div class="card-body">
													<div class="row">
														<?php
														foreach ($row as $data) {

															if ($data['STATUS_IMAGE'] != 1) {
					                                            $err ='alert alert-danger';
					                                            $msg = 'Without Mask';
					                                        }else{
					                                            $err = 'alert alert-success';
					                                            $msg = 'With Mask';
					                                        }

															if ($data['STATUS_IMAGE'] != 1) {
																echo "<div class='col-lg-4'>";
																	echo "<div class='card'>";
																		echo "<img src='".$data['RGB_IMAGE']."' class='card-img-top' width='200px' height='300px'>";
																		echo "<div class='card-body'>";
																			echo "<p class='".$err."' style='text-align: center;'>".$msg."</p>";
																		echo "</div>";
																	echo "</div>";
																echo "</div>";
															}
														}
													?>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="col-lg-6">
										<div class="card">
											<div class="card-header">
												<h6 class="m-0 font-weight-bold text-primary">Image with <i><b>Mask</b></i></h6>
												<div class="card-body">
													<div class="row">
														<?php
														foreach ($row as $data) {

															if ($data['STATUS_IMAGE'] != 1) {
					                                            $err ='alert alert-danger';
					                                            $msg = 'Without Mask';
					                                        }else{
					                                            $err = 'alert alert-success';
					                                            $msg = 'With Mask';
					                                        }

															if ($data['STATUS_IMAGE'] != 0) {
																echo "<div class='col-lg-4'>";
																	echo "<div class='card'>";
																		echo "<img src='".$data['RGB_IMAGE']."' class='card-img-top' width='200px' height='300px'>";
																		echo "<div class='card-body'>";
																			echo "<p class='".$err."' style='text-align: center;'>".$msg."</p>";
																		echo "</div>";
																	echo "</div>";
																echo "</div>";
															}
														}
													?>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<hr>
								<div class="col-lg-12">
									<input type="submit" name="btn-proses" value="Proses Training Citra" class="btn btn-lg btn-success col-lg-12">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
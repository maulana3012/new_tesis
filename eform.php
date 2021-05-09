<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>
<div class="container-fluid">
	<div class="row">
		<div class="col-lg-3" style="padding: 10px 0 0 0;">
			<div class="well">
				<div class="panel panel-default">
				  <div class="panel-body">
				    <!-- Carousel
				    ================================================== -->
				    <div id="myCarousel" class="carousel slide" data-ride="carousel">
				      <!-- Indicators -->
				      <ol class="carousel-indicators">
				        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				        <li data-target="#myCarousel" data-slide-to="1"></li>
				        <li data-target="#myCarousel" data-slide-to="2"></li>
				      </ol>
				      <div class="carousel-inner" role="listbox">
				        <div class="item active">
				          <img class="first-slide" src="_asset/_images/ban1.jpg" alt="First slide">
				          <div class="container">
				            <div class="carousel-caption">
				              <!-- <h1>Example headline.</h1> -->
				            </div>
				          </div>
				        </div>
				        <div class="item">
				          <img class="second-slide" src="_asset/_images/ban2.jpg" alt="Second slide">
				          <div class="container">
				            <div class="carousel-caption">
				              <!-- <h1>Another example headline.</h1> -->
				            </div>
				          </div>
				        </div>
				        <div class="item">
				          <img class="third-slide" src="_asset/_images/ban3.jpg" alt="Third slide">
				          <div class="container">
				            <div class="carousel-caption"><!-- 
				              <h1>One more for good measure.</h1> -->
				            </div>
				          </div>
				        </div>
				      </div>
				      <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
				        <span class="sr-only">Previous</span>
				      </a>
				      <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
				        <span class="sr-only">Next</span>
				      </a>
				    </div><!-- /.carousel -->
				    <hr>
				    <div class="btn-group">
					  <button type="button" class="btn btn-primary">Action</button>
					  <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					    <span class="caret"></span>
					    <span class="sr-only">Toggle Dropdown</span>
					  </button>
					  <ul class="dropdown-menu">
					    <li><a href="dasboard.php?page=attendance">Izin</a></li>
					    <li><a href="#">Cuti</a></li>
					    <li><a href="#">Perjalanan Dinas</a></li>
					  </ul>
					</div>
				    <div class="btn-group">
				    	<a href="" class="btn btn-success">Export</a>
				    </div>
				    <br><br>
				    <div class="panel panel-default" style="top">
						<div class="panel-body">
						    <?php
							include '_asset/_main/calender.php';
							 
							$calendar = new Calendar();
							 
							echo $calendar->show();
							?>
						</div>
					</div>
					<hr>
					<p>Schedule Legend</p>
					<div class="col-lg-12">
						<div class="row">
							<div class="col-lg-6" style="text-align: center;">
								<div class="alert alert-info" role="alert">Tugas Kantor</div>
							</div>
							<div class="col-lg-6" style="text-align: center;">
								<div class="alert alert-danger" role="alert">Tidak Hadir</div>
							</div>
							<div class="col-lg-6" style="text-align: center;">
								<div class="alert alert-warning" role="alert">Telat/Pulang Cepat</div>
							</div>
						</div>
					</div>
				  </div>
				</div>
			</div>
		</div>
		<div class="col-lg-9" style="padding: 10px 5px 5px;">
			<div class="panel panel-default">
			  <div class="panel-heading">eForm</div>
			  <div class="panel-body">
			    <form action="" method="post">
			    	<div class="row">
					  <div class="col-lg-3">
					    <div class="input-group">
					      <span class="input-group-btn">
					        <button class="btn btn-primary" type="button"><i class="fa fa-search" aria-hidden="true"></i></button>
					      </span>
					      <input type="text" class="form-control" placeholder="Search eForm">
					    </div><!-- /input-group -->
					  </div><!-- /.col-lg-6 -->
					  <div class="col-lg-3">
					    <div class="input-group">
					      <div class="input-group-btn">
					        <button type="button" class="btn btn-primary" aria-haspopup="true" aria-expanded="false">Urutkan</button>
					      </div><!-- /btn-group -->
					      <select class="form-control">
					      	<option>-Pilih</option>
					      	<option>Tanggal Pembuatan</option>
					      	<option>Nama Karyawan</option>
					      	<option>Jenis Form</option>
					      </select>
					    </div><!-- /input-group -->
					  </div><!-- /.col-lg-6 -->
					  <div class="col-lg-3">
					  	<div class="btn-group" role="group" aria-label="Basic example">
						  <button type="button" class="btn btn-primary"><i class="fa fa-sort" aria-hidden="true"></i></button>
						  <button type="button" class="btn btn-warning"><i class="fa fa-eye-slash" aria-hidden="true"></i></button>
						</div>
					  </div>
					</div><!-- /.row -->
			    </form>
			    <hr>
			    <div class="well well-lg">
			    	<p class="h4"><b>Muhamad Maulana Rachman</b> • <small>17h ago</small></p>
			    	<p>Work From Home : 1. 02/04/2021 : fixing bug UAT individeo Zurich, creataed backup datafeed cycle 02 April 2021 EOV zurich, meeting internal team Zurich Individeo. 2. Created datafeed cycle 02/04/2021.</p>
			    	<p><i>Duty <i class="fa fa-clock" aria-hidden="true"></i> 08 April 2021 08:30 - 17:30</i></p>
			    	<p>
			    		<i class="fa fa-user-circle" aria-hidden="true"></i> Status Atasan : <b><i>Panding</i></b>
			    		&nbsp;&nbsp;&nbsp;&nbsp; 
			    		<i class="fa fa-user-circle" aria-hidden="true"></i> Status HRD : <b><i>Panding</i> </b>
			    	</p>
			    </div>
			  </div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
<?php
include_once "asset/_lib/config.php";

if(!$user->is_loggedin())
{
 $user->redirect('index.php');
}

if (isset($_GET['fid'])) {
  $fid = $_GET['fid'];
  $row = $user->show_karyawan_nik($fid);
}

if (isset($_POST['submit'])) {
  $limit = 10 * 1024 * 1024;
  $ekstensi =  array('png','jpg','jpeg','gif');
  $jumlahFile = count($_FILES['uploadfile']['name']);
  $fKid           = $row['NIK'];
  $fnameKaryawan  = $row['FRISTNAME'];
  
  $upload_dir_rgb = "asset/_upload/dataset/";
  

  for($x=0; $x<$jumlahFile; $x++){
    $fimage_name    = $_FILES['uploadfile']['name'][$x];
    $fimage_tmp     = $_FILES['uploadfile']['tmp_name'][$x];
    $imgExt         = strtolower(pathinfo($fimage_name,PATHINFO_EXTENSION));
    $fimage_size    = $_FILES['uploadfile']['size'][$x];
    
    $file_name_new = uniqid('With-Mask-',true) .'.'. $imgExt;
    $localFile      = $upload_dir_rgb;
    $localPath      = $upload_dir_rgb.$file_name_new;
    $status         = 1;

    if (empty($fimage_name)) {
        $error[]    = "Please Select Image File.";
    }elseif ($fimage_size > $limit) {
        $error[]    = "Sorry, your file is too large.";
    }else{
      if (!in_array($imgExt,$ekstensi)) {
        $error[]    = "Sorry, only JPG, JPEG, PNG & GIF files are allowed.";
      }else{
        $upload     = move_uploaded_file($fimage_tmp,$localFile.$file_name_new);
        $user->upload_register_employe($fKid,$fnameKaryawan,$localPath,$status);
        if ($user) {
          echo "<script>window.location.href='dasboard.php?page=Data-Employe-Upload&fid=".$fid."'</script>";
        }
      }
    }
  }
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
<body id="page-top">
	<div id="wrapper">
		<div id="content-wrapper" class="d-flex flex-column">
			<div id="content">
				<div class="container-fluid">
					<h1 class="h3 mb-2 text-gray-800">Register Data Employe</h1>
					<hr class="sidebar-divider">
					<?php
                        if(isset($error))
                        {
                           foreach($error as $error)
                           {
                              ?>
                              <div class="alert alert-danger">
                                  <i class="glyphicon glyphicon-warning-sign"></i> &nbsp; <?php echo $error; ?>
                              </div>
                              <?php
                           }
                        }
                        else if(isset($_GET['joined']))
                        {
                             ?>
                             <div class="alert alert-info">
                                  <i class="glyphicon glyphicon-log-in"></i> &nbsp; Successfully registered <a href='data_register.php'>login</a> here
                             </div>
                             <?php
                        }
                    ?>
					<div class="card shadow mb-4">
						<div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Upload Images Menggunakan Masker</h6>
                        </div>
                        <div class="card-body">
                        	<div class="form-container">
                        		<form action="" method="post" enctype="multipart/form-data">
                        			<div class="container">
								      <div class="row">
								        <div class="col-md-12">
								          <div class="form-group">
								            <label class="control-label">Upload File</label>
								            <div class="preview-zone hidden">
								              <div class="box box-solid">
								                <div class="box-header with-border">
								                  <div><b>Preview</b></div>
								                  <div class="box-tools pull-right">
								                    <button type="button" class="btn btn-danger btn-xs remove-preview">
								                      <i class="fa fa-times"></i> Reset The Field
								                    </button>
								                  </div>
								                </div>
								                <div class="box-body">
                                                    <div class="imgGallery"> 
                                                      <!-- Image preview -->
                                                    </div>                        
                                                </div>
								              </div>
								            </div>
								            <div class="dropzone-wrapper">
								              <div class="dropzone-desc">
								                <i class="fa fa-download"></i>
								                <p>Choose an image file or drag it here.</p>
								              </div>
								              <input type="file" name="uploadfile[]" class="dropzone" id="chooseFile" multiple>
								            </div>
								          </div>
								        </div>
								      </div>
								 
								      <div class="row">
								        <div class="col-md-12">
								          <button type="submit" name="submit" class="btn btn-primary pull-right">Upload</button>
								        </div>
								      </div>
								    </div>
                        		</form>
                        	</div>
                        </div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<nav class="navbar navbar-custom navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <img src="_asset/_images/man.png" style="float: left;" width="50px">
      <a class="navbar-brand" href="dasboard.php">Attendance System Face Recognition</a>
    </div>
    <div id="navbar" class="navbar-collapse collapse">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="dasboard.php">Home</a></li>
        <!-- <li><a href="dasboard.php?page=Attendance">Attendance</a></li> -->
        <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Service<span class="caret"></span></a>
            <ul class="dropdown-menu">
              <li><a href="dasboard.php?page=eForm">e-Form</a></li>
            </ul>
        </li>
        <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><?php echo $Ffullname; ?><span class="caret"></span></a>
            <ul class="dropdown-menu">
              <li><a href="dasboard.php?page=Manage">Manage</a></li>
              <li role="separator" class="divider"></li>
              <li class="dropdown-header" data-toggle="modal" data-target="#logoutModal">Log Out</li>
            </ul>
        </li>
      </ul>
    </div><!--/.nav-collapse -->
  </div>
</nav>
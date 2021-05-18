<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>
<div class="jumbotron">
  <div class="container">
  	<div class="panel panel-default">
	  <div class="panel-body">
	    <?php
	    	$command = escapeshellcmd('tes.py 1');
	    	$output = shell_exec($command);
	    	echo $output;
	    ?>
	  </div>
	</div>
  </div>
</div>
</body>
</html>
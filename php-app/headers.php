<html>
<header>
<link href='http://fonts.googleapis.com/css?family=Muli' rel='stylesheet' type='text/css'>
<style type="text/css" media="screen">


body {
    width: 100%;
    height: 100%;
    position: fixed;
    color:white;
    background-color: #73AD21;
}

</style>
</header>
<body>


 <?php
 $headers = apache_request_headers();
 foreach ($headers as $header => $value) {
     echo "$header: $value <br />\n";
 }
 ?>


  </body>
</html>

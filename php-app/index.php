  <body>
    <h1>Hello, <?php echo(apache_request_headers()['OIDC_CLAIM_name']) ?></h1>
    <pre><?php
$headers = apache_request_headers();
foreach ($headers as $header => $value) {
    echo "$header: $value <br />\n";
}
?></pre>
    <a href="/protected/redirect_uri?logout=https%3A%2F%2Flocalhost%2Floggedout.html">Logout</a>
  </body>
</html>

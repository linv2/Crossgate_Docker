<?php
error_reporting(0);
header("Content-type: text/html; charset=GBK");
ini_set('date.timezone','Asia/Shanghai');
$connect=mysql_connect("127.0.0.1","root","root") or die();
mysql_select_db("rogue");
function URL_Refresh($url) {
print "<html><head><META HTTP-EQUIV=Refresh CONTENT=\"0;url='$url'\"></head></html>";
}
function Error($msg) {
echo("
   <script>
   window.alert(\"$msg\")
   history.go(-1)
   </script>"); exit;

}
if (get_magic_quotes_gpc()) {
$_GET = stripslashes_array($_GET);
$_POST = stripslashes_array($_POST);
}

function stripslashes_array(&$array) {
while(list($key,$var) = each($array)) {
if ($key != 'argc' && $key != 'argv' && (strtoupper($key) != $key || ''.intval($key) == "$key")) {
if (is_string($var)) {
$array[$key] = stripslashes($var);
}
if (is_array($var))  {
$array[$key] = stripslashes_array($var);
}
}
}
return $array;
}
function lib_replace_end_tag($str)
{
if (empty($str)) return false;
$str = htmlspecialchars($str);
$str = str_replace( '/', "", $str);
$str = str_replace("\\", "", $str);
$str = str_replace("&gt", "", $str);
$str = str_replace("&lt", "", $str);
$str = str_replace("<SCRIPT>", "", $str);
$str = str_replace("</SCRIPT>", "", $str);
$str = str_replace("<script>", "", $str);
$str = str_replace("</script>", "", $str);
$str=str_replace("select","",$str);
$str=str_replace("join","",$str);
$str=str_replace("union","",$str);
$str=str_replace("where","",$str);
$str=str_replace("insert","",$str);
$str=str_replace("delete","",$str);
$str=str_replace("update","",$str);
$str=str_replace("like","",$str);
$str=str_replace("drop","",$str);
$str=str_replace("create","",$str);
$str=str_replace("modify","",$str);
$str=str_replace("rename","",$str);
$str=str_replace("alter","",$str);
$str=str_replace("cas","",$str);
$str=str_replace("&","",$str);
$str=str_replace(">","",$str);
$str=str_replace("<","",$str);
$str=str_replace(" ",chr(32),$str);
$str=str_replace(" ",chr(9),$str);
$str=str_replace("    ",chr(9),$str);
$str=str_replace("&",chr(34),$str);
$str=str_replace("'",chr(39),$str);
$str=str_replace("<br />",chr(13),$str);
$str=str_replace("''","",$str);
$str=str_replace("css","",$str);
$str=str_replace("CSS","",$str);
$str=str_replace("password","",$str);
$str=str_replace("player_id","",$str);
$str=str_replace("ban","",$str);
$str=str_replace("online","",$str);
return $str;
}
?>

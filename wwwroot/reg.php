<?php
header("Content-type: text/html; charset=utf-8");
include("lib.php");
if ($_GET["act"]=="save")
{
$id = $_POST["user"];
$pass = $_POST["pass"];
$pass2 = $_POST["pass2"];
$mlhy = $_POST["mlhy"];
$userip =  getip();
$data = date("Y-m-d h:i:s");
if ($pass != $pass2) {
Error("������������벻һ�£�");
}
if (strlen($id) <4 or strlen($mlhy) <6 or strlen($pass) <6 or strlen($pass2) <6) {
Error("�ʺ�Ϊ�ջ�С��4λ������Ϊ�ջ�С��6λ��");
}
if (empty($id) or empty($mlhy) or empty($pass) or empty($pass2)) {
Error("�ʺ�Ϊ�ջ������ȫ��Ϊ�գ�");
}
$sql1="select AccountID from tbl_user where AccountID='$id'";
$check=mysql_query($sql1,$connect);
$total_count=mysql_affected_rows();
if($total_count==0)
{
$sql2="INSERT INTO tbl_user(AccountID,AccountPassword,EnableFlg,TrialFlg,DownFlg,ExpFlg,SequenceNumber,UseFlg,BadMsg,CdKey)VALUES('$id','$pass','1','8','0','0','13','1','0','$id')";
$result = mysql_query($sql2);
$total_count = mysql_affected_rows();
if($total_count==1) 
{
Error("ע��ɹ�!");
}
else
{
Error("ע��ʧ��!");
}
}
else
{
Error("�û����ظ�!");
}
}
function getip() {
   if (getenv("HTTP_CLIENT_IP") && strcasecmp(getenv("HTTP_CLIENT_IP"), "unknown"))
   $ip = getenv("HTTP_CLIENT_IP");
   else if (getenv("HTTP_X_FORWARDED_FOR") && strcasecmp(getenv("HTTP_X_FORWARDED_FOR"), "unknown"))
   $ip = getenv("HTTP_X_FORWARDED_FOR");
   else if (getenv("REMOTE_ADDR") && strcasecmp(getenv("REMOTE_ADDR"), "unknown"))
   $ip = getenv("REMOTE_ADDR");
   else if (isset($_SERVER['REMOTE_ADDR']) && $_SERVER['REMOTE_ADDR'] && strcasecmp($_SERVER['REMOTE_ADDR'], "unknown"))
   $ip = $_SERVER['REMOTE_ADDR'];
   else
   $ip = "unknown";
   return($ip);
}
?>

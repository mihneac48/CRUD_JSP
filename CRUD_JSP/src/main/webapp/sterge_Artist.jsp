<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
.fundal
{
	background-size: 100% 1500%;
	background-image: linear-gradient(to right top, #95adcb, #78b5ca, #6cbcb7, #80bd99, #a7b97b);
}
.buton2 {
	display: inline-block;
	outline: none;
	cursor: pointer;
	font-weight: 500;
	border: 1px solid transparent;
	border-radius: 2px;
	height: 36px;
	line-height: 34px;
	font-size: 14px;
	color: #ffffff;
	background-color: #007c89;
	transition: background-color 0.2s ease-in-out 0s, opacity 0.2s
		ease-in-out 0s;
	padding: 0 18px;
}

.buton2:hover {
	color: #ffffff;
	background-color: #006570;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tabela Artisti</title>
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body class="fundal">
<%
String[] s = request.getParameterValues("primarykey");
if(s!=null){
jb.connect();
jb.stergeDateTabela(s, "artisti", "idArtist");
jb.disconnect();}
%>
<p align="center">
<a href="index.html"><b class="buton2"><font size="+2">Home</font></b></a>
<br/>
</p>
</body>
</html>
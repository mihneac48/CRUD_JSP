<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
.fundal
{
	background-size: 100% 1000%;
	background-image: linear-gradient(to right top, #95adcb, #78b5ca, #6cbcb7, #80bd99, #a7b97b);
}
.titlu
{
	font-family: 'Calligraffitti', cursive;
	letter-spacing: 3px;
	font-size: 40px;
	color: #F9f1cc;
	text-shadow: 5px 5px 0px #FFB650, 
    10px 10px 0px #FFD662, 
    15px 15px 0px  #FF80BF, 
    20px 20px 0px #EF5097, 
}
.text
{
	font-family: 'Lato', sans-serif;
	color: gray;
	font-size: 30px;
	font-weight: bold;
	-webkit-text-stroke: 0.5px #5F9EA0;
}
.container-name {
  margin-left: 30px;
  margin-top: 60px;
}

.buton {
  font-family: 'Open Sans';
  color: #494949;
  text-transform: uppercase;
  text-decoration: none;
  background: #ffffff;
  padding: 20px;
  border: 4px solid #494949;
  display: inline-block;
  transition: all 0.4s ease 0s;
}

.buton:hover {
  color: #ffffff;
  background: #f6b93b;
  border-color: #f6b93b;
  transition: all 0.4s ease 0s;
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
<title>Adauga Concerte</title>
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body class="fundal">
<%
String Denumire = request.getParameter("Denumire");
String Locatie = request.getParameter("Locatie");
String GenMuzical = request.getParameter("GenMuzical");
if (Denumire != null) {
jb.connect();
jb.adaugaConcert(Denumire, Locatie, GenMuzical);
jb.disconnect();
%>
<p class="titlu">Datele au fost adaugate.</p><%
} else {
%>
<h1 class="titlu">Suntem in tabela Concert.</h1>
<form action="nou_Concert.jsp" method="post">
<table>
<tr>
<td class="text" align="right">Denumire Concert:</td>
<td> <input type="text" name="Denumire" size="40" /></td>
</tr>
<tr>
<td class="text" align="right">Locatie Concert:</td>
<td> <input type="text" name="Locatie" size="30" /></td>
</tr>
<tr>
<td class="text" align="right">GenMuzical Concert:</td>
<td> <input type="text" name="GenMuzical" size="30" /></td>
</tr>
</table>
<div class="container-name"><input class="buton" type="submit" value="Adauga concert" /></div>
</form>
<%
}
%>
<br/>
<a href="index.html"><font size="+2"><b class="buton2">Home</b></font></a>
<br/>
</body>
</html>
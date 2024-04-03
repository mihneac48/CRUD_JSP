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
<title>Tabela Concerte</title>
<link href="table.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body class="fundal">
<h1 class="titlu" align="center">Tabela Concerte:</h1>
<br/>
<p align="center"><a href="nou_Medic.jsp"><b class="buton2">Adauga un nou concert</b></a></p>
<%
String s = request.getParameter("primarykey");
if(s!=null){
jb.connect();
int aux = java.lang.Integer.parseInt(s);
ResultSet rs = jb.intoarceLinieDupaId("concerte", "idConcert", aux);
rs.first();
String Denumire = rs.getString("Denumire");
String Locatie = rs.getString("Locatie");
String GenMuzical = rs.getString("GenMuzical");
rs.close();
jb.disconnect();
%>
<form action="m2_Concert.jsp" method="post">
<table align="center">
<tr>
<td class="text" align="right">IdConcert:</td>
<td> <input type="text" name="idConcert" size="30" value="<%= aux%>" readonly/></td>
</tr>
<tr>
<td class="text" align="right">Denumire:</td>
<td> <input type="text" name="Denumire" size="30" value="<%= Denumire%>"/></td>
</tr>
<tr>
<td class="text" align="right">Locatie:</td>
<td> <input type="text" name="Locatie" size="30" value="<%= Locatie%>"/></td>
</tr>
<tr>
<td class="text" align="right">GenMuzical:</td>
<td> <input type="text" name="GenMuzical" size="30" value="<%= GenMuzical%>"/></td>
</tr>
</table><p align="center">
<input class="buton" type="submit" value="Modifica linia">
</p>
</form>
<p align="center">
<a href="index.html"><b class="buton2">Home</b></a>
<%}
	else{%>
<p align="center">
<a href="index.html"><b class="buton2">Home</b></a>
<%}%>
<br/>
</body>
</html>
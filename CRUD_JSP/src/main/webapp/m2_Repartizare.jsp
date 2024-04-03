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
<title>Tabela Repartizari</title>
<link href="table.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body class="fundal">
<h1 class="titlu" align="center"> Tabela Repartizari:</h1>
<br/>
<p align="center"><a href="nou_Repartizare.jsp"><b class="buton2">Adauga o noua repartizare</b></a></p>
<%
jb.connect();
int aux = java.lang.Integer.parseInt(request.getParameter("idRepartizare"));
String idArtist = request.getParameter("idArtist");
String idConcert = request.getParameter("idConcert");
String[] valori = {idArtist, idConcert};
String[] campuri = {"idArtist", "idConcert"};
jb.modificaTabela("repartizari", "idRepartizare", aux, campuri, valori);
jb.disconnect();
%>
<h1 class="titlu" align="center">Modificarile au fost efectuate !</h1>
<p align="center">
<a href="index.html"><b class="buton2">Home</b></a>
<br/>
</body>
</html>
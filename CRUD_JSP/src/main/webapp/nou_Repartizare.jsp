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
<title>Adauga repartizare</title>
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body class="fundal">
<%
int idArtist, idConcert;
String id1, id2, Nume, Prenume, Instrument, NumeImpresar, Denumire, Locatie, GenMuzical;
id1 = request.getParameter("idArtist");
id2 = request.getParameter("idConcert");
if (id1 != null) {
jb.connect();
jb.adaugaRepartizare(java.lang.Integer.parseInt(id1), java.lang.Integer.parseInt(id2));
jb.disconnect();
%>
<p class="titlu">Datele au fost adaugate.</p><%
} else {
jb.connect();
ResultSet rs1 = jb.vedeTabela("artisti");
ResultSet rs2 = jb.vedeTabela("concerte");
%>
<h1 class="titlu"> Suntem in tabela repartizari.</h1>
<form action="nou_Repartizare.jsp" method="post">
<table>
<tr>
<td class="text" align="right">IdArtist:</td>
<td>
<SELECT NAME="idArtist">
<%
while(rs1.next()){
idArtist = rs1.getInt("idArtist");
Nume = rs1.getString("Nume");
Prenume = rs1.getString("Prenume");
Instrument = rs1.getString("Instrument");
NumeImpresar=rs1.getString("NumeImpresar");
%>
<OPTION VALUE="<%= idArtist%>"><%= idArtist%>,<%= Nume%>,<%=
Prenume%>,<%= Instrument%>,<%= NumeImpresar%></OPTION>
<%
}
%>
</SELECT>
</td>
</tr>
<tr>
<td class="text" align="right">IdConcert:</td>
<td>
<SELECT NAME="idConcert">
<!-- OPTION selected="yes" VALUE="iris1">Iris 1</OPTION -->
<%
while(rs2.next()){
idConcert = rs2.getInt("idConcert");
Denumire = rs2.getString("Denumire");
Locatie = rs2.getString("Locatie");
GenMuzical = rs2.getString("GenMuzical");
%>
<OPTION VALUE="<%= idConcert%>"><%= idConcert%>,<%= Denumire%>,<%=
Locatie%>,<%= GenMuzical%></OPTION>
<%
}
%>
</SELECT>
</td>
</tr>
</table>
<div class="container-name"><input class="buton" type="submit" value="Adauga artistul" /></div>
</form>
<%
}
%>
<br/>
<a href="index.html"><font size="+2"><b class="buton2">Home</b></font></a>
<br/>
</body>
</html>
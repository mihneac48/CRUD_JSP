<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
.fundal {
	background-size: 100% 200%;
	background-image: linear-gradient(to right top, #95adcb, #78b5ca, #6cbcb7, #80bd99,
		#a7b97b);
}

.titlu {
	font-family: 'Calligraffitti', cursive;
	letter-spacing: 3px;
	font-size: 40px;
	color: #F9f1cc;
	text-shadow: 5px 5px 0px #FFB650, 10px 10px 0px #FFD662, 15px 15px 0px
		#FF80BF, 20px 20px 0px #EF5097,
}

.table-wrapper {
	margin: 10px 70px 70px;
	box-shadow: 0px 35px 50px rgba(0, 0, 0, 0.2);
}

.fl-table {
	border-radius: 5px;
	font-size: 12px;
	font-weight: normal;
	border: none;
	border-collapse: collapse;
	width: 100%;
	max-width: 100%;
	white-space: nowrap;
	background-color: white;
}

.fl-table td, .fl-table th {
	text-align: center;
	padding: 8px;
}

.fl-table td {
	border-right: 1px solid #f8f8f8;
	font-size: 12px;
}

.fl-table thead th {
	color: #ffffff;
	background: #4FC3A1;
}

.fl-table thead th:nth-child(odd) {
	color: #ffffff;
	background: #324960;
}

.fl-table tr:nth-child(even) {
	background: #F8F8F8;
}

/* Responsive */
@media ( max-width : 767px) {
	.fl-table {
		display: block;
		width: 100%;
	}
	.table-wrapper:before {
		content: "Scroll horizontally >";
		display: block;
		text-align: right;
		font-size: 11px;
		color: white;
		padding: 0 0 10px;
	}
	.fl-table thead, .fl-table tbody, .fl-table thead th {
		display: block;
	}
	.fl-table thead th:last-child {
		border-bottom: none;
	}
	.fl-table thead {
		float: left;
	}
	.fl-table tbody {
		width: auto;
		position: relative;
		overflow-x: auto;
	}
	.fl-table td, .fl-table th {
		padding: 20px .625em .625em .625em;
		height: 60px;
		vertical-align: middle;
		box-sizing: border-box;
		overflow-x: hidden;
		overflow-y: auto;
		width: 120px;
		font-size: 13px;
		text-overflow: ellipsis;
	}
	.fl-table thead th {
		text-align: left;
		border-bottom: 1px solid #f7f7f9;
	}
	.fl-table tbody tr {
		display: table-cell;
	}
	.fl-table tbody tr:nth-child(odd) {
		background: none;
	}
	.fl-table tr:nth-child(even) {
		background: transparent;
	}
	.fl-table tr td:nth-child(odd) {
		background: #F8F8F8;
		border-right: 1px solid #E6E4E4;
	}
	.fl-table tr td:nth-child(even) {
		border-right: 1px solid #E6E4E4;
	}
	.fl-table tbody td {
		display: block;
		text-align: center;
	}
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
                    transition: background-color 0.2s ease-in-out 0s, opacity 0.2s ease-in-out 0s;
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
	<h1 class="titlu" align="center">Tabela Artisti:</h1>
	<br />
	<p align="center">
		<a href="nou_Artist.jsp"><b class="buton2">Adauga un nou artist</b></a></p>
	<form action="sterge_Artist.jsp" method="post">
		<div class="table-wrapper"><table class="fl-table">
			<thead>
			<tr>
				<th><b>Mark:</b></th>
				<th><b>IdArtist:</b></th>
				<th><b>Nume:</b></th>
				<th><b>Prenume:</b></th>
				<th><b>Instrument:</b></th>
				<th><b>NumeImpresar:</b></th>
			</tr>
			</thead>
			
			
			<%
			
			jb.connect();
			ResultSet rs = jb.vedeTabela("artisti");
			long x;
			while (rs.next()) {
				x = rs.getInt("idArtist");
			
			%>
			<tr>
				<td><input type="checkbox" name="primarykey" value="<%=x%>" /></td>
				<td><%=x%></td>
				<td><%=rs.getString("Nume")%></td>
				<td><%=rs.getString("Prenume")%></td>
				<td><%=rs.getString("Instrument")%></td>
				<td><%=rs.getString("NumeImpresar")%></td>
				<%
				}
				%>
			</tr>
		</table></div>
		<br />
		<p align="center">
			<input class="buton" type="submit" value="Sterge liniile marcate">
		</p>
	</form>
	<%
	rs.close();
	jb.disconnect();
	%>
	<br />
	<p align="center"  >
		<a  href="index.html"><b class="buton2" >Home</b></a> <br />
	</p>
</body>
</html>
<%@ page import="java.sql.*, atmarkit.MyDBAccess"
    contentType="text/html; charset=UTF-8" %>
<%
  MyDBAccess db = new MyDBAccess();

  db.open();

  ResultSet rs = db.getResultSet("select * from member");

  String tableHTML = "<table border=1>";
  tableHTML += "<tr bgcolor=\"000080\"><td><font color=\"white\">メンバーID</font></td>"
	  + "<td><font color=\"white\">名前</font></td>"
	  + "<td><font color=\"white\">カナ</font></td>";

  while(rs.next()) {
    int id = rs.getInt("id");
    String name = rs.getString("name");
    String kana = rs.getString("kana");

    tableHTML += "<tr><td align=\"right\">" + id + "</td>"
      + "<td>" + name + "</td><td>" + kana + "</td></tr>";
  }

  tableHTML += "</table>";

  db.close();
%>

<html>
<head>
  <title>データベースサンプル</title>
</head>
<body>
  <p>データベース接続サンプル</p>
  <%= tableHTML %>
</body>
</html>

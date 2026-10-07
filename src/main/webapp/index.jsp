
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.DriverManager" %>

<!DOCTYPE html>
<html>

<head>

    <title>Student Records</title>

    <style>

        body {
            text-align: center;
            font-family: Arial, sans-serif;
        }

        table {
            margin: 30px auto;
            border-collapse: collapse;
        }

        th, td {
            padding: 10px 15px;
        }

        th {
            background-color: lightgray;
        }

    </style>

</head>

<body>

<h2>Student Records</h2>

<table border="1">

<tr>
    <th>ID</th>
    <th>ROLL NUMBER</th>
    <th>NAME</th>
    <th>COURSE</th>
</tr>

<%

Connection con = null;
Statement st = null;
ResultSet rs = null;

try {

    Class.forName("com.mysql.cj.jdbc.Driver");

    con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/db",
        "root",
        "manager"
    );

    st = con.createStatement();

    rs = st.executeQuery("SELECT * FROM student_records1");

    while(rs.next()) {

%>

<tr>

    <td>
        <%= rs.getInt("id") %>
    </td>

    <td>
        <%= rs.getInt("roll_number") %>
    </td>

    <td>
        <%= rs.getString("student_name") %>
    </td>

    <td>
        <%= rs.getString("course") %>
    </td>

</tr>

<%

    }

} catch(Exception e) {

    out.println("<h3>Error: " + e.getMessage() + "</h3>");

} finally {

    try {
        if(rs != null) rs.close();
    } catch(Exception e) {}

    try {
        if(st != null) st.close();
    } catch(Exception e) {}

    try {
        if(con != null) con.close();
    } catch(Exception e) {}

}

%>

</table>

</body>

</html>


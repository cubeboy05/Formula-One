<%@ page import="java.sql.*" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<!DOCTYPE HTML>
<html>
<head>
    <title>Formula One</title>
    <!-- Jquery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
    <!-- Bootstrap -->
    <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css">
    <link type="text/css" rel="stylesheet" href="css/bootstrap-theme.min.css">
    <script src="js/bootstrap.min.js"></script>

    <!-- Custom Files -->
    <link type="text/css" rel="stylesheet" href="css/styles.css">
    <script src="js/scripts.js"></script>
</head>
<body>

    <%
        String username = request.getParameter("usernameField");
        String password = request.getParameter("passwordField");

        Class.forName("com.mysql.jdbc.Driver");

        try {
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/formulaone", "root", "");
                Statement statement = con.createStatement();
                ResultSet rs = statement.executeQuery("SELECT * FROM credential WHERE username='" + username + "'");
                if(rs.next()){
                    if(rs.getString(3).equals(password)){
                        %>
                        <script language="JavaScript">
                            window.location = "home.html";
                        </script>
                        <%
                        System.out.println("logged in");
                    }
                    else {
                        %>
                            <script language="JavaScript">
                                alert("Invalid username or password");
                                window.location = "index.html";
                            </script>
                        <%
                        System.out.println("incorrect pw");
                    }
                }
                else {
                    %>
                        <script language="JavaScript">
                            alert("Invalid username or password");
                            window.location = "index.html";
                        </script>
                    <%
                    System.out.println("username is wrong");
                }
            } catch (SQLException e) {
                e.printStackTrace();
        }
    %>

    <%--<sql:setDataSource var="con" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost/formulaone" user="root" password=""/>
    <sql:query var="result" sql="SELECT username FROM credential" dataSource="${con}"/>
        <c:forEach var="rows" items="${result.rows}">
            <p>${rows.username}</p>
        </c:forEach>--%>
</body>
</html>

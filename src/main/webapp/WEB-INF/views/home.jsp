<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>RealTech Company - Home Page</title>
</head>
<body>
    <h2>RealTech Company Home Page</h2>
    <hr>
    <p>Welcome to RealTech Company Home Page</p>
    <hr>
    <p>
        User: <security:authentication property="principal.username"/>
        <br><br>
        Role(s): <security:authentication property="principal.authorities"/>
    </p>
    <hr>
    <!-- Add a link to /leaders ... this is for the managers-->

    <security:authorize access="hasRole('MANAGER')">
        <p>
            <a href="${pageContext.request.contextPath}/leaders">Leadership Meeting</a>
            (Only for Managers)
        </p>
        <hr>
    </security:authorize>

    <!-- Add a link to /systems ... this is for the admins-->

    <security:authorize access="hasRole('ADMIN')">
        <p>
            <a href="${pageContext.request.contextPath}/systems">IT Systems Meeting</a>
            (Only for Admins)
        </p>
        <hr>
    </security:authorize>

    <form:form action="${pageContext.request.contextPath}/logout"
               method="POST">
        <input type="submit" value="Logout">
    </form:form>
</body>
</html>

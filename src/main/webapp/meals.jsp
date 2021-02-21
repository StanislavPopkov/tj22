<%--
  Created by IntelliJ IDEA.
  User: I am
  Date: 14.02.2021
  Time: 22:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Meals</title>
</head>
<body>
<c:forEach items="${listMealTo}" var="listMealTo">
    <c:out value="${component.name}" />
</c:forEach>
    <table>
    <thead>
    <tr>
    <th>DateTime</th>
    <th>Description</th>
    <th>Calories</th>
    <th>Excess</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${mealToList}" var="mealTO">
        <tr>
            <td><c:out value="${mealTO.dateTime.toString().replace('T', ' ')}" /></td>
            <td><c:out value="${mealTO.description}" /></td>
            <td><c:out value="${mealTO.calories}" /></td>
            <td>
                <p style="color:${mealTO.excess ? "blue" : "red"}">
                    <c:out value="${mealTO.excess}" /></p></td>
        </tr>
    </c:forEach>
    </tbody>
    </table>
</body>
</html>


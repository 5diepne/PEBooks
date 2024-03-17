<%-- 
    Document   : index
    Created on : Mar 14, 2024, 9:55:36 AM
    Author     : DiepTCNN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="data" class="dao.DBContext"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Update Author of Booking</h1>
        <p style="color: green">${updated}</p>

        <form action="update" method="post">
            <table>
                <tr>
                    <td>Old Author:</td><td><input name="old" type="text"/></td>
                </tr>
                <tr>
                    <td>New Author:</td><td><input name="new" type="text"/></td>
                </tr>
                <tr>
                    <td></td><td><input type="submit" value="UPDATE"/></td>
                </tr>
            </table>
        </form>
        <h1>LIST OF BOOKINGS</h1>
        <table border="1px">
            <tr>
                <th>ID</th>
                <th>Quantity</th>
                <th>Title</th>
                <th>Author</th>
                <th>Publication Date</th>
            </tr>
            <c:forEach items="${data.all}" var="c">
                <tr>
                    <td>${c.id}</td>
                    <td>${c.quantity}</td>
                    <td>${c.title}</td>
                    <td>${c.author}</td>
                    <td>${c.publication_date}</td>
                </tr>
            </c:forEach>
        </table>
        <h1>LIST OF LOANS</h1>
        <table border="1px">
            <tr>
                <th>ID</th>
                <th>Book ID</th>
                <th>Borrower Name</th>
                <th>Loan Date</th>
                <th>Return Date</th>
            </tr>
            <c:forEach items="${data.allLoans}" var="c">
                <tr>
                    <td>${c.id}</td>
                    <td>${c.book_id}</td>
                    <td>${c.borrower_name}</td>
                    <td>${c.loan_date}</td>
                    <td>${c.return_date}</td>
                </tr>
            </c:forEach>
        </table>
        <br>
        <br>
        <br>
        <form action="index.jsp">
            <table>
                <tr>
                    <td>Borrower Name:</td><td><input name="borrower_name" type="text"/></td>
                </tr>
                <tr>
                    <td>Start Date:</td><td><input name="startDate" type="date"/></td>
                </tr>
                <tr>
                    <td>End Date:</td><td> <input name="endDate" type="date"/></td>
                </tr>
                <tr>
                    <td></td><td><input type="submit" value="SEARCH"/></td>
                </tr>
            </table>
        </form>
        <jsp:setProperty name="data" property="borrowerName" value="${param.borrower_name}"/>
        <jsp:setProperty name="data" property="startDate" value="${param.startDate}"/>
        <jsp:setProperty name="data" property="endDate" value="${param.endDate}"/>
        <h1>LIST OF Borrower Name FROM <jsp:getProperty name="data" 
                         property="startDate"/> TO <jsp:getProperty name="data" 
                         property="endDate" /> OF CARD NUMBER <jsp:getProperty name="data" 
                         property="borrowerName" /></h1>
        <table border="1px" width="40%">
            <tr>
                <th>ID</th>
                <th>Quantity</th>
                <th>Title</th>
                <th>Author</th>
                <th>Publication Date</th>
            </tr>
            <c:forEach items="${data.borrowedBooks}" var="o">
                <tr>
                    <td>${o.id}</td>
                    <td>${o.quantity}</td>
                    <td>${o.title}</td>
                    <td>${o.author}</td>
                    <td>${o.publication_date}</td>
                </tr>
            </c:forEach>
        </table>
        <h1>CHECK OVERDUE</h1>
        <p style="color: green">${valid}</p>
        <p style="color: red">${overdue}</p>
        
        <form action="check" method="post">
            <table>
                <tr>
                    <td>Borrower Name:</td><td><input name="borrowerName" type="text"/></td>
                </tr>
                <tr>
                    <td></td><td><input type="submit" value="CHECK"/></td>
                </tr>
               
            </table>
        </form>
    </body>
</html>

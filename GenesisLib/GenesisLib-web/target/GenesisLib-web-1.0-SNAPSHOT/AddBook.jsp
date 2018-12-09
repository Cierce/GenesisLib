<%-- 
    Document   : ListBooks
    Created on : 07-Dec-2018, 02:14:47
    Author     : Connor
--%>

<%@page import="java.util.List"%>
<%@page import="com.conindustries.genesislib.model.BookItem"%>
<%@page import="com.conindustries.genesislib.model.BookFactory"%>
<%@page import="com.conindustries.genesislib.model.Book"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.conindustries.WebObjectFactory"%>
<%@page import="com.conindustries.genesislib.service.ServiceFactory"%>
<%@page import="com.conindustries.genesislib.model.BookstoreFacade"%>
<%
    BookstoreFacade bookstoreFacade = (BookstoreFacade) session.getAttribute("bookstoreFacade");

    // If the user session has no bookstore api, create a new one
    if (bookstoreFacade == null) {
        ServiceFactory serviceFactory = WebObjectFactory.getServiceFactory();
        bookstoreFacade = serviceFactory.getBookStoreFacade();
        session.setAttribute("bookstoreFacade", bookstoreFacade);
    }
    
    String role = (String) session.getAttribute("role");
    boolean admin = "admin".equals(role);
    
    String bookId = (String) request.getParameter("bookId");
    String author = (String) request.getParameter("author");
    String name = (String) request.getParameter("name");
    String publisher = (String) request.getParameter("publisher");
    String price = (String) request.getParameter("price");
    
    String action = (String) request.getParameter("action");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <title>Add a Book</title>
    </head>
    <body>
        <h1>Add a Book</h1>
    <table>
            <tr>
                <th>Book Contents</th>
            </tr>
            <tr>
                <td>
                    <form action="AddBook.jsp">
                        <input type="text" name="bookId" placeholder="unique book id">
                        <input type="text" name="author" placeholder="author">
                        <input type="text" name="name" placeholder="name">
                        <input type="text" name="publisher" placeholder="publisher">
                        <input type="text" name="price" placeholder="(£) Price">
                        <input type="submit" value="Add Book" style="color:green;">
                    </form>
                </td>
            </tr>
     </table>   
    <br>
    <%
        try {
                bookstoreFacade.createBookItem(new BookItem(Integer.parseInt(bookId), author, name, publisher, Double.parseDouble(price)));
        }
        catch (NumberFormatException ex)
        {
            //TODO CATCH EXCEPTION
        }
        catch(NullPointerException ex2)
        {
            //TODO CATCH EXCEPTION
        }
    %>
    <h1>Recently Added</h1>
    <table>
            <tr>
                <th>Book ID</th>
                <th>Author</th>
                <th>Name</th>
                <th>Publisher</th>
                <th>Price</th>
            </tr>
            <%
                if(!(bookstoreFacade.getBooks().isEmpty()))
                {
            %>
             <tr>
                <td><%=bookstoreFacade.getBooks().get(bookstoreFacade.getBooks().size()-1).getBookItemId()%></td>
                <td><%=bookstoreFacade.getBooks().get(bookstoreFacade.getBooks().size()-1).getAuthor()%></td>
                <td><%=bookstoreFacade.getBooks().get(bookstoreFacade.getBooks().size()-1).getName()%></td>
                <td><%=bookstoreFacade.getBooks().get(bookstoreFacade.getBooks().size()-1).getPublisher()%></td>
                <td>£<%=String.format("%.2f", bookstoreFacade.getBooks().get(bookstoreFacade.getBooks().size()-1).getPrice())%></td>
            </tr>
            <%
                }
                else
                {  
            %>
            <tr>
                <td>0</td>
                <td>N/A</td>
                <td>N/A</td>
                <td>N/A</td>
                <td>£0.00</td>
            </tr>
            <%
                }
            %>
     </table>
            <p><a href="./ListBooks.jsp?role=admin&bookId=1" target="_self">Back</a></p>
    </body>
</html>

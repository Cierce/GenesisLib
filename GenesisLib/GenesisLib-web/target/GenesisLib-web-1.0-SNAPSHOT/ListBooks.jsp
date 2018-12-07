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
    
    // find user session type
    // only this page can change role
    String roleReq = (String) request.getParameter("role");
    if (roleReq != null && ("customer".equals(roleReq) || "admin".equals(roleReq))) {
        session.setAttribute("role", roleReq);
    }
    String role = (String) session.getAttribute("role");
    boolean admin = "admin".equals(role);
    
    String bookId = (String) request.getParameter("bookId");
    
    String action = (String) request.getParameter("action");
    //BookItem bookItem = bookstoreFacade.createBookItem(BookFactory.createBook(1, "Connor P", "Connor Phillips", "Sony Publishing"));
    //Book book = bookstoreFacade.createBook(bookItem, 24.40);
    List<BookItem> books = bookstoreFacade.getBooks();
    BookItem book = new BookItem();
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <title>Search Titles</title>
    </head>
    <body>
        <h1>Search for a book title!</h1
        <br>
        <form action="ListBooks.jsp">
            <input type="number" name="bookId" placeholder="Book_ID">
            <input type="submit" value="Search Library" style="color:green;">
        </form>
    <br>
    <%
        try {
            for(int i = 0; i < books.size(); i++)
            {
               if(books.get(i).getBookItemId().equals(Integer.parseInt(bookId)))
               {
                   book = books.get(i);
                   break;
               }
               else 
               {
                   book = books.get(i);
               }
            }
        }
        catch (NumberFormatException ex)
        {
            //TODO CATCH EXCEPTION
        }
    %>
     <table>
            <tr>
                <th>Book ID</th>
                <th>Author</th>
                <th>Name</th>
                <th>Publisher</th>
            </tr>
            <tr>
                <td><%=book.getBookItemId()%></td>
                <td><%=book.getAuthor()%></td>
                <td><%=book.getName()%></td>
                <td><%=book.getPublisher()%></td>
            </tr>
    <%
    %>   
        </table>
    </body>
</html>

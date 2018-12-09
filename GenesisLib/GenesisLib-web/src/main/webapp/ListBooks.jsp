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
    String isDelete = (String) request.getParameter("isDelete");
    if(isDelete == null)
    {
        isDelete = "false";
    }
    
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
            if(isDelete.equals("true"))
            {
                bookstoreFacade.deleteBookItem(Integer.parseInt(bookId));
            }
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
                <th>Price</th>
            </tr>
            <tr>
                <td><input type="text" name="bookId" value="<%=book.getBookItemId()%>" readonly></td>
                <td><input type="text" name="author" value="<%=book.getAuthor()%>" readonly></td>
                <td><input type="text" name="name" value="<%=book.getName()%>" readonly></td>
                <td><input type="text" name="publisher" value="<%=book.getPublisher()%>" readonly></td>
                <td><input type="text" name="price" value="£<%=String.format("%.2f", book.getPrice())%>" readonly></td>
                <%
                    if(!(bookstoreFacade.getBooks().isEmpty()))
                    {
                %>
                        <td>
                            <form action="EditBook.jsp">
                                <input type="hidden" name="bookId" value="<%=book.getBookItemId()%>">
                                <input type="hidden" name="isEdit" value="false">
                                <input type="hidden" name="fromLib" value="false">
                                <input type="submit" value="edit book" style="color:green;">
                            </form>
                        </td>
                        <td>
                            <form action="ListBooks.jsp">
                                <input type="hidden" name="bookId" value="<%=book.getBookItemId()%>">
                                <input type="hidden" name="isDelete" value="true">
                                <input type="submit" value="delete book" style="color:red;">
                            </form>
                        </td>
                <%
                    }
                %>
            </tr>
     </table>
     <p><a href="./AddBook.jsp?role=admin" target="_self">Add Book</a></p>
     <p><a href="./ShowAll.jsp?role=admin" target="_self">Show All Books</a></p>
    </body>
</html>

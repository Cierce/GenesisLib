<%-- 
    Document   : ShowAll
    Created on : 09-Dec-2018, 14:40:58
    Author     : Connor
--%>

<%@page import="java.text.DecimalFormat"%>
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
        <h1>All Library Book Entries</h1
        <br>
    <br>
   
     <table>
            <tr>
                <th>Book ID</th>
                <th>Author</th>
                <th>Book Title</th>
                <th>Publisher</th>
                <th>Price</th>
            </tr>
    <%
        try {
            if(isDelete.equals("true"))
            {
                for(int i = 0; i < bookstoreFacade.getBooks().size(); i++)
                {
                    if(books.get(i).getBookItemId() == Integer.parseInt(bookId))
                    {
                        books.remove(i);
                        bookstoreFacade.setBooks(books);
                    }
                }
            }
            for(int i = 0; i < books.size(); i++)
            {
               book = books.get(i);
    %>
            <tr>
                <td><%=book.getBookItemId()%></td>
                <td><%=book.getAuthor()%></td>
                <td><%=book.getName()%></td>
                <td><%=book.getPublisher()%></td>
                <td>£<%=String.format("%.2f", book.getPrice())%></td>
                <td>
                            <form action="EditBook.jsp">
                                <input type="hidden" name="bookId" value="<%=book.getBookItemId()%>">
                                <input type="hidden" name="fromLib" value="true">
                                <input type="submit" value="edit book" style="color:green;">
                            </form>
                        </td>
                        <td>
                            <form action="ShowAll.jsp">
                                <input type="hidden" name="bookId" value="<%=book.getBookItemId()%>">
                                <input type="hidden" name="isDelete" value="true">
                                <input type="submit" value="delete book" style="color:red;">
                            </form>
                        </td>
            </tr>
    <%
            }
        }
        catch (NumberFormatException ex)
        {
            //TODO CATCH EXCEPTION
        }
    %>
     </table>
     <p><a href="./ListBooks.jsp?role=admin&bookId=1" target="_self">Back</a></p>
    </body>
</html>

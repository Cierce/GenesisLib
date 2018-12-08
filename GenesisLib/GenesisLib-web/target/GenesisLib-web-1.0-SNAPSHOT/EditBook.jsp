<%-- 
    Document   : EditBook
    Created on : 08-Dec-2018, 19:52:18
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
    String author = (String) request.getParameter("author");
    String name = (String) request.getParameter("name");
    String publisher = (String) request.getParameter("publisher");
    String isEdit = (String) request.getParameter("isEdit");
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
                   if(isEdit.equals("true"))
                   {
                        book.setBookItemId(Integer.parseInt(bookId));
                        book.setAuthor(author);
                        book.setName(name);
                        book.setPublisher(publisher);
                        bookstoreFacade.updateBookItem(book);
                        break;
                   }
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
                <th>Book Contents: EDIT ON</th>
            </tr>
            <tr>
                <td>
                    <form action="EditBook.jsp">
                        <input type="text" name="bookId" value="<%=book.getBookItemId()%>">
                        <input type="text" name="author" value="<%=book.getAuthor()%>">
                        <input type="text" name="name" value="<%=book.getName()%>">
                        <input type="text" name="publisher" value="<%=book.getPublisher()%>">
                        <input type="hidden" name="isEdit" value="true">
                        <input type="submit" value="submit edit" style="color:green;">
                    </form>
                </td>
            </tr>
     </table>
    <%
        
    %>   
    <br>
            <table>
                <tr>
                    <th>Add a Book</th>
                </tr>
                <tr>
                    <td>
                        <form action="AddBook.jsp">
                            <input type="text" name="bookId" placeholder="unique book id">
                            <input type="text" name="author" placeholder="author">
                            <input type="text" name="name" placeholder="name">
                            <input type="text" name="publisher" placeholder="publisher">
                            <input type="submit" value="add book" style="color:green;">
                        </form>
                    </td>
                </tr>
            </table>
    <%
        
    %>
    </body>
</html>
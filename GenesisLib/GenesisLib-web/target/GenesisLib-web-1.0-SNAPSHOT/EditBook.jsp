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
    
    String role = (String) session.getAttribute("role");
    boolean admin = "admin".equals(role);
    
    String bookId = (String) request.getParameter("bookId");
    String author = (String) request.getParameter("author");
    String title = (String) request.getParameter("title");
    String publisher = (String) request.getParameter("publisher");
    String price = (String) request.getParameter("price");
    String isEdit = (String) request.getParameter("isEdit");
    if(isEdit == null)
    {
        isEdit = "false";
    }
    
    String fromLib = (String) request.getParameter("fromLib");
    
    List<BookItem> books = bookstoreFacade.getBooks();
    BookItem book = new BookItem();
        
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

            if(isEdit.equals("true"))
            {
                book.setBookItemId(Integer.parseInt(bookId));
                book.setAuthor(author);
                book.setTitle(title);
                book.setPublisher(publisher);
                book.setPrice (Double.parseDouble(price));
                bookstoreFacade.updateBookItem(book);
            }        
        }
        catch (NumberFormatException ex)
        {
            //TODO CATCH EXCEPTION
        }
        catch (NullPointerException ex2)
        {
            //TODO CATCH EXCEPTION
        }
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
        <h1>Editing: <%=book.getTitle()%> by <%=book.getAuthor()%></h1
    <br>
      <table>
            <tr>
                <th>Book Contents: EDIT ON</th>
            </tr>
            <tr>
                <td>
                    <form action="EditBook.jsp">
                        <input type="text" name="bookId" value="<%=book.getBookItemId()%>" readonly>
                        <input type="text" name="author" value="<%=book.getAuthor()%>">
                        <input type="text" name="title" value="<%=book.getTitle()%>">
                        <input type="text" name="publisher" value="<%=book.getPublisher()%>">
                        <input type="text" name="price" value="<%=String.format("%.2f", book.getPrice())%>">
                        <input type="hidden" name="isEdit" value="true">
                        <input type="hidden" name="fromLib" value="false">
                        <input type="submit" value="submit edit" style="color:green;">
                    </form>
                </td>
            </tr>
     </table>
        <%
            if(fromLib.equals("true"))
            {
        %>
                <p><a href="./ShowAll.jsp?role=admin" target="_self">Back</a></p>
        <%
            } 
            else
            {
        %>
                <p><a href="./ListBooks.jsp?role=admin&bookId=1" target="_self">Back</a></p>
        <%
            }
        %>
    </body>
</html>

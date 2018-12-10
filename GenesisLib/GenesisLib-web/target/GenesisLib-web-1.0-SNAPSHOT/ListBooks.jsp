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
    String isLoaned = (String) request.getParameter("isLoaned");
    
    if(isDelete == null)
    {
        isDelete = "false";
    }
    
    if(isLoaned == null)
    {
        isLoaned = "false";
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
            if(isLoaned.equals("true"))
            {
                for(int i = 0; i < books.size(); i++)
                {
                    if(books.get(i).getBookItemId() == Integer.parseInt(bookId))
                    {
                        if(books.get(i).getLoanStatus() != true)
                        {
                            books.get(i).setLoanStatus(true);
                        }
                        else if(books.get(i).getLoanStatus() == true)
                        {
                            books.get(i).setLoanStatus(false);
                        }
                        bookstoreFacade.setBooks(books);
                        break;
                    }
                }
            }
            if(isDelete.equals("true"))
            {
                for(int i = 0; i < books.size(); i++)
                {
                    if(books.get(i).getBookItemId() == Integer.parseInt(bookId))
                    {
                        books.remove(i);
                        bookstoreFacade.setBooks(books);
                        break;
                    }
                }
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
                <th>Title</th>
                <th>Publisher</th>
                <th>Price</th>
                <th>Loaned</th>
            </tr>
            <tr>
                <td><%=book.getBookItemId()%></td>
                <td><%=book.getAuthor()%></td>
                <td><%=book.getTitle()%></td>
                <td><%=book.getPublisher()%></td>
                <td>£<%=String.format("%.2f", book.getPrice())%></td>
                <td><%=book.getLoanStatus()%></td>
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
                                <input type="hidden" name="isLoaned" value="true">
                                <input type="submit" value="loan book" style="color:green;">
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

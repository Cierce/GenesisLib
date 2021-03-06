/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: jetty/9.4.14.v20181114
 * Generated at: 2018-12-10 15:18:45 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.text.DecimalFormat;
import java.util.List;
import com.conindustries.genesislib.model.BookItem;
import com.conindustries.genesislib.model.BookFactory;
import com.conindustries.genesislib.model.Book;
import java.util.ArrayList;
import com.conindustries.WebObjectFactory;
import com.conindustries.genesislib.service.ServiceFactory;
import com.conindustries.genesislib.model.BookstoreFacade;

public final class ShowAll_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("java.util.List");
    _jspx_imports_classes.add("com.conindustries.genesislib.model.BookItem");
    _jspx_imports_classes.add("com.conindustries.genesislib.model.BookFactory");
    _jspx_imports_classes.add("com.conindustries.genesislib.model.BookstoreFacade");
    _jspx_imports_classes.add("com.conindustries.WebObjectFactory");
    _jspx_imports_classes.add("java.text.DecimalFormat");
    _jspx_imports_classes.add("com.conindustries.genesislib.service.ServiceFactory");
    _jspx_imports_classes.add("com.conindustries.genesislib.model.Book");
    _jspx_imports_classes.add("java.util.ArrayList");
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    final java.lang.String _jspx_method = request.getMethod();
    if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET POST or HEAD");
      return;
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");

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

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"css/style.css\">\n");
      out.write("        <title>Search Titles</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <h1>All Library Book Entries</h1\n");
      out.write("        <br>\n");
      out.write("    <br>\n");
      out.write("   \n");
      out.write("     <table>\n");
      out.write("            <tr>\n");
      out.write("                <th>Book ID</th>\n");
      out.write("                <th>Author</th>\n");
      out.write("                <th>Book Title</th>\n");
      out.write("                <th>Publisher</th>\n");
      out.write("                <th>Price</th>\n");
      out.write("            </tr>\n");
      out.write("    ");

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
    
      out.write("\n");
      out.write("            <tr>\n");
      out.write("                <td>");
      out.print(book.getBookItemId());
      out.write("</td>\n");
      out.write("                <td>");
      out.print(book.getAuthor());
      out.write("</td>\n");
      out.write("                <td>");
      out.print(book.getTitle());
      out.write("</td>\n");
      out.write("                <td>");
      out.print(book.getPublisher());
      out.write("</td>\n");
      out.write("                <td>£");
      out.print(String.format("%.2f", book.getPrice()));
      out.write("</td>\n");
      out.write("                <td>\n");
      out.write("                            <form action=\"EditBook.jsp\">\n");
      out.write("                                <input type=\"hidden\" name=\"bookId\" value=\"");
      out.print(book.getBookItemId());
      out.write("\">\n");
      out.write("                                <input type=\"hidden\" name=\"fromLib\" value=\"true\">\n");
      out.write("                                <input type=\"submit\" value=\"edit book\" style=\"color:green;\">\n");
      out.write("                            </form>\n");
      out.write("                        </td>\n");
      out.write("                        <td>\n");
      out.write("                            <form action=\"ShowAll.jsp\">\n");
      out.write("                                <input type=\"hidden\" name=\"bookId\" value=\"");
      out.print(book.getBookItemId());
      out.write("\">\n");
      out.write("                                <input type=\"hidden\" name=\"isDelete\" value=\"true\">\n");
      out.write("                                <input type=\"submit\" value=\"delete book\" style=\"color:red;\">\n");
      out.write("                            </form>\n");
      out.write("                        </td>\n");
      out.write("            </tr>\n");
      out.write("    ");

            }
        }
        catch (NumberFormatException ex)
        {
            //TODO CATCH EXCEPTION
        }
    
      out.write("\n");
      out.write("     </table>\n");
      out.write("     <p><a href=\"./ListBooks.jsp?role=admin&bookId=1\" target=\"_self\">Back</a></p>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}

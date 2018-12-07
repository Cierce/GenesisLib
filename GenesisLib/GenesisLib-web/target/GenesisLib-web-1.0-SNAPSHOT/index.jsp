<!DOCTYPE html>
<html>
    <head>
        <title>Library System Demo</title>
        <meta charset="UTF-8">
        <link rel="stylesheet" type="text/css" href="css/style.css">
    </head>
    <body>
        <h1>Library System Demo</h1>
        <p>This demo allows you to simulate a library system,<BR>
        You can run the demo in two modes depending on which link you select below.<BR>
        This simulates whether the user is logged in as an administrator or is simply a customer.<BR>
        As an administrator you can access all of the library systems.<BR>
        As a customer, the library can operate how you'd typically expect it too.<BR>
        
        <table>
            <tr>
                <th>Administrator</th>
                <th>Customer</th>
            </tr>
            <tr>
                <td>
                    <p> <a href="./ListBooks.jsp?role=admin bookId=0" target="_blank">Run library system in administrator mode</a></p>
                </td>
                <td>
                    <p> <a href="./ListBooks.jsp?role=customer" target="_blank">Run library system in customer mode</a></p>
                </td>
            </tr>
        </table>
    </body>
</html>

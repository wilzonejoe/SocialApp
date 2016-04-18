<%-- 
    Document   : index
    Created on : Apr 18, 2016, 3:54:50 PM
    Author     : wilsonjoe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PostBook</title>
        <style>
            .center {
                margin: auto;
                width: 90%;
                padding: 10px;
            }
            .inputRegister{
                width: 100%;
            }
        </style>
    </head>
    <body style="background-color: #cccccc">
        <table width="100%" align="center" cellpadding="10" cellspacing="0" border="0" style="background-color: floralwhite">
            <tr>
                <td style="background-color: #333;">
                    <img src="images/logo.png" style="vertical-align: middle" width="30" height="30"/>
                </td>
                <td style="background-color: #333;">
                    <form action="LoginServlet" method="POST" style="float: right; color: white; ">
                        Username :<input type="text" name="username" required/>
                        Password :<input type="password" name="password" required/>
                        <input type = "submit" value="Login"/>
                    </form>

                </td>
            </tr>
            <tr> 
                <td style="width: 50%">
                    <img src="images/PostBook.gif" style="width: 100%"/>
                </td>
                <td style="width: 50%;vertical-align: top">
                    <h1>
                        WELCOME TO POSTBOOK !!
                    </h1>
                    <h3>
                        Register
                    </h3>
                    <hr/>
                    <form action="RegisterServlet"method="POST">
                        <table style="width: 100%"cellpadding="10">
                            <tr>
                                <td>    
                                    Username 
                                </td>
                                <td> : </td>
                                <td>
                                    <input type="text" name="username" class="inputRegister"/><br/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Password 
                                </td>
                                <td> : </td>
                                <td>
                                    <input type="text" name="password" class="inputRegister"/><br/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Fullname 
                                </td>
                                <td> : </td>
                                <td>
                                    <input type="text" name="fullname" class="inputRegister"/><br/> 
                                </td>
                            </tr>
                            </tr>
                        </table>
                        <input type="submit" value="sign-up" class="inputRegister"/>
                    </form>
                </td>

            </tr>
        </table>
    </body>
</html>

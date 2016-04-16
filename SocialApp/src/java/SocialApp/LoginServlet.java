/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SocialApp;

import Bean.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author wilzo
 */
public class LoginServlet extends HttpServlet {

    private Connection conn;
    private PreparedStatement stmt;

    public LoginServlet()
            throws SQLException, ClassNotFoundException, IOException {  // obtain database parameters from configuration file

        String dbDriver = "com.mysql.jdbc.Driver";
        String dbUrl = "jdbc:mysql://localhost:3306/mysql";
        String dbTable = "user_login";
        String userName = "root";
        String password = "";
        // connect to the database and create a prepared statement
        Class.forName(dbDriver);
        conn = DriverManager.getConnection(dbUrl, userName, password);
        stmt = conn.prepareStatement("SELECT * FROM " + dbTable
                + " WHERE username = ? AND password = ?");
    }

    // handle the initial HTTP request and check whether client name is
    // in database before passing on request to a JSP
    public void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {  // obtain the values of the form data automatically URL decoded
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        System.out.println(username);
        System.out.println(password);
        if (username == null || password == null
                || username.length() == 0 || password.length() == 0) {  // show page with form to obtain client name
            RequestDispatcher dispatcher = getServletContext().
                    getRequestDispatcher("/index.html");
            dispatcher.forward(request, response);
        } else {  // put client name into a bean
            User user = new User();
            user.setUsername(username);
            user.setPassword(password);
            // check database for name using an SQL command
            boolean userFound;
            try {
                synchronized (this) // synchronize access to stmt
                {
                    stmt.setString(1, username);
                    stmt.setString(2, password);
                    ResultSet rs = stmt.executeQuery();
                    userFound = rs.next();//true if there is a record
                }
            } catch (SQLException e) {
                System.err.println("SQL Exception during query: " + e);
                userFound = false;
            }
            // make customer bean available for session
            HttpSession session = request.getSession(true);
            session.setAttribute("user", user);
            // pass bean to appropriate page for displaying response
            if (userFound) {
                RequestDispatcher dispatcher = getServletContext().
                        getRequestDispatcher("/userLoggedIn.jsp");
                dispatcher.forward(request, response);
            } else {
                RequestDispatcher dispatcher = getServletContext().
                        getRequestDispatcher("/userNotFound.jsp");
                dispatcher.forward(request, response);
            }
        }
    }

    public void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    public void destroy() {
        super.destroy();
        // close database connection
        try {
            if (stmt != null) {
                stmt.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException e) {
            System.err.println("SQL Exception while closing: " + e);
        }
    }
}

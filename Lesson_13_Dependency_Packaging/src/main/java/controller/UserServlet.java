package controller;

import model.bean.User;
import model.repo.UserDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "UserServlet", urlPatterns = {"","/users"})
public class UserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDAO userDAO;
    public void init() {
        userDAO = new UserDAO();
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action=request.getParameter("action");
        if (action==null){
            action="";
        }
        switch (action){
            case "create":
                insertUser(request, response);
                listUser(request, response);
                break;
            case "edit":
                editUser(request, response);
                break;
            default:
                break;
        }
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id= Integer.parseInt(request.getParameter("idDelete"));
        userDAO.deleteUser(id);

        List<User> userList=userDAO.selectAllUser();
        request.setAttribute("userList",userList);

        RequestDispatcher dispatcher=request.getRequestDispatcher("user/list.jsp");

        dispatcher.forward(request, response);

    }

    private void editUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id= Integer.parseInt(request.getParameter("id"));
        String name=request.getParameter("name");
        String email=request.getParameter("email");
        String country=request.getParameter("country");
        User user=new User(id,name,email,country);
        userDAO.updateUser(user);

        response.sendRedirect("/users");

//        RequestDispatcher dispatcher=request.getRequestDispatcher("user/edit.jsp");
//        dispatcher.forward(request, response);


    }

    private void insertUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name=request.getParameter("name");
        String email=request.getParameter("email");
        String country=request.getParameter("country");
        User user=new User(name,email,country);
        userDAO.insertUser(user);
//        RequestDispatcher dispatcher=request.getRequestDispatcher("user/create.jsp");
//        RequestDispatcher dispatcher=request.getRequestDispatcher("user/list.jsp");
//
//        dispatcher.forward(request, response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action=request.getParameter("action");
        if (action==null){
            action="";
        }
        switch (action){
            case "create":
                showNewForm(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                deleteUser(request, response);
                break;
            default:
                listUser(request, response);
                break;
        }
    }

    private void showEditForm( HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id= Integer.parseInt(request.getParameter("id"));
        User existingUser=userDAO.selectUser(id);
        request.setAttribute("user", existingUser);
        request.setAttribute("flag", true);
        listUser(request,response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher=request.getRequestDispatcher("user/list.jsp");
        dispatcher.forward(request, response);
    }

    private void listUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<User> userList=userDAO.selectAllUser();
        request.setAttribute("userList",userList);

        RequestDispatcher dispatcher=request.getRequestDispatcher("user/list.jsp");

        dispatcher.forward(request, response);
    }

}

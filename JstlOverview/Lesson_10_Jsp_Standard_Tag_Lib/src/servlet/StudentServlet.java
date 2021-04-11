package servlet;

import bean.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(urlPatterns = {"", "/list"})
public class StudentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Student> studentList=new ArrayList<>();
        studentList.add(new Student(432, "Nguyen Van A",
                "09/04/2021", 1, 4.0));
        studentList.add(new Student(433, "Nguyen Van B",
                "12/04/2021", 0, 8.0));
        studentList.add(new Student(434, "Nguyen Van E",
                "11/04/2021", 1, 9.0));
        studentList.add(new Student(435, "Nguyen Van D",
                "08/04/2021", 2, 6.0));
        studentList.add(new Student(436, "Nguyen Van F",
                "010/04/2021", 1, 5.0));
        req.setAttribute("studentListServlet",studentList);
        req.getRequestDispatcher("list_by_jstl.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}

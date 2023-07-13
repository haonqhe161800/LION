/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.base;

import dal.AccountDAO;
import dal.CustomerDAO;
import dal.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;
import model.Customer;

/**
 *
 * @author laptop
 */
public class AccountServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AccountServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AccountServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        PrintWriter out = response.getWriter();
        CustomerDAO customerDAO = new CustomerDAO();
        Account acc = (Account) session.getAttribute("account");
        Customer cus = new CustomerDAO().findByAccountID(acc.getAccountID());
        request.setAttribute("customer", cus);
        request.getRequestDispatcher("account.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        CustomerDAO customerDAO = new CustomerDAO();
        AccountDAO accountDAO = new AccountDAO();
        PrintWriter out = response.getWriter();
        Account acc = (Account) session.getAttribute("account");
        String username = request.getParameter("username");
        String newpass = request.getParameter("password");
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        Customer customer = new Customer(acc, address, phone, fullname);
        Account account = new Account(username, newpass, "user", email);
        customerDAO.update(customer); // UPDATE CUSTOMER trong database
        accountDAO.update(account); // UPDATE ACCOUNT trong database
        response.sendRedirect("login");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
















































































/*
Phương thức doGet () lấy thông tin về tài khoản của người dùng đã đăng nhập từ đối tượng phiên (session),
lấy thông tin khách hàng tương ứng từ cơ sở dữ liệu bằng cách sử dụng đối tượng CustomerDAO, đặt thông tin đã lấy được làm thuộc tính yêu cầu (request attribute),
và chuyển tiếp yêu cầu đến tệp account.jsp để hiển thị thông tin.

Phương thức doPost () cập nhật thông tin khách hàng và tài khoản trong cơ sở dữ liệu với thông tin mới được gửi bởi người dùng 
qua một biểu mẫu HTML. Trước tiên, nó lấy trường cập nhật từ đối tượng yêu cầu (request object), tạo một đối tượng Customer và 
Account mới với các trường cập nhật, sau đó gọi phương thức update () của các đối tượng DAO tương ứng để cập nhật thay đổi trong cơ sở dữ liệu. 
Cuối cùng, nó chuyển hướng người dùng đến trang đăng nhập.*/
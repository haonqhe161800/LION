/* xử lý các yêu cầu liên quan đến việc thêm số lượng sản phẩm vào kho hàng.
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin;

import dal.ProductDAO;
import dal.StorageDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Product;

/**
 *
 * @author laptop
 */
public class AddStockServlet extends HttpServlet {

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
            out.println("<title>Số lượng</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddStockServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *Trong phương thức doGet(), nó tìm kiếm thông tin về kích thước và số lượng còn lại của sản phẩm trong kho thông qua tầng truy xuất dữ liệu (DAO),
     * sau đó chuyển hướng yêu cầu đến trang addstock.jsp để hiển thị thông tin về số lượng còn lại và cho phép người dùng thêm số lượng.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        StorageDAO sdb = new StorageDAO();
        ProductDAO productDAO = new ProductDAO();
        int productID = Integer.valueOf(request.getParameter("id"));
        List<String> sizeList = productDAO.getSize(productID);
        String size = request.getParameter("size");
        String img = request.getParameter("img");
        if (size == null) {
            size = "L";
        }
        int num = sdb.getLeft(productID, sizeList.get(0));
        
        request.setAttribute("id", productID);
        request.setAttribute("num", num);
        request.setAttribute("img", img);
        request.setAttribute("size", size);
        request.getRequestDispatcher("addstock.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *Trong phương thức doPost(), nó nhận thông tin về số lượng cần thêm vào kho từ người dùng, 
     * sau đó thực hiện thêm số lượng này vào cơ sở dữ liệu thông qua tầng truy xuất dữ liệu và chuyển hướng người dùng đến trang 
     * CRUD (Create, Read, Update, Delete) để hiển thị danh sách sản phẩm trong kho.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int add = Integer.parseInt(request.getParameter("add"));
//        PrintWriter out = response.getWriter();
        int id = Integer.valueOf(request.getParameter("id"));
        String size = new ProductDAO().getSize(id).get(0);
//        out.print(id+" "+size+" "+add);
        StorageDAO sdb = new StorageDAO();
        sdb.addStock(id, size, add);
        response.sendRedirect("crud");
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

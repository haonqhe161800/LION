/* AddProduct servlet cung cấp chức năng tạo mới sản phẩm trong hệ thống.
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin;

import dal.CategoryDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Category;
import model.Product;

/**
 *
 * @author laptop
 */
public class AddProduct extends HttpServlet {

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
            out.println("<title>Servlet AddCRUDServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddCRUDServlet at " + request.getContextPath() + "</h1>");
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
        DecimalFormat df = new DecimalFormat("#.00");
        String name = request.getParameter("name");
        float price = Float.parseFloat(request.getParameter("price"));
        price = Float.parseFloat(df.format(price));
        String descript = request.getParameter("description");
        String supplier = request.getParameter("supplier");
        String img = request.getParameter("img");
        int categoryID = Integer.valueOf(request.getParameter("categoryID"));
        Category category = new CategoryDAO().get(categoryID);
        Product product = new Product(name, img, price, descript, supplier, category);

        ProductDAO productDAO = new ProductDAO();

        productDAO.create(product);

        response.sendRedirect("crud");

//        PrintWriter out = response.getWriter();
//        out.print(d);
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
        processRequest(request, response);
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
Phương thức doGet () nhận thông tin về sản phẩm mới từ đối tượng yêu cầu (request object), bao gồm tên sản phẩm, giá, mô tả, nhà cung cấp, ảnh và ID danh mục. 
Sau đó, nó lấy đối tượng Category tương ứng từ cơ sở dữ liệu bằng cách sử dụng đối tượng CategoryDAO, 
tạo ra một đối tượng Product mới với thông tin vừa nhận được và lưu nó vào cơ sở dữ liệu bằng cách sử dụng đối tượng ProductDAO. 
Cuối cùng, nó chuyển hướng người dùng đến trang CRUD để hiển thị danh sách sản phẩm.
*/

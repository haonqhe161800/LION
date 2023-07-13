/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.base;

import dal.ProductDAO;
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
public class CatalogServlet extends HttpServlet {

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
            out.println("<title>Servlet CatalogServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CatalogServlet at " + request.getContextPath() + "</h1>");
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
        PrintWriter out = response.getWriter();
//        HttpSession session = request.getSession();
        int categoryID = Integer.valueOf(request.getParameter("categoryID")); 
        ProductDAO productDAO = new ProductDAO();
        List<Product> list = productDAO.getProductByCategory(categoryID); //Nó lấy categoryID từ request và tìm kiếm danh sách sản phẩm từ cơ sở dữ liệu thông qua đối tượng ProductDAO
        List<String> type = productDAO.getSize(categoryID);
        int size = list.size(); // tổng số sản phẩm
        int numperPage = 10; // số lượng sản phẩm trên trang
        int numPage = size / numperPage + (size % numperPage == 0 ? 0 : 1); // phân trang dua tren tong so sp va sl sp tren trang
        String spage = request.getParameter("page");
        int page;
        if (spage == null) {
            page = 1;
        } else {
            page = Integer.parseInt(spage);
        }

        int start, end;
        start = (page - 1) * numperPage;
        end = Math.min(size, page * numperPage);
        List<Product> arr = productDAO.getProductByPage(list, start, end);
        request.setAttribute("categoryID", categoryID);
        request.setAttribute("num", numPage);
        request.setAttribute("type", type);
        request.setAttribute("data", arr);
        request.setAttribute("page", page);
        request.getRequestDispatcher("catalog.jsp").forward(request, response); // thiet lap cac attribute roi chuyen den jsp

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

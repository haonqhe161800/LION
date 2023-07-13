<% session.invalidate();
    String redirectURL = "home.jsp";
    response.sendRedirect(redirectURL);%>
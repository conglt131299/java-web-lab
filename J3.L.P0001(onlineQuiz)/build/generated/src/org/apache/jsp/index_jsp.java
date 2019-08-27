package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import model.User;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");

    
    String includePage = (String)request.getAttribute("page"); // Get include page from servlet.
    User user = (User)session.getAttribute("user"); // get user's session logged in.
    
    /*
        Determine title of page when user access.
    */
    String title = "";
    if (includePage.equals("loginForm.jsp")) {
        title = "Home";
    } else if (includePage.equals("registerForm.jsp")) {
        title = "Register";
    } else if (includePage.equals("takeQuiz/prepareQuiz.jsp")
            || includePage.equals("takeQuiz/quizPage.jsp")) {
        title = "Take Quiz";
    } else if (includePage.equals("manageQuiz.jsp")) {
        title = "Manage Quiz";
    } else if (includePage.equals("makeQuiz.jsp")) {
        title = "Make Quiz";
    }
    

      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <!--Display title on user's browser-->\n");
      out.write("        <title>");
      out.print(title);
      out.write("</title> \n");
      out.write("        <link rel=\"stylesheet\" href=\"resource/css/index.css\">\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div class=\"container\">\n");
      out.write("            <div class=\"nav-bar\">\n");
      out.write("                <ul>\n");
      out.write("                    <li><a href=\"login\">Home</a></li>\n");
      out.write("                    <li><a href=\"take_quiz\">Take Quiz</a></li>\n");
      out.write("                    <li><a href=\"make_quiz\">Make Quiz</a></li>\n");
      out.write("                    <li><a href=\"manage_quiz\">Manage Quiz</a></li>\n");
      out.write("                    ");
 if (user != null) {
      out.write("\n");
      out.write("                        <li><a href=\"logout\">Logout</a></li>\n");
      out.write("                    ");
}
      out.write("\n");
      out.write("                </ul>\n");
      out.write("            </div>\n");
      out.write("            <!--Display includePage required from servlet-->\n");
      out.write("            <div class=\"main-content\">\n");
      out.write("                ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, includePage, out, false);
      out.write("\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}

package control.multimedia;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ServletUploadMultimedia", value = "/ServletUploadMultimedia")
@MultipartConfig
public class ServletUploadMultimedia extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Part> multi = new ArrayList<Part>();
        for(Part part : request.getParts()){
            System.out.println(part.getName());
        }
    }
}

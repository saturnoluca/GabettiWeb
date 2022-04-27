package control;

import model.multimedia.MultimediaBean;
import model.multimedia.MultimediaModelDM;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "Servlet", value = "/Servlet")
@MultipartConfig
public class Servlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        MultimediaModelDM model = new MultimediaModelDM();
        MultimediaBean bean = new MultimediaBean();
        String action=request.getParameter("action");
        try {
            if (action.equals("img")) {
                ArrayList<Part> array = new ArrayList<Part>();
                System.out.println(request.getParts());
                for (Part part : request.getParts()) {
                    array.add(part);
                }
                bean.setFoto(array);
                bean.setIdAppartamento(2);
                model.doSaveFoto(bean);
            } else if (action.equals("video")) {
                ArrayList<Part> array = new ArrayList<Part>();
                for (Part part : request.getParts()) {
                    array.add(part);
                }
                bean.setVideo(array);
                bean.setIdAppartamento(2);
                model.doSaveVideo(bean);
            }
        }
            catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

}


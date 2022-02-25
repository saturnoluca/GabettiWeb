package control.multimedia;

import model.multimedia.MultimediaBean;
import model.multimedia.MultimediaModelDM;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "ServletRetrieveMultimedia", value = "/ServletRetrieveMultimedia")
@MultipartConfig
public class ServletRetrieveMultimedia extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        MultimediaModelDM model = new MultimediaModelDM();
        MultimediaBean bean = new MultimediaBean();
        try{
            bean.setFotoString(model.doRetrieveFoto(2));
            bean.setVideoString(model.doRetrieveVideo(2));
        }catch(SQLException e){
            e.printStackTrace();
        }
        request.setAttribute("multimedia", bean);
        RequestDispatcher rd = request.getRequestDispatcher("/NewFile.jsp");
        rd.forward(request, response);
    }
}

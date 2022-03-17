package control.appartamento;

import model.appartamento.AppartamentoBean;
import model.appartamento.AppartamentoModelDM;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "ServletListaAppartamenti", value = "/ServletListaAppartamenti")
public class ServletListaAppartamenti extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String numeroString = request.getParameter("numero");
        int num = 0;
        if(numeroString==null){
            num = 1;
        }else{
            num = Integer.parseInt(numeroString);
        }
        AppartamentoModelDM appartamentoModelDM = new AppartamentoModelDM();
        ArrayList<AppartamentoBean> appArray = new ArrayList<AppartamentoBean>();
        ArrayList<AppartamentoBean> appArray2 = new ArrayList<AppartamentoBean>();
        try{
            appArray=(ArrayList<AppartamentoBean>) appartamentoModelDM.RetrieveAllAppartamento();
        }catch(SQLException e ){
            e.printStackTrace();
        }
        if(appArray!=null){
            if(appArray.size()<10){
              request.setAttribute("array", appArray);
            }else if(appArray.size() < num*10){
                for(int i=(num-1)*10;i<appArray.size();i++){
                    appArray2.add(appArray.get(i));
                }
                request.setAttribute("array", appArray2);
            }else if(appArray.size()>num*10){
                for(int i=(num-1)*10;i<appArray.size();i++){
                    appArray2.add(appArray.get(i));
                }
                request.setAttribute("array", appArray2);
            }
        }
    }
}

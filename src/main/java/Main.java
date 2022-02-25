import UtilityClass.Ricerca;
import model.appartamento.AppartamentoBean;
import model.appartamento.AppartamentoModelDM;

import java.sql.SQLException;
import java.util.ArrayList;

public class Main {
    public static void main(String[] args){
        AppartamentoBean bean = new AppartamentoBean();
        AppartamentoModelDM model = new AppartamentoModelDM();
        ArrayList<AppartamentoBean> array = new ArrayList<AppartamentoBean>();
        Ricerca ricerca = new Ricerca();
        ricerca.setCittà("Sarno");
        try{
            array=model.barraRicerca(ricerca);
        }catch (SQLException e){
            e.printStackTrace();
        }
        System.out.println(array.get(0).toString());
    }
}

import UtilityClass.Ricerca;
import model.appartamento.AppartamentoBean;
import model.appartamento.AppartamentoModelDM;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

public class Main {
    public static void main(String[] args){
<<<<<<< Updated upstream
        AppartamentoBean bean = new AppartamentoBean();
        AppartamentoModelDM model = new AppartamentoModelDM();
        ArrayList<AppartamentoBean> array = new ArrayList<AppartamentoBean>();
        Ricerca ricerca = new Ricerca();
        ricerca.setCittà("Sarno");
        try{
            array=model.barraRicerca(ricerca);
=======
        UtenteBean u = new UtenteBean();
        u.setRuolo("Admin");
        u.setPassword("123456");
        u.setUsername("diocane");
        u.setEmail("diocane@gmail.com");
        u.setCognome("Cane");
        u.setNome("Dio");
        UtenteModelDM utenteModelDM = new UtenteModelDM();
        try{
            utenteModelDM.doSave(u);
            System.out.println(utenteModelDM.RetrieveByEmail(u.getEmail()).getIdUtente());
>>>>>>> Stashed changes
        }catch (SQLException e){
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
<<<<<<< Updated upstream
        System.out.println(array.get(0).toString());
=======
>>>>>>> Stashed changes
    }
}

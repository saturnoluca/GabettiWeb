import UtilityClass.Ricerca;
import model.appartamento.AppartamentoBean;
import model.appartamento.AppartamentoModelDM;
import model.utente.UtenteBean;
import model.utente.UtenteModelDM;

import java.sql.SQLException;
import java.util.ArrayList;

public class Main {
    public static void main(String[] args){
        UtenteBean u = new UtenteBean();
        UtenteModelDM utenteModelDM = new UtenteModelDM();
        try{
            u= utenteModelDM.RetrieveByEmail("bobaggiustatutto@gmail.com");
        }catch (SQLException e){
            e.printStackTrace();
        }
        System.out.println(u.getEmail()+" "+u.getIdUtente());

    }
}

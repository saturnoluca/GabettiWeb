import UtilityClass.Ricerca;
import model.agente.AgenteBean;
import model.agente.AgenteModelDM;
import model.appartamento.AppartamentoBean;
import model.appartamento.AppartamentoModelDM;
import model.utente.UtenteBean;
import model.utente.UtenteModelDM;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

public class Main {
    public static void main(String[] args){
        UtenteBean u = new UtenteBean();
        UtenteModelDM utenteModelDM = new UtenteModelDM();
        u.setNome("lu");
        u.setCognome("sa");
        u.setEmail("ciao@gmail.com");
        u.setRuolo("Agente");
        u.setUsername("lusa");
        u.setPassword("sium");
        UtenteBean utenteBean;
        try{
            utenteModelDM.doSave(u);
            utenteBean = utenteModelDM.RetrieveByEmail(u.getEmail());
            AgenteBean agenteBean = new AgenteBean();
            AgenteModelDM agenteModelDM= new AgenteModelDM();
            agenteBean.setLinkInstagram("dkpqdqw");
            agenteBean.setLinkFacebook("fdfew");
            agenteBean.setTelefonoFisso("fewfwe");
            agenteBean.setTelefonoCellulare("feqfe");
            agenteBean.setIdUtente(utenteBean.getIdUtente());
            agenteBean.setLinkTwitter("efewfw");
            agenteBean.setLinkInternet("efewf");
            agenteModelDM.doSave(agenteBean);
        }catch (SQLException e){
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

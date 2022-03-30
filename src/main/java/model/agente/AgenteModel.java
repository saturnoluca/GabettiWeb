package model.agente;

import UtilityClass.CompositeKeyAgenteCase;
import model.utente.UtenteBean;

import java.sql.SQLException;
import java.util.Collection;

public interface AgenteModel<T> {
    public void doSave(AgenteBean agente) throws SQLException;

    public Collection<CompositeKeyAgenteCase> RetrieveAgenteCase() throws SQLException;

    public int TotaleVisite(int id) throws SQLException;

    public Collection<AgenteBean> RetrieveAgente() throws SQLException;

    public AgenteBean RetrieveAgenteById(int id) throws SQLException;

    public AgenteBean RetrieveAgenteByIdUtente(int id) throws SQLException;

    void doDelete(UtenteBean utenteAgente) throws SQLException;

    void doUpdate(AgenteBean agenteBean) throws SQLException;
}

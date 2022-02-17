package model.utente;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

public interface UtenteModel<T> {
    public void doSave(T utente) throws SQLException, IOException;

    public Collection<ArrayList> doRetrieveAll() throws SQLException;

    public Collection<ArrayList> doRetrieveByRole(String ruolo) throws SQLException;

    public UtenteBean doRetrieveUtenteByKey(int idUtente) throws SQLException;

    public void doDelete(int idUtente) throws SQLException;
}

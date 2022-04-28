package model.utente;

import model.DriverManagerConnectionPool;

import javax.servlet.http.Part;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

public interface UtenteModel<T> {
    public void doSave(T utente) throws SQLException, IOException;

    public Collection<T> doRetrieveAll() throws SQLException;

    public Collection<T> doRetrieveByRole(String ruolo) throws SQLException;

    public UtenteBean doRetrieveUtenteByKey(int idUtente) throws SQLException;

    public void doDelete(int idUtente) throws SQLException;

    public UtenteBean doRetrieveUtenteByKeyAgente(int idUtente) throws SQLException;

    public UtenteBean Login(String email, String password) throws SQLException;

    public UtenteBean RetrieveByEmail(String email) throws SQLException;

    public UtenteBean RetrieveNomeCognome(String nome, String cognome);

    public void doUpdate(UtenteBean utenteBean) throws SQLException, IOException;

    public void doUpdateFoto(int idUtente, Part foto) throws SQLException, IOException;

}

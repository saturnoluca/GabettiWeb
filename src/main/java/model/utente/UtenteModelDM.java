package model.utente;

import model.DriverManagerConnectionPool;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

public class UtenteModelDM implements UtenteModel {
    private DriverManagerConnectionPool dmcp = null;

    public UtenteModelDM(DriverManagerConnectionPool dmcp) {
        this.dmcp = dmcp;
        System.out.println("DriverManager Product Model: creazione...");
    }

    public UtenteModelDM() {
    }

    @Override
    public void doSave(Object utente) throws SQLException, IOException {
        Connection connection = null;
        PreparedStatement ps = null;
        InputStream in = null;
        String insertSql = null;
        try {
            connection = dmcp.getConnection();
            if (utente instanceof UtenteBean) {
                if (((UtenteBean) utente).getFoto() == null) {
                    insertSql = "INSERT INTO Utente(username, password, nome, cognome, email, ruolo) VALUES(?, ?, ?, ?, ?, ?)";
                    ps = connection.prepareStatement(insertSql);
                    ps.setString(1, ((UtenteBean) utente).getUsername());
                    ps.setString(2, ((UtenteBean) utente).getPassword());
                    ps.setString(3, ((UtenteBean) utente).getNome());
                    ps.setString(4, ((UtenteBean) utente).getCognome());
                    ps.setString(5, ((UtenteBean) utente).getEmail());
                    ps.setString(6, ((UtenteBean) utente).getRuolo());
                } else {
                    insertSql = "INSERT INTO Utente(username, password, nome, cognome, email, foto, ruolo) VALUES(?, ?, ?, ?, ?, ?, ?)";
                    ps = connection.prepareStatement(insertSql);
                    ps.setString(1, ((UtenteBean) utente).getUsername());
                    ps.setString(2, ((UtenteBean) utente).getPassword());
                    ps.setString(3, ((UtenteBean) utente).getNome());
                    ps.setString(4, ((UtenteBean) utente).getCognome());
                    ps.setString(5, ((UtenteBean) utente).getEmail());
                    in = ((UtenteBean) utente).getFoto().getInputStream();
                    ps.setBlob(6, in);
                    ps.setString(7, ((UtenteBean) utente).getRuolo());
                }
                System.out.println("doSave:" + ps.toString());
                ps.executeUpdate();
                connection.commit();
            }
            if (in != null) {
                in.close();
            }
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
            } finally {
                DriverManagerConnectionPool.releaseConnection(connection);
            }
        }
    }

    @Override
    public Collection<ArrayList> doRetrieveAll() throws SQLException {
        Connection connection=null;
        return null;
    }

    @Override
    public Collection<ArrayList> doRetrieveByRole(String ruolo) throws SQLException {
        return null;
    }

    @Override
    public UtenteBean doRetrieveUtenteByKey(int idUtente) throws SQLException {
        return null;
    }

    @Override
    public void doDelete(int idUtente) throws SQLException {

    }
}

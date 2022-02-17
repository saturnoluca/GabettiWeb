package model.indirizzo;

import model.DriverManagerConnectionPool;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class IndirizzoModelDM implements IndirizzoModel {
    private DriverManagerConnectionPool dmcp = null;

    public IndirizzoModelDM() {
    }

    public IndirizzoModelDM(DriverManagerConnectionPool dmcp) {
        this.dmcp = dmcp;
    }

    @Override
    public void doSave(IndirizzoBean indirizzo) throws SQLException {
        Connection connection = null;
        PreparedStatement ps = null;
        String insertSql = "INSERT INTO Indirizzo(via, numeroCivico, cap, città, Appartamento_idAppartamento) VALUES(?, ?, ?, ?, ?)";
        try {
            connection = dmcp.getConnection();
            if (indirizzo instanceof IndirizzoBean) {
                ps = connection.prepareStatement(insertSql);
                ps.setString(1, indirizzo.getVia());
                ps.setString(2, indirizzo.getNumeroCivico());
                ps.setString(3, indirizzo.getCap());
                ps.setString(4, indirizzo.getCitta());
                ps.setInt(5, indirizzo.getIdAppartamento());
                connection.commit();
                System.out.println("doSave: " + indirizzo);
            }
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
            } finally {
                dmcp.releaseConnection(connection);
            }
        }
    }
}

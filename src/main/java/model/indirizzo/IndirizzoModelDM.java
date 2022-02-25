package model.indirizzo;

import model.DriverManagerConnectionPool;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
        String insertSql = "INSERT INTO Indirizzo(via, numeroCivico, cap, città, provincia, Appartamento_idAppartamento) VALUES(?, ?, ?, ?, ?, ?)";
        try {
            connection = dmcp.getConnection();
            if (indirizzo instanceof IndirizzoBean) {
                ps = connection.prepareStatement(insertSql);
                ps.setString(1, indirizzo.getVia());
                ps.setString(2, indirizzo.getNumeroCivico());
                ps.setString(3, indirizzo.getCap());
                ps.setString(4, indirizzo.getCitta());
                ps.setString(5, indirizzo.getProvincia());
                ps.setInt(6, indirizzo.getIdAppartamento());
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

    @Override
    public IndirizzoBean RetrieveIndirizzoByAppId(int id) throws SQLException {
        Connection connection = null;
        PreparedStatement ps = null;
        String selectSql="SELECT * FROM indirizzo WHERE Appartamento_idAppartamento=?";
        IndirizzoBean bean = new IndirizzoBean();
        try{
            connection=dmcp.getConnection();
            ps= connection.prepareStatement(selectSql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            rs.next();
            bean.setIdIndirizzo(rs.getInt("idIndirizzo"));
            bean.setVia(rs.getString("via"));
            bean.setNumeroCivico(rs.getString("numeroCivico"));
            bean.setCap(rs.getString("cap"));
            bean.setCitta(rs.getString("città"));
            bean.setProvincia(rs.getString("provincia"));
            bean.setIdAppartamento(rs.getInt("Appartamento_idAppartamento"));
        }finally {
            try {
                if (ps != null) {
                    ps.close();
                }
            } finally {
                dmcp.releaseConnection(connection);
            }
        }
        return bean;
    }
}

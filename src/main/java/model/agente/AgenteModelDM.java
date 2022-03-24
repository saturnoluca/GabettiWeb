package model.agente;

import UtilityClass.CompositeKeyAgenteCase;
import model.DriverManagerConnectionPool;
import model.appartamento.AppartamentoBean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

public class AgenteModelDM implements AgenteModel {
    private DriverManagerConnectionPool dmcp = null;

    public AgenteModelDM(DriverManagerConnectionPool dmcp) {
        this.dmcp = dmcp;
    }

    public AgenteModelDM() {
    }

    @Override
    public void doSave(AgenteBean agent) throws SQLException {
        Connection connection = null;
        PreparedStatement ps = null;
        String insertSql = "INSERT INTO agente(linkFacebook, linkInternet, linkInstagram, linkTwitter, telefonoFisso, telefonoCellulare, descrizionePersonale, Utente_idUtente) VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            connection = dmcp.getConnection();
            if (agent instanceof AgenteBean) {
                ps = connection.prepareStatement(insertSql);
                ps.setString(1, agent.getLinkFacebook());
                ps.setString(2, agent.getLinkInstagram());
                ps.setString(3, agent.getLinkTwitter());
                ps.setString(4, agent.getLinkInternet());
                ps.setString(5, agent.getTelefonoFisso());
                ps.setString(6, agent.getTelefonoCellulare());
                ps.setString(7, agent.getDescrizionePersonale());
                ps.setInt(8, agent.getIdUtente());
                ps.executeUpdate();
                connection.commit();
                System.out.println("doSave: " + ps.toString());
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
    public Collection<CompositeKeyAgenteCase> RetrieveAgenteCase() throws SQLException {
        Connection connection = null;
        PreparedStatement ps = null;
        String selectSql = "SELECT agente.*, (Select count(*) from appartamento where appartamento.Agente_idAgente=agente.idAgente) as contaCase FROM mydb.agente order by contaCase desc";
        ArrayList<CompositeKeyAgenteCase> array = new ArrayList<CompositeKeyAgenteCase>();
        try {
            connection = dmcp.getConnection();
            ps = connection.prepareStatement(selectSql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                CompositeKeyAgenteCase key = new CompositeKeyAgenteCase();
                AgenteBean bean = new AgenteBean();
                int numCase;
                bean.setIdAgente(rs.getInt("idAgente"));
                bean.setLinkFacebook(rs.getString("linkFacebook"));
                bean.setLinkInstagram(rs.getString("linkInstagram"));
                bean.setLinkTwitter(rs.getString("linkTwitter"));
                bean.setLinkInternet(rs.getString("linkInternet"));
                bean.setTelefonoFisso(rs.getString("telefonoFisso"));
                bean.setTelefonoCellulare(rs.getString("telefonoCellulare"));
                bean.setDescrizionePersonale(rs.getString("descrizionePersonale"));
                bean.setIdUtente(rs.getInt("Utente_idUtente"));
                numCase = rs.getInt("contaCase");
                key.setBean(bean);
                key.setContaCase(numCase);
                key.setTotvisite(TotaleVisite(bean.getIdAgente()));
                array.add(key);
            }
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
            } finally {
                dmcp.releaseConnection(connection);
            }
            return array;
        }
    }

    @Override
    public int TotaleVisite(int id) throws SQLException {
        Connection connection = null;
        PreparedStatement ps = null;
        String selectSql = "SELECT SUM(visualizzazioni) as totvisite FROM mydb.appartamento where Agente_idAgente=?";
        int totvisite=0;
        try{
            connection=dmcp.getConnection();
            ps=connection.prepareStatement(selectSql);
            ps.setInt(1, id);
            ResultSet rs= ps.executeQuery();
            while (rs.next()){
                totvisite=rs.getInt("totvisite");
            }
        }finally {
            try {
                if (ps != null) {
                    ps.close();
                }
            } finally {
                dmcp.releaseConnection(connection);
            }
            return totvisite;
        }
    }

    @Override
    public Collection<AgenteBean> RetrieveAgente() throws SQLException {
        Connection connection = null;
        PreparedStatement ps = null;
        String selectSql = "SELECT * FROM agente";
        ArrayList<AgenteBean> array = new ArrayList<AgenteBean>();
        try {
            connection = dmcp.getConnection();
            ps = connection.prepareStatement(selectSql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                AgenteBean bean = new AgenteBean();
                bean.setIdAgente(rs.getInt("idAgente"));
                bean.setLinkFacebook(rs.getString("linkFacebook"));
                bean.setLinkTwitter(rs.getString("linkTwitter"));
                bean.setLinkInstagram(rs.getString("linkInstagram"));
                bean.setLinkInternet(rs.getString("linkInternet"));
                bean.setTelefonoFisso(rs.getString("telefonoFisso"));
                bean.setTelefonoCellulare(rs.getString("telefonoFisso"));
                bean.setIdUtente(rs.getInt("Utente_idUtente"));
                array.add(bean);
            }
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
            } finally {
                dmcp.releaseConnection(connection);
            }
            return array;
        }
    }

    @Override
    public AgenteBean RetrieveAgenteById(int id) throws SQLException {
        Connection connection = null;
        PreparedStatement ps = null;
        String selectSql = "SELECT * FROM agente WHERE idAgente=?";
        AgenteBean bean = new AgenteBean();
        try {
            connection = dmcp.getConnection();
            ps = connection.prepareStatement(selectSql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                bean.setIdAgente(rs.getInt("idAgente"));
                bean.setDescrizionePersonale(rs.getString("descrizionePersonale"));
                bean.setLinkFacebook(rs.getString("linkFacebook"));
                bean.setLinkTwitter(rs.getString("linkTwitter"));
                bean.setLinkInstagram(rs.getString("linkInstagram"));
                bean.setLinkInternet(rs.getString("linkInternet"));
                bean.setTelefonoFisso(rs.getString("telefonoFisso"));
                bean.setTelefonoCellulare(rs.getString("telefonoCellulare"));
                bean.setIdUtente(rs.getInt("Utente_idUtente"));
            }
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
            } finally {
                dmcp.releaseConnection(connection);
            }
            return bean;
        }
    }

    @Override
    public AgenteBean RetrieveAgenteByIdUtente(int id) throws SQLException {
        Connection connection = null;
        PreparedStatement ps = null;
        String selectSql = "SELECT * FROM agente WHERE Utente_idUtente=?";
        AgenteBean bean = new AgenteBean();
        try {
            connection = dmcp.getConnection();
            ps = connection.prepareStatement(selectSql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                bean.setIdAgente(rs.getInt("idAgente"));
                bean.setDescrizionePersonale(rs.getString("descrizionePersonale"));
                bean.setLinkFacebook(rs.getString("linkFacebook"));
                bean.setLinkTwitter(rs.getString("linkTwitter"));
                bean.setLinkInstagram(rs.getString("linkInstagram"));
                bean.setLinkInternet(rs.getString("linkInternet"));
                bean.setTelefonoFisso(rs.getString("telefonoFisso"));
                bean.setTelefonoCellulare(rs.getString("telefonoCellulare"));
                bean.setIdUtente(rs.getInt("Utente_idUtente"));
            }
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
            } finally {
                dmcp.releaseConnection(connection);
            }
            return bean;
        }
    }

}

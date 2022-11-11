package model.agente;

import UtilityClass.CompositeKeyAgenteCase;
import UtilityClass.UtilityBlob;
import model.DriverManagerConnectionPool;
import model.appartamento.AppartamentoBean;
import model.utente.UtenteBean;

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
    public void doSave(AgenteBean agent){
        Connection connection = null;
        PreparedStatement ps = null;
        String insertSql = "INSERT INTO agente(linkFacebook, linkInternet, linkInstagram, linkTwitter, telefonoFisso, telefonoCellulare, descrizionePersonale, Utente_idUtente, collaboratore) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)";
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
                ps.setInt(9, agent.getCollaboratore());
                ps.executeUpdate();
                connection.commit();
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
    }

    @Override
    public Collection<CompositeKeyAgenteCase> RetrieveAgenteCase() {
        Connection connection = null;
        PreparedStatement ps = null;
        String selectSql = "SELECT agente.*, (Select count(*) from appartamento where appartamento.Agente_idAgente=agente.idAgente) as contaCase FROM agente order by contaCase desc";
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
                bean.setCollaboratore(rs.getInt("collaboratore"));
                numCase = rs.getInt("contaCase");
                key.setBean(bean);
                key.setContaCase(numCase);
                key.setTotvisite(TotaleVisite(bean.getIdAgente()));
                array.add(key);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return array;
    }

    public CompositeKeyAgenteCase RetrieveAgenteCase(int idAgente) {
        Connection connection = null;
        PreparedStatement ps = null;
        String selectSql = "Select COUNT(idAppartamento) as contaCase from appartamento where Agente_idAgente=? ";
        CompositeKeyAgenteCase compositeKeyAgenteCase = new CompositeKeyAgenteCase();
        try {
            connection = dmcp.getConnection();
            ps = connection.prepareStatement(selectSql);
            ps.setInt(1,idAgente);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int numCase;
                numCase = rs.getInt("contaCase");
                compositeKeyAgenteCase.setContaCase(numCase);
                compositeKeyAgenteCase.setTotvisite(TotaleVisite(idAgente));
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return compositeKeyAgenteCase;
    }

    @Override
    public int TotaleVisite(int id) {
        Connection connection = null;
        PreparedStatement ps = null;
        String selectSql = "SELECT SUM(visualizzazioni) as totvisite FROM appartamento where Agente_idAgente=?";
        int totvisite=0;
        try{
            connection=dmcp.getConnection();
            ps=connection.prepareStatement(selectSql);
            ps.setInt(1, id);
            ResultSet rs= ps.executeQuery();
            while (rs.next()){
                totvisite=rs.getInt("totvisite");
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return totvisite;
    }

    @Override
    public Collection<AgenteBean> RetrieveAgente(){
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
                bean.setCollaboratore(rs.getInt("collaboratore"));
                array.add(bean);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return array;
    }

    @Override
    public AgenteBean RetrieveAgenteById(int id) {
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
                bean.setCollaboratore(rs.getInt("collaboratore"));
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return bean;

    }

    @Override
    public AgenteBean RetrieveAgenteByIdUtente(int id) {
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
                bean.setCollaboratore(rs.getInt("collaboratore"));
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return bean;

    }

    @Override
    public void doDelete(UtenteBean utenteAgente){
        Connection connection = null;
        PreparedStatement ps = null;
        String deleteSql="DELETE FROM agente WHERE Utente_idUtente=?";
        try{
            connection=dmcp.getConnection();
            ps= connection.prepareStatement(deleteSql);
            ps.setInt(1, utenteAgente.getIdUtente());
            ps.executeUpdate();
            connection.commit();
        }catch (SQLException e){
            e.printStackTrace();
        }
    }

    @Override
    public void doUpdate(AgenteBean agenteBean) {
        Connection connection = null;
        PreparedStatement ps = null;
        String updateSql = "UPDATE agente SET linkFacebook=? , linkInstagram=? , telefonoCellulare=? , descrizionePersonale=?, collaboratore=? WHERE idAgente=?";
        try {
            connection = dmcp.getConnection();
            ps = connection.prepareStatement(updateSql);
            ps.setString(1, agenteBean.getLinkFacebook());
            ps.setString(2, agenteBean.getLinkInstagram());
            ps.setString(3, agenteBean.getTelefonoCellulare());
            ps.setString(4, agenteBean.getDescrizionePersonale());
            ps.setInt(5, agenteBean.getCollaboratore());
            ps.setInt(6, agenteBean.getIdAgente());
            ps.executeUpdate();
            connection.commit();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Collection<AgenteBean> doRetrieveAll() {
        Connection connection = null;
        PreparedStatement ps = null;
        ArrayList<AgenteBean> array = new ArrayList<AgenteBean>();
        String selectSql = "SELECT * FROM agente";
        try {
            connection = dmcp.getConnection();
            ps = connection.prepareStatement(selectSql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                AgenteBean bean = new AgenteBean();
                bean.setIdAgente(rs.getInt("idAgente"));
                bean.setLinkFacebook(rs.getString("linkFacebook"));
                bean.setLinkInstagram(rs.getString("linkInstagram"));
                bean.setTelefonoCellulare(rs.getString("telefonoCellulare"));
                bean.setDescrizionePersonale(rs.getString("descrizionePersonale"));
                bean.setIdUtente(rs.getInt("Utente_idUtente"));
                bean.setCollaboratore(rs.getInt("collaboratore"));

                array.add(bean);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return array;
    }

    public ArrayList<AgenteBean> RetrieveCollaboratoreByAgente(int collaboratore)  {
        Connection connection = null;
        PreparedStatement ps = null;
        String selectSql = "SELECT * FROM agente WHERE collaboratore=?";
        ArrayList<AgenteBean> collaboratori = new ArrayList<AgenteBean>();
        try {
            connection=dmcp.getConnection();
            ps = connection.prepareStatement(selectSql);
            ps.setInt(1, collaboratore);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                AgenteBean bean = new AgenteBean();
                bean.setIdAgente(rs.getInt("Agente_idAgente"));
                bean.setIdUtente(rs.getInt("Utente_idUtente"));
                bean.setTelefonoCellulare(rs.getString("telefonoCellulare"));
                bean.setLinkFacebook(rs.getString("linkFacebook"));
                bean.setLinkInstagram(rs.getString("linkInstagram"));
                bean.setDescrizionePersonale(rs.getString("descrizionePersonale"));
                bean.setCollaboratore(rs.getInt("collaboratore"));
                collaboratori.add(bean);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return collaboratori;
    }

    public ArrayList<AgenteBean> RetrieveAllCollaboratore() {
        Connection connection = null;
        PreparedStatement ps = null;
        String selectSql = "SELECT * FROM agente WHERE collaboratore!=?";
        ArrayList<AgenteBean> collaboratori = new ArrayList<AgenteBean>();
        try {
            connection = dmcp.getConnection();
            ps = connection.prepareStatement(selectSql);
            ps.setInt(1, 0);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                AgenteBean bean = new AgenteBean();
                bean.setIdAgente(rs.getInt("Agente_idAgente"));
                bean.setIdUtente(rs.getInt("Utente_idUtente"));
                bean.setTelefonoCellulare(rs.getString("telefonoCellulare"));
                bean.setLinkFacebook(rs.getString("linkFacebook"));
                bean.setLinkInstagram(rs.getString("linkInstagram"));
                bean.setDescrizionePersonale(rs.getString("descrizionePersonale"));
                bean.setCollaboratore(rs.getInt("collaboratore"));
                collaboratori.add(bean);
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
        return collaboratori;
    }
}

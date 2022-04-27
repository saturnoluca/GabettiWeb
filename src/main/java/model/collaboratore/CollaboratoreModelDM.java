package model.collaboratore;

import model.DriverManagerConnectionPool;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CollaboratoreModelDM implements CollaboratoreModel {
    private DriverManagerConnectionPool dmcp = null;

    public CollaboratoreModelDM() {
    }

    public CollaboratoreModelDM(DriverManagerConnectionPool dmcp) {
        this.dmcp = dmcp;
    }

    @Override
    public CollaboratoreBean doSave(CollaboratoreBean bean) {
        Connection connection = null;
        PreparedStatement ps = null;
        String insertSql = "INSERT INTO collaboratore(Agente_idAgente, Utente_idUtente, telefonoCellulare, linkFacebook, linkInstagram, descrizionePersonale) VALUES(?, ?, ?, ?, ?, ?)";
        try {
            connection = dmcp.getConnection();
            if (bean instanceof CollaboratoreBean) {
                ps = connection.prepareStatement(insertSql);
                ps.setInt(1, bean.getIdAgente());
                ps.setInt(2, bean.getIdUtente());
                ps.setString(3, bean.getTelefonoCellulare());
                ps.setString(4, bean.getLinkFacebook());
                ps.setString(5, bean.getLinkInstagram());
                ps.setString(6, bean.getDescrizionePersonale());
                connection.commit();
                System.out.println("doSave: " + bean);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return bean;
    }

    @Override
    public CollaboratoreBean RetrieveCollaboratore(int idUtente) {
        Connection connection = null;
        PreparedStatement ps = null;
        String selectSql = "SELECT * FROM collaboratore WHERE idCollaboratore=? AND idUtente";
        CollaboratoreBean bean = new CollaboratoreBean();
        try {
            ps = connection.prepareStatement(selectSql);
            ps.setInt(1, idUtente);
            ResultSet rs = ps.executeQuery();
            bean.setIdCollaboratore(rs.getInt("idCollaboratore"));
            bean.setIdAgente(rs.getInt("Agente_idAgente"));
            bean.setIdUtente(rs.getInt("Utente_idUtente"));
            bean.setTelefonoCellulare(rs.getString("telefonoCellulare"));
            bean.setLinkFacebook(rs.getString("linkFacebook"));
            bean.setLinkInstagram(rs.getString("linkInstagram"));
            bean.setDescrizionePersonale(rs.getString("descrizionePersonale"));
        }catch (SQLException e){
            e.printStackTrace();
        }
        return bean;
    }

    @Override
    public ArrayList<CollaboratoreBean> RetrieveCollaboratoreByAgente(int idAgente)  {
        Connection connection = null;
        PreparedStatement ps = null;
        String selectSql = "SELECT * FROM collaboratore WHERE Agente_idAgente=?";
        ArrayList<CollaboratoreBean> collaboratori = new ArrayList<CollaboratoreBean>();
        try {
            ps = connection.prepareStatement(selectSql);
            ps.setInt(1, idAgente);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                CollaboratoreBean bean = new CollaboratoreBean();
                bean.setIdCollaboratore(rs.getInt("idCollaboratore"));
                bean.setIdAgente(rs.getInt("Agente_idAgente"));
                bean.setIdUtente(rs.getInt("Utente_idUtente"));
                bean.setTelefonoCellulare(rs.getString("telefonoCellulare"));
                bean.setLinkFacebook(rs.getString("linkFacebook"));
                bean.setLinkInstagram(rs.getString("linkInstagram"));
                bean.setDescrizionePersonale(rs.getString("descrizionePersonale"));
                collaboratori.add(bean);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return collaboratori;
    }

    @Override
    public ArrayList<CollaboratoreBean> RetrieveAllCollaboratore() {
        Connection connection = null;
        PreparedStatement ps = null;
        String selectSql = "SELECT * FROM collaboratore";
        ArrayList<CollaboratoreBean> collaboratori = new ArrayList<CollaboratoreBean>();
        try {
            connection = dmcp.getConnection();
            ps = connection.prepareStatement(selectSql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                CollaboratoreBean bean = new CollaboratoreBean();
                bean.setIdCollaboratore(rs.getInt("idCollaboratore"));
                bean.setIdAgente(rs.getInt("Agente_idAgente"));
                bean.setIdUtente(rs.getInt("Utente_idUtente"));
                bean.setTelefonoCellulare(rs.getString("telefonoCellulare"));
                bean.setLinkFacebook(rs.getString("linkFacebook"));
                bean.setLinkInstagram(rs.getString("linkInstagram"));
                bean.setDescrizionePersonale(rs.getString("descrizionePersonale"));
                collaboratori.add(bean);
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
        return collaboratori;
    }
}

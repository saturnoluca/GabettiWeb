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
    public CollaboratoreBean doSave(CollaboratoreBean bean) throws SQLException {
        Connection connection = null;
        PreparedStatement ps = null;
        String insertSql = "INSERT INTO collaboratore(Agente_idAgente, Utente_idUtente) VALUES(?, ?)";
        try {
            connection = dmcp.getConnection();
            if (bean instanceof CollaboratoreBean) {
                ps = connection.prepareStatement(insertSql);
                ps.setInt(1, bean.getIdAgente());
                ps.setInt(2, bean.getIdUtente());
                connection.commit();
                System.out.println("doSave: " + bean);
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
        return bean;
    }

    @Override
    public CollaboratoreBean RetrieveCollaboratore(int idUtente) throws SQLException {
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
        } finally {
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

    @Override
    public ArrayList<CollaboratoreBean> RetrieveCollaboratoreByAgente(int idAgente) throws SQLException {
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
                collaboratori.add(bean);
            }
        }finally {
            try {
                if (ps != null) {
                    ps.close();
                }
            } finally {
                dmcp.releaseConnection(connection);
            }
        }
        return collaboratori;
    }

    @Override
    public ArrayList<CollaboratoreBean> RetrieveAllCollaboratore() throws SQLException {
        Connection connection = null;
        PreparedStatement ps = null;
        String selectSql = "SELECT * FROM collaboratore";
        ArrayList<CollaboratoreBean> collaboratori = new ArrayList<CollaboratoreBean>();
        try {
            ps = connection.prepareStatement(selectSql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                CollaboratoreBean bean = new CollaboratoreBean();
                bean.setIdCollaboratore(rs.getInt("idCollaboratore"));
                bean.setIdAgente(rs.getInt("Agente_idAgente"));
                bean.setIdUtente(rs.getInt("Utente_idUtente"));
                collaboratori.add(bean);
            }
        }finally {
            try {
                if (ps != null) {
                    ps.close();
                }
            } finally {
                dmcp.releaseConnection(connection);
            }
        }
        return collaboratori;
    }
}

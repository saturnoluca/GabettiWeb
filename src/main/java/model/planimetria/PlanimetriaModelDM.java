package model.planimetria;

import UtilityClass.UtilityBlob;
import model.DriverManagerConnectionPool;
import model.galleria.GalleriaBean;

import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.ArrayList;

public class PlanimetriaModelDM {

    private DriverManagerConnectionPool dmcp = null;

    public PlanimetriaModelDM(){

    }

    public PlanimetriaModelDM(DriverManagerConnectionPool dmcp){
        this.dmcp = dmcp;
    }

    public void doSavePlanimetria(PlanimetriaBean planimetria) throws IOException {
        Connection connection = null;
        PreparedStatement ps = null;
        InputStream in = null;
        String insertSql = null;
        try{
            connection = dmcp.getConnection();
            insertSql = "INSERT INTO planimetria(planimetria, idAppartamento) VALUES(?,?)";
            ps = connection.prepareStatement(insertSql);
            in = planimetria.getPlanimetria().getInputStream();
            if(in.available() != 0) {
                ps.setBinaryStream(1,in);
                ps.setInt(2, planimetria.getIdAppartamento());
                ps.executeUpdate();
                connection.commit();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void doDeletePlanimetria(String idPlanimetria) {
        Connection connection = null;
        PreparedStatement ps = null;
        String deleteSql = "DELETE FROM planimetria WHERE idPlanimetria=?";
        try {
            connection = dmcp.getConnection();
            ps = connection.prepareStatement(deleteSql);
            ps.setInt(1, Integer.parseInt(idPlanimetria));
            ps.executeUpdate();
            connection.commit();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public ArrayList<String> doRetrievePlanimetria(int idAppartamento) throws IOException {
        Connection connection = null;
        PreparedStatement ps = null;
        ArrayList<String> array = new ArrayList<String>();
        String selectSQL = "SELECT planimetria FROM planimetria WHERE idAppartamento=?";
        try {
            connection = dmcp.getConnection();
            ps = connection.prepareStatement(selectSQL);
            ps.setInt(1, idAppartamento);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                if (rs.getBlob("planimetria") != null) {
                    String planimetriaPart = null;
                    planimetriaPart = (UtilityBlob.base64ImageString(UtilityBlob.blobToBytes(rs.getBlob("planimetria"))));
                    array.add(planimetriaPart);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return array;
    }

    public ArrayList<PlanimetriaBean> doRetrievePlanimetriaCompleta(int idAppartamento) throws IOException {
        Connection connection = null;
        PreparedStatement ps = null;
        ArrayList<PlanimetriaBean> array = new ArrayList<PlanimetriaBean>();
        String selectSQL = "SELECT * FROM planimetria WHERE idAppartamento=?";
        PlanimetriaBean planimetriaBean = new PlanimetriaBean();
        try {
            connection = dmcp.getConnection();
            ps = connection.prepareStatement(selectSQL);
            ps.setInt(1, idAppartamento);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                planimetriaBean.setIdPlanimetria(rs.getInt("idPlanimetria"));

                if (rs.getBlob("planimetria") != null) {
                    String planimetriaPart = null;
                    planimetriaBean.setPlanimetriaString(UtilityBlob.base64ImageString(UtilityBlob.blobToBytes(rs.getBlob("planimetria"))));
                    array.add(planimetriaBean);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return array;
    }

    public byte[] doRetrievePdf(int idPlanimetria) throws IOException {
        Connection connection = null;
        PreparedStatement ps = null;
        Blob file = null;
        byte[] fileData = null;
        String selectSQL = "SELECT planimetria FROM planimetria WHERE idPlanimetria=?";
        try {
            connection = dmcp.getConnection();
            ps = connection.prepareStatement(selectSQL);
            ps.setInt(1, idPlanimetria);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                System.out.println("Sium");
                file = rs.getBlob("planimetria");
                fileData = file.getBytes(1, (int) file.length());
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return fileData;
    }
}

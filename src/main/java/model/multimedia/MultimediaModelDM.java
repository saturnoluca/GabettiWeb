package model.multimedia;

import model.DriverManagerConnectionPool;
import UtilityClass.UtilityBlob;

import javax.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

public class MultimediaModelDM implements MultimediaModel {
    private DriverManagerConnectionPool dmcp = null;

    public MultimediaModelDM() {
    }

    public MultimediaModelDM(DriverManagerConnectionPool dmcp) {
        this.dmcp = dmcp;
    }

    @Override
    public void doSaveFoto(MultimediaBean multi) throws SQLException, IOException {
        Connection connection = null;
        PreparedStatement ps = null;
        InputStream in = null;
        String insertSql = null;
        try {
            if (multi instanceof MultimediaBean) {
                int i = multi.getFoto().size();
                if (i > 0) {
                    connection = dmcp.getConnection();
                    for (int k = 1; k < i; k++) {
                        System.out.println("SIUM1");
                        insertSql = "INSERT INTO multimedia(foto, Appartamento_idAppartamento) VALUES(?, ?)";
                        ps = connection.prepareStatement(insertSql);
                        in = multi.getFoto().get(k).getInputStream();
                        ps.setBlob(1, in);
                        ps.setInt(2, multi.getIdAppartamento());
                        System.out.println("doSaveFoto:" + ps.toString());
                        ps.executeUpdate();
                        connection.commit();
                    }
                }
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
                dmcp.releaseConnection(connection);
            }
        }
    }

    @Override
    public void doSaveVideo(MultimediaBean multi) throws SQLException, IOException {
        Connection connection = null;
        PreparedStatement ps = null;
        InputStream in = null;
        String insertSql = null;
        try {
            if (multi instanceof MultimediaBean) {
                int i = multi.getVideo().size();
                if (i > 0) {
                    connection = dmcp.getConnection();
                    for (int k = 1; k < i; k++) {
                        insertSql = "INSERT INTO multimedia(video, Appartamento_idAppartamento) VALUES(?, ?)";
                        ps = connection.prepareStatement(insertSql);
                        in = multi.getVideo().get(k).getInputStream();
                        ps.setBlob(1, in);
                        ps.setInt(2, multi.getIdAppartamento());
                        System.out.println("doSaveFoto:" + ps.toString());
                        ps.executeUpdate();
                        connection.commit();
                    }
                }
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
                dmcp.releaseConnection(connection);
            }
        }

    }

    @Override
    public ArrayList<String> doRetrieveFoto(int idAppartamento) throws SQLException, IOException {
        Connection connection = null;
        PreparedStatement ps = null;
        ArrayList<String> array = new ArrayList<String>();
        String selectSQL = "SELECT multimedia.foto FROM multimedia WHERE Appartamento_idAppartamento=?";
        try {
            connection = dmcp.getConnection();
            ps = connection.prepareStatement(selectSQL);
            ps.setInt(1, idAppartamento);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                if (rs.getBlob("foto") != null) {
                    String fotoPart = null;
                    fotoPart = (UtilityBlob.base64ImageString(UtilityBlob.blobToBytes(rs.getBlob("foto"))));
                    array.add(fotoPart);
                }
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
    public ArrayList<String> doRetrieveVideo(int idAppartamento) throws SQLException, IOException {
        Connection connection = null;
        PreparedStatement ps = null;
        ArrayList<String> array = new ArrayList<String>();
        String selectSQL = "SELECT multimedia.video FROM multimedia WHERE Appartamento_idAppartamento=?";
        try {
            connection = dmcp.getConnection();
            ps = connection.prepareStatement(selectSQL);
            ps.setInt(1, idAppartamento);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                if (rs.getBlob("video") != null) {
                    String partVideo = null;
                    partVideo = UtilityBlob.base64ImageString(UtilityBlob.blobToBytes(rs.getBlob("video")));
                    array.add(partVideo);
                }
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
    public ArrayList<String> doRetrievePlanimetria(int idAppartamento) throws SQLException, IOException {
        Connection connection = null;
        PreparedStatement ps = null;
        ArrayList<String> array = new ArrayList<String>();
        String selectSQL = "SELECT multimedia.planimetria FROM multimedia WHERE Appartamento_idAppartamento=?";
        try {
            connection = dmcp.getConnection();
            ps = connection.prepareStatement(selectSQL);
            ps.setInt(1, idAppartamento);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                if (rs.getBlob("planimetria") != null) {
                    String partPlanimetria = null;
                    partPlanimetria = UtilityBlob.base64ImageString(UtilityBlob.blobToBytes(rs.getBlob("planimetria")));
                    array.add(partPlanimetria);
                }
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
}

package model.multimedia;

import UtilityClass.VisualizzazioneMultimedia;
import model.DriverManagerConnectionPool;
import UtilityClass.UtilityBlob;
import model.appartamento.AppartamentoBean;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MultimediaModelDM implements MultimediaModel {
    private DriverManagerConnectionPool dmcp = null;

    public MultimediaModelDM() {
    }

    public MultimediaModelDM(DriverManagerConnectionPool dmcp) {
        this.dmcp = dmcp;
    }

    @Override
    public void doSaveFoto(MultimediaBean multi) throws IOException {
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
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void doDeleteFoto(String idMultimedia) {
        Connection connection = null;
        PreparedStatement ps = null;
        String deleteSql = "DELETE FROM multimedia WHERE idMultimedia=?";
        try {
            System.out.println("voglio eliminare la foto con id" + idMultimedia);
            connection = dmcp.getConnection();
            ps = connection.prepareStatement(deleteSql);
            ps.setInt(1, Integer.parseInt(idMultimedia));
            ps.executeUpdate();
            connection.commit();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void doSaveVideo(MultimediaBean multi) throws IOException {
        Connection connection = null;
        PreparedStatement ps = null;
        InputStream in = null;
        String insertSql = null;
        try {
            if (multi instanceof MultimediaBean) {
                int i = multi.getVideo().size();
                if (i > 0) {
                    connection = dmcp.getConnection();
                    for (int k = 0; k < i; k++) {
                        insertSql = "INSERT INTO multimedia(video, Appartamento_idAppartamento) VALUES(?, ?)";
                        ps = connection.prepareStatement(insertSql);
                        in = multi.getVideo().get(k).getInputStream();
                        ps.setBlob(1, in);
                        ps.setInt(2, multi.getIdAppartamento());
                        System.out.println("doSaveVideo:" + ps.toString());
                        ps.executeUpdate();
                        connection.commit();
                    }
                }
            }
            if (in != null) {
                in.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    @Override
    public void doSavePlanimetria(MultimediaBean multi) throws IOException {
        Connection connection = null;
        PreparedStatement ps = null;
        InputStream in = null;
        String insertSql = null;
        try {
            if (multi instanceof MultimediaBean) {
                int i = multi.getPlanimetria().size();
                if (i > 0) {
                    connection = dmcp.getConnection();
                    for (int k = 1; k < i; k++) {
                        insertSql = "INSERT INTO multimedia(planimetria, Appartamento_idAppartamento) VALUES(?, ?)";
                        ps = connection.prepareStatement(insertSql);
                        in = multi.getPlanimetria().get(k).getInputStream();
                        ps.setBlob(1, in);
                        ps.setInt(2, multi.getIdAppartamento());
                        System.out.println("doSavePlanimetria:" + ps.toString());
                        ps.executeUpdate();
                        connection.commit();
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public ArrayList<String> doRetrieveFoto(int idAppartamento) throws IOException {
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
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return array;
    }

    public ArrayList<VisualizzazioneMultimedia> doRetrieveVisualizzazioneMultimedia(int idAppartamento) throws IOException {
        Connection connection = null;
        PreparedStatement ps = null;
        ArrayList<VisualizzazioneMultimedia> array = new ArrayList<VisualizzazioneMultimedia>();
        String selectSQL = "SELECT multimedia.idMultimedia, multimedia.foto FROM multimedia WHERE Appartamento_idAppartamento=?";
        try {
            connection = dmcp.getConnection();
            ps = connection.prepareStatement(selectSQL);
            ps.setInt(1, idAppartamento);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                VisualizzazioneMultimedia visualizzazioneMultimedia = new VisualizzazioneMultimedia();
                visualizzazioneMultimedia.setIdMultimedia(rs.getInt("idMultimedia"));
                if (rs.getBlob("foto") != null) {
                    String fotoPart = null;
                    fotoPart = (UtilityBlob.base64ImageString(UtilityBlob.blobToBytes(rs.getBlob("foto"))));
                    visualizzazioneMultimedia.setFotoString(fotoPart);
                    array.add(visualizzazioneMultimedia);
                }

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return array;
    }

    public ArrayList<MultimediaBean> doRetrieveFotoBean(int idAppartamento) throws IOException {
        Connection connection = null;
        PreparedStatement ps = null;
        ArrayList<String> array = new ArrayList<String>();
        ArrayList<MultimediaBean> multimediaBeans = new ArrayList<MultimediaBean>();
        String selectSQL = "SELECT multimedia.idMultimedia, multimedia.foto FROM multimedia WHERE Appartamento_idAppartamento=?";
        try {
            MultimediaBean multimediaBean = new MultimediaBean();
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
                multimediaBean.setIdAppartamento(rs.getInt("idMultimedia"));
                multimediaBean.setFotoString(array);
                multimediaBeans.add(multimediaBean);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return multimediaBeans;
    }

    @Override
    public ArrayList<String> doRetrieveVideo(int idAppartamento) throws IOException {
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
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return array;
    }

    @Override
    public ArrayList<String> doRetrievePlanimetria(int idAppartamento) throws IOException {
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
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return array;
    }

    @Override
    public ArrayList<MultimediaBean> RetrieveAll(ArrayList arrayAppartamento) throws IOException {
        ArrayList<AppartamentoBean> arrayList = (ArrayList<AppartamentoBean>) arrayAppartamento;
        ArrayList<MultimediaBean> arrayMultimedia = new ArrayList<MultimediaBean>();
        MultimediaModel model = new MultimediaModelDM();
        MultimediaBean multimediaBean = new MultimediaBean();
        try {
            for (AppartamentoBean appartamentoBean : arrayList) {
                multimediaBean.setFotoString(model.doRetrieveFoto(appartamentoBean.getIdAppartamento()));
                multimediaBean.setVideo(model.doRetrieveVideo(appartamentoBean.getIdAppartamento()));
                multimediaBean.setPlanimetria(model.doRetrievePlanimetria(appartamentoBean.getIdAppartamento()));
                arrayMultimedia.add(multimediaBean);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return arrayMultimedia;
    }

    public ArrayList<MultimediaBean> RetrieveAllMultimedia() throws IOException {
        Connection connection = null;
        PreparedStatement ps = null;
        ArrayList<MultimediaBean> array = new ArrayList<MultimediaBean>();
        String selectSQL = "SELECT * FROM multimedia";
        try {
            connection = dmcp.getConnection();
            ps = connection.prepareStatement(selectSQL);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                MultimediaBean bean = new MultimediaBean();
                ArrayList<String> immagini = new ArrayList<>();
                if (rs.getBlob("planimetria") != null) {
                    String partPlanimetria = null;
                    partPlanimetria = UtilityBlob.base64ImageString(UtilityBlob.blobToBytes(rs.getBlob("planimetria")));
                    immagini.add(0, partPlanimetria);
                    bean.setPlanimetriaString(immagini);
                }
                if (rs.getBlob("foto") != null) {
                    String part = null;
                    part = UtilityBlob.base64ImageString(UtilityBlob.blobToBytes(rs.getBlob("foto")));
                    immagini.add(0, part);
                    bean.setFotoString(immagini);
                }
                if (rs.getBlob("video") != null) {
                    String part = null;
                    part = UtilityBlob.base64ImageString(UtilityBlob.blobToBytes(rs.getBlob("video")));
                    immagini.add(0, part);
                    bean.setVideoString(immagini);
                }
                bean.setIdAppartamento(rs.getInt("Appartamento_idAppartamento"));
                bean.setIdMultimedia(rs.getInt("idMultimedia"));
                array.add(bean);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return array;
    }

}

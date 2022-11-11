package model.galleria;

import UtilityClass.UtilityBlob;
import UtilityClass.VisualizzazioneMultimedia;
import model.DriverManagerConnectionPool;
import model.appartamento.AppartamentoBean;
import model.multimedia.MultimediaBean;
import model.multimedia.MultimediaModel;
import model.multimedia.MultimediaModelDM;
import model.utente.UtenteBean;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class GalleriaModelDM {
    private DriverManagerConnectionPool dmcp = null;

    public GalleriaModelDM(){

    }
    public GalleriaModelDM(DriverManagerConnectionPool dmcp){
        this.dmcp = dmcp;
    }

    public void doSaveFoto(GalleriaBean foto) throws IOException{
        Connection connection = null;
        PreparedStatement ps = null;
        InputStream in = null;
        String insertSql = null;
        try{
            connection = dmcp.getConnection();
            insertSql = "INSERT INTO galleria(foto, idAppartamento, copertina) VALUES(?,?,?)";
            ps = connection.prepareStatement(insertSql);
            in = foto.getFoto().getInputStream();
            if(in.available() != 0) {
                ps.setBlob(1, in);
                ps.setInt(2, foto.getIdAppartamento());
                ps.setInt(3, foto.getCopertina());
                ps.executeUpdate();
                connection.commit();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void doDeleteFoto(String idFoto) {
        Connection connection = null;
        PreparedStatement ps = null;
        String deleteSql = "DELETE FROM galleria WHERE idFoto=?";
        try {
            connection = dmcp.getConnection();
            ps = connection.prepareStatement(deleteSql);
            ps.setInt(1, Integer.parseInt(idFoto));
            ps.executeUpdate();
            connection.commit();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public ArrayList<String> doRetrieveFoto(int idAppartamento) throws IOException {
        Connection connection = null;
        PreparedStatement ps = null;
        ArrayList<String> array = new ArrayList<String>();
        String selectSQL = "SELECT foto FROM galleria WHERE idAppartamento=?";
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

    public ArrayList<String> doRetrieveFotoDesc(int idAppartamento) throws IOException {
        Connection connection = null;
        PreparedStatement ps = null;
        ArrayList<String> array = new ArrayList<String>();
        String selectSQL = "SELECT foto FROM galleria WHERE idAppartamento=? ORDER BY copertina DESC";
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

    public String doRetrieveFoto(int idAppartamento,int copertina) throws IOException {
        Connection connection = null;
        PreparedStatement ps = null;
        String fotoPart = null;
        String selectSQL = "SELECT foto FROM galleria WHERE idAppartamento=? AND copertina=?";
        try {
            connection = dmcp.getConnection();
            ps = connection.prepareStatement(selectSQL);
            ps.setInt(1, idAppartamento);
            ps.setInt(2,copertina);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                if (rs.getBlob("foto") != null) {
                    fotoPart = (UtilityBlob.base64ImageString(UtilityBlob.blobToBytes(rs.getBlob("foto"))));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return fotoPart;
    }

    public ArrayList<VisualizzazioneMultimedia> doRetrieveVisualizzazioneMultimedia(int idAppartamento) throws IOException {
        Connection connection = null;
        PreparedStatement ps = null;
        ArrayList<VisualizzazioneMultimedia> array = new ArrayList<VisualizzazioneMultimedia>();
        String selectSQL = "SELECT idFoto, foto, copertina FROM galleria WHERE idAppartamento=?";
        try {
            connection = dmcp.getConnection();
            ps = connection.prepareStatement(selectSQL);
            ps.setInt(1, idAppartamento);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                VisualizzazioneMultimedia visualizzazioneMultimedia = new VisualizzazioneMultimedia();
                visualizzazioneMultimedia.setIdMultimedia(rs.getInt("idFoto"));
                if (rs.getBlob("foto") != null) {
                    String fotoPart = null;
                    fotoPart = (UtilityBlob.base64ImageString(UtilityBlob.blobToBytes(rs.getBlob("foto"))));
                    visualizzazioneMultimedia.setFotoString(fotoPart);
                    array.add(visualizzazioneMultimedia);
                }
                visualizzazioneMultimedia.setCopertina(rs.getInt("copertina"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return array;
    }

    public ArrayList<VisualizzazioneMultimedia> doRetrieveVisualizzazionePlanimetria(int idAppartamento) throws IOException {
        Connection connection = null;
        PreparedStatement ps = null;
        ArrayList<VisualizzazioneMultimedia> array = new ArrayList<VisualizzazioneMultimedia>();
        String selectSQL = "SELECT idPlanimetria, planimetria FROM planimetria WHERE idAppartamento=?";
        try {
            connection = dmcp.getConnection();
            ps = connection.prepareStatement(selectSQL);
            ps.setInt(1, idAppartamento);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                VisualizzazioneMultimedia visualizzazioneMultimedia = new VisualizzazioneMultimedia();
                visualizzazioneMultimedia.setIdMultimedia(rs.getInt("idPlanimetria"));
                if (rs.getBlob("planimetria") != null) {
                    String fotoPart = null;
                    fotoPart = (UtilityBlob.base64ImageString(UtilityBlob.blobToBytes(rs.getBlob("planimetria"))));
                    visualizzazioneMultimedia.setFotoString(fotoPart);
                    array.add(visualizzazioneMultimedia);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return array;
    }
    public ArrayList<MultimediaBean> RetrieveAllMultimedia() throws IOException {
        Connection connection = null;
        PreparedStatement ps = null;
        ArrayList<MultimediaBean> array = new ArrayList<MultimediaBean>();
        String selectSQL = "SELECT * FROM galleria";
        try {
            connection = dmcp.getConnection();
            ps = connection.prepareStatement(selectSQL);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                MultimediaBean bean = new MultimediaBean();
                ArrayList<String> immagini = new ArrayList<>();
                if (rs.getBlob("foto") != null) {
                    String part = null;
                    part = UtilityBlob.base64ImageString(UtilityBlob.blobToBytes(rs.getBlob("foto")));
                    immagini.add(0, part);
                    bean.setFotoString(immagini);
                }
                bean.setIdAppartamento(rs.getInt("idAppartamento"));
                bean.setIdMultimedia(rs.getInt("idFoto"));
                bean.setCopertina(rs.getInt("copertina"));
                array.add(bean);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return array;
    }

    public ArrayList<MultimediaBean> RetrieveAll(ArrayList arrayAppartamento) throws IOException {
        ArrayList<AppartamentoBean> arrayList = (ArrayList<AppartamentoBean>) arrayAppartamento;
        ArrayList<MultimediaBean> arrayMultimedia = new ArrayList<MultimediaBean>();
        GalleriaModelDM model = new GalleriaModelDM();
        MultimediaBean multimediaBean = new MultimediaBean();
        for (AppartamentoBean appartamentoBean : arrayList) {
            multimediaBean.setFotoString(model.doRetrieveFoto(appartamentoBean.getIdAppartamento()));
            arrayMultimedia.add(multimediaBean);
        }
        return arrayMultimedia;
    }

    public ArrayList<MultimediaBean> doRetrieveFotoBean(int idAppartamento) throws IOException {
        Connection connection = null;
        PreparedStatement ps = null;
        ArrayList<String> array = new ArrayList<String>();
        ArrayList<MultimediaBean> multimediaBeans = new ArrayList<MultimediaBean>();
        String selectSQL = "SELECT idFoto, foto FROM galleria WHERE idAppartamento=?";
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
                multimediaBean.setIdAppartamento(rs.getInt("idFoto"));
                multimediaBean.setFotoString(array);
                multimediaBeans.add(multimediaBean);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return multimediaBeans;
    }

    public void doUpdateCopertina(int idFoto, int copertina) throws IOException {
        Connection connection = null;
        PreparedStatement ps = null;
        InputStream in = null;
        String updateSql="UPDATE galleria SET copertina=? WHERE idFoto=?";
        try{
            connection = dmcp.getConnection();
            ps = connection.prepareStatement(updateSql);
            ps.setInt(1, copertina);
            ps.setInt(2,idFoto);
            ps.executeUpdate();
            connection.commit();
        }catch (SQLException e){
            e.printStackTrace();
        }
    }

    public int doRetrieveCopertina(int idAppartamento, int copertina) throws IOException {
        Connection connection = null;
        PreparedStatement ps = null;
        int result=0;
        String selectSQL = "SELECT * FROM galleria WHERE idAppartamento=? AND copertina=?";
        try {
            connection = dmcp.getConnection();
            ps = connection.prepareStatement(selectSQL);
            ps.setInt(1, idAppartamento);
            ps.setInt(2, copertina);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                result = rs.getInt("idFoto");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

}

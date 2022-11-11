package model.galleria;

import javax.servlet.http.Part;
import java.io.Serializable;

public class GalleriaBean implements Serializable {
    private int idFoto;
    private Part foto;
    private String fotoString;
    private int idAppartamento;
    private int copertina;

    public GalleriaBean(){}

    public GalleriaBean(int idFoto, Part foto, String fotoString, int idAppartamento, int copertina) {
        this.idFoto = idFoto;
        this.foto = foto;
        this.fotoString = fotoString;
        this.idAppartamento = idAppartamento;
        this.copertina = copertina;
    }

    public int getIdFoto() {
        return idFoto;
    }

    public void setIdFoto(int idFoto) {
        this.idFoto = idFoto;
    }

    public Part getFoto() {
        return foto;
    }

    public void setFoto(Part foto) {
        this.foto = foto;
    }

    public String getFotoString() {
        return fotoString;
    }

    public void setFotoString(String fotoString) {
        this.fotoString = fotoString;
    }

    public int getIdAppartamento() {
        return idAppartamento;
    }

    public void setIdAppartamento(int idAppartamento) {
        this.idAppartamento = idAppartamento;
    }

    public int getCopertina() {
        return copertina;
    }

    public void setCopertina(int copertina) {
        this.copertina = copertina;
    }

    @Override
    public String toString() {
        return "GalleriaBean{" +
                "idFoto=" + idFoto +
                ", foto=" + foto +
                ", fotoString='" + fotoString + '\'' +
                ", idAppartamento=" + idAppartamento +
                ", copertina=" + copertina +
                '}';
    }
}

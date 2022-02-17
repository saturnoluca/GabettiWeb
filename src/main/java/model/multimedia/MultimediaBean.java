package model.multimedia;

import javax.servlet.http.Part;
import java.io.Serializable;
import java.util.ArrayList;


public class MultimediaBean implements Serializable {
    private int idMultimedia;
    private ArrayList<Part> foto;
    private ArrayList<Part> video;
    private ArrayList<Part> planimetria;
    private int idAppartamento;

    public MultimediaBean() {
    }

    public MultimediaBean(int idMultimedia, ArrayList<Part> foto, ArrayList<Part> video, ArrayList<Part> planimetria, int idAppartamento) {
        this.idMultimedia = idMultimedia;
        this.foto = foto;
        this.video = video;
        this.planimetria = planimetria;
        this.idAppartamento = idAppartamento;
    }

    public int getIdMultimedia() {
        return idMultimedia;
    }

    public void setIdMultimedia(int idMultimedia) {
        this.idMultimedia = idMultimedia;
    }

    public ArrayList<Part> getFoto() {
        return foto;
    }

    public void setFoto(ArrayList<Part> foto) {
        this.foto = foto;
    }

    public ArrayList<Part> getVideo() {
        return video;
    }

    public void setVideo(ArrayList<Part> video) {
        this.video = video;
    }

    public ArrayList<Part> getPlanimetria() {
        return planimetria;
    }

    public void setPlanimetria(ArrayList<Part> planimetria) {
        this.planimetria = planimetria;
    }

    public int getIdAppartamento() {
        return idAppartamento;
    }

    public void setIdAppartamento(int idAppartamento) {
        this.idAppartamento = idAppartamento;
    }
}

package model.multimedia;

import javax.servlet.http.Part;
import java.io.Serializable;
import java.lang.reflect.Array;
import java.util.ArrayList;


public class MultimediaBean implements Serializable {
    private int idMultimedia;
    private ArrayList<Part> foto;
    private ArrayList<Part> video;
    private ArrayList<Part> planimetria;
    private ArrayList<String> fotoString;
    private ArrayList<String> videoString;
    private ArrayList<String> planimetriaString;
    private int idAppartamento;

    public MultimediaBean(int idMultimedia, ArrayList<Part> foto, ArrayList<Part> video, ArrayList<Part> planimetria, ArrayList<String> fotoString, ArrayList<String> videoString, ArrayList<String> planimetriaString, int idAppartamento) {
        this.idMultimedia = idMultimedia;
        this.foto = foto;
        this.video = video;
        this.planimetria = planimetria;
        this.fotoString = fotoString;
        this.videoString = videoString;
        this.planimetriaString = planimetriaString;
        this.idAppartamento = idAppartamento;
    }

    public MultimediaBean() {
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

    public ArrayList<String> getFotoString() {
        return fotoString;
    }

    public void setFotoString(ArrayList<String> fotoString) {
        this.fotoString = fotoString;
    }

    public ArrayList<String> getVideoString() {
        return videoString;
    }

    public void setVideoString(ArrayList<String> videoString) {
        this.videoString = videoString;
    }

    public ArrayList<String> getPlanimetriaString() {
        return planimetriaString;
    }

    public void setPlanimetriaString(ArrayList<String> planimetriaString) {
        this.planimetriaString = planimetriaString;
    }

    public int getIdAppartamento() {
        return idAppartamento;
    }

    public void setIdAppartamento(int idAppartamento) {
        this.idAppartamento = idAppartamento;
    }
}

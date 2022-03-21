package model.collaboratore;

import java.io.Serializable;

public class CollaboratoreBean implements Serializable {
    private int idCollaboratore;
    private int idAgente;
    private int idUtente;
    private String descrizionePersonale;
    private String linkFacebook;
    private String linkInstagram;
    private String telefonoCellulare;

    public CollaboratoreBean() {
    }

    public CollaboratoreBean(int idCollaboratore, int idAgente, int idUtente, String descrizionePersonale, String linkFacebook, String linkInstagram, String telefonoCellulare) {
        this.idCollaboratore = idCollaboratore;
        this.idAgente = idAgente;
        this.idUtente = idUtente;
        this.descrizionePersonale = descrizionePersonale;
        this.linkFacebook = linkFacebook;
        this.linkInstagram = linkInstagram;
        this.telefonoCellulare = telefonoCellulare;
    }

    public int getIdCollaboratore() {
        return idCollaboratore;
    }

    public void setIdCollaboratore(int idCollaboratore) {
        this.idCollaboratore = idCollaboratore;
    }

    public int getIdAgente() {
        return idAgente;
    }

    public void setIdAgente(int idAgente) {
        this.idAgente = idAgente;
    }

    public int getIdUtente() {
        return idUtente;
    }

    public void setIdUtente(int idUtente) {
        this.idUtente = idUtente;
    }

    public String getDescrizionePersonale() {
        return descrizionePersonale;
    }

    public void setDescrizionePersonale(String descrizionePersonale) {
        this.descrizionePersonale = descrizionePersonale;
    }

    public String getLinkFacebook() {
        return linkFacebook;
    }

    public void setLinkFacebook(String linkFacebook) {
        this.linkFacebook = linkFacebook;
    }

    public String getLinkInstagram() {
        return linkInstagram;
    }

    public void setLinkInstagram(String linkInstagram) {
        this.linkInstagram = linkInstagram;
    }

    public String getTelefonoCellulare() {
        return telefonoCellulare;
    }

    public void setTelefonoCellulare(String telefonoCellulare) {
        this.telefonoCellulare = telefonoCellulare;
    }
}



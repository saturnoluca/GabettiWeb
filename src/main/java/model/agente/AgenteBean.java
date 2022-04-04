package model.agente;

import java.io.Serializable;

public class AgenteBean implements Serializable {
    private int idAgente;
    private String linkFacebook;
    private String linkInstagram;
    private String linkTwitter;
    private String linkInternet;
    private String telefonoFisso;
    private String telefonoCellulare;
    private String descrizionePersonale;
    private int idUtente;

    public AgenteBean() {
    }

    public AgenteBean(int idAgente, String linkFacebook, String linkInstagram, String linkTwitter, String linkInternet, String telefonoFisso, String telefonoCellulare, String descrizionePersonale, int idUtente) {
        this.idAgente = idAgente;
        this.linkFacebook = linkFacebook;
        this.linkInstagram = linkInstagram;
        this.linkTwitter = linkTwitter;
        this.linkInternet = linkInternet;
        this.telefonoFisso = telefonoFisso;
        this.telefonoCellulare = telefonoCellulare;
        this.descrizionePersonale = descrizionePersonale;
        this.idUtente = idUtente;
    }

    public int getIdAgente() {
        return idAgente;
    }

    public void setIdAgente(int idAgente) {
        this.idAgente = idAgente;
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

    public String getLinkTwitter() {
        return linkTwitter;
    }

    public void setLinkTwitter(String linkTwitter) {
        this.linkTwitter = linkTwitter;
    }

    public String getLinkInternet() {
        return linkInternet;
    }

    public void setLinkInternet(String linkInternet) {
        this.linkInternet = linkInternet;
    }

    public String getTelefonoFisso() {
        return telefonoFisso;
    }

    public void setTelefonoFisso(String telefonoFisso) {
        this.telefonoFisso = telefonoFisso;
    }

    public String getTelefonoCellulare() {
        return telefonoCellulare;
    }

    public void setTelefonoCellulare(String telefonoCellulare) {
        this.telefonoCellulare = telefonoCellulare;
    }

    public String getDescrizionePersonale() {
        return descrizionePersonale;
    }

    public void setDescrizionePersonale(String descrizionePersonale) {
        this.descrizionePersonale = descrizionePersonale;
    }

    public int getIdUtente() {
        return idUtente;
    }

    public void setIdUtente(int idUtente) {
        this.idUtente = idUtente;
    }

    @Override
    public String toString() {
        return "AgenteBean{" +
                "idAgente=" + idAgente +
                ", linkFacebook='" + linkFacebook + '\'' +
                ", linkInstagram='" + linkInstagram + '\'' +
                ", descrizionePersonale='" + descrizionePersonale + '\'' +
                ", idUtente=" + idUtente +
                '}';
    }
}

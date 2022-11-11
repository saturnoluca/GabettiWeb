package UtilityClass;

import javax.servlet.http.Part;

public class UtenteAgente {
    private int idUtente;
    private int idAgente;
    private String nome;
    private String cognome;
    private String email;
    private String username;
    private String password;
    private String ruolo;
    private String descrizione;
    private String linkFacebook;
    private String linkInstragram;

    private String telefono;

    private String fotoString;

    private Part foto;

    private int collaboratore;
    public UtenteAgente() {
    }

    public UtenteAgente(int idUtente, int idAgente, String nome, String cognome, String email, String username, String password, String ruolo, String descrizione, String linkFacebook, String linkInstragram, String telefono, String fotoString, Part foto, int collaboratore) {
        this.idUtente = idUtente;
        this.idAgente = idAgente;
        this.nome = nome;
        this.cognome = cognome;
        this.email = email;
        this.username = username;
        this.password = password;
        this.ruolo = ruolo;
        this.descrizione = descrizione;
        this.linkFacebook = linkFacebook;
        this.linkInstragram = linkInstragram;
        this.telefono = telefono;
        this.fotoString = fotoString;
        this.foto = foto;
        this.collaboratore = collaboratore;
    }

    public int getIdUtente() {
        return idUtente;
    }

    public void setIdUtente(int idUtente) {
        this.idUtente = idUtente;
    }

    public int getIdAgente() {
        return idAgente;
    }

    public void setIdAgente(int idAgente) {
        this.idAgente = idAgente;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCognome() {
        return cognome;
    }

    public void setCognome(String cognome) {
        this.cognome = cognome;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRuolo() {
        return ruolo;
    }

    public void setRuolo(String ruolo) {
        this.ruolo = ruolo;
    }

    public String getDescrizione() {
        return descrizione;
    }

    public void setDescrizione(String descrizione) {
        this.descrizione = descrizione;
    }

    public String getLinkFacebook() {
        return linkFacebook;
    }

    public void setLinkFacebook(String linkFacebook) {
        this.linkFacebook = linkFacebook;
    }

    public String getLinkInstragram() {
        return linkInstragram;
    }

    public void setLinkInstragram(String linkInstragram) {
        this.linkInstragram = linkInstragram;
    }

    public String getFotoString() {
        return fotoString;
    }

    public void setFotoString(String fotoString) {
        this.fotoString = fotoString;
    }

    public Part getFoto() {
        return foto;
    }

    public void setFoto(Part foto) {
        this.foto = foto;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public int getCollaboratore() {
        return collaboratore;
    }

    public void setCollaboratore(int collaboratore) {
        this.collaboratore = collaboratore;
    }

    @Override
    public String toString() {
        return "UtenteAgente{" +
                "idUtente=" + idUtente +
                ", idAgente=" + idAgente +
                ", nome='" + nome + '\'' +
                ", cognome='" + cognome + '\'' +
                ", email='" + email + '\'' +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", ruolo='" + ruolo + '\'' +
                ", descrizione='" + descrizione + '\'' +
                ", linkFacebook='" + linkFacebook + '\'' +
                ", linkInstragram='" + linkInstragram + '\'' +
                ", telefono='" + telefono + '\'' +
                ", fotoString='" + fotoString + '\'' +
                ", foto=" + foto +
                ", collaboratore=" + collaboratore +
                '}';
    }
}

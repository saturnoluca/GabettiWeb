package model.utente;

import javax.servlet.http.Part;
import java.io.Serializable;


public class UtenteBean implements Serializable {
    private int idUtente;
    private String username;
    private String password;
    private String nome;
    private String cognome;
    private String email;
    private Part foto;
    private String ruolo;
    private String fotoString;

    public UtenteBean() {
    }

    public UtenteBean(int idUtente, String username, String password, String nome, String cognome, String email, Part foto, String ruolo, String fotoString) {
        this.idUtente = idUtente;
        this.username = username;
        this.password = password;
        this.nome = nome;
        this.cognome = cognome;
        this.email = email;
        this.foto = foto;
        this.ruolo = ruolo;
        this.fotoString = fotoString;
    }

    public int getIdUtente() {
        return idUtente;
    }

    public void setIdUtente(int idUtente) {
        this.idUtente = idUtente;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
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

    public Part getFoto() {
        return foto;
    }

    public void setFoto(Part foto) {
        this.foto = foto;
    }

    public String getRuolo() {
        return ruolo;
    }

    public void setRuolo(String ruolo) {
        this.ruolo = ruolo;
    }

    public String getFotoString() {
        return fotoString;
    }

    public void setFotoString(String fotoString) {
        this.fotoString = fotoString;
    }

    public String getPassword() {
        return password;
    }
}

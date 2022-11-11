package UtilityClass;

public class VisualizzazioneMultimedia {
    public int idMultimedia;
    public String fotoString;
    public int copertina;
    public int getIdMultimedia() {
        return idMultimedia;
    }

    public void setIdMultimedia(int idMultimedia) {
        this.idMultimedia = idMultimedia;
    }

    public String getFotoString() {
        return fotoString;
    }

    public void setFotoString(String fotoString) {
        this.fotoString = fotoString;
    }

    public int getCopertina() {
        return copertina;
    }

    public void setCopertina(int copertina) {
        this.copertina = copertina;
    }

    @Override
    public String toString() {
        return "VisualizzazioneMultimedia{" +
                "idMultimedia=" + idMultimedia +
                ", fotoString='" + fotoString + '\'' +
                ", copertina=" + copertina +
                '}';
    }
}

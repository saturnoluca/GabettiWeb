package UtilityClass;

public class VisualizzazioneMultimedia {
    public int idMultimedia;
    public String fotoString;

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

    @Override
    public String toString() {
        return "VisualizzazioneMultimedia{" +
                "idMultimedia=" + idMultimedia +
                ", fotoString='" + fotoString + '\'' +
                '}';
    }
}

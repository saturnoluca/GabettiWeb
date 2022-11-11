package UtilityClass;

import model.appartamento.AppartamentoBean;

import java.util.Comparator;

public class PrezzoCrescenteImmobileComparator implements Comparator<VisualizzazioneImmobile> {
    @Override
    public int compare(VisualizzazioneImmobile o1, VisualizzazioneImmobile o2) {
        if(o1.getPrezzo() == o2.getPrezzo())
            return 0;
        else if(o1.getPrezzo() > o2.getPrezzo())
            return 1;
        else
            return -1;
    }
}

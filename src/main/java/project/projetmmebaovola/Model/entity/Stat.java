package project.projetmmebaovola.Model.entity;

import project.projetmmebaovola.Model.entity.voyage.Voyage;

import java.util.ArrayList;
import java.util.List;

public class Stat {
    List<Integer> nombre= new ArrayList<>();
    List<String> sexe = new ArrayList<>();
    Voyage voyage= new Voyage();
    int total=0;

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public Voyage getVoyage() {
        return voyage;
    }

    public void setVoyage(Voyage voyage) {
        this.voyage = voyage;
    }

    public List<Integer> getNombre() {
        return nombre;
    }

    public void setNombre(List<Integer> nombre) {
        this.nombre = nombre;
    }

    public List<String> getSexe() {
        return sexe;
    }

    public void setSexe(List<String> sexe) {
        this.sexe = sexe;
    }

    public Stat getFromListObject(List<Object[]> objets, Voyage voyage){
        Stat stat= new Stat();
        stat.setVoyage(voyage);
        setTotal(0);
        for (int i = 0; i < objets.size() ; i++) {
            stat.getNombre().add(Integer.valueOf(String.valueOf(objets.get(i)[0])));
            setTotal(getTotal()+Integer.valueOf(String.valueOf(objets.get(i)[0])));
            stat.getSexe().add(String.valueOf(objets.get(i)[1]));
        }

        return stat;
    }

    @Override
    public String toString() {
        return "Stat{" +
                "nombre=" + nombre +
                ", sexe=" + sexe +
                ", voyage=" + voyage +
                '}';
    }
}

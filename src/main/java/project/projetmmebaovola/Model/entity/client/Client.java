package project.projetmmebaovola.Model.entity.client;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

import java.time.LocalDate;
import java.time.Period;

@Entity
public class Client {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String nomClient;
    private LocalDate dateNaissance;
    private  String sexe;
    private int etat=0;

    public int getEtat() {
        return etat;
    }

    public void setEtat(int etat) {
        this.etat = etat;
    }

    public LocalDate getDateNaissance() {
        return dateNaissance;
    }

    public void setSexe(String sexe) {
        this.sexe = sexe;
    }

    public void setId(Integer id) {
        this.id = id;
    }
    public Integer getId(){return id;}

    public void setNomClient(String nomClient) {
        this.nomClient = nomClient;
    }
    public String getNomClient(){return nomClient;}
    public  void  setDateNaissance(LocalDate dateNaissance){
        this.dateNaissance=dateNaissance;
    }
    public void settSexe(String sexe){
        this.sexe=sexe;
    }
    public  String getSexe(){return sexe;}

    public int getAge(){
        Period period = Period.between(getDateNaissance(), LocalDate.now());
        int years = period.getYears();
        return years;
    }
}

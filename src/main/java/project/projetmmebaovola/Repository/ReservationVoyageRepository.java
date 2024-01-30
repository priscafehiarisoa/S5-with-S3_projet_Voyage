package project.projetmmebaovola.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import project.projetmmebaovola.Model.entity.voyage.ReservationVoyage;

import java.util.List;

public interface ReservationVoyageRepository extends JpaRepository<ReservationVoyage, Integer> {

    List<ReservationVoyage> getReservationVoyageByEtat(int etat);
}
package project.projetmmebaovola.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import project.projetmmebaovola.Model.entity.activite.Activite;
import project.projetmmebaovola.Model.entity.bouquet.Bouquet_activite;
import project.projetmmebaovola.Model.entity.bouquet.Bouquets;

import java.util.List;

public interface BouquetActiviteRepository extends JpaRepository<Activite,Integer> {


//    List<Bouquet_activite> getBouquet_activitesByBouquetsAndEtat(Bouquets bouquets,int etat);

}

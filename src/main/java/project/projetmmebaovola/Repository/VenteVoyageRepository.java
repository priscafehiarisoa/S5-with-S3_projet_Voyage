package project.projetmmebaovola.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import project.projetmmebaovola.Model.entity.voyage.VenteVoyage;

import java.util.List;

public interface VenteVoyageRepository extends JpaRepository<VenteVoyage, Integer> {
    
    @Query(value = "SELECT MAX(nombre), sexe " +
            "FROM (" +
            "         (SELECT COALESCE(SUM(rv.nombre_rervation), 0) AS nombre, c.sexe " +
            "          FROM vente_voyage" +
            "                   JOIN public.reservation_voyage rv ON rv.id = vente_voyage.reservatio_id" +
            "                   RIGHT JOIN public.client c ON c.id = rv.id_client" +
            "          WHERE rv.id_voyage = :id" +
            "          GROUP BY c.sexe)" +
            "         UNION ALL" +
            "         (SELECT 0 AS nombre, m.sexe" +
            "          FROM (SELECT 'femme' AS sexe UNION SELECT 'homme') AS m)" +
            "     ) AS subquery_alias " +
            "GROUP BY sexe",nativeQuery = true)
    List<Object[]> getStatistique(int id);
}
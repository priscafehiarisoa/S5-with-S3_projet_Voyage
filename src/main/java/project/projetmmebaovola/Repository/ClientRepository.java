package project.projetmmebaovola.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import project.projetmmebaovola.Model.entity.client.Client;

import java.util.List;

public interface ClientRepository extends JpaRepository<Client, Integer> {
    @Query("select c from Client c where c.etat=0")
    List<Client> getValidClient();
    @Query("select c from Client c where c.etat=-10")
    List<Client> getInvalidClient();

}
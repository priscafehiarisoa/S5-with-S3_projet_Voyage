package project.projetmmebaovola.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import project.projetmmebaovola.Model.entity.Stat;
import project.projetmmebaovola.Model.entity.voyage.Voyage;
import project.projetmmebaovola.Repository.VenteVoyageRepository;
import project.projetmmebaovola.Repository.VoyageRepository;

import java.util.List;
import java.util.Optional;

@Controller
public class StatistiqueController {

    private final VenteVoyageRepository venteVoyageRepository;
    private final VoyageRepository voyageRepository;

    public StatistiqueController(VenteVoyageRepository venteVoyageRepository,
                                 VoyageRepository voyageRepository) {
        this.venteVoyageRepository = venteVoyageRepository;
        this.voyageRepository = voyageRepository;
    }

    @GetMapping("/getStatistique")
    public String getStatistique(Model model ){
        List<Voyage> listeVoyage= voyageRepository.getVoyageByEtat(0);
        model.addAttribute("voyage",listeVoyage);
        return "/statistique/statistiqueVente";
    }

    @PostMapping("/getStatVoyage")
    public String getStatVoyage(@RequestParam("id") int id, Model model){
        List<Object[]> listobject = venteVoyageRepository.getStatistique(id);
        List<Voyage> listeVoyage= voyageRepository.getVoyageByEtat(0);
        Optional<Voyage> optionalVoyage= voyageRepository.findById(id);

        model.addAttribute("voyage",listeVoyage);
        Stat stat= new Stat().getFromListObject(listobject,optionalVoyage.get());
        model.addAttribute("stat",stat);
        return "statistique/statistiqueVente";
    }



}

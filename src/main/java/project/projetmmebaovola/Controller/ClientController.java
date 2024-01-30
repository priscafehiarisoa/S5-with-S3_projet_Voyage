package project.projetmmebaovola.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.view.RedirectView;
import project.projetmmebaovola.Model.entity.client.Client;
import project.projetmmebaovola.Model.util.Utils;
import project.projetmmebaovola.Repository.ClientRepository;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Optional;

@Controller
public class ClientController {

    private final ClientRepository clientRepository;

    public ClientController(ClientRepository clientRepository) {
        this.clientRepository = clientRepository;
    }

    @GetMapping("/clients")
    public String getListeClient(Model model )
    {
        List<Client> clientList=clientRepository.getValidClient();
        model.addAttribute("client",clientList);
        return "client/listeClient";
    }
    @GetMapping("/formClient")
    public String formClientpage(){
        return "client/AjoutClient";
    }
    @PostMapping("/client")
    public Object newClient( @RequestParam("sexe") String sexe, @RequestParam("dateNaissance") LocalDate localdate,@RequestParam("nomClient") String nomClient, Model model){
        Client client = new Client();
        try {
            client.setEtat(0);
            client.setSexe(sexe);
            client.setDateNaissance(localdate);
            client.setNomClient(nomClient);
            clientRepository.save(client);
            System.out.println("** mety **");

        }catch (Exception e){
            System.out.println("** erreur **");
            model.addAttribute("erreur",e.getMessage());
            return "client/AjoutClient";

        }
        String redirectString= "/clients";
        return new RedirectView(redirectString,true);
    }


    @GetMapping("/deleteClient/{id}")
    public Object deleteClient(@PathVariable ("id") int id,Model model){
        Optional<Client> optional=clientRepository.findById(id);
        if(optional.isPresent()){
            Client client= optional.get();
            client.setEtat(-10);
            clientRepository.save(client);
            String redirectString= "/clients";
            return new RedirectView(redirectString,true);
        }
        else{
            model.addAttribute("erreur","client introuvable");
            List<Client> clientList=clientRepository.getValidClient();
            model.addAttribute("client",clientList);
            return "client/listeClient";
        }
    }

    @GetMapping("/updateclientPage/{id}")
    public String updateclientPage(@PathVariable("id") int id,Model model){
        Optional<Client> optionalClient=clientRepository.findById(id);
        if(optionalClient.isPresent())
        {
            model.addAttribute("client",optionalClient.get());
        }
        return "client/ModifierClient";
    }

    @PostMapping("/updateClient")
    public Object updateClient( @RequestParam("sexe") String sexe, @RequestParam("id") int id,@RequestParam("etat") int etat, @RequestParam("dateNaissance") LocalDate localdate,@RequestParam("nomClient") String nomClient,Model model ){
        Client client = new Client();
        try {
            client.setId(Integer.valueOf(String.valueOf(id)));
            client.setEtat(Integer.valueOf(String.valueOf(etat)));
            client.setSexe(String.valueOf(sexe));
            client.setDateNaissance(localdate);
            client.setNomClient(nomClient);
            clientRepository.save(client);
            System.out.println("nety");
        }catch (Exception e){
            System.out.println("erreur");
            List<Client> clientList=clientRepository.getValidClient();
            model.addAttribute("erreur",e.getMessage());
            return "client/ModifierClient";

        }
        String redirectString= "/clients";
        return new RedirectView(redirectString,true);

    }
}

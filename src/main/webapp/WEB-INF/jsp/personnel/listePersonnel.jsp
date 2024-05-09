<%--
  Created by IntelliJ IDEA.
  User: Valisoa
  Date: 23/01/2024
  Time: 12:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Liste perso</title>


    <%@ page import="java.util.List" %>
    <%@ page import="java.util.ArrayList" %>
    <%@ page import="project.projetmmebaovola.Model.entity.voyage.Voyage" %>
    <%@ page import="project.projetmmebaovola.Model.entity.personnel.Personnel" %>

    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
        <%
    List<Personnel> personnelList= (List<Personnel>) request.getAttribute("personnel");

%>

    <jsp:include page="../template/header.jsp" />

    <div class="col-lg-12 grid-margin stretch-card">
        <div class="card">
            <div class="card-body">
                <h4 class="card-title">liste des personnels </h4>
                <p class="card-description">
                </p>
                <div class="search-container">
                    <form id="searchForm">
                        <input type="text" id="searchInput" class="form-control" placeholder="Entrez le nom du personnel" oninput="search()">
                    </form>
                </div>
                <%--                description de l'activité --%>
                <div class="table-responsive">
                    <table border="1" class="table">
                        <tr>
                            <th>_</th>
                            <th>Pesronnel</th>
                            <th>fonction</th>
                            <th>date embauche</th>
                            <th>heure de travail</th>
                            <th>Salaire horaire</th>
                            <th>references</th>
                            <th>-</th>
                        </tr>
                        <tbody>

                        <% for (Personnel personnel:personnelList) { %>
                        <tr>
                            <td><%=personnel.getId()%></td>
                            <td><%=personnel.getNomPersonnel()%></td>
                            <td><%=personnel.getFonction().getNomFonction()%></td>
                            <td><%=personnel.getDateEmbauche()%></td>
                            <td><%=personnel.getHeureTravail()%></td>
                            <td><%=personnel.getSalaire()%></td>
                            <td>
                                <ul>
                                    <li>salaire horaire le plus bas : <%=personnel.getTypeMainOeuvre().getTauxHoraire()%></li>
                                    <li>taux horaire le plus bas : <%=personnel.getTypeMainOeuvre().getHeureDeTravail()%></li>
                                </ul>
                            </td>
                            <td><a href="/updateFormPersonnel/<%=personnel.getId()%>" class="btn btn-dark"><i class="mdi mdi-pen"></i></a></td>

                        </tr>
                        <% } %>
                        </tbody>

                    </table>

                </div>
            </div>
        </div>
    </div>
    <script>
        function search() {
            // Récupérer la valeur de recherche
            var input = document.getElementById('searchInput');
            var filter = input.value.toUpperCase();

            // Récupérer la table et les lignes
            var table = document.querySelector('.table');
            var rows = table.getElementsByTagName('tr');

            // Parcourir toutes les lignes de la table, et masquer celles qui ne correspondent pas à la recherche
            for (var i = 1; i < rows.length; i++) { // Commence à 1 pour sauter l'en-tête
                var nameCell = rows[i].getElementsByTagName('td')[1]; // Changer l'index selon la position de la colonne du nom du personnel

                if (nameCell) {
                    var nameText = nameCell.textContent || nameCell.innerText;
                    if (nameText.toUpperCase().indexOf(filter) > -1) {
                        rows[i].style.display = '';
                    } else {
                        rows[i].style.display = 'none';
                    }
                }
            }
        }
    </script>
    <jsp:include page="../template/footer.jsp" />



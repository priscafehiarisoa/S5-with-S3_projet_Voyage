<%--
  Created by IntelliJ IDEA.
  User: Valisoa
  Date: 11/01/2024
  Time: 11:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="project.projetmmebaovola.Model.entity.voyage.ReservationVoyage" %>
<%@ page import="project.projetmmebaovola.Model.entity.client.Client" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<Client> reservationVoyages= (List<Client>) request.getAttribute("client");

%>
<jsp:include page="../template/header.jsp" />

<div class="col-lg-12 grid-margin stretch-card">
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">Liste des Clients </h4>
            <div>
                <%
                if(request.getAttribute("erreur")!=null){
                    out.println(request.getAttribute("erreur"));
                }
                %>
            </div>
            <div class="form-group">
                <div class="search-container">
                    <form id="searchForm">
                        <label for="searchInput">Recherche:</label>
<%--                        <input type="text" id="searchInput" placeholder="Entrez le nom du client" oninput="search()">--%>
<%--                        <input type="submit" name="recherche">--%>
                        <div class="row">
                            <div class=" col-10">
                                <input type="text" id="searchInput" class="form-control p-3" height="50px" oninput="search()" name="recherche" required placeholder="rechercher un voyage particulier ">
                            </div>
                            <div class=" col-2">
                                <button class="btn btn-primary"> <i class="mdi mdi-table-search"></i></button>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="table-responsive">
                    <table border="1" class="table">
                        <tr>

                            <th>id</th>
                            <th>nom du client</th>
                            <th>Age</th>
                            <th>sexe</th>
                            <th>-</th>
                            <th>-</th>
                        </tr>
                        <tbody>

                        <% for (Client client:reservationVoyages) { %>
                        <tr>
                            <td><%=client.getId()%></td>
                            <td><%=client.getNomClient() %></td>
                            <td><%=client.getAge() %></td>
                            <td><%=client.getSexe() %></td>
<%--                            <td><a href="/updateclientPage/<%=client.getId()%>">modifier</a></td>--%>
<%--                            <td><a href="/deleteClient/<%=client.getId()%>">supprimer</a></td>--%>
                            <td><a href="/updateclientPage/<%=client.getId()%>" class="btn btn-dark"><i class="mdi mdi-pen"></i></a></td>
                            <td><a href="/deleteClient/<%=client.getId()%>" class="btn btn-warning"> <i class="mdi mdi-trash-can"></i></a></td>
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
                var nameCell = rows[i].getElementsByTagName('td')[1]; // Changer l'index selon la position de la colonne du nom du client

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

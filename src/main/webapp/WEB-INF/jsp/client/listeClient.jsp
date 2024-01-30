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
            <h4 class="card-title">Reservation </h4>
            <div>
                <%
                if(request.getAttribute("erreur")!=null){
                    out.println(request.getAttribute("erreur"));
                }
                %>
            </div>
            <div class="form-group">
                <form action="${pageContext.request.contextPath}/rechercheReservation" method="post">
                    <label>rechercher des clients  </label>
                    <input type="text" class="form-control " name="rechercheReservation" required>
                    <br>
                </form>
                <input type="submit" name="recherche">

                <div class="table-responsive">
                    <table border="1" class="table">
                        <tr>

                            <th>id</th>
                            <th>nom du client</th>
                            <th>Age</th>
                            <th>sexe</th>
                        </tr>
                        <tbody>

                        <% for (Client client:reservationVoyages) { %>
                        <tr>
                            <td><%=client.getId()%></td>
                            <td><%=client.getNomClient() %></td>
                            <td><%=client.getAge() %></td>
                            <td><%=client.getSexe() %></td>
                            <td><a href="/updateclientPage/<%=client.getId()%>">modifier</a></td>
                            <td><a href="/deleteClient/<%=client.getId()%>">supprimer</a></td>
                        </tr>
                        <% } %>
                        </tbody>
                    </table>

                </div>
            </div>
        </div>
    </div>

    <jsp:include page="../template/footer.jsp" />

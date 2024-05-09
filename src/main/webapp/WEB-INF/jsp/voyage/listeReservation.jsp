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
Created by IntelliJ IDEA.
  User: Valisoa
  Date: 11/01/2024
  Time: 11:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<ReservationVoyage> reservationVoyages= (List<ReservationVoyage>) request.getAttribute("reservation");
    List<ReservationVoyage> reservationVoyagesPaye= (List<ReservationVoyage>) request.getAttribute("reservationPaye");

%>
<jsp:include page="../template/header.jsp" />

<div class="col-lg-12 grid-margin stretch-card">
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">Reservation </h4>
            <div class="form-group">
                <form action="${pageContext.request.contextPath}/rechercheReservation" method="post">
                    <div class="row">
                        <div class=" col-10">
                            <input type="text" id="idEtudiant3" class="form-control p-3" height="50px" name="rechercheReservation" required placeholder="rechercher un voyage particulier ">
                        </div>
                        <div class=" col-2">
                            <button class="btn btn-primary"> <i class="mdi mdi-table-search"></i></button>
                        </div>
                    </div>
                </form>
                <div class="table-responsive mt-5">
                    <table border="1" class="table">
                        <tr>

                            <th>id</th>
                            <th>idVoyage</th>
                            <th>DateDebut</th>
                            <th>DateFin</th>
                            <th>Nombre Reservation</th>
                            <th>Date Reservation</th>
                            <th>client</th>
                            <th></th>
                        </tr>
                        <tbody>

                        <% for (ReservationVoyage reservationVoyage:reservationVoyages) { %>
                        <tr>
                            <td><%=reservationVoyage.getId()%></td>
                            <th><%=reservationVoyage.getVoyage().getId() %></th>
                            <th><%=reservationVoyage.getVoyage().getDateDebutvoyage() %></th>
                            <th><%=reservationVoyage.getVoyage().getDateFinVoyage() %></th>
                            <td><%=reservationVoyage.getNombreRervation()%></td>
                            <td><%=reservationVoyage.getDateReservation()%></td>
                            <td><%=reservationVoyage.getClient().getNomClient()%></td>
                            <td><a href="getPagePayerReservation/<%=reservationVoyage.getId()%>" class="btn btn-success"><i class="mdi mdi-cash mt-3 mx-2"></i> <i class="mb-4">payer</i></a></td>

                        </tr>
                        <% } %>
                        </tbody>
                    </table>

                </div>

                <br>
                <h4 class="card-title mt-5">Reservation payés </h4>

                <div class="table-responsive mt-5">
                    <table border="1" class="table">
                        <tr>

                            <th>id</th>
                            <th>idVoyage</th>
                            <th>DateDebut</th>
                            <th>DateFin</th>
                            <th>Nombre Reservation</th>
                            <th>Date Reservation</th>
                            <th>client</th>
                        </tr>
                        <tbody>

                        <% for (ReservationVoyage reservationVoyage:reservationVoyagesPaye) { %>
                        <tr>
                            <td><%=reservationVoyage.getId()%></td>
                            <th><%=reservationVoyage.getVoyage().getId() %></th>
                            <th><%=reservationVoyage.getVoyage().getDateDebutvoyage() %></th>
                            <th><%=reservationVoyage.getVoyage().getDateFinVoyage() %></th>
                            <td><%=reservationVoyage.getNombreRervation()%></td>
                            <td><%=reservationVoyage.getDateReservation()%></td>
                            <td><%=reservationVoyage.getClient().getNomClient()%></td>

                        </tr>
                        <% } %>
                        </tbody>
                    </table>

                </div>

            </div>
        </div>
    </div>









<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="project.projetmmebaovola.Model.entity.voyage.Voyage" %>
<%--
  Created by IntelliJ IDEA.
  User: falyarivelo
  Date: 10/12/2023
  Time: 22:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<Voyage> voyages= (List<Voyage>) request.getAttribute("voyage");

%>

<jsp:include page="../template/header.jsp" />


<div class="row col-md-12 grid-margin stretch-card shadow-sm " style="background-color: #fff ; border-radius: 12px; margin-left: 2%; width: 97%">
    <div class="col-9 mt-3">
        <h3 class="text-secondary">Voyage</h3>
    </div>
    <div class="col-3 mt-2" style="font-size: 20px">
        <nav aria-label="breadcrumb" >
            <ol class="breadcrumb" style="border:none;">
                <li class="breadcrumb-item"><a href="/" style="font-size: 16px" ><i class="mdi mdi-home"></i></a></li>
                <li class="breadcrumb-item active" aria-current="page" style="font-size: 16px" >Liste</li>
            </ol>
        </nav>
    </div>
</div>

<div class="col-lg-12 grid-margin stretch-card">
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">liste des voyages </h4>

            <%--                description de l'activité --%>
            <form action="${pageContext.request.contextPath}/searchvoyage" method="post">

            <div class="row">
                    <div class=" col-10">
                        <input type="text" id="idEtudiant3" class="form-control p-3" height="50px" name="recherche" required placeholder="rechercher un voyage particulier ">
                    </div>
                    <div class=" col-2">
                        <button class="btn btn-primary"> <i class="mdi mdi-table-search"></i></button>
                    </div>
            </div>
            </form>



            <div class="table-responsive">
            <table border="1" class="table">
                <tr>
                    <th>_</th>
                    <th>date debut de voyage</th>
                    <th>date fin de voyage</th>
                    <th>bouquet</th>
                    <th>type de voyage</th>
                    <th>activités</th>
                    <th>prix Voyage</th>
                    <th>-</th>
                    <th>-</th>
                </tr>
                <tbody>

                <% for (Voyage voyage: voyages) { %>
                <tr>
                    <td><%=voyage.getId()%></td>
                    <td><%=voyage.getDateDebutvoyage()%></td>
                    <td><%=voyage.getDateFinVoyage()%></td>
                    <td>
                        <ul>
                            <li><%=voyage.getBouquets().getNomBouquet()%></li>
                        </ul>
                    </td>
                    <td><%=voyage.getTypeLieu().getDescriptionLieu()%></td>
                    <td>
                        <ul>
                            <%
                                for (int i = 0; i < voyage.getListeActivite().size(); i++) {%>
                            <li><%=voyage.getListeActivite().get(i).getActivite().getNomActivite()%> (<%=(int)voyage.getListeActivite().get(i).getQuantite()%>)</li>
                            <%}%>
                        </ul>
                    </td>
                    <td><%=voyage.getPrixUnitaireVoyage()%></td>
                    <td><a href="/updateVoyage/<%=voyage.getId()%>" class="btn btn-dark"><i class="mdi mdi-pen"></i></a></td>
                    <td><a href="/updateVoyage/<%=voyage.getId()%>" class="btn btn-warning"> <i class="mdi mdi-trash-can"></i></a></td>
                </tr>
                <% } %>
                </tbody>

            </table>

            </div>
        </div>
    </div>
</div>
<jsp:include page="../template/footer.jsp" />


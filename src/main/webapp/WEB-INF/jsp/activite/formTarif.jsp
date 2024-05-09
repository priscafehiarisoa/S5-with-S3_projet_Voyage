<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="project.projetmmebaovola.Model.entity.voyage.Voyage" %><%--
  Created by IntelliJ IDEA.
  User: Valisoa
  Date: 09/01/2024
  Time: 11:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../template/header.jsp" />
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% List<HashMap<String,Object>> listVoyage=new ArrayList<>();
if (request.getAttribute("tarifVoyage")!=null){
    listVoyage= (List<HashMap<String, Object>>) request.getAttribute("tarifVoyage");
}%>


<div class="row col-md-12 grid-margin stretch-card shadow-sm " style="background-color: #fff ; border-radius: 12px; margin-left: 2%; width: 97%">
    <div class="col-9 mt-3">
        <h3 class="text-secondary">Voyage</h3>
    </div>
    <div class="col-3 mt-2" style="font-size: 20px">
        <nav aria-label="breadcrumb" >
            <ol class="breadcrumb" style="border:none;">
                <li class="breadcrumb-item"><a href="/" style="font-size: 16px" ><i class="mdi mdi-home"></i></a></li>
                <li class="breadcrumb-item active" aria-current="page" style="font-size: 16px">tarif avtivite</li>
            </ol>
        </nav>
    </div>
</div>

<div class="col-lg-12 grid-margin stretch-card">
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">Recherche de voyages en fonction d'une plage de prix d'activites </h4>
            <div class="form-group">
                <form action="VoyageTarif"  method="post">

                    <div class="row">
                        <div class="col-5">
                            <label >debut </label>
                            <input type="number"  class="form-control " name="debut" required>
                        </div>
                        <div class="col-5">
                            <label> fin</label>
                            <input type="number" class="form-control"  name="fin" required>
                        </div>
                        <div class="col-2 mt-3">
                            <button type="submit" class="btn btn-primary me-2">Valider</button>
                        </div>
                    </div>
                </form>
            </div>

            <div class="table-responsive">
                <table border="1" class="table">
                    <tr>
                        <th>_</th>
                        <th>date debut de voyage</th>
                        <th>date fin de voyage</th>
                        <th>bouquet</th>
                        <th>type de voyage</th>
                        <th>activités</th>
                        <th> Tarif</th>
                    </tr>

                    <%
                        if(request.getAttribute("tarifVoyage")!=null){
                        for (HashMap<String,Object> voyage:listVoyage) { %>
                    <tr>
                        <td><%=((Voyage)voyage.get("voyage")).getId()%></td>
                        <td><%=((Voyage)voyage.get("voyage")).getDateDebutvoyage()%></td>
                        <td><%=((Voyage)voyage.get("voyage")).getDateFinVoyage()%></td>
                        <td>
                            <ul>
                                <li><%=((Voyage)voyage.get("voyage")).getBouquets().getNomBouquet()%></li>
                            </ul>
                        </td>
                        <td><%=((Voyage)voyage.get("voyage")).getTypeLieu().getDescriptionLieu()%></td>
                        <td>
                            <ul>
                                <%
                                    for (int i = 0; i < ((Voyage)voyage.get("voyage")).getListeActivite().size(); i++) {%>
                                <li><%=((Voyage)voyage.get("voyage")).getListeActivite().get(i).getActivite().getNomActivite()%>(<%=(int)((Voyage)voyage.get("voyage")).getListeActivite().get(i).getQuantite()%>)(prix: <%=((Voyage)voyage.get("voyage")).getListeActivite().get(i).getActivite().getTarif()%> ar)</li>
                                <%}%>
                            </ul>
                        </td>
                        <td>
                            <%=voyage.get("tarif")%>
                        </td>
                    </tr>
                    <% }
                        } %>
                    </tbody>

                </table>
        </div>
    </div>
</div>



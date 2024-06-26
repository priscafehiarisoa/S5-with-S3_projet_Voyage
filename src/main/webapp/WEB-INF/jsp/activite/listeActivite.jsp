

<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="project.projetmmebaovola.Model.entity.voyage.Voyage" %>
<%@ page import="project.projetmmebaovola.Model.entity.bouquet.Bouquets" %>
<%@ page import="project.projetmmebaovola.Model.entity.activite.Activite" %>
<%--
  Created by IntelliJ IDEA.
  User: falyarivelo
  Date: 10/12/2023
  Time: 22:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  List<Activite> activites= (List<Activite>) request.getAttribute("activite");

%>

<jsp:include page="../template/header.jsp" />

<div class="col-lg-12 grid-margin stretch-card">
  <div class="card">
    <div class="card-body">
      <h4 class="card-title">liste des Activites </h4>
      <div class="form-group">
        <form action="${pageContext.request.contextPath}/rechercheActivite" method="get">
          <label for="idEtudiant3">recherche </label>
          <input type="text" id="idEtudiant3" class="form-control " name="recherche" required> </input>
          <br>
        </form>

      </div>
      <div class="table-responsive">
        <table border="1" class="table">
          <tr>
            <th>_</th>
            <th>Nom de l'activité</th>
            <th>description </th>
            <th> tarif </th>
            <th>catégories d'activité</th>
            <th>-</th>
            <th>-</th>

          </tr>
          <tbody>

          <% for (Activite activite1: activites) { %>
          <tr>
            <td><%=activite1.getId()%></td>
            <td><%=activite1.getNomActivite()%></td>
            <td><%=activite1.getDescription()%></td>
            <td><%=activite1.getTarif()%></td>
            <td>
              <ul>
                <%
                  for (int i = 0; i < activite1.getListeCategorieActivite().size(); i++) {%>
                <li><%=activite1.getListeCategorieActivite().get(i).getNomCAtegorie()%></li>
                <%}%>
              </ul>
            </td>
            <td><a href="/getUpdateActivitepage/<%=activite1.getId()%>" class="btn btn-dark"><i class="mdi mdi-pen"></i></a></td>
            <td><a  href="/deleteActivite/<%=activite1.getId()%>" class="btn btn-warning"> <i class="mdi mdi-trash-can"></i></a></td>

          </tr>
          <% } %>
          </tbody>

        </table>

      </div>
    </div>
  </div>
</div>

<jsp:include page="../template/footer.jsp" />


<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="project.projetmmebaovola.Model.entity.client.Client" %><%--
  Created by IntelliJ IDEA.
  User: Valisoa
  Date: 25/01/2024
  Time: 13:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% List<Client> Client=new ArrayList<>();
    if(request.getAttribute("Client")!=null){
        Client=(List<Client>) request.getAttribute("client");
    }
%>
<jsp:include page="../template/header.jsp" />
<div class="col-lg-12 grid-margin stretch-card">
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">Client </h4>
            <div>
                <%
                    if (request.getAttribute("erreur")!=null){%>
                  <p> <%= request.getAttribute("erreur") %></p>
                <%}%>
            </div>
            <div class="form-group">
                <form class="forms-sample" action="${pageContext.request.contextPath}/client" method="post">
                    <div class="form-group">
                        <label>Nom</label>
                        <input type="text" class="form-control " name="nomClient" required>
                    </div>
                    <div class="form-group">
                        <label>date de Naissance</label>
                        <input type="date" class="form-control " name="dateNaissance" required>
                    </div>
                    <div class="form-group">
                        <label>Sexe</label>
                        <select class="form-control " name="sexe">
                            <option value="homme">homme</option>
                            <option value="femme">femme</option>
                        </select>
                    </div>
                    <div>
                        <button type="submit" class="btn btn-primary me-2">Valider</button>
                    </div>
                </form>

            </div>
        </div>
    </div>

    <jsp:include page="../template/footer.jsp" />

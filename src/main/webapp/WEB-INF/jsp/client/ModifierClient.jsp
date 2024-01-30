<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="project.projetmmebaovola.Model.entity.client.Client" %>
<%@ page import="java.util.Objects" %><%--
  Created by IntelliJ IDEA.
  User: Valisoa
  Date: 25/01/2024
  Time: 13:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../template/header.jsp" />
<%
    Client client= new Client();
    if( request.getAttribute("client")!=null){
        client= (Client) request.getAttribute("client");
    }

%>
<div class="col-lg-12 grid-margin stretch-card">
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">Modifier Client </h4>
            <div class="form-group">
                <form class="forms-sample" action="${pageContext.request.contextPath}/updateClient" method="post">
                    <div class="form-group">
                        <label>Nom</label>
                        <input type="text" class="form-control " name="nomClient" value="<%=client.getNomClient()%>" required>
                        <input type="hidden" class="form-control " name="id" value="<%=client.getId()%>" required>
                        <input type="hidden" class="form-control " name="etat" value="<%=client.getEtat()%>" required>
                    </div>
                    <div class="form-group">
                        <label>date de Naissance</label>
                        <input type="date" class="form-control " name="dateNaissance" value="<%=client.getDateNaissance()%>" required>
                    </div>

                    <label> genre : </label>

                    <div class="mx-5">
                        <div class="form-check col-5">
                            <input type="checkbox" class="form-check-input d-inline-flex "
                                <%
                            if(Objects.equals(client.getSexe(), "femme")){
                                out.print("checked");
                            }
                            %>
                                   id="femme" name="sexe" value="femme">
                            <label class="form-check-label" for="femme">femme</label>
                        </div>
                        <div class="form-check col-5">
                            <input type="checkbox" class="form-check-input d-inline-flex " id="homme" name="sexe" value="homme"
                                <%
                            if(client.getSexe()=="homme"){
                                out.print("checked");
                            }
                            %>
                            >
                            <label class="form-check-label" for="femme">homme</label>
                        </div>
                    </div>

                    <div>
                        <button type="submit" class="btn btn-primary me-2">Valider</button>
                    </div>
                </form>

            </div>
        </div>
    </div>

    <jsp:include page="../template/footer.jsp" />

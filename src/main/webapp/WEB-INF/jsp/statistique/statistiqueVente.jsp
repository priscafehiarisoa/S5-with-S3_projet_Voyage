<%@ page import="project.projetmmebaovola.Model.entity.Stat" %>
<%@ page import="project.projetmmebaovola.Model.entity.voyage.Voyage" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.google.gson.Gson" %>
<jsp:include page="../template/header.jsp" />
<%--get datas --%>

<%
    Stat stat= new Stat();
    if(request.getAttribute("stat")!=null){
        stat= (Stat) request.getAttribute("stat");
    }
    List<Voyage> voyageList= new ArrayList<>();
    if(request.getAttribute("voyage")!=null){
        voyageList= (List<Voyage>) request.getAttribute("voyage");
    }
%>
<div class="col-md-12 grid-margin stretch-card">

    <div class="card">
        <div class="card-body">
            <h4>Statistiques des genres pour le voyage du : <%=stat.getVoyage().getDateDebutvoyage()%> au <%=stat.getVoyage().getDateFinVoyage()%> </h4>
            <br>
            <div class="my-5">
                <h5>selectionner un voyage </h5>

                <form action="/getStatVoyage" method="post">
                    <div class="form-group">
                        <select name="id" id="" class="form-control">
                            <%
                                for (int i = 0; i < voyageList.size(); i++) {%>
                            <option value=<%=voyageList.get(i).getId()%>><%=voyageList.get(i).getId()%> | <%=voyageList.get(i).getDateDebutvoyage()%> | <%=voyageList.get(i).getDateDebutvoyage()%></option>
                            <% }
                            %>
                        </select>
                    </div>
                    <div>
                        <button type="submit" class="btn btn-primary me-2">Valider</button>
                    </div>
                </form>
            </div>
            <div class="my-5">
                <div>
                    <h4>tableau des statistiques</h4>
                </div>

                <div class="table-responsive">
                    <table border="1" class="table">
                        <tr>
                            <th>statistiques</th>
                            <th>nombre</th>

                        </tr>
                        <tbody>

                        <%
                            int total=0;
                            for (int i = 0; i < stat.getSexe().size(); i++)
                            {
                                total+=stat.getNombre().get(i);
                        %>
                        <tr>
                            <td><%=stat.getSexe().get(i)%></td>
                            <td><%=stat.getNombre().get(i)%></td>
                        </tr>
                        <% } %>
                        <tr>
                            <td>total</td>
                            <td><%=total%></td>

                        </tr>
                        </tbody>

                    </table>

                </div>
            </div>
            <div>
                <h4>graphes</h4>
            </div>
            <div style="width: 30%">
                <canvas id="myChart"></canvas>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    const ctx = document.getElementById('myChart');
    var labels = <%= new Gson().toJson(stat.getSexe()) %>;
    var datas = <%= new Gson().toJson(stat.getNombre()) %>;

    new Chart(ctx, {
        type: 'doughnut',
        data: {
            labels: labels,
            datasets: [{
                label: 'nombre de voyages achetés par des femmes',
                data: datas,
                borderWidth: 1,
                backgroundColor: ['pink', 'brown']
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
</script>
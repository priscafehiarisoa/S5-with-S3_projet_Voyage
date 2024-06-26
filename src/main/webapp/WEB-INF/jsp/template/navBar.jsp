<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="container-fluid page-body-wrapper">

  <nav class="sidebar sidebar-offcanvas" id="sidebar">
    <ul class="nav">
      <li class="nav-item">
        <a class="nav-link" href="">
          <i class="mdi mdi-grid-large menu-icon"></i>
          <span class="menu-title">Dashboard</span>
        </a>
      </li>

      <li class="nav-item nav-category">Voyage</li>
      <li class="nav-item">
        <a class="nav-link" data-bs-toggle="collapse" href="#Voyage" aria-expanded="false"
           aria-controls="Voyage">
          <i class="menu-icon mdi mdi-earth"></i>
          <span class="menu-title">Voyage</span>
          <i class="menu-arrow"></i>
        </a>
        <div class="collapse" id="Voyage">
          <ul class="nav flex-column sub-menu">
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/formVoyage">ajouter</a></li>
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/listVoyage">liste</a></li>
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/getTarif">tarif voyage</a></li>
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/getFormReservationVoyage">reservation</a></li>
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/getListeReservation">liste reservation</a></li>
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/getBenefice">benefices</a></li>
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/typeMO">Ajout type MO</a></li>
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/formOuvrierVoyages">Ajout voyage MO</a></li>
          </ul>
        </div>
      </li>

      <li class="nav-item nav-category">Bouquets</li>
      <li class="nav-item">
        <a class="nav-link" data-bs-toggle="collapse" href="#note" aria-expanded="false"
           aria-controls="note">
          <i class="menu-icon mdi mdi-map-check-outline"></i>
          <span class="menu-title">Bouquets</span>
          <i class="menu-arrow"></i>
        </a>
        <div class="collapse" id="note">
          <ul class="nav flex-column sub-menu">
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/formBouquet">ajouter</a></li>
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/listBouquet">liste</a></li>
          </ul>
        </div>
      </li>

      <li class="nav-item nav-category">Personnel</li>
      <li class="nav-item">
        <a class="nav-link" data-bs-toggle="collapse" href="#personnel" aria-expanded="false"
           aria-controls="personnel">
          <i class="menu-icon mdi mdi-account"></i>
          <span class="menu-title">Personnel</span>
          <i class="menu-arrow"></i>
        </a>
        <div class="collapse" id="personnel">
          <ul class="nav flex-column sub-menu">
            <li class="nav-item"><a class="nav-link" href="/formAjoutPersonnel">ajouter personnel</a></li>
            <li class="nav-item"><a class="nav-link" href="/listePersonnel">liste</a></li>
            <li class="nav-item"><a class="nav-link" href="/listFonction">liste fonctions</a></li>
          </ul>
        </div>
      </li>

      <li class="nav-item nav-category">Activités</li>
      <li class="nav-item">
        <a class="nav-link" data-bs-toggle="collapse" href="#activite" aria-expanded="false"
           aria-controls="activite">
          <i class="menu-icon mdi mdi-gamepad"></i>
          <span class="menu-title">Activités</span>
          <i class="menu-arrow"></i>
        </a>
        <div class="collapse" id="activite">
          <ul class="nav flex-column sub-menu">
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/formActivite">ajouter</a></li>
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/listActivite">liste</a></li>
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/getFormStockActivite">ajout stock</a></li>
            <li class="nav-item"><a class="nav-link" href="/getResteStock">stock Activite</a></li>

          </ul>
        </div>
      </li>

      <li class="nav-item nav-category">Client</li>
      <li class="nav-item">
        <a class="nav-link" data-bs-toggle="collapse" href="#client" aria-expanded="false"
           aria-controls="client">
          <i class="menu-icon mdi mdi-emoticon-happy"></i>
          <span class="menu-title">Client</span>
          <i class="menu-arrow"></i>
        </a>
        <div class="collapse" id="client">
          <ul class="nav flex-column sub-menu">
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/formClient">ajouter</a></li>
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/clients">liste</a></li>
          </ul>
        </div>
      </li>

      <li class="nav-item nav-category">Statistique</li>
      <li class="nav-item">
        <a class="nav-link" data-bs-toggle="collapse" href="#statistique" aria-expanded="false"
           aria-controls="statistique">
          <i class="menu-icon mdi mdi-settings"></i>
          <span class="menu-title">Statistique</span>
          <i class="menu-arrow"></i>
        </a>
        <div class="collapse" id="statistique">
          <ul class="nav flex-column sub-menu">
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/getStatistique">statistique</a></li>
          </ul>
        </div>
      </li>
    </ul>
  </nav>


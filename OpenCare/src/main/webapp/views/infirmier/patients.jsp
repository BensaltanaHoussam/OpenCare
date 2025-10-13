<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
  <meta charset="UTF-8"/>
  <title>Patients du jour</title>
  <style>
    body{font-family:Arial;margin:24px}
    table{border-collapse:collapse;width:100%}
    th,td{border:1px solid #ddd;padding:8px;text-align:left}
    th{background:#f5f5f5}
    .ok{color:#0a7f2e;margin-bottom:12px}
  </style>
</head>
<body>
<h2>Patients en attente aujourd’hui</h2>

<c:if test="${param.added == '1'}">
  <div class="ok">Patient ajouté à la file d’attente.</div>
</c:if>

<table>
  <thead>
    <tr>
      <th>Arrivée</th>
      <th>Nom</th>
      <th>Prénom</th>
      <th>N° sécu</th>
      <th>Statut</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach var="fa" items="${fileAttente}">
    <tr>
      <td>${fa.arriveAt}</td>
      <td>${fa.patient.nom}</td>
      <td>${fa.patient.prenom}</td>
      <td>${fa.patient.numeroSecuriteSociale}</td>
      <td>${fa.statut}</td>
    </tr>
  </c:forEach>
  <c:if test="${empty fileAttente}">
    <tr><td colspan="5" style="color:#666">Aucun patient en attente pour le moment.</td></tr>
  </c:if>
  </tbody>
</table>

<div style="margin-top:12px;">
  <a href="${pageContext.request.contextPath}/infirmier/accueil">Retour à l’accueil infirmier</a>
</div>
</body>
</html>
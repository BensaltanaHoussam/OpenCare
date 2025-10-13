<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
  <meta charset="UTF-8"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/tailwind.generated.css"/>
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

<form method="get" action="${pageContext.request.contextPath}/infirmier/patients" style="margin-bottom:12px;">
  <label for="date">Date</label>
  <input type="date" id="date" name="date" value="${empty date ? '' : date}"/>
  <button type="submit">Filtrer</button>
</form>

<table>
  <thead>
  <tr>
    <th>Arrivée</th>
    <th>Nom</th>
    <th>Prénom</th>
    <th>N° sécu</th>
    <th>TA</th>
    <th>FC</th>
    <th>T°</th>
    <th>SpO2</th>
    <th>Poids</th>
    <th>Taille</th>
    <th>IMC</th>
    <th>Statut</th>
  </tr>
  </thead>
  <tbody>
  <c:forEach var="fa" items="${fileAttente}">
    <tr>
      <td><c:out value="${fa.arriveAt}"/></td>
      <td><c:out value="${fa.patient.nom}"/></td>
      <td><c:out value="${fa.patient.prenom}"/></td>
      <td><c:out value="${fa.patient.numeroSecuriteSociale}"/></td>
      <td><c:out value="${fa.signesVitaux.taSys}"/>/<c:out value="${fa.signesVitaux.taDia}"/></td>
      <td><c:out value="${fa.signesVitaux.frequenceCardiaque}"/></td>
      <td><c:out value="${fa.signesVitaux.temperatureC}"/></td>
      <td><c:out value="${fa.signesVitaux.spo2}"/></td>
      <td><c:out value="${fa.signesVitaux.poidsKg}"/></td>
      <td><c:out value="${fa.signesVitaux.tailleCm}"/></td>
      <td><c:out value="${fa.signesVitaux.imc}"/></td>
      <td><c:out value="${fa.statut}"/></td>
    </tr>
  </c:forEach>
  <c:if test="${empty fileAttente}">
    <tr><td colspan="12" style="color:#666">Aucun patient pour cette date.</td></tr>
  </c:if>
  </tbody>
</table>

<div style="margin-top:12px;">
  <a href="${pageContext.request.contextPath}/infirmier/accueil">Retour à l’accueil infirmier</a>
</div>
</body>
</html>
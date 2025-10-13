<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
  <meta charset="UTF-8"/>
  <title>Accueil infirmier</title>
  <style>
    body{font-family:Arial;margin:24px}
    .row{display:flex;gap:12px;margin-bottom:8px}
    .row label{width:180px}
    input[type=text], input[type=date]{padding:6px;min-width:260px}
    .error{color:#b00020;margin:8px 0}
    .actions{margin-top:12px}
  </style>
</head>
<body>
<h2>Accueil infirmier</h2>

<c:if test="${not empty error}">
  <div class="error">${error}</div>
</c:if>

<form method="post" action="${pageContext.request.contextPath}/infirmier/accueil">
  <fieldset>
    <legend>Identification du patient</legend>

    <div class="row">
      <label for="nss">N° sécurité sociale</label>
      <input type="text" id="nss" name="nss" value="${param.nss}"/>
    </div>

    <div style="margin:6px 0;color:#666">— ou bien —</div>

    <div class="row">
      <label for="nom">Nom</label>
      <input type="text" id="nom" name="nom" value="${param.nom}"/>
    </div>
    <div class="row">
      <label for="prenom">Prénom</label>
      <input type="text" id="prenom" name="prenom" value="${param.prenom}"/>
    </div>
    <div class="row">
      <label for="dateNaissance">Date de naissance</label>
      <input type="date" id="dateNaissance" name="dateNaissance" value="${param.dateNaissance}"/>
    </div>
  </fieldset>

  <fieldset style="margin-top:12px;">
    <legend>Coordonnées (optionnel si patient existant)</legend>
    <div class="row">
      <label for="telephone">Téléphone</label>
      <input type="text" id="telephone" name="telephone" value="${param.telephone}"/>
    </div>
    <div class="row">
      <label for="adresse">Adresse</label>
      <input type="text" id="adresse" name="adresse" value="${param.adresse}"/>
    </div>
  </fieldset>

  <div class="actions">
    <button type="submit">Enregistrer et ajouter à la file</button>
    <a href="${pageContext.request.contextPath}/infirmier/patients" style="margin-left:12px;">Voir la file du jour</a>
  </div>
</form>
</body>
</html>
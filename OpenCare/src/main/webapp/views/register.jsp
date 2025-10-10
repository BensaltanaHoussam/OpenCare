<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
  <title>Création d’un utilisateur</title>
  <meta charset="UTF-8"/>
  <style>
    body { font-family: Arial, sans-serif; margin: 32px; }
    .box { max-width: 520px; padding: 20px; border: 1px solid #ddd; border-radius: 8px; }
    .row { margin-bottom: 12px; }
    label { display: block; margin-bottom: 4px; }
    input[type=text], input[type=password], input[type=email], select { width: 100%; padding: 8px; box-sizing: border-box; }
    .error { color: #b00020; margin-bottom: 12px; }
    .success { color: #0a7f2e; margin-bottom: 12px; }
    .hint { font-size: 0.9em; color: #555; margin-bottom: 12px; }
    .actions { display: flex; gap: 8px; align-items: center; }
  </style>
</head>
<body>
  <h2>
    <c:choose>
      <c:when test="${noUserYet}">Initialisation \- premier compte ADMIN</c:when>
      <c:otherwise>Créer un utilisateur</c:otherwise>
    </c:choose>
  </h2>

  <div class="box">
    <c:if test="${not empty error}">
      <div class="error">${error}</div>
    </c:if>
    <c:if test="${not empty success}">
      <div class="success">${success}</div>
    </c:if>

    <c:if test="${noUserYet}">
      <div class="hint">Le premier utilisateur sera automatiquement créé avec le rôle `ADMIN`.</div>
    </c:if>

    <form method="post" action="${pageContext.request.contextPath}/register-user">
      <input type="hidden" name="csrfToken" value="${csrfToken}" />
      <div class="row">
        <label for="username">Nom d’utilisateur</label>
        <input id="username" name="username" type="text" required />
      </div>
      <div class="row">
        <label for="fullName">Nom complet</label>
        <input id="fullName" name="fullName" type="text" />
      </div>
      <div class="row">
        <label for="email">Email</label>
        <input id="email" name="email" type="email" />
      </div>
      <div class="row">
        <label for="password">Mot de passe</label>
        <input id="password" name="password" type="password" required />
      </div>

      <c:choose>
        <c:when test="${noUserYet}">
          <input type="hidden" name="role" value="ADMIN" />
        </c:when>
        <c:otherwise>
          <div class="row">
            <label for="role">Rôle</label>
            <select id="role" name="role" required>
              <option value="" disabled selected>Choisir un rôle</option>
              <option value="ADMIN">ADMIN</option>
              <option value="INFIRMIER">INFIRMIER</option>
              <option value="GENERALISTE">GENERALISTE</option>
              <option value="SPECIALISTE">SPECIALISTE</option>
            </select>
          </div>
        </c:otherwise>
      </c:choose>

      <div class="actions">
        <button type="submit">
          <c:choose>
            <c:when test="${noUserYet}">Créer l’ADMIN</c:when>
            <c:otherwise>Créer l’utilisateur</c:otherwise>
          </c:choose>
        </button>
        <a class="link" href="${pageContext.request.contextPath}/login">Retour à la connexion</a>
      </div>
    </form>
  </div>
</body>
</html>
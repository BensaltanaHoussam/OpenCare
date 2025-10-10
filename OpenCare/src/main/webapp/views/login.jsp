<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
  <title>Connexion</title>
  <meta charset="UTF-8"/>
  <style>
    body { font-family: Arial, sans-serif; margin: 32px; }
    .box { max-width: 420px; padding: 20px; border: 1px solid #ddd; border-radius: 8px; }
    .row { margin-bottom: 12px; }
    label { display: block; margin-bottom: 4px; }
    input[type=text], input[type=password], input[type=email], select { width: 100%; padding: 8px; box-sizing: border-box; }
    .error { color: #b00020; margin-bottom: 12px; }
    .actions { display: flex; gap: 8px; align-items: center; }
    .link { font-size: 0.9em; }
  </style>
</head>
<body>
  <h2>Connexion</h2>

  <div class="box">
    <c:if test="${not empty error}">
      <div class="error">${error}</div>
    </c:if>

    <form method="post" action="${pageContext.request.contextPath}/login">
      <input type="hidden" name="csrfToken" value="${csrfToken}" />
      <div class="row">
        <label for="username">Nom d’utilisateur</label>
        <input id="username" name="username" type="text" required />
      </div>
      <div class="row">
        <label for="password">Mot de passe</label>
        <input id="password" name="password" type="password" required />
      </div>
      <div class="actions">
        <button type="submit">Se connecter</button>
        <a class="link" href="${pageContext.request.contextPath}/register-user">Créer un compte</a>
      </div>
    </form>
  </div>
</body>
</html>



<!-- html -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Inscription - OpenCare</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="min-h-screen flex items-center justify-center" style="background-image: url('${pageContext.request.contextPath}/assets/img/'); background-size: cover; background-position: center;">
  <div class="w-[550px] rounded-2xl p-8 lg:p-12 bg-white shadow-sm">
    <!-- Logo -->
    <div class="mb-8 text-center">
      <img src="${pageContext.request.contextPath}/assets/img/logoCare.png" alt="OpenCare" class="h-12 w-auto mx-auto" />
    </div>

    <!-- Titre + lien -->
    <div class="mb-4 text-center">
      <h1 class="text-2xl font-serif font-light text-gray-900 mb-2">
        <c:choose>
          <c:when test="${noUserYet}">Initialisation \- premier compte ADMIN</c:when>
          <c:otherwise>Créer un compte</c:otherwise>
        </c:choose>
      </h1>
      <p class="text-gray-600">
        Vous avez déjà un compte ?
        <a href="${pageContext.request.contextPath}/login" class="text-red-600 hover:text-red-700 font-medium transition-colors underline decoration-red-600/30 hover:decoration-red-700">
          Connectez\-vous
        </a>
      </p>
    </div>

    <!-- Messages -->
    <c:if test="${not empty error}">
      <div class="mb-6 p-4 bg-red-50 border-l-4 border-red-600 rounded-r">
        <p class="text-red-800 text-sm font-medium">${error}</p>
      </div>
    </c:if>
    <c:if test="${not empty success}">
      <div class="mb-6 p-4 bg-green-50 border-l-4 border-green-600 rounded-r">
        <p class="text-green-800 text-sm font-medium">${success}</p>
      </div>
    </c:if>
    <c:if test="${noUserYet}">
      <div class="mb-6 p-3 rounded-md bg-gray-50 text-gray-700 text-sm">
        Le premier utilisateur sera automatiquement créé avec le rôle <strong>ADMIN</strong>.
      </div>
    </c:if>

    <!-- Formulaire -->
    <form method="post" action="${pageContext.request.contextPath}/register-user" class="space-y-6">
      <input type="hidden" name="csrfToken" value="${csrfToken}" />

      <!-- Nom d’utilisateur -->
      <div>
        <label for="username" class="block text-sm font-medium text-gray-800 mb-2.5">Nom d’utilisateur</label>
        <div class="relative">
          <span class="absolute inset-y-0 left-0 flex items-center pl-4 text-gray-400">
            <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M5.121 17.804A7 7 0 0112 15a7 7 0 016.879 2.804M15 10a3 3 0 11-6 0 3 3 0 016 0z"/>
            </svg>
          </span>
          <input id="username" name="username" type="text" required placeholder="Entrez le nom d’utilisateur"
                 class="w-full pl-12 pr-4 py-3.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-red-600 focus:border-red-600 transition-all outline-none bg-white text-gray-900 placeholder:text-gray-400"/>
        </div>
      </div>

      <!-- Nom complet -->
      <div>
        <label for="fullName" class="block text-sm font-medium text-gray-800 mb-2.5">Nom complet</label>
        <div class="relative">
          <span class="absolute inset-y-0 left-0 flex items-center pl-4 text-gray-400">
            <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"/>
            </svg>
          </span>
          <input id="fullName" name="fullName" type="text" placeholder="Entrez le nom complet"
                 class="w-full pl-12 pr-4 py-3.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-red-600 focus:border-red-600 transition-all outline-none bg-white text-gray-900 placeholder:text-gray-400"/>
        </div>
      </div>

      <!-- Email -->
      <div>
        <label for="email" class="block text-sm font-medium text-gray-800 mb-2.5">Email</label>
        <div class="relative">
          <span class="absolute inset-y-0 left-0 flex items-center pl-4 text-gray-400">
            <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z"/>
            </svg>
          </span>
          <input id="email" name="email" type="email" placeholder="Entrez l’email"
                 class="w-full pl-12 pr-4 py-3.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-red-600 focus:border-red-600 transition-all outline-none bg-white text-gray-900 placeholder:text-gray-400"/>
        </div>
      </div>

      <!-- Mot de passe -->
      <div>
        <label for="password" class="block text-sm font-medium text-gray-800 mb-2.5">Mot de passe</label>
        <div class="relative">
          <span class="absolute inset-y-0 left-0 flex items-center pl-4 text-gray-400">
            <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z"/>
            </svg>
          </span>
          <input id="password" name="password" type="password" required placeholder="Entrez le mot de passe"
                 class="w-full pl-12 pr-4 py-3.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-red-600 focus:border-red-600 transition-all outline-none bg-white text-gray-900 placeholder:text-gray-400"/>
        </div>
      </div>

      <!-- Rôle -->
      <c:choose>
        <c:when test="${noUserYet}">
          <input type="hidden" name="role" value="ADMIN" />
        </c:when>
        <c:otherwise>
          <div>
            <label for="role" class="block text-sm font-medium text-gray-800 mb-2.5">Rôle</label>
            <select id="role" name="role" required
                    class="w-full pr-10 py-3.5 px-4 border border-gray-300 rounded-lg focus:ring-2 focus:ring-red-600 focus:border-red-600 bg-white text-gray-900">
              <option value="" disabled selected>Choisir un rôle</option>
              <option value="ADMIN">ADMIN</option>
              <option value="INFIRMIER">INFIRMIER</option>
              <option value="GENERALISTE">GENERALISTE</option>
              <option value="SPECIALISTE">SPECIALISTE</option>
            </select>
          </div>
        </c:otherwise>
      </c:choose>

      <!-- Actions -->
      <button type="submit"
              class="w-full bg-red-600 text-white py-3.5 rounded-lg font-medium hover:bg-red-700 active:bg-red-800 transition-all duration-200 shadow-sm hover:shadow-md">
        <c:choose>
          <c:when test="${noUserYet}">Créer l’ADMIN</c:when>
          <c:otherwise>Créer l’utilisateur</c:otherwise>
        </c:choose>
      </button>
    </form>
  </div>
</body>
</html>

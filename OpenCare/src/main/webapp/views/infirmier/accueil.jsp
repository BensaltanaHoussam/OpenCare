<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html lang="fr">
<head>
  <meta charset="UTF-8"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/tailwind.generated.css"/>
  <title>Accueil infirmier</title>
</head>
<body class="min-h-screen bg-gray-50 text-gray-900">
  <main class="max-w-4xl mx-auto p-6">
    <h1 class="text-2xl font-semibold mb-6">Accueil infirmier</h1>

    <c:if test="${not empty error}">
      <div class="mb-4 rounded-md border border-red-200 bg-red-50 text-red-700 px-4 py-3">
        ${error}
      </div>
    </c:if>

    <form method="post" action="${pageContext.request.contextPath}/infirmier/accueil" class="space-y-6">
      <fieldset class="bg-white rounded-lg shadow p-6">
        <legend class="text-lg font-medium text-gray-800">Identification du patient</legend>

        <div class="mt-4 grid grid-cols-1 sm:grid-cols-3 sm:gap-4">
          <label for="nss" class="block text-sm font-medium text-gray-700 self-center">N° sécurité sociale</label>
          <div class="sm:col-span-2">
            <input type="text" id="nss" name="nss" value="${param.nss}"
                   class="block w-full rounded-md border border-gray-300 px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"/>
          </div>
        </div>

        <div class="my-3 text-center text-sm text-gray-500">— ou bien —</div>

        <div class="grid grid-cols-1 sm:grid-cols-3 sm:gap-4">
          <label for="nom" class="block text-sm font-medium text-gray-700 self-center">Nom</label>
          <div class="sm:col-span-2">
            <input type="text" id="nom" name="nom" value="${param.nom}"
                   class="block w-full rounded-md border border-gray-300 px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"/>
          </div>
        </div>

        <div class="mt-3 grid grid-cols-1 sm:grid-cols-3 sm:gap-4">
          <label for="prenom" class="block text-sm font-medium text-gray-700 self-center">Prénom</label>
          <div class="sm:col-span-2">
            <input type="text" id="prenom" name="prenom" value="${param.prenom}"
                   class="block w-full rounded-md border border-gray-300 px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"/>
          </div>
        </div>

        <div class="mt-3 grid grid-cols-1 sm:grid-cols-3 sm:gap-4">
          <label for="dateNaissance" class="block text-sm font-medium text-gray-700 self-center">Date de naissance</label>
          <div class="sm:col-span-2">
            <input type="date" id="dateNaissance" name="dateNaissance" value="${param.dateNaissance}"
                   class="block w-full rounded-md border border-gray-300 px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"/>
          </div>
        </div>
      </fieldset>

      <fieldset class="bg-white rounded-lg shadow p-6">
        <legend class="text-lg font-medium text-gray-800">Coordonnées \(`optionnel si patient existant`\)</legend>

        <div class="mt-4 grid grid-cols-1 sm:grid-cols-3 sm:gap-4">
          <label for="telephone" class="block text-sm font-medium text-gray-700 self-center">Téléphone</label>
          <div class="sm:col-span-2">
            <input type="text" id="telephone" name="telephone" value="${param.telephone}"
                   class="block w-full rounded-md border border-gray-300 px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"/>
          </div>
        </div>

        <div class="mt-3 grid grid-cols-1 sm:grid-cols-3 sm:gap-4">
          <label for="adresse" class="block text-sm font-medium text-gray-700 self-center">Adresse</label>
          <div class="sm:col-span-2">
            <input type="text" id="adresse" name="adresse" value="${param.adresse}"
                   class="block w-full rounded-md border border-gray-300 px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"/>
          </div>
        </div>
      </fieldset>

      <fieldset class="bg-white rounded-lg shadow p-6">
        <legend class="text-lg font-medium text-gray-800">Signes vitaux</legend>

        <div class="mt-4 grid grid-cols-1 sm:grid-cols-2 gap-4">
          <div>
            <label for="taSys" class="block text-sm font-medium text-gray-700">TA systolique \(\*mmHg\*\)</label>
            <input type="text" id="taSys" name="taSys" value="${param.taSys}"
                   class="mt-1 block w-full rounded-md border border-gray-300 px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"/>
          </div>
          <div>
            <label for="taDia" class="block text-sm font-medium text-gray-700">TA diastolique \(\*mmHg\*\)</label>
            <input type="text" id="taDia" name="taDia" value="${param.taDia}"
                   class="mt-1 block w-full rounded-md border border-gray-300 px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"/>
          </div>
          <div>
            <label for="fc" class="block text-sm font-medium text-gray-700">Fréquence cardiaque \(\*bpm\*\)</label>
            <input type="text" id="fc" name="fc" value="${param.fc}"
                   class="mt-1 block w-full rounded-md border border-gray-300 px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"/>
          </div>
          <div>
            <label for="temp" class="block text-sm font-medium text-gray-700">Température \(\*°C\*\)</label>
            <input type="text" id="temp" name="temp" value="${param.temp}"
                   class="mt-1 block w-full rounded-md border border-gray-300 px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"/>
          </div>
          <div>
            <label for="spo2" class="block text-sm font-medium text-gray-700">SpO2 \(\*%\*\)</label>
            <input type="text" id="spo2" name="spo2" value="${param.spo2}"
                   class="mt-1 block w-full rounded-md border border-gray-300 px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"/>
          </div>
          <div>
            <label for="poids" class="block text-sm font-medium text-gray-700">Poids \(\*kg\*\)</label>
            <input type="text" id="poids" name="poids" value="${param.poids}"
                   class="mt-1 block w-full rounded-md border border-gray-300 px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"/>
          </div>
          <div>
            <label for="taille" class="block text-sm font-medium text-gray-700">Taille \(\*cm\*\)</label>
            <input type="text" id="taille" name="taille" value="${param.taille}"
                   class="mt-1 block w-full rounded-md border border-gray-300 px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"/>
          </div>
        </div>
      </fieldset>

      <div class="flex items-center gap-3">
        <button type="submit"
                class="inline-flex items-center rounded-md bg-blue-600 px-4 py-2 text-white text-sm font-medium shadow hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-blue-500">
          Enregistrer et ajouter à la file
        </button>
        <a href="${pageContext.request.contextPath}/infirmier/patients"
           class="text-sm font-medium text-blue-700 hover:text-blue-900">
          Voir la file du jour
        </a>
      </div>
    </form>
  </main>
</body>
</html>

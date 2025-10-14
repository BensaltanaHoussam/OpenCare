<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
  <title>Accueil infirmier - MediCare</title>
</head>
<body class="bg-gray-50 min-h-screen">

  <!-- Header -->
  <header class="bg-white shadow-sm border-b border-gray-200">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-4">
      <div class="flex items-center justify-between">
        <div class="flex items-center gap-3">
         <img src="${pageContext.request.contextPath}/assets/img/logoCare.png" alt="Logo MediCare" class="w-[120px] rounded-lg object-contain   "/>
         <div class="border border-left-2 border-red-500 h-10 mr-3">
         </div>
          <div>
            <h1 class="text-xl font-semibold text-gray-900">Accueil infirmier</h1>
            <p class="text-sm text-gray-500">Enregistrement des patients</p>
          </div>
        </div>
        <div>
         <a href="${pageContext.request.contextPath}/infirmier/patients"
                   class="inline-flex items-center gap-2 px-4 py-2 text-sm font-medium text-gray-700 bg-white border border-gray-300 rounded-lg hover:bg-gray-50 transition-colors">
                  <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2"/>
                  </svg>
                  Voir la file du jour
                </a>
                 <a href="${pageContext.request.contextPath}/logout"
                                   class="inline-flex items-center gap-2 px-4 py-2 text-sm font-medium text-red-600 bg-white border border-red-200 rounded-lg hover:bg-red-50 transition-colors ml-2">
                                  <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                          d="M17 16l4-4m0 0l-4-4m4 4H7"/>
                                  </svg>
                                  Déconnexion
                                </a>
        </div>

      </div>
    </div>
  </header>

  <!-- Main Content -->
  <main class="max-w-5xl mx-auto px-4 sm:px-6 lg:px-8 py-8">

    <!-- Error Message -->
    <c:if test="${not empty error}">
      <div class="mb-6 bg-red-50 border border-red-200 rounded-lg p-4 flex items-start gap-3">
        <svg class="w-5 h-5 text-red-600 flex-shrink-0 mt-0.5" fill="currentColor" viewBox="0 0 20 20">
          <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd"/>
        </svg>
        <div>
          <h3 class="text-sm font-medium text-red-800">Erreur</h3>
          <p class="text-sm text-red-700 mt-1">${error}</p>
        </div>
      </div>
    </c:if>

    <form method="post" action="${pageContext.request.contextPath}/infirmier/accueil" class="space-y-6">

      <!-- Patient Identification Section -->
      <div class="bg-white rounded-lg shadow-sm border border-gray-200 overflow-hidden">
        <div class="bg-gradient-to-r from-red-600 to-red-700 px-6 py-4">
          <h2 class="text-lg font-semibold text-white flex items-center gap-2">
            <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 6H5a2 2 0 00-2 2v9a2 2 0 002 2h14a2 2 0 002-2V8a2 2 0 00-2-2h-5m-4 0V5a2 2 0 114 0v1m-4 0a2 2 0 104 0m-5 8a2 2 0 100-4 2 2 0 000 4zm0 0c1.306 0 2.417.835 2.83 2M9 14a3.001 3.001 0 00-2.83 2M15 11h3m-3 4h2"/>
            </svg>
            Identification du patient
          </h2>
        </div>

        <div class="p-6 space-y-4">
          <div>
            <label for="nss" class="block text-sm font-medium text-gray-700 mb-2">
              Numéro de sécurité sociale
            </label>
            <input
              type="text"
              id="nss"
              name="nss"
              value="${param.nss}"
              placeholder="Ex: 1 85 03 75 116 001 23"
              class="w-full px-4 py-2.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-red-500 focus:border-red-500 transition-colors text-gray-900 placeholder-gray-400"
            />
          </div>

          <div class="relative">
            <div class="absolute inset-0 flex items-center">
              <div class="w-full border-t border-gray-300"></div>
            </div>
            <div class="relative flex justify-center text-sm">
              <span class="px-4 bg-white text-gray-500 font-medium">ou bien</span>
            </div>
          </div>

          <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
            <div>
              <label for="nom" class="block text-sm font-medium text-gray-700 mb-2">
                Nom
              </label>
              <input
                type="text"
                id="nom"
                name="nom"
                value="${param.nom}"
                placeholder="Nom de famille"
                class="w-full px-4 py-2.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-red-500 focus:border-red-500 transition-colors text-gray-900 placeholder-gray-400"
              />
            </div>

            <div>
              <label for="prenom" class="block text-sm font-medium text-gray-700 mb-2">
                Prénom
              </label>
              <input
                type="text"
                id="prenom"
                name="prenom"
                value="${param.prenom}"
                placeholder="Prénom"
                class="w-full px-4 py-2.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-red-500 focus:border-red-500 transition-colors text-gray-900 placeholder-gray-400"
              />
            </div>
          </div>

          <div>
            <label for="dateNaissance" class="block text-sm font-medium text-gray-700 mb-2">
              Date de naissance
            </label>
            <input
              type="date"
              id="dateNaissance"
              name="dateNaissance"
              value="${param.dateNaissance}"
              class="w-full px-4 py-2.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-red-500 focus:border-red-500 transition-colors text-gray-900"
            />
          </div>
        </div>
      </div>

      <!-- Contact Information Section -->
      <div class="bg-white rounded-lg shadow-sm border border-gray-200 overflow-hidden">
        <div class="bg-gray-50 px-6 py-4 border-b border-gray-200">
          <h2 class="text-lg font-semibold text-gray-900 flex items-center gap-2">
            <svg class="w-5 h-5 text-gray-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z"/>
            </svg>
            Coordonnées
            <span class="text-sm font-normal text-gray-500">(optionnel si patient existant)</span>
          </h2>
        </div>

        <div class="p-6 space-y-4">
          <div>
            <label for="telephone" class="block text-sm font-medium text-gray-700 mb-2">
              Téléphone
            </label>
            <input
              type="text"
              id="telephone"
              name="telephone"
              value="${param.telephone}"
              placeholder="Ex: 06 12 34 56 78"
              class="w-full px-4 py-2.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-red-500 focus:border-red-500 transition-colors text-gray-900 placeholder-gray-400"
            />
          </div>

          <div>
            <label for="adresse" class="block text-sm font-medium text-gray-700 mb-2">
              Adresse
            </label>
            <input
              type="text"
              id="adresse"
              name="adresse"
              value="${param.adresse}"
              placeholder="Adresse complète"
              class="w-full px-4 py-2.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-red-500 focus:border-red-500 transition-colors text-gray-900 placeholder-gray-400"
            />
          </div>
        </div>
      </div>

      <!-- Vital Signs Section -->
      <div class="bg-white rounded-lg shadow-sm border border-gray-200 overflow-hidden">
        <div class="bg-gradient-to-r from-red-600 to-red-700 px-6 py-4">
          <h2 class="text-lg font-semibold text-white flex items-center gap-2">
            <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z"/>
            </svg>
            Signes vitaux
          </h2>
        </div>

        <div class="p-6">
          <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
            <div>
              <label for="taSys" class="block text-sm font-medium text-gray-700 mb-2">
                TA systolique
              </label>
              <div class="relative">
                <input
                  type="text"
                  id="taSys"
                  name="taSys"
                  value="${param.taSys}"
                  placeholder="120"
                  class="w-full px-4 py-2.5 pr-16 border border-gray-300 rounded-lg focus:ring-2 focus:ring-red-500 focus:border-red-500 transition-colors text-gray-900 placeholder-gray-400"
                />
                <span class="absolute right-4 top-1/2 -translate-y-1/2 text-sm text-gray-500">mmHg</span>
              </div>
            </div>

            <div>
              <label for="taDia" class="block text-sm font-medium text-gray-700 mb-2">
                TA diastolique
              </label>
              <div class="relative">
                <input
                  type="text"
                  id="taDia"
                  name="taDia"
                  value="${param.taDia}"
                  placeholder="80"
                  class="w-full px-4 py-2.5 pr-16 border border-gray-300 rounded-lg focus:ring-2 focus:ring-red-500 focus:border-red-500 transition-colors text-gray-900 placeholder-gray-400"
                />
                <span class="absolute right-4 top-1/2 -translate-y-1/2 text-sm text-gray-500">mmHg</span>
              </div>
            </div>

            <div>
              <label for="fc" class="block text-sm font-medium text-gray-700 mb-2">
                Fréquence cardiaque
              </label>
              <div class="relative">
                <input
                  type="text"
                  id="fc"
                  name="fc"
                  value="${param.fc}"
                  placeholder="70"
                  class="w-full px-4 py-2.5 pr-12 border border-gray-300 rounded-lg focus:ring-2 focus:ring-red-500 focus:border-red-500 transition-colors text-gray-900 placeholder-gray-400"
                />
                <span class="absolute right-4 top-1/2 -translate-y-1/2 text-sm text-gray-500">bpm</span>
              </div>
            </div>

            <div>
              <label for="temp" class="block text-sm font-medium text-gray-700 mb-2">
                Température
              </label>
              <div class="relative">
                <input
                  type="text"
                  id="temp"
                  name="temp"
                  value="${param.temp}"
                  placeholder="37.0"
                  class="w-full px-4 py-2.5 pr-10 border border-gray-300 rounded-lg focus:ring-2 focus:ring-red-500 focus:border-red-500 transition-colors text-gray-900 placeholder-gray-400"
                />
                <span class="absolute right-4 top-1/2 -translate-y-1/2 text-sm text-gray-500">°C</span>
              </div>
            </div>

            <div>
              <label for="spo2" class="block text-sm font-medium text-gray-700 mb-2">
                SpO2
              </label>
              <div class="relative">
                <input
                  type="text"
                  id="spo2"
                  name="spo2"
                  value="${param.spo2}"
                  placeholder="98"
                  class="w-full px-4 py-2.5 pr-8 border border-gray-300 rounded-lg focus:ring-2 focus:ring-red-500 focus:border-red-500 transition-colors text-gray-900 placeholder-gray-400"
                />
                <span class="absolute right-4 top-1/2 -translate-y-1/2 text-sm text-gray-500">%</span>
              </div>
            </div>

            <div>
              <label for="poids" class="block text-sm font-medium text-gray-700 mb-2">
                Poids
              </label>
              <div class="relative">
                <input
                  type="text"
                  id="poids"
                  name="poids"
                  value="${param.poids}"
                  placeholder="70"
                  class="w-full px-4 py-2.5 pr-10 border border-gray-300 rounded-lg focus:ring-2 focus:ring-red-500 focus:border-red-500 transition-colors text-gray-900 placeholder-gray-400"
                />
                <span class="absolute right-4 top-1/2 -translate-y-1/2 text-sm text-gray-500">kg</span>
              </div>
            </div>

            <div>
              <label for="taille" class="block text-sm font-medium text-gray-700 mb-2">
                Taille
              </label>
              <div class="relative">
                <input
                  type="text"
                  id="taille"
                  name="taille"
                  value="${param.taille}"
                  placeholder="170"
                  class="w-full px-4 py-2.5 pr-10 border border-gray-300 rounded-lg focus:ring-2 focus:ring-red-500 focus:border-red-500 transition-colors text-gray-900 placeholder-gray-400"
                />
                <span class="absolute right-4 top-1/2 -translate-y-1/2 text-sm text-gray-500">cm</span>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- Submit Button -->
      <div class="flex items-center justify-end gap-4 pt-4">
        <button
          type="submit"
          class="inline-flex items-center gap-2 px-6 py-3 bg-red-600 text-white font-medium rounded-lg hover:bg-red-700 focus:outline-none focus:ring-2 focus:ring-red-500 focus:ring-offset-2 transition-colors shadow-sm"
        >
          <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"/>
          </svg>
          Enregistrer et ajouter à la file
        </button>
      </div>
    </form>
  </main>

</body>
</html>

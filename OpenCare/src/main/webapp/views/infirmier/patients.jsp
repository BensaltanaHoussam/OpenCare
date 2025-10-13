<!-- html -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
  <title>Patients du jour - MediCare</title>
</head>
<body class="bg-gray-50 min-h-screen">

  <!-- Header -->
  <header class="bg-white shadow-sm border-b border-gray-200">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-4">
      <div class="flex items-center justify-between">
        <div class="flex items-center gap-3">
          <img src="${pageContext.request.contextPath}/assets/img/logoCare.png" alt="Logo MediCare" class="w-[120px] rounded-lg object-contain"/>
          <div class="border border-left-2 border-red-500 h-10 mr-3"></div>
          <div>
            <h1 class="text-xl font-semibold text-gray-900">Patients du jour</h1>
            <p class="text-sm text-gray-500">File d’attente et suivi</p>
          </div>
        </div>
        <a href="${pageContext.request.contextPath}/infirmier/accueil"
           class="inline-flex items-center gap-2 px-4 py-2 text-sm font-medium text-gray-700 bg-white border border-gray-300 rounded-lg hover:bg-gray-50 transition-colors">
          <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                  d="M12 4v16m8-8H4"/>
          </svg>
          Nouvel enregistrement
        </a>
      </div>
    </div>
  </header>

  <!-- Main -->
  <main class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8 space-y-6">

    <!-- Success -->
    <c:if test="${param.added == '1'}">
      <div class="bg-green-50 border border-green-200 rounded-lg p-4 flex items-start gap-3">
        <svg class="w-5 h-5 text-green-700 flex-shrink-0 mt-0.5" fill="currentColor" viewBox="0 0 20 20">
          <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.707a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414L9 13.414l4.707-4.707z" clip-rule="evenodd"/>
        </svg>
        <div>
          <h3 class="text-sm font-medium text-green-800">Patient ajouté</h3>
          <p class="text-sm text-green-700 mt-1">Patient ajouté à la file d’attente.</p>
        </div>
      </div>
    </c:if>

    <!-- Filtres -->
    <div class="bg-white rounded-lg shadow-sm border border-gray-200">
      <div class="bg-gray-50 px-6 py-4 border-b border-gray-200">
        <h2 class="text-lg font-semibold text-gray-900 flex items-center gap-2">
          <svg class="w-5 h-5 text-gray-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                  d="M8 7V3m8 4V3M3 11h18M5 21h14a2 2 0 002-2v-6H3v6a2 2 0 002 2z"/>
          </svg>
          Filtrer par date
        </h2>
      </div>
      <form method="get" action="${pageContext.request.contextPath}/infirmier/patients" class="p-6">
        <div class="flex flex-col sm:flex-row items-start sm:items-end gap-4">
          <div class="w-full sm:w-auto">
            <label for="date" class="block text-sm font-medium text-gray-700 mb-2">Date</label>
            <input type="date" id="date" name="date" value="${empty date ? '' : date}"
                   class="w-full sm:w-64 px-4 py-2.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-red-600 focus:border-red-600 transition-colors text-gray-900"/>
          </div>
          <button type="submit"
                  class="inline-flex items-center gap-2 px-5 py-2.5 bg-red-600 text-white font-medium rounded-lg hover:bg-red-700 focus:outline-none focus:ring-2 focus:ring-red-500 focus:ring-offset-2 transition-colors">
            <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                    d="M8 7V3m8 4V3M3 11h18M5 21h14a2 2 0 002-2v-6H3v6a2 2 0 002 2z"/>
            </svg>
            Filtrer
          </button>
        </div>
      </form>
    </div>

    <!-- Tableau -->
    <div class="bg-white rounded-lg shadow-sm border border-gray-200 overflow-hidden">
      <div class="bg-gradient-to-r from-red-600 to-red-700 px-6 py-4">
        <h2 class="text-lg font-semibold text-white flex items-center gap-2">
          <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                  d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2"/>
          </svg>
          File d’attente du jour
        </h2>
      </div>

      <div class="overflow-x-auto">
        <table class="min-w-full divide-y divide-gray-200">
          <thead class="bg-gray-50">
            <tr>
              <th class="px-4 py-3 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">Arrivée</th>
              <th class="px-4 py-3 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">Nom</th>
              <th class="px-4 py-3 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">Prénom</th>
              <th class="px-4 py-3 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">N° sécu</th>
              <th class="px-4 py-3 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">TA</th>
              <th class="px-4 py-3 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">FC</th>
              <th class="px-4 py-3 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">T°</th>
              <th class="px-4 py-3 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">SpO2</th>
              <th class="px-4 py-3 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">Poids</th>
              <th class="px-4 py-3 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">Taille</th>
              <th class="px-4 py-3 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">IMC</th>
              <th class="px-4 py-3 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">Statut</th>
            </tr>
          </thead>
          <tbody class="bg-white divide-y divide-gray-100">
            <c:forEach var="fa" items="${fileAttente}">
              <tr class="hover:bg-gray-50">
                <td class="px-4 py-3 text-sm text-gray-900"><c:out value="${fa.arriveAt}"/></td>
                <td class="px-4 py-3 text-sm text-gray-900"><c:out value="${fa.patient.nom}"/></td>
                <td class="px-4 py-3 text-sm text-gray-900"><c:out value="${fa.patient.prenom}"/></td>
                <td class="px-4 py-3 text-sm text-gray-700"><c:out value="${fa.patient.numeroSecuriteSociale}"/></td>
                <td class="px-4 py-3 text-sm text-gray-700">
                  <c:out value="${fa.signesVitaux.taSys}"/>/<c:out value="${fa.signesVitaux.taDia}"/> mmHg
                </td>
                <td class="px-4 py-3 text-sm text-gray-700"><c:out value="${fa.signesVitaux.frequenceCardiaque}"/> bpm</td>
                <td class="px-4 py-3 text-sm text-gray-700"><c:out value="${fa.signesVitaux.temperatureC}"/> °C</td>
                <td class="px-4 py-3 text-sm text-gray-700"><c:out value="${fa.signesVitaux.spo2}"/> %</td>
                <td class="px-4 py-3 text-sm text-gray-700"><c:out value="${fa.signesVitaux.poidsKg}"/> kg</td>
                <td class="px-4 py-3 text-sm text-gray-700"><c:out value="${fa.signesVitaux.tailleCm}"/> cm</td>
                <td class="px-4 py-3 text-sm text-gray-700"><c:out value="${fa.signesVitaux.imc}"/></td>
                <td class="px-4 py-3">
                  <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium
                    <c:out value='${fa.statut == "EN_ATTENTE" ? "bg-yellow-50 text-yellow-800 ring-1 ring-yellow-200" :
                                   fa.statut == "EN_COURS"   ? "bg-blue-50 text-blue-800 ring-1 ring-blue-200" :
                                   fa.statut == "TERMINE"    ? "bg-green-50 text-green-800 ring-1 ring-green-200" :
                                                                "bg-gray-50 text-gray-800 ring-1 ring-gray-200"}'/>">
                    <c:out value="${fa.statut}"/>
                  </span>
                </td>
              </tr>
            </c:forEach>

            <c:if test="${empty fileAttente}">
              <tr>
                <td colspan="12" class="px-4 py-6 text-center text-sm text-gray-500">
                  Aucun patient pour cette date.
                </td>
              </tr>
            </c:if>
          </tbody>
        </table>
      </div>
    </div>

    <!-- Back link -->
    <div class="flex justify-end">
      <a href="${pageContext.request.contextPath}/infirmier/accueil"
         class="text-sm text-red-600 hover:text-red-700 font-medium transition-colors">
        Retour à l’accueil infirmier
      </a>
    </div>

  </main>
</body>
</html>

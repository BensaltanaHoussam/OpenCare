<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Connexion - OpenCare</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="min-h-screen opacity-3 flex items-center justify-center " style="background-image: url('${pageContext.request.contextPath}/assets/img/'); background-size: cover; background-position: center;">
  <div class="w-[550px] rounded-2xl  p-8 lg:p-12 bg-white">
    <div class="mb-8 text-center">
      <img src="${pageContext.request.contextPath}/assets/img/logoCare.png" alt="MediCare" class="h-12 w-auto mx-auto" />
    </div>

    <div class="mb-4 text-center">
      <p class="text-gray-600">
        Don't have an account?
        <a href="${pageContext.request.contextPath}/register-user" class="text-red-600 hover:text-red-700 font-medium transition-colors underline decoration-red-600/30 hover:decoration-red-700">
          Register here
        </a>
      </p>
    </div>

    <c:if test="${not empty error}">
      <div class="mb-8 p-4 bg-red-50 border-l-4 border-red-600 rounded-r">
        <p class="text-red-800 text-sm font-medium">${error}</p>
      </div>
    </c:if>

    <form method="post" action="${pageContext.request.contextPath}/login" class="space-y-7">
      <input type="hidden" name="csrfToken" value="${csrfToken}" />

      <div>
        <label for="username" class="block text-sm font-medium text-gray-800 mb-2.5">
          Email Address
        </label>
        <div class="relative">
          <span class="absolute inset-y-0 left-0 flex items-center pl-4 text-gray-400">
            <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z"/>
            </svg>
          </span>
          <input
            id="username"
            name="username"
            type="text"
            required
            placeholder="Enter your email"
            class="w-full pl-12 pr-4 py-3.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-red-600 focus:border-red-600 transition-all outline-none bg-white text-gray-900 placeholder:text-gray-400"
          />
        </div>
      </div>

      <div>
        <label for="password" class="block text-sm font-medium text-gray-800 mb-2.5">
          Password
        </label>
        <div class="relative">
          <span class="absolute inset-y-0 left-0 flex items-center pl-4 text-gray-400">
            <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z"/>
            </svg>
          </span>
          <input
            id="password"
            name="password"
            type="password"
            required
            placeholder="Enter your password"
            class="w-full pl-12 pr-4 py-3.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-red-600 focus:border-red-600 transition-all outline-none bg-white text-gray-900 placeholder:text-gray-400"
          />
        </div>
      </div>

      <div class="flex items-center justify-between pt-1">
        <label class="flex items-center cursor-pointer group">
          <input type="checkbox" name="remember" class="w-4 h-4 text-red-600 border-gray-300 rounded focus:ring-red-600 cursor-pointer" />
          <span class="ml-2.5 text-sm text-gray-700 group-hover:text-gray-900 transition-colors">Remember me</span>
        </label>
        <a href="#" class="text-sm text-red-600 hover:text-red-700 font-medium transition-colors">
          Forgot Password?
        </a>
      </div>

      <button
        type="submit"
        class="w-full bg-red-600 text-white py-3.5 rounded-lg font-medium hover:bg-red-700 active:bg-red-800 transition-all duration-200 shadow-sm hover:shadow-md"
      >
        Sign in
      </button>

      <div class="relative my-8">
        <div class="absolute inset-0 flex items-center">
          <div class="w-full border-t border-gray-200"></div>
        </div>
        <div class="relative flex justify-center text-sm">
          <span class="px-4 bg-white text-gray-500 font-light">or continue with</span>
        </div>
      </div>

      <button
        type="button"
        class="w-full flex items-center justify-center gap-3 bg-white border-2 border-gray-200 text-gray-700 py-3.5 rounded-lg font-medium hover:bg-gray-50 hover:border-gray-300 active:bg-gray-100 transition-all duration-200 shadow-sm"
      >
        <svg class="w-5 h-5" viewBox="0 0 24 24">
          <path fill="#4285F4" d="M22.56 12.25c0-.78-.07-1.53-.2-2.25H12v4.26h5.92c-.26 1.37-1.04 2.53-2.21 3.31v2.77h3.57c2.08-1.92 3.28-4.74 3.28-8.09z"/>
          <path fill="#34A853" d="M12 23c2.97 0 5.46-.98 7.28-2.66l-3.57-2.77c-.98.66-2.23 1.06-3.71 1.06-2.86 0-5.29-1.93-6.16-4.53H2.18v2.84C3.99 20.53 7.7 23 12 23z"/>
          <path fill="#FBBC05" d="M5.84 14.09c-.22-.66-.35-1.36-.35-2.09s.13-1.43.35-2.09V7.07H2.18C1.43 8.55 1 10.22 1 12s.43 3.45 1.18 4.93l2.85-2.22.81-.62z"/>
          <path fill="#EA4335" d="M12 5.38c1.62 0 3.06.56 4.21 1.64l3.15-3.15C17.45 2.09 14.97 1 12 1 7.7 1 3.99 3.47 2.18 7.07l3.66 2.84c.87-2.6 3.3-4.53 6.16-4.53z"/>
        </svg>
        Continue with Google
      </button>
    </form>
  </div>
</body>
</html>

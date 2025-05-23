document.addEventListener("DOMContentLoaded", () => {
  const loginForm = document.getElementById("loginForm")
  const emailInput = document.getElementById("email")
  const passwordInput = document.getElementById("password")
  const emailError = document.getElementById("emailError")
  const passwordError = document.getElementById("passwordError")
  const togglePassword = document.querySelector(".toggle-password")

  // Toggle password visibility
  togglePassword.addEventListener("click", () => {
    if (passwordInput.type === "password") {
      passwordInput.type = "text"
      togglePassword.textContent = "🔒"
    } else {
      passwordInput.type = "password"
      togglePassword.textContent = "👁️"
    }
  })

  // Input focus effects
  const inputs = document.querySelectorAll("input")
  inputs.forEach((input) => {
    input.addEventListener("focus", function () {
      this.parentElement.classList.add("focused")
    })

    input.addEventListener("blur", function () {
      this.parentElement.classList.remove("focused")
    })
  })

  // Basic form validation
  loginForm.addEventListener("submit", (e) => {
    let isValid = true

    // Reset errors
    emailError.textContent = ""
    passwordError.textContent = ""

    // Email validation - just check if it's filled and has basic email format
    if (!emailInput.value) {
      emailError.textContent = "Email is required"
      isValid = false
    } else if (!isValidEmail(emailInput.value)) {
      emailError.textContent = "Please enter a valid email"
      isValid = false
    }

    // Password validation - just check if it's filled
    if (!passwordInput.value) {
      passwordError.textContent = "Password is required"
      isValid = false
    }

    if (!isValid) {
      e.preventDefault()
    }
    // If valid, the form will submit naturally to your Java backend
  })

  // Helper function to validate email format
  function isValidEmail(email) {
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/
    return emailRegex.test(email)
  }

  // Add subtle animation to the login card
  const loginCard = document.querySelector(".login-card")
  loginCard.style.opacity = "0"
  loginCard.style.transform = "translateY(20px)"

  setTimeout(() => {
    loginCard.style.transition = "opacity 0.5s ease, transform 0.5s ease"
    loginCard.style.opacity = "1"
    loginCard.style.transform = "translateY(0)"
  }, 100)
})

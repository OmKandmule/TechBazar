document.addEventListener("DOMContentLoaded", () => {
  const registerForm = document.getElementById("registerForm")
  const firstNameInput = document.getElementById("firstName")
  const lastNameInput = document.getElementById("lastName")
  const mobileInput = document.getElementById("mobile")
  const emailInput = document.getElementById("email")
  const passwordInput = document.getElementById("password")
  const termsCheckbox = document.getElementById("terms")

  const firstNameError = document.getElementById("firstNameError")
  const lastNameError = document.getElementById("lastNameError")
  const mobileError = document.getElementById("mobileError")
  const emailError = document.getElementById("emailError")
  const passwordError = document.getElementById("passwordError")
  const termsError = document.getElementById("termsError")

  const strengthSegments = [
    document.getElementById("segment1"),
    document.getElementById("segment2"),
    document.getElementById("segment3"),
    document.getElementById("segment4"),
  ]
  const strengthText = document.getElementById("strengthText")

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

  // Format phone number as user types
  mobileInput.addEventListener("input", (e) => {
    // Get only digits from the input
    let digits = e.target.value.replace(/\D/g, "")

    // Format the phone number
    if (digits.length > 0) {
      if (digits.length <= 3) {
        digits = `(${digits}`
      } else if (digits.length <= 6) {
        digits = `(${digits.substring(0, 3)}) ${digits.substring(3)}`
      } else {
        digits = `(${digits.substring(0, 3)}) ${digits.substring(3, 6)}-${digits.substring(6, 10)}`
      }
    }

    // Set the formatted value back to the input
    e.target.value = digits
  })

  // Password strength checker
  passwordInput.addEventListener("input", () => {
    const password = passwordInput.value
    let strength = 0

    // Reset all segments
    strengthSegments.forEach((segment) => {
      segment.style.backgroundColor = "#ddd"
    })

    if (password.length > 0) {
      // Check length
      if (password.length >= 8) strength++

      // Check for numbers
      if (/\d/.test(password)) strength++

      // Check for special characters
      if (/[!@#$%^&*(),.?":{}|<>]/.test(password)) strength++

      // Check for uppercase and lowercase
      if (/[a-z]/.test(password) && /[A-Z]/.test(password)) strength++

      // Update strength meter
      for (let i = 0; i < strength; i++) {
        switch (strength) {
          case 1:
            strengthSegments[i].style.backgroundColor = "#ff4d4d" // Weak - Red
            break
          case 2:
            strengthSegments[i].style.backgroundColor = "#ffa64d" // Fair - Orange
            break
          case 3:
            strengthSegments[i].style.backgroundColor = "#ffff4d" // Good - Yellow
            break
          case 4:
            strengthSegments[i].style.backgroundColor = "#4dff4d" // Strong - Green
            break
        }
      }

      // Update strength text
      switch (strength) {
        case 1:
          strengthText.textContent = "Weak"
          strengthText.style.color = "#ff4d4d"
          break
        case 2:
          strengthText.textContent = "Fair"
          strengthText.style.color = "#ffa64d"
          break
        case 3:
          strengthText.textContent = "Good"
          strengthText.style.color = "#ffff4d"
          break
        case 4:
          strengthText.textContent = "Strong"
          strengthText.style.color = "#4dff4d"
          break
        default:
          strengthText.textContent = "Password strength"
          strengthText.style.color = "#888"
      }
    } else {
      strengthText.textContent = "Password strength"
      strengthText.style.color = "#888"
    }
  })

  // Form validation
  registerForm.addEventListener("submit", (e) => {
    let isValid = true

    // Reset all error messages
    firstNameError.textContent = ""
    lastNameError.textContent = ""
    mobileError.textContent = ""
    emailError.textContent = ""
    passwordError.textContent = ""
    termsError.textContent = ""

    // Validate first name
    if (!firstNameInput.value.trim()) {
      firstNameError.textContent = "First name is required"
      isValid = false
    } else if (!/^[A-Za-z\s]+$/.test(firstNameInput.value.trim())) {
      firstNameError.textContent = "First name should contain only letters"
      isValid = false
    }

    // Validate last name
    if (!lastNameInput.value.trim()) {
      lastNameError.textContent = "Last name is required"
      isValid = false
    } else if (!/^[A-Za-z\s]+$/.test(lastNameInput.value.trim())) {
      lastNameError.textContent = "Last name should contain only letters"
      isValid = false
    }

    // Validate mobile
    if (!mobileInput.value.trim()) {
      mobileError.textContent = "Mobile number is required"
      isValid = false
    } 
	/*else if (!/^$$\d{3}$$\s\d{3}-\d{4}$/.test(mobileInput.value.trim())) {
      mobileError.textContent = "Please enter a valid mobile number"
      isValid = false
    }*/

    // Validate email
    if (!emailInput.value.trim()) {
      emailError.textContent = "Email is required"
      isValid = false
    } else if (!isValidEmail(emailInput.value.trim())) {
      emailError.textContent = "Please enter a valid email address"
      isValid = false
    }

    // Validate password
    if (!passwordInput.value) {
      passwordError.textContent = "Password is required"
      isValid = false
    } else if (passwordInput.value.length < 8) {
      passwordError.textContent = "Password must be at least 8 characters"
      isValid = false
    }

    // Validate terms checkbox
    if (!termsCheckbox.checked) {
      termsError.textContent = "You must agree to the terms"
      isValid = false
    }

    if (!isValid) {
      e.preventDefault()
    }
  })

  // Helper function to validate email format
  function isValidEmail(email) {
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/
    return emailRegex.test(email)
  }

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
})

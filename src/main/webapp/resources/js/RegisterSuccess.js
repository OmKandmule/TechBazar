document.addEventListener("DOMContentLoaded", () => {
  // Add pulse effect to the login button
  const loginButton = document.querySelector(".btn-login")

  if (loginButton) {
    // Create a pulsing effect to draw attention to the login button
    const pulseAnimation = () => {
      loginButton.style.transform = "scale(1.05)"
      loginButton.style.boxShadow = "0 5px 20px rgba(0, 102, 204, 0.4)"

      setTimeout(() => {
        loginButton.style.transform = "scale(1)"
        loginButton.style.boxShadow = "0 5px 15px rgba(0, 102, 204, 0.3)"

        setTimeout(pulseAnimation, 3000)
      }, 700)
    }

    // Start the pulse animation after 2 seconds
    setTimeout(pulseAnimation, 2000)
  }

  // Create dynamic confetti
  const createConfetti = () => {
    const confettiContainer = document.querySelector(".confetti-container")

    if (confettiContainer) {
      // Remove existing confetti
      const existingConfetti = document.querySelectorAll(".dynamic-confetti")
      existingConfetti.forEach((confetti) => confetti.remove())

      // Create new confetti pieces
      for (let i = 0; i < 20; i++) {
        const confetti = document.createElement("div")
        confetti.classList.add("confetti", "dynamic-confetti")

        // Random position
        confetti.style.left = Math.random() * 100 + "%"

        // Random size
        const size = Math.random() * 10 + 5
        confetti.style.width = size + "px"
        confetti.style.height = size + "px"

        // Random color
        const colors = ["#ff6600", "#0066cc", "#28a745", "#ffc107", "#dc3545"]
        confetti.style.backgroundColor = colors[Math.floor(Math.random() * colors.length)]

        // Random rotation
        confetti.style.transform = `rotate(${Math.random() * 360}deg)`

        // Random animation duration
        const duration = Math.random() * 3 + 3
        confetti.style.animationDuration = duration + "s"

        // Random animation delay
        confetti.style.animationDelay = Math.random() * 5 + "s"

        confettiContainer.appendChild(confetti)
      }
    }
  }

  // Create initial dynamic confetti
  createConfetti()

  // Recreate confetti periodically
  setInterval(createConfetti, 8000)

  // Add hover effects to buttons
  const buttons = document.querySelectorAll(".btn-login, .btn-home")

  buttons.forEach((button) => {
    button.addEventListener("mouseenter", function () {
      this.style.transform = "translateY(-3px)"

      if (this.classList.contains("btn-login")) {
        this.style.boxShadow = "0 5px 15px rgba(0, 102, 204, 0.3)"
      } else {
        this.style.boxShadow = "0 5px 15px rgba(0, 0, 0, 0.1)"
      }
    })

    button.addEventListener("mouseleave", function () {
      this.style.transform = "translateY(0)"

      if (this.classList.contains("btn-login")) {
        this.style.boxShadow = "none"
      } else {
        this.style.boxShadow = "none"
      }
    })
  })

  // Add click effect to buttons
  buttons.forEach((button) => {
    button.addEventListener("mousedown", function () {
      this.style.transform = "translateY(-1px)"
    })

    button.addEventListener("mouseup", function () {
      this.style.transform = "translateY(-3px)"
    })
  })

  // Add success icon animation
  const successIcon = document.querySelector(".success-icon i")
  if (successIcon) {
    // Add a subtle bounce effect
    setTimeout(() => {
      successIcon.style.animation = "none"
      void successIcon.offsetWidth // Force reflow
      successIcon.style.animation = "bounce 1s ease infinite"
    }, 1000)
  }

  // Add bounce animation style
  const style = document.createElement("style")
  style.textContent = `
    @keyframes bounce {
      0%, 20%, 50%, 80%, 100% {transform: translateY(0);}
      40% {transform: translateY(-10px);}
      60% {transform: translateY(-5px);}
    }
  `
  document.head.appendChild(style)
})

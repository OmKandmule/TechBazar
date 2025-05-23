document.addEventListener("DOMContentLoaded", () => {
  // Animate elements when they come into view
  const animateOnScroll = () => {
    const elements = document.querySelectorAll(".feature, .category-card, .trending-card, .section-header")

    elements.forEach((element) => {
      const elementPosition = element.getBoundingClientRect().top
      const screenPosition = window.innerHeight / 1.2

      if (elementPosition < screenPosition) {
        element.style.opacity = "1"
        element.style.transform = "translateY(0)"
      }
    })
  }

  // Set initial state for animated elements
  const elementsToAnimate = document.querySelectorAll(".feature, .category-card, .trending-card, .section-header")
  elementsToAnimate.forEach((element) => {
    element.style.opacity = "0"
    element.style.transform = "translateY(20px)"
    element.style.transition = "opacity 0.6s ease, transform 0.6s ease"
  })

  // Run animation on load and scroll
  animateOnScroll()
  window.addEventListener("scroll", animateOnScroll)

  // Smooth scroll for anchor links
  document.querySelectorAll('a[href^="#"]').forEach((anchor) => {
    anchor.addEventListener("click", function (e) {
      e.preventDefault()

      const targetId = this.getAttribute("href")
      if (targetId === "#") return

      const targetElement = document.querySelector(targetId)
      if (targetElement) {
        window.scrollTo({
          top: targetElement.offsetTop - 80,
          behavior: "smooth",
        })
      }
    })
  })

  // Mobile menu toggle (for smaller screens)
  const createMobileMenu = () => {
    if (window.innerWidth <= 768 && !document.querySelector(".mobile-menu-toggle")) {
      const header = document.querySelector(".header-container")
      const navMenu = document.querySelector(".nav-menu")

      // Create mobile menu toggle button
      const mobileMenuToggle = document.createElement("button")
      mobileMenuToggle.className = "mobile-menu-toggle"
      mobileMenuToggle.innerHTML = '<i class="fas fa-bars"></i>'

      // Insert before the search bar
      header.insertBefore(mobileMenuToggle, navMenu)

      // Add toggle functionality
      mobileMenuToggle.addEventListener("click", () => {
        navMenu.classList.toggle("active")

        if (navMenu.classList.contains("active")) {
          mobileMenuToggle.innerHTML = '<i class="fas fa-times"></i>'
        } else {
          mobileMenuToggle.innerHTML = '<i class="fas fa-bars"></i>'
        }
      })

      // Add mobile menu styles
      const style = document.createElement("style")
      style.textContent = `
                @media (max-width: 768px) {
                    .nav-menu {
                        position: absolute;
                        top: 100%;
                        left: 0;
                        width: 100%;
                        background-color: white;
                        box-shadow: 0 5px 10px rgba(0,0,0,0.1);
                        padding: 20px;
                        display: none;
                        z-index: 1000;
                    }
                    
                    .nav-menu.active {
                        display: block;
                    }
                    
                    .nav-menu ul {
                        flex-direction: column;
                        gap: 15px;
                    }
                    
                    .mobile-menu-toggle {
                        display: block;
                        background: none;
                        border: none;
                        font-size: 1.5rem;
                        cursor: pointer;
                        color: #333;
                    }
                }
            `
      document.head.appendChild(style)
    }
  }

  // Check if mobile menu is needed
  createMobileMenu()
  window.addEventListener("resize", createMobileMenu)

  // Add hover effect for category cards
  const categoryCards = document.querySelectorAll(".category-card")
  categoryCards.forEach((card) => {
    card.addEventListener("mouseenter", function () {
      this.querySelector(".shop-now").style.color = "#ff6600"
    })

    card.addEventListener("mouseleave", function () {
      this.querySelector(".shop-now").style.color = "#0066cc"
    })
  })

  // Add to cart functionality for trending products (placeholder)
  const trendingCards = document.querySelectorAll(".trending-card")
  trendingCards.forEach((card) => {
    // Create add to cart button
    const addToCartBtn = document.createElement("button")
    addToCartBtn.className = "add-to-cart-btn"
    addToCartBtn.innerHTML = 'Add to Cart <i class="fas fa-shopping-cart"></i>'

    // Add button to card
    card.appendChild(addToCartBtn)

    // Add click event
    addToCartBtn.addEventListener("click", function (e) {
      e.preventDefault()
      e.stopPropagation()

      // Animation effect
      this.innerHTML = 'Added! <i class="fas fa-check"></i>'
      this.classList.add("added")

      setTimeout(() => {
        this.innerHTML = 'Add to Cart <i class="fas fa-shopping-cart"></i>'
        this.classList.remove("added")
      }, 2000)
    })
  })

  // Add styles for the add to cart button
  const style = document.createElement("style")
  style.textContent = `
        .add-to-cart-btn {
            background-color: #0066cc;
            color: white;
            border: none;
            padding: 8px 15px;
            border-radius: 20px;
            margin-top: 10px;
            cursor: pointer;
            font-weight: 500;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 5px;
        }
        
        .add-to-cart-btn:hover {
            background-color: #0055aa;
        }
        
        .add-to-cart-btn.added {
            background-color: #28a745;
        }
    `
  document.head.appendChild(style)
})

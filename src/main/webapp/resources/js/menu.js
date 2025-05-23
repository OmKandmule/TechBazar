document.addEventListener("DOMContentLoaded", () => {
  // Elements
  const productList = document.getElementById("productList")
  const gridViewBtn = document.getElementById("gridView")
  const listViewBtn = document.getElementById("listView")
  const sortSelect = document.getElementById("sortSelect")
  const filterSelect = document.getElementById("filterSelect")
  const searchInput = document.getElementById("searchInput")
  const quickViewBtns = document.querySelectorAll(".quick-view-btn")
  const modal = document.getElementById("quickViewModal")
  const closeModal = document.querySelector(".close-modal")
  const backToTopBtn = document.getElementById("backToTop")
  const quantityBtns = document.querySelectorAll(".quantity-btn")

  // View Toggle
  gridViewBtn.addEventListener("click", () => {
    productList.className = "product-list grid-view"
    gridViewBtn.classList.add("active")
    listViewBtn.classList.remove("active")
    localStorage.setItem("viewPreference", "grid")
  })

  listViewBtn.addEventListener("click", () => {
    productList.className = "product-list list-view"
    listViewBtn.classList.add("active")
    gridViewBtn.classList.remove("active")
    localStorage.setItem("viewPreference", "list")
  })

  // Load saved view preference
  const savedView = localStorage.getItem("viewPreference")
  if (savedView === "list") {
    productList.className = "product-list list-view"
    listViewBtn.classList.add("active")
    gridViewBtn.classList.remove("active")
  }

  // Sort Products
  sortSelect.addEventListener("change", () => {
    const value = sortSelect.value
    const products = Array.from(document.querySelectorAll(".product-card"))

    products.sort((a, b) => {
      if (value === "price-low") {
        return Number.parseFloat(a.dataset.price) - Number.parseFloat(b.dataset.price)
      } else if (value === "price-high") {
        return Number.parseFloat(b.dataset.price) - Number.parseFloat(a.dataset.price)
      } else if (value === "rating") {
        return Number.parseFloat(b.dataset.rating) - Number.parseFloat(a.dataset.rating)
      }
      // Default to featured (original order)
      return 0
    })

    // Clear and re-append sorted products
    productList.innerHTML = ""
    products.forEach((product) => {
      productList.appendChild(product)
    })
  })

  // Filter Products (placeholder functionality)
  filterSelect.addEventListener("change", () => {
    const value = filterSelect.value
    const products = document.querySelectorAll(".product-card")

    products.forEach((product) => {
      if (value === "all") {
        product.style.display = "block"
      } else if (value === "in-stock") {
        // This is just a placeholder. In a real app, you'd check stock status
        product.style.display = Math.random() > 0.3 ? "block" : "none"
      } else if (value === "on-sale") {
        // This is just a placeholder. In a real app, you'd check if on sale
        const hasDiscount = product.querySelector(".discount-badge")
        product.style.display = hasDiscount ? "block" : "none"
      }
    })
  })

  // Search Functionality
  searchInput.addEventListener("input", () => {
    const searchTerm = searchInput.value.toLowerCase().trim()
    const products = document.querySelectorAll(".product-card")

    products.forEach((product) => {
      const productName = product.querySelector(".product-name").textContent.toLowerCase()
      const productDesc = product.querySelector(".product-description").textContent.toLowerCase()

      if (productName.includes(searchTerm) || productDesc.includes(searchTerm)) {
        product.style.display = "block"
      } else {
        product.style.display = "none"
      }
    })
  })

  // Quick View Modal
  quickViewBtns.forEach((btn) => {
    btn.addEventListener("click", (e) => {
      e.preventDefault()
      const productId = btn.dataset.productId
      const productCard = btn.closest(".product-card")

      // Get product details
      const productName = productCard.querySelector(".product-name").textContent
      const productImage = productCard.querySelector(".product-image").src
      const productPrice = productCard.querySelector(".current-price").textContent
      const productDesc = productCard.querySelector(".product-description").textContent
      const productRating = productCard.querySelector(".product-rating").innerHTML

      // Get form values
      const itemId = productCard.querySelector("input[name='itemId']").value
      const typeId = productCard.querySelector("input[name='typeId']").value
      const formAction = productCard.querySelector("form").action

      // Populate modal
      document.getElementById("modalProductName").textContent = productName
      document.getElementById("modalProductImage").src = productImage
      document.getElementById("modalProductPrice").textContent = productPrice
      document.getElementById("modalProductDescription").textContent = productDesc
      document.getElementById("modalProductRating").innerHTML = productRating

      // Set form values
      document.getElementById("modalAddToCartForm").action = formAction
      document.getElementById("modalItemId").value = itemId
      document.getElementById("modalTypeId").value = typeId
      document.getElementById("modalInputName").value = productName
      document.getElementById("modalInputPrice").value = productCard.dataset.price
      document.getElementById("modalInputImage").value = productCard.querySelector("input[name='imageUrl']").value

      // Generate random features (in a real app, these would come from the database)
      const features = [
        "High-resolution display",
        "Long battery life",
        "Water resistant",
        "Fast charging capability",
        "Bluetooth 5.0 connectivity",
        "1-year manufacturer warranty",
      ]

      const featuresList = document.getElementById("modalProductFeatures")
      featuresList.innerHTML = ""

      // Add 3-4 random features
      const numFeatures = 3 + Math.floor(Math.random() * 2)
      for (let i = 0; i < numFeatures; i++) {
        const li = document.createElement("li")
        li.textContent = features[i]
        featuresList.appendChild(li)
      }

      // Show modal
      modal.style.display = "block"
      document.body.style.overflow = "hidden" // Prevent scrolling
    })
  })

  // Close modal
  closeModal.addEventListener("click", () => {
    modal.style.display = "none"
    document.body.style.overflow = "auto" // Re-enable scrolling
  })

  // Close modal when clicking outside
  window.addEventListener("click", (e) => {
    if (e.target === modal) {
      modal.style.display = "none"
      document.body.style.overflow = "auto"
    }
  })

  // Back to Top Button
  window.addEventListener("scroll", () => {
    if (window.pageYOffset > 300) {
      backToTopBtn.classList.add("visible")
    } else {
      backToTopBtn.classList.remove("visible")
    }
  })

  backToTopBtn.addEventListener("click", () => {
    window.scrollTo({
      top: 0,
      behavior: "smooth",
    })
  })

  // Quantity Buttons
  document.addEventListener("click", (e) => {
    if (e.target.closest(".minus-btn")) {
      const input = e.target.closest(".quantity-selector").querySelector(".quantity-input")
      const value = Number.parseInt(input.value)
      if (value > 1) {
        input.value = value - 1
      }
    }

    if (e.target.closest(".plus-btn")) {
      const input = e.target.closest(".quantity-selector").querySelector(".quantity-input")
      const value = Number.parseInt(input.value)
      if (value < 10) {
        input.value = value + 1
      }
    }
  })

  // Add to Cart Animation
  const addToCartForms = document.querySelectorAll(".add-to-cart-form")
  addToCartForms.forEach((form) => {
    form.addEventListener("submit", (e) => {
      const button = form.querySelector(".add-to-cart-button")
      const originalText = button.innerHTML

      // Show loading state
      button.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Adding...'

      // This timeout is just for demo purposes
      // In a real app, you'd remove this and let the form submit naturally
      setTimeout(() => {
        button.innerHTML = '<i class="fas fa-check"></i> Added!'

        setTimeout(() => {
          button.innerHTML = originalText
        }, 2000)
      }, 1000)

      // Don't prevent default - let the form submit
    })
  })

  // Staggered animation for product cards
  const productCards = document.querySelectorAll(".product-card")
  productCards.forEach((card, index) => {
    card.style.opacity = "0"
    card.style.animation = `slideUp 0.5s ease forwards ${0.1 + index * 0.05}s`
  })
})

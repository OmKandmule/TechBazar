document.addEventListener("DOMContentLoaded", () => {
  // Elements
  const cartItems = document.querySelectorAll(".cart-item")
  const quantityForms = document.querySelectorAll(".quantity-form")
  const removeForms = document.querySelectorAll(".remove-form")
  const checkoutBtn = document.querySelector(".checkout-btn")

  // Add animation to cart items
  cartItems.forEach((item, index) => {
    item.style.animationDelay = `${index * 0.1}s`
  })

  // Handle quantity button clicks with animation
  quantityForms.forEach((form) => {
    form.addEventListener("submit", function (e) {
      e.preventDefault()

      const itemId = this.querySelector("input[name='itemId']").value
      const cartItem = document.querySelector(`.cart-item[data-item-id="${itemId}"]`)
      const quantityValue = cartItem.querySelector(".quantity-value")
      const itemTotal = cartItem.querySelector(".total-value")
      const priceValue = Number.parseFloat(cartItem.querySelector(".price-value").textContent.replace("₹", ""))

      // Determine if increasing or decreasing
      const isIncrease = this.classList.contains("increase-form")
      const currentQty = Number.parseInt(quantityValue.textContent)

      // Update quantity display with animation
      quantityValue.classList.add("updating")

      // Simulate the server response
      setTimeout(() => {
        const newQty = isIncrease ? currentQty + 1 : Math.max(1, currentQty - 1)
        quantityValue.textContent = newQty

        // Update total
        const newTotal = (priceValue * newQty).toFixed(2)
        itemTotal.textContent = `₹${newTotal}`

        // Update summary (this would be more complex in a real app)
        updateCartSummary()

        quantityValue.classList.remove("updating")

        // Actually submit the form after visual update
        this.submit()
      }, 300)
    })
  })

  // Handle remove button with animation
  removeForms.forEach((form) => {
    form.addEventListener("submit", function (e) {
      e.preventDefault()

      const itemId = this.querySelector("input[name='itemId']").value
      const cartItem = document.querySelector(`.cart-item[data-item-id="${itemId}"]`)

      // Add removal animation
      cartItem.style.opacity = "0"
      cartItem.style.transform = "translateX(30px)"
      cartItem.style.transition = "all 0.5s ease"

      // Submit the form after animation
      setTimeout(() => {
        this.submit()
      }, 500)
    })
  })

  // Add hover effect to checkout button
  if (checkoutBtn) {
    checkoutBtn.addEventListener("mouseenter", () => {
      const icon = checkoutBtn.querySelector("i")
      icon.style.transform = "translateX(5px)"
    })

    checkoutBtn.addEventListener("mouseleave", () => {
      const icon = checkoutBtn.querySelector("i")
      icon.style.transform = "translateX(0)"
    })
  }

  // Function to update cart summary (placeholder)
  function updateCartSummary() {
    // This would calculate totals based on current cart items
    // For now, we'll just add a visual indicator that something changed
    const summaryRows = document.querySelectorAll(".summary-row")

    summaryRows.forEach((row) => {
      row.style.backgroundColor = "#f0f7ff"
      setTimeout(() => {
        row.style.transition = "background-color 1s ease"
        row.style.backgroundColor = "transparent"
      }, 100)
    })
  }

  // Add to cart animation for recently viewed products
  const addToCartMiniButtons = document.querySelectorAll(".add-to-cart-mini")

  addToCartMiniButtons.forEach((button) => {
    button.addEventListener("click", function () {
      const originalText = this.textContent

      // Show loading state
      this.textContent = "Adding..."
      this.disabled = true

      // Simulate adding to cart
      setTimeout(() => {
        this.textContent = "Added!"

        setTimeout(() => {
          this.textContent = originalText
          this.disabled = false
        }, 1500)
      }, 800)
    })
  })

  // Add styles for quantity updating animation
  const style = document.createElement("style")
  style.textContent = `
    .quantity-value.updating {
      animation: pulse 0.5s ease;
    }
    
    @keyframes pulse {
      0% { transform: scale(1); }
      50% { transform: scale(1.2); }
      100% { transform: scale(1); }
    }
  `
  document.head.appendChild(style)
})

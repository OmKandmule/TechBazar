document.addEventListener("DOMContentLoaded", () => {
  // Track Order Button Click
  const trackButtons = document.querySelectorAll(".btn-track")
  const trackingModal = document.getElementById("trackingModal")
  const trackingOrderId = document.getElementById("trackingOrderId")

  trackButtons.forEach((button) => {
    button.addEventListener("click", function () {
      const orderId = this.getAttribute("data-order-id")
      if (trackingOrderId) {
        trackingOrderId.textContent = orderId
      }

      // Show modal with animation
      if (trackingModal) {
        trackingModal.style.display = "block"
        setTimeout(() => {
          trackingModal.classList.add("show")
        }, 10)
      }
    })
  })

  // View Details Button Click
  const detailButtons = document.querySelectorAll(".btn-details")
  const detailsModal = document.getElementById("detailsModal")
  const detailsOrderId = document.getElementById("detailsOrderId")

  detailButtons.forEach((button) => {
    button.addEventListener("click", function () {
      const orderId = this.getAttribute("data-order-id")
      if (detailsOrderId) {
        detailsOrderId.textContent = orderId
      }

      // Show modal with animation
      if (detailsModal) {
        detailsModal.style.display = "block"
        setTimeout(() => {
          detailsModal.classList.add("show")
        }, 10)
      }
    })
  })

  // Close Modal
  const closeButtons = document.querySelectorAll(".close-modal")
  const modals = document.querySelectorAll(".modal")

  closeButtons.forEach((button) => {
    button.addEventListener("click", function () {
      const modal = this.closest(".modal")
      if (modal) {
        modal.classList.remove("show")
        setTimeout(() => {
          modal.style.display = "none"
        }, 300)
      }
    })
  })

  // Close modal when clicking outside
  window.addEventListener("click", (e) => {
    modals.forEach((modal) => {
      if (e.target === modal) {
        modal.classList.remove("show")
        setTimeout(() => {
          modal.style.display = "none"
        }, 300)
      }
    })
  })

  // Order Card Hover Animation
  const orderCards = document.querySelectorAll(".order-card")
  orderCards.forEach((card) => {
    card.addEventListener("mouseenter", function () {
      this.style.transform = "translateY(-5px)"
      this.style.boxShadow = "0 8px 25px rgba(0, 0, 0, 0.1)"
    })

    card.addEventListener("mouseleave", function () {
      this.style.transform = "translateY(0)"
      this.style.boxShadow = "0 5px 15px rgba(0, 0, 0, 0.05)"
    })
  })

  // Timeline Animation
  const timelineItems = document.querySelectorAll(".timeline-item")
  let delay = 0

  timelineItems.forEach((item) => {
    setTimeout(() => {
      item.style.opacity = "0"
      item.style.transform = "translateY(20px)"
      item.style.transition = "opacity 0.5s ease, transform 0.5s ease"

      setTimeout(() => {
        item.style.opacity = "1"
        item.style.transform = "translateY(0)"
      }, 50)
    }, delay)

    delay += 200
  })

  // Download Invoice Button
  const downloadBtn = document.querySelector(".btn-download")
  if (downloadBtn) {
    downloadBtn.addEventListener("click", () => {
      alert("Invoice download functionality would be implemented here.")
    })
  }

  // Reorder Button
  const reorderBtn = document.querySelector(".btn-reorder")
  if (reorderBtn) {
    reorderBtn.addEventListener("click", () => {
      alert("Reorder functionality would be implemented here.")
    })
  }

  // Contact Support Button
  const contactBtn = document.querySelector(".btn-contact")
  if (contactBtn) {
    contactBtn.addEventListener("click", () => {
      alert("Contact support functionality would be implemented here.")
    })
  }

  // Add animation to empty orders icon if it exists
  const emptyIcon = document.querySelector(".empty-icon")
  if (emptyIcon) {
    emptyIcon.style.animation = "fadeIn 1s ease, slideUp 1s ease"
  }
})

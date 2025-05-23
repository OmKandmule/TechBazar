document.addEventListener("DOMContentLoaded", () => {
  // Elements
  const checkoutForm = document.getElementById("checkoutForm");
  const placeOrderBtn = document.querySelector(".place-order-btn");

  // Form field animations
  const formInputs = document.querySelectorAll("input, select, textarea");
  formInputs.forEach((input) => {
    // Add focus effect
    input.addEventListener("focus", function () {
      this.parentElement.classList.add("focused");
    });

    input.addEventListener("blur", function () {
      if (!this.value) {
        this.parentElement.classList.remove("focused");
      }
    });

    // Check if input already has value on page load
    if (input.value) {
      input.parentElement.classList.add("focused");
    }
  });

  // Payment method selection
  const paymentOptions = document.querySelectorAll(".payment-option input[type='radio']");
  paymentOptions.forEach((option) => {
    option.addEventListener("change", function () {
      // Update payment method icons
      document.querySelectorAll(".payment-icon").forEach((icon) => {
        icon.style.color = "#0066cc";
      });
      
      if (this.checked) {
        const paymentIcon = this.nextElementSibling.querySelector(".payment-icon");
        paymentIcon.style.color = "#ff6600";
      }
    });
  });

  // Handle form submission
  if (checkoutForm) {
    checkoutForm.addEventListener("submit", function (e) {
      // Don't prevent default - let the form submit normally to ordersuccess.jsp
      
      // Show loading state on button
      if (placeOrderBtn) {
        const originalButtonText = placeOrderBtn.innerHTML;
        placeOrderBtn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Processing...';
        placeOrderBtn.disabled = true;
        
        // Reset button state after a short delay (in case submission takes time)
        setTimeout(() => {
          placeOrderBtn.innerHTML = originalButtonText;
          placeOrderBtn.disabled = false;
        }, 5000);
      }
    });
  }

  // Add styles for input focus
  const style = document.createElement("style");
  style.textContent = `
    .form-group.focused label {
      color: #0066cc;
    }
    
    .form-group.focused input,
    .form-group.focused select,
    .form-group.focused textarea {
      border-color: #0066cc;
      box-shadow: 0 0 0 3px rgba(0, 102, 204, 0.1);
    }
  `;
  document.head.appendChild(style);
});
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { timeout: Number }

  connect() {
    this.timeout = this.timeoutValue || 5000; // Default to 5 seconds if no value is provided

    this.hideAfterTimeout();
  }

  hideAfterTimeout() {
    setTimeout(() => {
      this.element.classList.remove('show');
      this.element.classList.add('fade');
      setTimeout(() => {
        this.element.remove();
      }, 150); // Time for the fade-out animation to complete
    }, this.timeout);
  }
}

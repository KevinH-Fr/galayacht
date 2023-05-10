
import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form-refresh"
export default class extends Controller {
  connect() {
    this.element.reset()
  }
}
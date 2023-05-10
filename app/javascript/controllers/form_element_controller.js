
import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form-element"
export default class extends Controller {
  static targets = ["remoteBtn"]
  connect() {
    this.remoteBtnTarget.hidden = true
  }

  autosubmit() {
    this.remoteBtnTarget.click()
  }
}
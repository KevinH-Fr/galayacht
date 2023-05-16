
import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="option-role"
export default class extends Controller {

  static targets = ["bailleur"];

  connect() {
    console.log("hello from option role controller js")
  }

  toggleBailleur() {
    console.log("click bailleur")
    this.bailleurTarget.visible = true;
  }

}
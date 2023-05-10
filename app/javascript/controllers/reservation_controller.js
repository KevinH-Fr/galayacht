import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  // champs dans le form resultat
  static targets = ["debut", "fin", "prixjourInitial", "prixsemaineInitial", "prix"]

  connect() {
   console.log("Hello from reservation ")       
  }

  calculatePrix() {
    const debutValue = this.debutTarget.value;
    const finValue = this.finTarget.value;

    const prixJourInitial = this.prixjourInitialTarget.value;
    const prixSemaineInitial = this.prixsemaineInitialTarget.value;

    // count nb jours
    const timeDelta = Date.parse(finValue) - Date.parse(debutValue);
    const joursDelta = Math.ceil(timeDelta / (1000 * 3600 * 24));

    console.log(debutValue, finValue, joursDelta);

    // maj de la div nbJours pour info
    const nbJoursDiv = document.getElementById("nbJours");
    nbJoursDiv.textContent = joursDelta;

    // prix jour ou semaine 
    let prixFinal;
    let nbSemaines;
    let joursRestants;

    if (joursDelta <= 6) {
        prixFinal = joursDelta * prixJourInitial;
    } else {

      nbSemaines = Math.floor(joursDelta / 7);
      joursRestants = joursDelta % 7
      prixFinal = ( nbSemaines * prixSemaineInitial ) + ( joursRestants * prixJourInitial ) 
      
    }

   // console.log("nb semaine: " + nbSemaines + " - nb jours: " + joursRestants)
    this.prixTarget.value = prixFinal ;

    // maj de la div prixtotal pour info
    const prixTotalDiv = document.getElementById("prixTotal");
    prixTotalDiv.textContent = prixFinal;

  }
  
}

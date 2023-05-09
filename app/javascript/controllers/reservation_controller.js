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

    // count nb jours
    const timeDelta = Date.parse(finValue) - Date.parse(debutValue);
    const joursDelta = Math.ceil(timeDelta / (1000 * 3600 * 24));

    console.log(debutValue, finValue, joursDelta);

    // maj de la div nbJours pour info
    const nbJoursDiv = document.getElementById("nbJours");
    nbJoursDiv.textContent = joursDelta;

    // prix jour ou semaine 

    /* 
      verifier si infieureur ou egale à 6
        si vrai nbJours x prix jour

        si faux compter le nb de semaines pleines
          y ajouter le nb de jours restants
          

    */

    // maj prix 
    this.prixTarget.value = prixJourInitial * joursDelta ;


  }
  
}

// besoin de la val date debut loc
// besoin de la val date fin loc
// besoin du nb de jour
// besoin du prix jour
// besoin du prix semaine

// selection auto du prix adequate si plus ou moins 7 jours
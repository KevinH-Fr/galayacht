import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  // champs dans le form resultat
  static targets = [   
    "debut", "fin",
    "prixjourInitial", "prixsemaineInitial",
    "prixjourHautesaisonInitial", "prixsemaineHautesaisonInitial",
    "prix",
  ];

  connect() {
   console.log("Hello from reservation ")       
  }

  calculatePrix() {
    const debutValue = this.debutTarget.value;
    const finValue = this.finTarget.value;

    const prixJourInitial = this.prixjourInitialTarget.value;
    const prixSemaineInitial = this.prixsemaineInitialTarget.value;
    
    const prixJourHautesaisonInitial = this.prixjourHautesaisonInitialTarget.value;
    const prixSemaineHauteaisonInitial = this.prixsemaineHautesaisonInitialTarget.value;

    // saison haute 01 juin
    const debutHauteSaison = new Date(`06/01/${new Date().getFullYear()}`);
    
    // maj de la div saison pour info
    const saisonDiv = document.getElementById("saison");

    let tarifJourRetenu;
    let tarifSemaineRetenu;

    // Vérification si finValue est inférieure à debutHauteSaison et select tarif lié
    if (Date.parse(finValue) <  Date.parse(debutHauteSaison)) {
      saisonDiv.textContent = 'hors haute saison';
      tarifJourRetenu = prixJourInitial;
      tarifSemaineRetenu = prixSemaineInitial;

    } else {
      saisonDiv.textContent = 'haute saison';
      tarifJourRetenu = prixJourHautesaisonInitial;
      tarifSemaineRetenu = prixSemaineHauteaisonInitial;
    }

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
        prixFinal = joursDelta * tarifJourRetenu;
    } else {

      nbSemaines = Math.floor(joursDelta / 7);
      joursRestants = joursDelta % 7
      prixFinal = ( nbSemaines * tarifSemaineRetenu ) + ( joursRestants * tarifJourRetenu ) 
      
    }

   // maj field prix avec valeur calculée
    this.prixTarget.value = prixFinal ;

    // maj de la div prixtotal pour info
    const prixTotalDiv = document.getElementById("prixTotal");
    prixTotalDiv.textContent = prixFinal;

  }
  
}

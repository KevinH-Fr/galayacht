// app/javascript/controllers/video_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["video"];

  connect() {
    this.options = {
      root: null,
      rootMargin: "0px",
      threshold: 0.1, // Adjust this threshold as needed
    };

    this.observer = new IntersectionObserver(this.handleIntersection.bind(this), this.options);

    this.playVideo();
    this.observeVideo();
  }

  playVideo() {
    if (this.videoTarget) {
      this.videoTarget.play();
    }
  }

  pauseVideo() {
    if (this.videoTarget) {
      this.videoTarget.pause();
    }
  }

  observeVideo() {
    if (this.videoTarget) {
      this.observer.observe(this.videoTarget);
    }
  }

  handleIntersection(entries) {
    entries.forEach((entry) => {
      if (entry.isIntersecting) {
        this.playVideo();
     //   console.log("Video play");
      } else {
        this.pauseVideo();
    //    console.log("Video pause");
      }
    });
  }
}

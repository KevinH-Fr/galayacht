// app/javascript/controllers/video_controller.js
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["video"];

  connect() {
    this.options = {
      root: null,
      rootMargin: "0px",
      threshold: 0.1, // Adjust this threshold as needed
    };

    this.observer = new IntersectionObserver(this.handleIntersection.bind(this), this.options);

    // Check if autoplay is allowed and play the video
    this.checkAutoplayAndPlay();
    
    // Observe the video element
    this.observeVideo();
  }

  playVideo() {
   // console.log("play video");
    if (this.videoTarget) {
      this.videoTarget.play().catch((error) => {
        // Handle the error, e.g., log it or display a message to the user
        console.error("Video playback error:", error);
      });
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
        // Start video playback when it's in the viewport
        this.playVideo();
      }
    });
  }

  checkAutoplayAndPlay() {
    if (this.videoTarget) {
      // Check if the browser allows autoplay
      const canAutoplayPromise = this.videoTarget.play();
      if (canAutoplayPromise !== undefined) {
        canAutoplayPromise
          .then(() => {
            // Autoplay is allowed, so we can start the video
            this.playVideo();
            
          })
          .catch((error) => {
            // Autoplay is not allowed; handle the error or show a play button
            console.error("Autoplay not allowed:", error);
            // Optionally, you can display a play button and let the user initiate playback
            // this.showPlayButton();
          });
      }
    }
  }

  // Optionally, you can implement a showPlayButton() method to let users initiate playback.
}

import { Application, Controller } from "@hotwired/stimulus"

const application = Application.start()

application.register("nav", class extends Controller {
  static targets = ["menuText"]

  connect(){
  }

  handleOnClick(){
    this.menuTextTarget.style.display = "none"
  }
});

application.register("train", class extends Controller {
  static targets = ["doc"]
  connect() {

  }
  handleFiles(e) { 
    console.log(this.docTarget.files[0]);
  }
})

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }

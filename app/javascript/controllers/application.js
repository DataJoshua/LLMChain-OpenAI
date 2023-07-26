import { Application, Controller } from "@hotwired/stimulus"

const application = Application.start()

application.register("nav", class extends Controller {
  static targets = ["menu"]

  connect(){
  }

  handleOnClick(){
    this.menuTarget.classList.toggle("hidden");
  }
})

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }

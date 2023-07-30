import { Application, Controller } from "@hotwired/stimulus"

const application = Application.start()

application.register("nav", class extends Controller {
  static targets = ["menuText"]

  connect(){
  }

  handleOnClick(){
    this.menuTextTarget.style.display = "none"
  }
})

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }

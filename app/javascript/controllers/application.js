import { Application, Controller } from "@hotwired/stimulus"

import { createClient } from '@supabase/supabase-js';
import { nanoid } from "nanoid";

const supabase = createClient(ENV_VARS.SUPA_URL, ENV_VARS.SUPA_KEY)


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
  static targets = ["doc", "input"]
  connect() {

  }
  async handleFiles(e) { 
    const file = this.docTarget.files[0];
    console.log(file);

    const { data: res , error} = await supabase.storage
                                        .from("docs")
                                        .upload(`public/${nanoid()}-${file.name}`, file, {
                                          cacheControl: '3600',
                                          upsert: false
                                        });
    if(!error) {
      const { path } = res;

      const {  data : { publicUrl }} = supabase
                                    .storage
                                    .from("docs")
                                    .getPublicUrl(path)
      console.log(publicUrl);
      this.inputTarget.value = publicUrl;
    }
  }
})

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }

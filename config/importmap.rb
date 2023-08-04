# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "@supabase/supabase-js", to: "https://ga.jspm.io/npm:@supabase/supabase-js@2.31.0/dist/module/index.js"
pin "@supabase/functions-js", to: "https://ga.jspm.io/npm:@supabase/functions-js@2.1.2/dist/module/index.js"
pin "@supabase/gotrue-js", to: "https://ga.jspm.io/npm:@supabase/gotrue-js@2.46.1/dist/module/index.js"
pin "@supabase/postgrest-js", to: "https://ga.jspm.io/npm:@supabase/postgrest-js@1.7.2/dist/module/index.js"
pin "@supabase/realtime-js", to: "https://ga.jspm.io/npm:@supabase/realtime-js@2.7.3/dist/module/index.js"
pin "@supabase/storage-js", to: "https://ga.jspm.io/npm:@supabase/storage-js@2.5.1/dist/module/index.js"
pin "cross-fetch", to: "https://ga.jspm.io/npm:cross-fetch@3.1.8/dist/browser-ponyfill.js"
pin "es5-ext/global", to: "https://ga.jspm.io/npm:es5-ext@0.10.62/global.js"
pin "websocket", to: "https://ga.jspm.io/npm:websocket@1.0.34/lib/browser.js"
pin "nanoid", to: "https://ga.jspm.io/npm:nanoid@3.3.6/index.browser.js"

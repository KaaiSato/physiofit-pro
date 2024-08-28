# Pin npm packages by running ./bin/importmap

pin "application", to:"application.js"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "@rails/actioncable", to: "actioncable.esm.js"
pin_all_from "app/javascript/channels", under: "channels"
pin "@rails/ujs", to: "rails-ujs.js"
pin "@rails/activestorage", to: "activestorage.js"

pin "channels/comment_channel", to: "channels/message_channel.js" 
pin "channels/consumer", to: "channels/consumer.js" 

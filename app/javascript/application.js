// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import '@hotwired/turbo-rails';
import "controllers"
//= require rails-ujs
//= require turbolinks
//= require_tree .
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

import "channels/chat_channel"

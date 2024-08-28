// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import '@hotwired/turbo-rails';
import "controllers";
import * as Rails from "@rails/ujs"; 
import * as ActiveStorage from "@rails/activestorage";
import "channels";

import "channels/message_channel" 
import "channels/consumer"

Rails.start();
Turbolinks.start();
ActiveStorage.start();

/*
//= require rails-ujs
//= require turbolinks
//= require_tree .
*/

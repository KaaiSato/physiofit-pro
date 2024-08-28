import consumer from "channels/consumer"

if(location.pathname.match(/\/chats\/\d/)){
  
consumer.subscriptions.create("MessageChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    console.log(data)
  }
});
}
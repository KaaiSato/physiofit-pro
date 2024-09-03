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
    console.log(data);
    let html;
    const profileImageUrl = data.sender_profile_image_url

    if (data.sender_type === "Trainer") {
      html = `
        <div class="message-row trainer-message">
         <div class="message-content">
          <div class="profile-image">
           <img src="${profileImageUrl}" alt="Trainer" class="profile-img">
          </div>
          <div class="bubble">
            <p>${data.content}</p>
          </div>
         </div>
        </div>
      `;
    } else {
      html = `
        <div class="message-row user-message">
         <div class="message-content">
          <div class="bubble">
           <p>${data.content}</p>
          </div>
          <div class="profile-image">
            <img src="${profileImageUrl}" alt="User" class="profile-img">
          </div>
         </div>
       </div>
      `;
    }

    const messages = document.getElementById("messages-list");
    if (messages) {
      messages.insertAdjacentHTML('beforeend', html);
      scrollToBottom(); 
    } else {
      console.error("Could not find element with ID 'messages-list'");
    }

    const messageForm = document.getElementById("message-form");
    if (messageForm) {
      messageForm.reset();
    } else {
      console.warn("Message form not found");
    }
  }
});
}
function scrollToBottom() {
  const messages = document.getElementById("messages-list");
  messages.scrollTop = messages.scrollHeight;
}

document.addEventListener("DOMContentLoaded", () => {
  scrollToBottom();
});
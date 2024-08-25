import consumer from "./consumer"

document.addEventListener("turbolinks:load", () => {
  const chatContainer = document.getElementById('chat-container')
  if (chatContainer) {
    const chatId = chatContainer.dataset.chatId

    consumer.subscriptions.create({ channel: "ChatChannel", chat_id: chatId }, {
      received(data) {
        const messagesList = document.querySelector(".messages-list")
        messagesList.insertAdjacentHTML("beforeend", data)
      }
    })
  }
})

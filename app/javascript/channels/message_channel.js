import consumer from "./consumer"
//
// consumer.subscriptions.create("MessageChannel", {
//   connected() {
//     // Called when the subscription is ready for use on the server
//   },
//
//   disconnected() {
//     // Called when the subscription has been terminated by the server
//   },
//
//   received(data) {
//     // Called when there's incoming data on the websocket for this channel
//   }
// });

$(document).on('turbolinks:load', () => {
  $('[data-channel-subscribe="conversation"]').each(function(index, element) {
    var $element = $(element),
      $chatList = $("#message_list"),
      $form = $("#new_message"),

      conversation_id = $element.data('conversation-id'),
      user_id = $element.data('user-id');

    consumer.subscriptions.create(
      {
        channel: "MessageChannel",
        conversation: conversation_id
      },
      {
        received: function(data) {
          if (data.sender_id == user_id) {
            $chatList.append(data.sender)
          } else {
            $chatList.append(data.receiver)
          }

          $form[0].reset();
          $chatList.animate({
            scrollTop: $chatList.prop("scrollHeight")
          }, 1000)
        }
      }
    )

  })
});
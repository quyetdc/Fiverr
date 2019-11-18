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
  $('[data-channel-subscribe="order"]').each(function(index, element) {
    var $element = $(element),
      $chatList = $("#comment-list"),
      $form = $("#new-comment"),


      order_id = $element.data('order-id');

    consumer.subscriptions.create(
      {
        channel: "CommentChannel",
        order: order_id
      },
      {
        received: function(data) {
          $chatList.append(data.message);

          $form[0].reset();
          $chatList.animate({
            scrollTop: $chatList.prop("scrollHeight")
          }, 1000)
        }
      }
    )

  })
});

function configurePaymentDetails() {
  if($('#terms').is(':checked')) {
    if($('input[type=radio][data-free=true]').is(':checked')) {
      $("#payment-details").hide();
    } else {
      $('input[type=radio][data-free=false]').each(function(index, element) {
        if($(this).is(':checked')) {
          $("#email-field").show();
          $("#payment-details").show();
        }
      })
    };
    $("#terms-panel").hide();
    $("#register-button").show();
  } else {
    $("#terms-panel").show();
    $("#email-field").hide();
    $("#register-button").hide();
    $("#payment-details").hide();
  }
}

$(document).on('change', '#terms', function() {
  configurePaymentDetails();
});

$(document).on('change', 'input[type=radio]', function() {
  configurePaymentDetails();
});


jQuery(function ($) {
  var show_error, stripeResponseHandler;

  $("#new_hotspot_registration").submit(function (event) {
    var $form;
    $form = $(this);

    if(!$('input[type=radio][data-free=true]').is(':checked')) {
      $form.find("input[type=submit]").prop("disabled", true);
      Stripe.card.createToken($form, stripeResponseHandler);
      return false;
    } else {
      $form.get(0).submit();
    };
  });

  stripeResponseHandler = function (status, response) {
    var $form, token;
    $form = $("#new_hotspot_registration");

    if (response.error) {
      show_error(response.error.message);
      $form.find("input[type=submit]").prop("disabled", false);
    } else {
      token = response.id;
      $form.append($("<input type=\"hidden\" name=\"hotspot_registration[card_token]\" />").val(token));
      $("[data-stripe=number]").remove();
      $("[data-stripe=cvv]").remove();
      $("[data-stripe=exp-year]").remove();
      $("[data-stripe=exp-month]").remove();
      $form.get(0).submit();
    }
    return false;
  };

  show_error = function (message) {
    $("#flash-messages").html('<div class="alert alert-warning"><a class="close" data-dismiss="alert">×</a><div id="flash_alert">' + message + '</div></div>');
    $('.alert').delay(5000).fadeOut(3000);
    return false;
  };
});

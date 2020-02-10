$(document).on('turbolinks:load', function() {
  var form = $("#credit_form"),
      number = form.find('input[name="number"]'),
      cvc = form.find('input[name="securitycode"]'),
      exp_month = form.find('select[name="[expiredate(2i)]"]'),
      exp_year = form.find('select[name="[expiredate(1i)]"]');
  $("#token_submit").click(function() {
    form.find("input[type=submit]").prop("disabled", true);

    var card = {
        number:    number.val(),
        cvc:       cvc.val(),
        exp_month: exp_month.val(),
        exp_year:  exp_year.val()
    };
    Payjp.createToken(card, function(s, response) {
      if (response.error) {
        form.find('.payment-errors').text(response.error.message);
        form.find('button').prop('disabled', false);
      }
      else {
        $("#number").removeAttr("name");
        $("#securitycode").removeAttr("name");
        $("#_expiredate_2i").removeAttr("name");
        $("#_expiredate_1i").removeAttr("name");

        var token = response.id;

        form.append($('<input type="hidden" name="payjpToken" />').val(token));
        form.get(0).submit();
      }
    });
  });
});

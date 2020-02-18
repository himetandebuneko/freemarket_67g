$(document).on('turbolinks:load', function() {

  $("#credits_send_btn").on("click",function(e){
    e.preventDefault();
    Payjp.setPublicKey('pk_test_44fcb39a49afbd7cd6794ea7');
    var card = {
      number:    $('#number').val(),
      cvc:       $('#cvc').val(),
      exp_month: $('#card_month').val(),
      exp_year:  $('#card_year').val()
    }

    Payjp.createToken(card, function(s, response) {

      if (response.error) {
        $('#credits_send_btn').prop('disabled', false);
        alert("カード情報が不十分のため、登録できませんでした。");
      }
      else {
        $('#number').removeAttr('name');
        $('#cvc').removeAttr('name');
        $('#card_month').removeAttr('name');
        $('#card_year').removeAttr('name');

        $('#credit_form').append(
          $('<input type="hidden" name="payjpToken">').val(response.id)
        );
        $('#credit_form').get(0).submit(function(){
          alert("登録しました。");
        });
      }
    });
  });
});

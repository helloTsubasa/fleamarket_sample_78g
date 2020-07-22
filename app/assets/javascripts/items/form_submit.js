$(document).on('turbolinks:load', ()=> {
  $(function() {
    $('.submit_btn').prop("disabled", true);
    $('.required').change(function() {
      let flag = true
      $('.required').each(function(e){
        if($('.required').eq(e).val() === "") {
          flag = false;
        }
      });
      if (flag) {
        $('.submit_btn').prop("disabled", false);
      }
      else {
        $('.submit_btn').prop("disabled", true);
      }
    });
  });
});
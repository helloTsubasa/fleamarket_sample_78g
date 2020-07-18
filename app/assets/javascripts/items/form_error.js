//  $(function(){
//    $("#image-box__container").validate({
//      rules: {
//        "item[image]": {
//         required: true
//       }
//      },
//      messages: {
//       "item[image]": {
//         required: "姓を入力してください"
//       },
//     errorClass: "invalid",
//     errorElement: "p",
//     validClass: "valid",

//     errorPlacement: function (error, element) {
//       if (element.attr("name") == "user[lastname]" || element.attr("name") == "user[firstname]") {
//         error.insertAfter("#name_error"); // 指定した要素の後ろにエラーを表示
//       } else {
//         error.insertAfter(element);
//       }
//     }
//    });
// $("#lastname, #firstname").blur(function () {
//   $(this).valid();
// })
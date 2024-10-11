$(function () {
    $("#chk_payment").change(function () {
      if ($(this).prop("checked")) {
        $("label[for='chk_payment']").addClass("divClick");
      } else {
        $("label[for='chk_payment']").removeClass("divClick");
      }
    });

    $("#chk_agree").change(function () {
      if ($(this).prop("checked")) {
        $("label[for='chk_agree']").addClass("checkedLabel");
      } else {
        $("label[for='chk_agree']").removeClass("checkedLabel");
      }
    });


  });
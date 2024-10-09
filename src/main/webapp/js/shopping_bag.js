 $(document).ready(function () {
    const $checkbox = $("#bascket_all_checkbox_hidden");
    const $control = $("#bascket_all_checkbox_control");
    const $labelcontrol = $("#bascket_all_checkbox");

    // 체크박스 상태가 변경될 때 data-state를 변경
    $checkbox.change(function () {
      if ($checkbox.is(":checked")) {
        $labelcontrol.attr("data-state", "checked");
        $control.attr("data-state", "checked");
      } else {
        $labelcontrol.attr("data-state", "unchecked");
        $control.attr("data-state", "unchecked");
      }
    });

    // 페이지 로드 시 초기 상태 설정
    if ($checkbox.is(":checked")) {
      $labelcontrol.attr("data-state", "checked");
      $control.attr("data-state", "checked");
    } else {
      $labelcontrol.attr("data-state", "unchecked");
      $control.attr("data-state", "unchecked");
    }
});
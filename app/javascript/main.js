window.showAlertToast = function showAlertToast(text) {
  Toastify({
    text: text,
    duration: 5000,
    close: true,
    gravity: "bottom",
    position: "right",
    stopOnFocus: true,
    className : "alert"
  }).showToast();
}

window.showNoticeToast = function showNoticeToast(text) {
  Toastify({
    text: text,
    duration: 5000,
    close: true,
    gravity: "bottom",
    position: "right",
    stopOnFocus: true,
    className : "notice"
  }).showToast();
}

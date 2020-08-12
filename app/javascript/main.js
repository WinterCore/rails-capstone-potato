window.showAlertToast = function showAlertToast(text) {
  Toastify({
    text: text,
    duration: 3000,
    close: true,
    gravity: "top",
    position: "right",
    stopOnFocus: true,
    className : "alert"
  }).showToast();
}

window.showNoticeToast = function showNoticeToast(text) {
  Toastify({
    text: text,
    duration: 3000,
    close: true,
    gravity: "top",
    position: "right",
    stopOnFocus: true,
    className : "notice"
  }).showToast();
}

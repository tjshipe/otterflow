

$(document).ready(function() {
  if ($('#new_user').length) {
function validate() {
 var password = $('input[name="user[password]"]').val();
    if (!(/.{6,}/.test(password))) {
     event.preventDefault();
     alert("Your password must be at least 6 characters");
    }
}
  console.log("file loaded");
  $('#new_user').submit(function(event) {
    validate();
  });
}
});

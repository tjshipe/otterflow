function upvote(event){
  event.preventDefault();
  var id = $(this).closest('span').attr('id');
  var voteType = $(this).closest('div').attr('class');
  var voteDirection = $(this).attr('class');
  $.ajax({
    url: '/votes',
    type: 'post',
    data: {object_id: id, voteDirection: voteDirection, voteType: voteType},
    success: function() {
      alert('success');
    },
    error: function() {
      alert('error');
    }
  })
};


$(document).ready(function(){
  $('.upvote').on('click', upvote);
});

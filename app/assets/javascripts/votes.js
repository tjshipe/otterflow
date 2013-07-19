function vote(event){
  event.preventDefault();
  var id = $(this).closest('span').attr('id');
  var voteType = $(this).closest('div').attr('class');
  var voteDirection = $(this).attr('class');
  var voteElement = $(this);
  $.ajax({
    url: '/votes',
    type: 'post',
    dataType: "json",
    data: {object_id: id, voteDirection: voteDirection, voteType: voteType},
    success: function(data, status, xhr) {

      voteElement.children('.voteTotal').html(data.vote_count);
    },
    error: function() {
      alert('error');
    }
  })
};


$(document).ready(function(){
  $('.votes').on('click', vote);
});

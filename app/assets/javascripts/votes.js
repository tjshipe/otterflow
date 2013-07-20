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
      voteElement.siblings('.voteTotal').html(data.vote_count);
      updateIconColor(voteElement, voteDirection);
    },
    error: function() {
      alert('error');
    }
  });
};

function updateIconColor(element, direction) {
  element.siblings('a').removeClass('upvoted downvoted');
  if(direction == 'upvote') {
    if(element.hasClass('upvoted')) {element.removeClass('upvoted');}
    else {element.addClass('upvoted');}
  }
  else if(direction == 'downvote') {
    if(element.hasClass('downvoted')) {element.removeClass('downvoted');}
    else {element.addClass('downvoted');}
  }
  else {element.removeClass('upvoted downvoted');}
};


$(document).ready(function(){
  $('.votes a').on('click', vote);
});

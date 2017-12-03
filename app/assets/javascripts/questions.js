$('.vote-answer').click(function(e){
  var id = e.target.id;
  var type = id.match(/^downvote/) ? 'downvote' : 'upvote';
  var a_id = id.replace(/[^0-9]/g, '')
  var url = '/' + type + '/' + a_id;
  $.ajax({
    url: url,
    method: 'POST',
    success: function(e){
    },
    error: function(e){}
  });
});

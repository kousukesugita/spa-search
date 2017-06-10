// https://github.com/wbotelhos/raty
$('.star').raty({
  size : 36,
  starOff : '/assets/star-off.png',
  starOn : '/assets/star-on.png',
  scoreName : 'review[point]',
  click : function(score, event) {
    $.post( '/reviews', { onsen_code: $(this).data('onsen-code'), score: score } );
  }
});
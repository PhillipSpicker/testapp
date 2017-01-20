//file contains any site-wide js functions
var refreshRating = function() {
  $('.rating').raty({ path: '/assets', scoreName: 'comment[rating]' });
  $('.rated').raty({ path: '/assets',
    readOnly: true,
    score: function() {
      return $(this).attr('data-score');
      }
    });
};


$(document).on('turbolinks:load ajaxSucess', function(){
  $(".alert").delay(4000).fadeOut("fast");
  /* raty plugin */
  refreshRating();

  $('.img-zoom').elevateZoom({
    zoomType				: "lens",
    lensShape : "round",
    lensSize    : 200
  });

});

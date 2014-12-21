$('#myTab a').click(function (e) {
	e.preventDefault()
	$(this).tab('show')
})

// learn bootcamp jquery 1
$(document).ready(function () {
	$(".a").each(function() {
		$(this).click(function (e) {
			var detail = $(this).parents('.detail').find('.b');
			e.preventDefault();
			detail.slideDown(300);
		});
	});
});

// loading page
$(document).ready(function () {
		$(window).load(function() { $("#loading").fadeOut(1000); 
	});
});

// back to top
$(function(){
	$(document).on( 'scroll', function(){
		if ($(window).scrollTop() > 100) {
			$('.scroll-top-wrapper').addClass('show');
		} else {
			$('.scroll-top-wrapper').removeClass('show');
		}
	});
	$('.scroll-top-wrapper').on('click', scrollToTop);
});
 
function scrollToTop() {
	verticalOffset = typeof(verticalOffset) != 'undefined' ? verticalOffset : 0;
	element = $('body');
	offset = element.offset();
	offsetTop = offset.top;
	$('html, body').animate({scrollTop: offsetTop}, 500, 'linear');
}

$(function () {
  $('[data-toggle="tooltip"]').tooltip()
})

$(document).ready(function (){
	var config = {
      '.chosen-select'           : {},
      '.chosen-select-deselect'  : {allow_single_deselect:true},
      '.chosen-select-no-single' : {disable_search_threshold:10},
      '.chosen-select-no-results': {no_results_text:'Oops, nothing found!'},
      '.chosen-select-width'     : {width:"95%"}
    }
    for (var selector in config) {
      $(selector).chosen(config[selector]);
    }
})
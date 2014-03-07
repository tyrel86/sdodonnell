$(document).ready( function() {
	$('#magazine').turn({gradients: true, acceleration: true});
	$('.read_book').click(function() {
		function exterminate_close_button() {
			$('.close-modal').css('display','none')
			$('#magazine').css('width','866px')
		}
		setTimeout(exterminate_close_button,100)
	})
})

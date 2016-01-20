$(document).ready(function(){

	$('.login-link').on('click', function(){
		$('.signup-show').hide();
		$('.login-show').show();
	});

	$('.signup-link').on('click', function(){
		$('.login-show').hide();
		$('.signup-show').show();
	});

});
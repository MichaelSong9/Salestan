// Progress bar

			var progress_key = '';

			$(document).ready(function() {
			    $("#pb1").progressBar({ barImage: '_shared/jQuery/ProgressBar/images/progress.png', showText: true });
			});
			


// Image preloader

        jQuery.preloadImages = function()
	{
	  for(var i = 0; i<arguments.length; i++)
	  {
		jQuery("<img>").attr("src", arguments[i]);
	  }
	}
	$.preloadImages("../images/sub_input.png", "images/sub_button.png", "images/notify_but_2.png"); // The list of images to preload
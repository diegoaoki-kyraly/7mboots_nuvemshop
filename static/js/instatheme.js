window.tiendaNubeInstaTheme = (function($, window) {
	return {
		waitFor: function() {
			return [window.homeSlider];
		},
		handlers: function(instaElements) {
			return {
				logo: new instaElements.Logo({
					$storeName: $('#no-logo'),
					$logo: $('#logo')
				}),
				slider: new instaElements.Slider(window.homeSlider),
				slider_auto: new instaElements.AutoSliderCheckbox({
					slider: 'slider'
				})
			};
		}
	};
})(jQuery, window);
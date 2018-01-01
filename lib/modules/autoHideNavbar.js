;( function( $, window, document, undefined ) {

	"use strict";

		var pluginName = "autoHideNavbar",
			$window = $(window),
			_elementHeight = null,
			_visible = true,
			_disabled = true,
			_showNavScrollTop = 0,
			_hideNavScrollTop = 0,
			_previousScrollTop = 0;

		var defaults = {
		};

		function Plugin ( element, options ) {
			this.element = $(element);
			this.settings = $.extend( {}, defaults, options );
			this._defaults = defaults;
			this._name = pluginName;
			this.init();
		}

		$.extend( Plugin.prototype, {
			init: function() {
				this.element.css({'transition':'top 200ms linear 0s'});
				_elementHeight= this.element.height();
				_previousScrollTop=$window.scrollTop();
				$(document).on('scroll.' + pluginName, this.onScroll.bind(this));
				this.bindResize();
				return this.element;
			},
			
			bindResize: function() {
				var selectors=['.visible-sm'];
				var rules = document.styleSheets[0].cssRules;
				var l=rules.length;
				var i=0;
				while(0<l--){
					var r=rules[i++];
					if (r.type==4) {
						var selector=r.cssRules[0].selectorText;
						if (selectors.indexOf(selector) != -1) {
							var mm=window.matchMedia(r.media.mediaText.match(/\(max-width: \w+\)/)[0]);
							mm.addListener(this.toggle.bind(this));
							this.toggle(mm);
						}
					}
				}

				$window.on('resize.' + pluginName, this.onResize.bind(this));
				this.onResize();
			},

			toggle: function(mq){
				_disabled = !mq.matches;
				if (!mq.matches && !_visible) {
					this.showNav();
				}
			},

			showNav: function() {
				this.element.removeClass('navbar-hidden').css({"top":"0px"});
				_visible = true;
			},

			hideNav: function() {
				this.element.addClass('navbar-hidden').css({"top":-1 * _elementHeight+'px'});
				_visible = false;
			},

			onResize: function() {
				var scrollTop = $window.scrollTop();
				_hideNavScrollTop=scrollTop + _elementHeight/2;
				_showNavScrollTop=scrollTop - _elementHeight/2;
			},

			onScroll: function() {
			if (!_disabled) {
				var scrollTop = $window.scrollTop(),
				scrollDelta = scrollTop - _previousScrollTop;
				_previousScrollTop = scrollTop;

				if (scrollDelta < 0) {
					_hideNavScrollTop=scrollTop +_elementHeight/2; // + _elementHeight;
					
					if (_visible) {
						return;
					}

					if (scrollTop < _showNavScrollTop) {
						this.showNav();
					}
				}

				else if (scrollDelta > 0) {
					_showNavScrollTop=scrollTop -_elementHeight/2; // - _elementHeight;

					if (!_visible) {
						return;
					}

					if (scrollTop > _hideNavScrollTop) {
						this.hideNav();
					}
				}
			}
			}
		} );

		$.fn[ pluginName ] = function( options ) {
			return this.each( function() {
				if ( !$.data( this, "plugin_" + pluginName ) ) {
					$.data( this, "plugin_" +
						pluginName, new Plugin( this, options ) );
				}
			} );
		};

} )( jQuery, window, document );

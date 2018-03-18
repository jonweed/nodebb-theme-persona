;( function( $, undefined ) {

	"use strict";

		var pluginName = "slide";

		var defaults = {
		};

		function Plugin ( element ) {
			this.element = $(element);
			this.element.on('action:open', this.open.bind(this));
			this.element.on('action:close', this.close.bind(this));
			return this.element;
		}

		$.extend( Plugin.prototype, {

			open: function(ev, callback) {
				var $this =this.element,h=$this.find('> :first-child')[0],h=h.offsetHeight+h.offsetTop;
				$this.css({'transition': 'all '+(h/3)+'ms ease','max-height': 0})[0].getBoundingClientRect();
				$this.one('transitionend',function(ev){
					$this.css('max-height', 'none');
					if (callback) { callback(ev); }
				}).css('max-height', h+'px');
			},

			close: function(ev, callback) {
				var $this =this.element,h=$this.find('> :first-child')[0],h=h.offsetHeight+h.offsetTop;
				$this.css({'transition': 'all '+(h/3)+'ms ease','max-height': h+'px'})[0].getBoundingClientRect();
				$this.one('transitionend',function(ev){
					if (callback) { callback(ev); }
				}).css('max-height', 0);
			}

		} );

		$.fn[ pluginName ] = function( action, callback ) {
			return this.each( function() {
				if ( !$.data( this, "plugin_" + pluginName ) ) {
					$.data( this, "plugin_" +
						pluginName, new Plugin( this ) );
				}
				if (action) { $(this).trigger('action:'+action,callback); }
			} );
		};

} )( jQuery );

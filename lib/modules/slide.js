;( function( $, undefined ) {

	"use strict";

		var pluginName = "slide";

		var defaults = {
		};

		function Plugin ( element, action ) {
			this.element = $(element);
			this._name = pluginName;
			this.element.on('action:open', this.open.bind(this));
			this.element.on('action:close', this.close.bind(this));
			if (action) { this[action](); }
			return this.element;
		}

		$.extend( Plugin.prototype, {

			open: function(ev, callback) {
				var $this =this.element,h=$this.find('> :first-child')[0],h=h.offsetHeight+h.offsetTop+'px';
				$this.one('transitionend',function(ev){
					$this.css('max-height', 'none');
					if (callback) { callback(ev); }
				}).css('max-height', h);
			},

			close: function(ev, callback) {
				var $this =this.element,h=$this.find('> :first-child')[0],h=h.offsetHeight+h.offsetTop+'px';
				this.element.css({'max-height':h})[0].getBoundingClientRect();
				$this.one('transitionend',function(ev){
					if (callback) { callback(ev); }
				}).css('max-height', 0);
			}

		} );

		$.fn[ pluginName ] = function( action, callback ) {
			return this.each( function() {
				if ( !$.data( this, "plugin_" + pluginName ) ) {
					$.data( this, "plugin_" +
						pluginName, new Plugin( this, action ) );
				}
				else {
					$(this).trigger('action:'+action,callback);
				}
			} );
		};

} )( jQuery );

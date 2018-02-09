"use strict";

/*globals ajaxify, config, utils, app, socket, NProgress*/

$(document).ready(function() {
	setupNProgress();
	setupTaskbar();
	setupEditedByIcon();
	setupMobileMenu();
	setupQuickReply();
	configureNavbarHiding();
	setupComponents();


	$(window).on('action:ajaxify.end', function(ev, data) {
		setupHoverCards();
		setupTeaserSlide();
		setupDevelop();
		configureBreadcrumbs();
		setupRepliesToggle();

		(data.tpl_url == 'categories')
		? socket.on('event:new_post', updateCategoriesCount)
		: socket.off('event:new_post', updateCategoriesCount);
	});


	function setupComponents() {
		require(['components'], function(components) {
			components.core['category/topic-count'] = function (cid) {
				return $('[component="categories/category"][data-cid="' + cid + '"] [component="category/topic-count"]');
			};
			components.core['category/post-count'] = function (cid) {
				return $('[component="categories/category"][data-cid="' + cid + '"] [component="category/post-count"]');
			};
		});
	}

	function updateCategoriesCount(data) {
		require(['components'], function(components) {
			if (data.posts) {
				data.posts.forEach(function(post) {
					var $el =components.get('category/post-count', post.cid).find('> span');
					count=parseInt($el.attr('title'), 10)+1;
					$el.attr('title',count).text(count);

					if (post.isMain) {
						$el =components.get('category/topic-count', post.cid).find('> span');
						count=parseInt($el.attr('title'), 10)+1;
						$el.attr('title',count).text(count);
					}
				});
			}
		});
	};

	function configureBreadcrumbs() {
		$('.breadcrumb .menu-toggle').on('click', function(ev) {
			var el=$('.breadcrumb-menu');
			(el.height() == 0)
			? el.animate({height: el.find('> *:first').innerHeight()+'px'},'fast',function(){ $(this).css('height','auto'); })
			: el.animate({height: '0'},'fast');
		});
	};

	function configureNavbarHiding () {
		function toggle(mq) {
			(mq.matches)
			? $(".navbar-fixed-top").autoHidingNavbar({ 'showOnBottom': false })
			: $(".navbar-fixed-top").autoHidingNavbar('destroy').removeData('plugin_autoHidingNavbar');
		};

		var mq=window.matchMedia('(max-width: 991px)');
		mq.addListener(toggle);
		toggle(mq);
	};

	function setupNProgress() {
		$(window).on('action:ajaxify.start', function() {
			NProgress.set(0.7);
		});

		$(window).on('action:ajaxify.end', function(ev, data) {
			NProgress.done();

			if (data.url && data.url.match('user/')) {
				setupFavouriteButtonOnProfile();
			}
		});
	}

	function setupTaskbar() {
		$(window).on('filter:taskbar.push', function(ev, data) {
			data.options.className = 'taskbar-' + data.module;

			if (data.module === 'composer') {
				data.options.icon = 'fa-plus';
			} else if (data.module === 'chat') {
				if (!data.element.length) {
					createChatIcon(data);
					$(window).one('action:taskbar.pushed', function(ev, data) {
						updateChatCount(data.element);
					});

				} else if (!data.element.hasClass('active')) {
					updateChatCount(data.element);
				}
			}
		});

		socket.on('event:chats.markedAsRead', function(data) {
			$('#taskbar [data-roomId="' + data.roomId + '"]')
				.removeClass('new')
				.attr('data-content', 0);
		});

		function createChatIcon(data) {
			data.options.icon = 'fa-spinner fa-spin';

			$.getJSON(config.relative_path + '/api/user/' + utils.slugify(data.options.title), function(user) {
				var el = $('#taskbar [data-uuid="' + data.uuid + '"] a');
				el.find('i').remove();
				el.parent('[data-uuid]').attr('data-roomId', data.options.roomId);

				if (user.picture) {
					el.css('background-image', 'url(' + user.picture + ')');
				} else {
					el	.css('background-color', user['icon:bgColor'])
						.text(user['icon:text'])
						.addClass('user-icon');
				}
			});
		}

		function updateChatCount(el) {
			var count = (parseInt($(el).attr('data-content'), 10) || 0) + 1;
			$(el).attr('data-content', count);
		}
	}

	function setupEditedByIcon() {
		function activateEditedTooltips() {
			$('[data-pid] [component="post/editor"]').each(function() {
				var el = $(this), icon;

				if (!el.attr('data-editor')) {
					return;
				}

				icon = el.closest('[data-pid]').find('.edit-icon').first();
				icon.prop('title', el.text()).tooltip('fixTitle').removeClass('hidden');
			});
		}

		$(window).on('action:posts.edited', function(ev, data) {
			var parent = $('[data-pid="' + data.post.pid + '"]');
			var icon = parent.find('.edit-icon').filter(function (index, el) {
				return parseInt($(el).closest('[data-pid]').attr('data-pid'), 10) === parseInt(data.post.pid, 10);
			});
			var el = parent.find('[component="post/editor"]').first();
			icon.prop('title', el.text()).tooltip('fixTitle').removeClass('hidden');
		});

		$(window).on('action:topic.loaded', activateEditedTooltips);
		$(window).on('action:posts.loaded', activateEditedTooltips);
	}

	function setupMobileMenu() {
		if (!window.addEventListener) {
			return;
		}


		require(['pulling', 'storage'], function (Pulling, Storage) {
			// initialization

			var chatMenuVisible = !config.disableChat && app.user && parseInt(app.user.uid, 10);
			var swapped = !!Storage.getItem('persona:menus:legacy-layout');
			var margin = window.innerWidth;

			if (swapped) {
				$('#mobile-menu').removeClass('pull-left');
				$('#mobile-chats').addClass('pull-left');
			}

			if (document.documentElement.getAttribute('data-dir') === 'rtl') {
				swapped = !swapped;
			}

			var navSlideout = Pulling.create({
				panel: document.getElementById('panel'),
				menu: document.getElementById('menu'),
				width: 256,
				margin: margin,
				side: swapped ? 'right' : 'left',
			});
			$('#menu').removeClass('hidden');

			var chatsSlideout;
			if (chatMenuVisible) {
				chatsSlideout = Pulling.create({
					panel: document.getElementById('panel'),
					menu: document.getElementById('chats-menu'),
					width: 256,
					margin: margin,
					side: swapped ? 'left' : 'right',
				});
				$('#chats-menu').removeClass('hidden');
			}

			// all menus

			function closeOnClick() {
				navSlideout.close();
				if (chatsSlideout) { chatsSlideout.close(); }
			}

			function onBeforeOpen() {
				document.documentElement.classList.add('slideout-open');
			}

			function onClose() {
				document.documentElement.classList.remove('slideout-open');
				$('#panel').off('click', closeOnClick);
			}

			$(window).on('resize action:ajaxify.start', function () {
				navSlideout.close();
				if (chatsSlideout) { chatsSlideout.close(); }
				$('.account .cover').css('top', $('[component="navbar"]').height());
			});

			navSlideout
				.ignore('code, code *, .preventSlideout, .preventSlideout *')
				.on('closed', onClose)
				.on('beforeopen', onBeforeOpen)
				.on('opened', function () {
					$('#panel').one('click', closeOnClick);
				});

			if (chatMenuVisible) {
				chatsSlideout
					.ignore('code, code *, .preventSlideout, .preventSlideout *')
					.on('closed', onClose)
					.on('beforeopen', onBeforeOpen)
					.on('opened', function () {
						$('#panel').one('click', closeOnClick);
					});
			}

			// left slideout navigation menu

			$('#mobile-menu').on('click', function () {
				navSlideout.enable().toggle();
			});

			function loadNotifications() {
				require(['notifications'], function(notifications) {
					notifications.loadNotifications($('#menu [data-section="notifications"] ul'));
				});
			}

			navSlideout.on('opened', loadNotifications);

			if (chatMenuVisible) {
				navSlideout.on('beforeopen', function () {
					chatsSlideout.close();
					chatsSlideout.disable();
				}).on('closed', function () {
					chatsSlideout.enable();
				});
			}

			$('#menu [data-section="navigation"] ul').html($('#main-nav').html() + ($('#search-menu').html() || '') + ($('#logged-out-menu').html() || ''));

			$('#user-control-list').children().clone(true, true).appendTo($('#menu [data-section="profile"] ul'));
			$('#menu [data-section="profile"] ul').find('[component="user/status"]').remove();

			socket.on('event:user_status_change', function(data) {
				if (parseInt(data.uid, 10) === app.user.uid) {
					app.updateUserStatus($('#menu [component="user/status"]'), data.status);
					navSlideout.close();
				}
			});

			// right slideout chats menu

			function loadChats() {
				require(['chat'], function (chat) {
					chat.loadChatsDropdown($('#chats-menu .chat-list'));
				});
			}

			if (chatMenuVisible) {
				$('#mobile-chats').removeClass('hidden').on('click', function() {
					navSlideout.close();
					chatsSlideout.enable().toggle();
				});
				$('#chats-menu').on('click', 'li[data-roomid]', function () {
					chatsSlideout.close();
				});

				chatsSlideout
					.on('opened', loadChats)
					.on('beforeopen', function () {
						navSlideout.close().disable();
					})
					.on('closed', function () {
						navSlideout.enable();
					});
			}

			// add a checkbox in the user settings page
			// so users can swap the sides the menus appear on

			function setupSetting() {
				if (ajaxify.data.template['account/settings'] && !document.getElementById('persona:menus:legacy-layout')) {
					$('<div class="well checkbox"><label><input type="checkbox" id="persona:menus:legacy-layout"/><strong>Switch which side each mobile menu is on</strong></label></div>')
						.appendTo('#content .account > .row > div:first-child')
						.find('input')
						.prop('checked', Storage.getItem('persona:menus:legacy-layout', 'true'))
						.change(function (e) {
							if (e.target.checked) {
								Storage.setItem('persona:menus:legacy-layout', 'true');
							} else {
								Storage.removeItem('persona:menus:legacy-layout');
							}
						});
				}
			}

			$(window).on('action:ajaxify.end', setupSetting);
			setupSetting();
		});
	}

	function setupDevelop() {
		require(['components'], function(components) {
			function toggle(ev) {
				var $target=$(ev.target).closest('.toggle'),
				el=$target.parents('.ro-card').find('[component="category/posts"] > .post-content');


				if (el.height() == 0) {
					el.animate({height: el.find('> *:first').innerHeight()+'px'},'fast',function(){ $(this).css('height','auto'); });
					$target.addClass('open');
				}
				else {
					el.animate({height: '0'},'fast');
					$target.removeClass('open');
				}
			}

			components.get('categories/category').on('click', '.ro-toggle-btn > .toggle', toggle);
		});
	}

	function setupRepliesToggle() {
		require(['components'], function(components) {
			function toggle(ev) {
				function slideUp(){
					el.slideUp('fast');
					$target.addClass('open');
				}

				var $target=$(ev.target).closest('[data-toggle]'),
				el=$target.parents('[component="box"]:first').find($target.data('toggle')),
				block=$(ev.delegateTarget);

				if (el.is(':visible')) {
					block.trigger('close.slides');
				}
				else {
					block.trigger('close.slides').one('close.slides',slideUp);
					el.slideDown('fast');
					$target.removeClass('open');
				}
			}

			$('[component="post"]').on('click', '[component="post/replies"] [data-toggle]', toggle);
		});
	}

	function setupTeaserSlide() {
		require(['components'], function(components) {
			function toggle(ev) {
				var $target=$(ev.target).closest('.toggle'),
				el=$target.parents('.ro-block:first').find('.ro-teaser');


				if (el.height() == 0) {
					el.animate({height: el.find('> .post-content').innerHeight()+'px'},'fast',function(){ $(this).css('height','auto'); });
					$target.addClass('open');
				}
				else {
					el.animate({height: '0'},'fast');
					$target.removeClass('open');
				}
			}

			components.get('category/topic').on('click', '.ro-toggle-btn > .toggle', toggle);
		});
	}


	function setupHoverCards() {
		require(['components'], function(components) {
			components.get('topic')
				.on('click', '[component="user/picture"],[component="user/picture"] .status', generateUserCard);
		});


		require(['components'], function(components) {
			components.get('topic').on('click', '.ro-toggle-vote', function(ev){
					ev.preventDefault();
					ev.stopPropagation();

					var panel=$(this).parents('[component="post"]:first'),el=panel.find('.ro-drawer:first > .ro-vote-sm');
					(el.is(':visible')) ? el.slideUp('fast') : el.slideDown('fast').focus();

					function hideClick(ev) {
						if ($(ev.target).closest('.ro-upvote,.ro-downvote').length === 1 ||  $(ev.target).closest('.ro-toggle-vote, .ro-vote-sm').length === 0) {
							el.slideUp('fast');
							panel.off('click', hideClick);
						}
					}
					panel.on('click', hideClick);

				});
		});

		function userData(posts) {
			for (var i = 0, ii = posts.length; i < ii; i++) {
				if (posts[i].index || posts[i].index === 0) {
					$('[component="post"][data-index="'+posts[i].index+'"]').data('usercard', posts[i].user);
				}
				else {
					$('[component="post"][data-index="'+posts[i].toIndex+'"] [data-pid="'+posts[i].pid+'"]').data('usercard', posts[i].user);
				}
			}
		}

		if (ajaxify.data.url && ajaxify.data.url.match('^/topic/')) {
			userData(ajaxify.data.posts);
		}

		$(window).on('action:posts.loaded', function(ev, data) {
			userData(data.posts);
		});

		socket.on('event:user_status_change',function(data){
			if (data.uid == app.user.uid) {
				$('[component="header/profilelink"] [component="user/status"]')
					.removeClass('away online dnd offline')
					.addClass(data.status);
			}
			$('[component="post"][data-uid="'+data.uid+'"]').each(function(){
				$(this).data('usercard').status = data.status;
			});
		});

		socket.on('event:voted',function(data){
				$('[component="post"][data-uid="'+data.post.uid+'"]').each(function(){
					$(this).data('usercard').reputation = data.user.reputation;
				});

				$('[component="post"][data-pid="'+data.post.pid+'"]').each(function(){
					var el=$(this).find('> .ro-panel-post:first > .ro-bar > .ro-head > .ro-toggle-vote > span');
					utils.makeNumbersHumanReadable(el.text(data.post.votes));
					if (data.fromuid == app.user.uid) {
						el.parent().removeClass('upvoted downvoted');
						if (data.upvote) { el.parent().addClass('upvoted');  }
						else if (data.downvote) { el.parent().addClass('downvoted'); }
					}
				});
		});


		socket.on('connect', function(data){
			if (app.user.uid != 0) {
				socket.emit('user.setStatus', app.user.status, function (err) {
					if (err) {
						return app.alertError(err.message);
					}
				});
			}
		});

		$(window).on('action:app.logout', function(ev, data) {
			socket.emit('user.setStatus', 'disconnect', function (err) {
				if (err) {
					return app.alertError(err.message);
				}
			});
		});

	}

	function generateUserCard(ev) {
		ev.preventDefault();
		ev.stopPropagation();

		var avatar = $(this),
				 panel = avatar.parents('[component="post"]:first'),
				 data = panel.data('usercard');


		if (panel.find('.ro-drawer:first > .ro-usercard').is(':visible')) {
				panel.trigger('click');
		}

		else {
			if (parseInt(data.uid, 10) === 0) {
				return false;
			}

			panel.addClass('ro-loading');

			socket.emit('user.isFollowing', {uid: data.uid}, function(err, isFollowing) {
				app.parseAndTranslate('modules/usercard', data, function(html) {
					var card = $(html).hide();
					panel.find('.ro-drawer:first').prepend(card);

					if (parseInt(app.user.uid, 10) === parseInt(data.uid, 10) || !app.user.uid) {
						card.find('.btn-morph').hide();
					} else {
						setupFavouriteMorph(card, data.uid, data.username);

						if (isFollowing) {
							$('.btn-morph').addClass('heart');
						} else {
							$('.btn-morph').addClass('plus');
						}
					}

					utils.makeNumbersHumanReadable(card.find('.human-readable-number'));
					panel.removeClass('ro-loading');
					card.slideDown('fast');


					function hideClick(ev) {
						if ($(ev.target).closest('.ro-usercard').length === 0) {
							card.slideUp('fast', function(){
								card.remove();
							});
							panel.off('click', hideClick);
						}
					}
					panel.on('click', hideClick);
				});
			});
		}

		return false;
	}

	function setupFavouriteButtonOnProfile() {
		setupFavouriteMorph($('[component="account/cover"]'), ajaxify.data.uid, ajaxify.data.username);
	}


	function setupFavouriteMorph(parent, uid, username) {
		parent.find('.btn-morph').click(function(ev) {
			var type = $(this).hasClass('plus') ? 'follow' : 'unfollow';

			socket.emit('user.' + type, {uid: uid}, function(err) {
				if (err) {
					return app.alertError(err.message);
				}

				app.alertSuccess('[[global:alert.' + type + ', ' + username + ']]');
			});

			$(this).toggleClass('plus').toggleClass('heart');
			$(this).translateAttr('title', type  === 'follow' ? '[[global:unfollow]]' : '[[global:follow]]');

			if ($(this).find('b.drop').length === 0) {
				$(this).prepend('<b class="drop"></b>');
			}

			var drop = $(this).find('b.drop').removeClass('animate'),
				x = ev.pageX - drop.width() / 2 - $(this).offset().left,
				y = ev.pageY - drop.height() / 2 - $(this).offset().top;

			drop.css({top: y + 'px', left: x + 'px'}).addClass('animate');
		});
	}

	function setupQuickReply() {
		$(window).on('action:ajaxify.end', function(ev, data) {
			if (data.url && data.url.match('^topic/')) {
				require(['persona/quickreply'], function(quickreply) {
					quickreply.init();
				});
			}
		});
	}
});

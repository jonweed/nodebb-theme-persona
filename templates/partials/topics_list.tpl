<ul component="category" class="topic-list" itemscope itemtype="http://www.schema.org/ItemList" data-nextstart="{nextStart}" data-set="{set}">
	<meta itemprop="itemListOrder" content="descending">

	<!-- BEGIN topics -->
	<li component="category/topic" class="category-item ro-panel-category auto {function.generateTopicClass}" <!-- IMPORT partials/data/category.tpl -->>
		<meta itemprop="name" content="{function.stripTags, title}">
		<div class="ro-bar">

			<!-- IF showSelect -->
			<div class="select ro-icon" component="topic/select">
				<!-- IF topics.thumb -->
				<img src="{topics.thumb}" class="ro-user-icon" />
				<!-- ELSE -->
				<!-- IF topics.user.picture -->
				<img component="user/picture" data-uid="{topics.user.uid}" src="{topics.user.picture}" class="ro-user-icon" />
				<!-- ELSE -->
				<div class="ro-user-icon" style="background: {topics.user.icon:bgColorImage};">{topics.user.icon:text}</div>
				<!-- ENDIF topics.user.picture -->
				<!-- ENDIF topics.thumb -->
				<i class="fa fa-check"></i>
			</div>

			<!-- ELSE -->
			<a href="<!-- IF topics.user.userslug -->{config.relative_path}/user/{topics.user.userslug}<!-- ELSE -->#<!-- ENDIF topics.user.userslug -->" class="ro-icon">
				<!-- IF topics.thumb -->
				<img src="{topics.thumb}" class="ro-user-icon" />
				<!-- ELSE -->
				<!-- IF topics.user.picture -->
				<img component="user/picture" data-uid="{topics.user.uid}" src="{topics.user.picture}" class="ro-user-icon" />
				<!-- ELSE -->
				<div class="ro-user-icon" style="background: {topics.user.icon:bgColorImage};">{topics.user.icon:text}</div>
				<!-- ENDIF topics.user.picture -->
				<!-- ENDIF topics.thumb -->
			</a>
			<!-- ENDIF showSelect -->

			<div class="ro-head">



				<div class="ro-splitblock">
						
					<div class="ro-title">
						<div>
							<i component="topic/pinned" class="fa fa-thumb-tack <!-- IF !topics.pinned -->hide<!-- ENDIF !topics.pinned -->" title="[[topic:pinned]]"></i>
							<i component="topic/locked" class="fa fa-lock <!-- IF !topics.locked -->hide<!-- ENDIF !topics.locked -->" title="[[topic:locked]]"></i>
							<i component="topic/moved" class="fa fa-arrow-circle-right <!-- IF !topics.oldCid -->hide<!-- ENDIF !topics.oldCid -->" title="[[topic:moved]]"></i>
							<!-- BEGIN icons -->@value<!-- END icons -->

							<!-- IF !topics.noAnchor -->
							<a href="{config.relative_path}/topic/{topics.slug}<!-- IF topics.bookmark -->/{topics.bookmark}<!-- ENDIF topics.bookmark -->" itemprop="url">{topics.title}</a>
							<!-- ELSE -->
							<span>{topics.title}</span>
							<!-- ENDIF !topics.noAnchor -->
						</div>

						<!-- IF !template.category -->
						<small class="ro-category-link">
							<a href="{config.relative_path}/category/{topics.category.slug}"><i style="color:{topics.category.bgColor};" class="fa {topics.category.icon}"></i> {topics.category.name}</a> &bull;
						</small>
						<!-- ENDIF !template.category -->					

						<small class="ro-posted-by">
							Posted by <a href="<!-- IF topics.user.userslug -->{config.relative_path}/user/{topics.user.userslug}<!-- ELSE -->#<!-- ENDIF topics.user.userslug -->">{topics.user.username}</a> &bull; <span class="timeago" title="{topics.timestampISO}"></span>
						</small>

						<!-- IF topics.tags.length -->
						&bull; <span class="tag-list hidden-xs">
							<!-- BEGIN tags -->
							<a href="{config.relative_path}/tags/{topics.tags.value}"><span class="tag" style="<!-- IF topics.tags.color -->color: {topics.tags.color};<!-- ENDIF topics.tags.color --><!-- IF topics.tags.bgColor -->background-color: {topics.tags.bgColor};<!-- ENDIF topics.tags.bgColor -->">{topics.tags.value}</span></a>
							<!-- END tags -->
						</span>
						<!-- ENDIF topics.tags.length -->

						<!-- IF supportForum -->
						<div class="ro-private">
							<i class="fa fa-user-secret"></i>
							<span>Private</span>
						</div>
						<!-- ENDIF supportForum -->

					</div><!-- .ro-title -->

					<div class="ro-stats">
						<div class="stats posts">
							<span class="human-readable-number" title="{topics.postcount}">{topics.postcount}</span><small>[[global:posts]]</small>						
						</div>
						<div style="display:none">
							<div class="stats views">
								<span class="human-readable-number" title="{topics.viewcount}">{topics.viewcount}</span><small>[[global:views]]</small>
							</div>
							<div class="stats votes">
								<span class="human-readable-number" title="{topics.votes}">{topics.votes}</span><small>[[global:votes]]</small>
							</div>
						</div>
					</div><!-- .ro-stats --->	

				</div><!-- .ro-splitblock -->



			</div><!-- .ro-head -->

		</div><!-- .ro-bar -->

		<div class="ro-box" style="border-color:{topics.category.bgColor}">

			<!-- IF topics.unreplied -->
			<div class="ro-teaser no-reply">
				<div class="post-content">
					[[category:no_new_posts]]
				</div>
			</div><!-- .ro-teaser.no-reply -->
			<!-- ELSE -->
			<!-- IF topics.teaser.pid -->			
			<a class="ro-icon" href="{config.relative_path}/user/{topics.teaser.user.userslug}">
			
				<!-- IF topics.teaser.user.picture -->
				<img class="ro-user-icon" title="{topics.teaser.user.username}" alt="{topics.teaser.user.username}" src="{topics.teaser.user.picture}">
				<!-- ELSE -->
				<span class="ro-user-icon" title="{topics.teaser.user.username}" style="background: {topics.teaser.user.icon:bgColorImage};">{topics.teaser.user.icon:text}</span>
				<!-- ENDIF topics.teaser.user.picture -->
			</a>				

			<div class="ro-block">
				
				<div class="ro-toggle-btn">
					<div class="ro-permalink">
						{topics.teaser.user.username} replied <a href="{config.relative_path}/topic/{topics.slug}/{topics.teaser.index}"><span class="timeago" title="{topics.teaser.timestampISO}"></span></a>
					</div>
					<div class="toggle"></div>
				</div><!-- .ro-toggle-btn -->

				<div class="ro-teaser" component="topic/teaser">
					<div class="post-content">
						{topics.teaser.content}
					</div>
				</div><!-- .ro-teaser -->
				

			</div><!-- .ro-block -->

			<!-- ENDIF topics.teaser.pid -->
			<!-- ENDIF topics.unreplied -->	

		</div><!-- .ro-box -->

	</li><!-- .ro-panel -->
	<!-- END topics -->

</ul>

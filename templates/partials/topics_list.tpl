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
				<div class="ro-title">
					<i component="topic/pinned" class="fa fa-thumb-tack <!-- IF !topics.pinned -->hide<!-- ENDIF !topics.pinned -->" title="[[topic:pinned]]"></i>
					<i component="topic/locked" class="fa fa-lock <!-- IF !topics.locked -->hide<!-- ENDIF !topics.locked -->" title="[[topic:locked]]"></i>
					<i component="topic/moved" class="fa fa-arrow-circle-right <!-- IF !topics.oldCid -->hide<!-- ENDIF !topics.oldCid -->" title="[[topic:moved]]"></i>
					<!-- BEGIN icons -->@value<!-- END icons -->

					<!-- IF !topics.noAnchor -->
					<a href="{config.relative_path}/topic/{topics.slug}<!-- IF topics.bookmark -->/{topics.bookmark}<!-- ENDIF topics.bookmark -->" itemprop="url">{topics.title}</a><br />
					<!-- ELSE -->
					<span>{topics.title}</span><br />
					<!-- ENDIF !topics.noAnchor -->

					<div>
						<!-- IF !template.category -->
						<small>
							<a href="{config.relative_path}/category/{topics.category.slug}"><span class="fa-stack fa-lg"><i style="color:{topics.category.bgColor};"class="fa fa-circle fa-stack-2x"></i><i style="color:{topics.category.color};" class="fa {topics.category.icon} fa-stack-1x"></i></span> {topics.category.name}</a> &bull;
						</small>
						<!-- ENDIF !template.category -->
						
						<!-- IF topics.tags.length -->
						<span class="tag-list hidden-xs">
							<!-- BEGIN tags -->
							<a href="{config.relative_path}/tags/{topics.tags.value}"><span class="tag" style="<!-- IF topics.tags.color -->color: {topics.tags.color};<!-- ENDIF topics.tags.color --><!-- IF topics.tags.bgColor -->background-color: {topics.tags.bgColor};<!-- ENDIF topics.tags.bgColor -->">{topics.tags.value}</span></a>
							<!-- END tags -->
							<small>&bull;</small>
						</span>
						<!-- ENDIF topics.tags.length -->

						<small><span class="timeago" title="{topics.timestampISO}"></span> &bull; <a href="<!-- IF topics.user.userslug -->{config.relative_path}/user/{topics.user.userslug}<!-- ELSE -->#<!-- ENDIF topics.user.userslug -->">{topics.user.username}</a></small>
						<small class="visible-xs-inline">
							<!-- IF topics.teaser.timestamp -->
							<span class="timeago" title="{topics.teaser.timestampISO}"></span>
							<!-- ELSE -->
							<span class="timeago" title="{topics.timestampISO}"></span>
							<!-- ENDIF topics.teaser.timestamp -->
						</small>
					</div>
					
				</div>

				<div class="ro-stats">

					<div class="stats posts">
						<span class="human-readable-number" title="{topics.postcount}">{topics.postcount}</span><small>[[global:posts]]</small>						
					</div>
					<div class="stats views">
						<span class="human-readable-number" title="{topics.viewcount}">{topics.viewcount}</span><small>[[global:views]]</small>
					</div>
					<div class="stats votes">
						<span class="human-readable-number" title="{topics.votes}">{topics.votes}</span><small>[[global:votes]]</small>
					</div>
					
				</div><!-- .ro-stats --->
	
			</div><!-- .ro-head -->
			
		</div><!-- .ro-bar -->


		<div class="ro-box" style="border-color:{topics.category.bgColor}">
			<!-- IF topics.unreplied -->
			<div class="ro-teaser no-reply">
				<div class="post-content">
					[[category:no_new_posts]]
				</div>
			</div>
			<!-- ELSE -->
			<!-- IF topics.teaser.pid -->			
			<div class="ro-teaser" component="topic/teaser">
				<div class="post-content">
					{topics.teaser.content}
				</div>
			</div>
			<div class="ro-toggle-btn">
				<a class="ro-icon" href="{config.relative_path}/user/{topics.teaser.user.userslug}">
				
					<!-- IF topics.teaser.user.picture -->
					<img class="ro-user-icon" title="{topics.teaser.user.username}" alt="{topics.teaser.user.username}" src="{topics.teaser.user.picture}">
					<!-- ELSE -->
					<span class="ro-user-icon" title="{topics.teaser.user.username}" style="background: {topics.teaser.user.icon:bgColorImage};">{topics.teaser.user.icon:text}</span>
					<!-- ENDIF topics.teaser.user.picture -->
				</a>
				<div class="ro-push">
					<a class="ro-permalink" href="{config.relative_path}/topic/{topics.slug}/{topics.teaser.index}">
						<span class="timeago" title="{topics.teaser.timestampISO}"></span>
					</a>
				</div>
				<div class="toggle"><span>Show</span><span>Hide</span></div>
			</div>
			<!-- ENDIF topics.teaser.pid -->
			<!-- ENDIF topics.unreplied -->		

		</div><!-- .ro-box -->

	</li><!-- .ro-panel -->
	<!-- END topics -->

</ul>

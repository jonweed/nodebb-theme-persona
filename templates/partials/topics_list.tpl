<ul component="category" class="topic-list" itemscope itemtype="http://www.schema.org/ItemList" data-nextstart="{nextStart}" data-set="{set}">
	<meta itemprop="itemListOrder" content="descending">
	<!-- BEGIN topics -->
	<li component="category/topic" class="category-item ro-category-item {function.generateTopicClass}" <!-- IMPORT partials/data/category.tpl -->>
		<meta itemprop="name" content="{function.stripTags, title}">
		
		<div class="col1">
				<!-- IF showSelect -->
				<div class="select" component="topic/select">
					<!-- IF topics.thumb -->
					<img src="{topics.thumb}" class="ro-user-icon" />
					<!-- ELSE -->
					<!-- IF topics.user.picture -->
					<img component="user/picture" data-uid="{topics.user.uid}" src="{topics.user.picture}" class="ro-user-icon" />
					<!-- ELSE -->
					<div class="ro-user-icon" style="background-color: {topics.user.icon:bgColor};">{topics.user.icon:text}</div>
					<!-- ENDIF topics.user.picture -->
					<!-- ENDIF topics.thumb -->
					<i class="fa fa-check"></i>
				</div>
				<!-- ENDIF showSelect -->

				<!-- IF !showSelect -->
				<a href="<!-- IF topics.user.userslug -->{config.relative_path}/user/{topics.user.userslug}<!-- ELSE -->#<!-- ENDIF topics.user.userslug -->" class="pull-left">
					<!-- IF topics.thumb -->
					<img src="{topics.thumb}" class="ro-user-icon" />
					<!-- ELSE -->
					<!-- IF topics.user.picture -->
					<img component="user/picture" data-uid="{topics.user.uid}" src="{topics.user.picture}" class="ro-user-icon" />
					<!-- ELSE -->
					<div class="ro-user-icon" style="background-color: {topics.user.icon:bgColor};">{topics.user.icon:text}</div>
					<!-- ENDIF topics.user.picture -->
					<!-- ENDIF topics.thumb -->
				</a>
				<!-- ENDIF !showSelect -->
		</div>

		<div class="col2">

			<div component="topic/header" class="title" title="{topics.user.username}">
				
				<div class="col1">
					<i component="topic/pinned" class="fa fa-thumb-tack <!-- IF !topics.pinned -->hide<!-- ENDIF !topics.pinned -->" title="[[topic:pinned]]"></i>
					<i component="topic/locked" class="fa fa-lock <!-- IF !topics.locked -->hide<!-- ENDIF !topics.locked -->" title="[[topic:locked]]"></i>
					<i component="topic/moved" class="fa fa-arrow-circle-right <!-- IF !topics.oldCid -->hide<!-- ENDIF !topics.oldCid -->" title="[[topic:moved]]"></i>
					<!-- BEGIN icons -->@value<!-- END icons -->

					<!-- IF !topics.noAnchor -->
					<a href="{config.relative_path}/topic/{topics.slug}<!-- IF topics.bookmark -->/{topics.bookmark}<!-- ENDIF topics.bookmark -->" itemprop="url">{topics.title}</a><br />
					<!-- ELSE -->
					<span>{topics.title}</span><br />
					<!-- ENDIF !topics.noAnchor -->

					<!-- IF !template.category -->
					<small>
						<a href="{config.relative_path}/category/{topics.category.slug}"><span class="fa-stack fa-lg"><i style="color:{topics.category.bgColor};"class="fa fa-circle fa-stack-2x"></i><i style="color:{topics.category.color};" class="fa {topics.category.icon} fa-stack-1x"></i></span> {topics.category.name}</a> &bull;
					</small>
					<!-- ENDIF !template.category -->

					<div>
						<!-- IF topics.tags.length -->
						<span class="tag-list hidden-xs">
							<!-- BEGIN tags -->
							<a href="{config.relative_path}/tags/{topics.tags.value}"><span class="tag" style="<!-- IF topics.tags.color -->color: {topics.tags.color};<!-- ENDIF topics.tags.color --><!-- IF topics.tags.bgColor -->background-color: {topics.tags.bgColor};<!-- ENDIF topics.tags.bgColor -->">{topics.tags.value}</span></a>
							<!-- END tags -->
							<small>&bull;</small>
						</span>
						<!-- ENDIF topics.tags.length -->

						<small class="hidden-xs"><span class="timeago" title="{topics.timestampISO}"></span> &bull; <a href="<!-- IF topics.user.userslug -->{config.relative_path}/user/{topics.user.userslug}<!-- ELSE -->#<!-- ENDIF topics.user.userslug -->">{topics.user.username}</a></small>
						<small class="visible-xs-inline">
							<!-- IF topics.teaser.timestamp -->
							<span class="timeago" title="{topics.teaser.timestampISO}"></span>
							<!-- ELSE -->
							<span class="timeago" title="{topics.timestampISO}"></span>
							<!-- ENDIF topics.teaser.timestamp -->
						</small>
					</div>
				</div>

				<div class="ro-category-post-info">
					<div class="mobile-stat visible-xs text-right">
						<span class="human-readable-number">{topics.postcount}</span> <a href="{config.relative_path}/topic/{topics.slug}/{topics.teaser.index}"><i class="fa fa-arrow-circle-right"></i></a>
					</div>

					<div class="hidden-xs stats">
						<span class="human-readable-number" title="{topics.postcount}">{topics.postcount}</span>
						<br />
						<small>[[global:posts]]</small>
					</div>

					<div class="hidden-xs stats">
						<span class="human-readable-number" title="{topics.viewcount}">{topics.viewcount}</span>
						<br />
						<small>[[global:views]]</small>
					</div>

					<div class="hidden-xs stats">
						<span class="human-readable-number" title="{topics.votes}">{topics.votes}</span>
						<br />
						<small>[[global:votes]]</small>
					</div>
				</div>

			</div>


			
		</div>

		<div class="col3 teaser hidden-xs" component="topic/teaser" style="border-color: {topics.category.bgColor}">
			<div class="ro-card">
				<!-- IF topics.unreplied -->
				<p>
					[[category:no_replies]]
				</p>
				<!-- ELSE -->
				<!-- IF topics.teaser.pid -->
				<p>
					<a href="{config.relative_path}/user/{topics.teaser.user.userslug}">
						<!-- IF topics.teaser.user.picture -->
						<img title="{topics.teaser.user.username}" class="ro-user-icon" src="{topics.teaser.user.picture}" />
						<!-- ELSE -->
						<span title="{topics.teaser.user.username}" class="ro-user-icon" style="background-color: {topics.teaser.user.icon:bgColor};">{topics.teaser.user.icon:text}</span>
						<!-- ENDIF topics.teaser.user.picture -->
					</a>
					<a class="permalink" href="{config.relative_path}/topic/{topics.slug}/{topics.teaser.index}">
						<span class="timeago" title="{topics.teaser.timestampISO}"></span>
					</a>
				</p>
				<div class="post-content">
					{topics.teaser.content}
				</div>
				<!-- ENDIF topics.teaser.pid -->
				<!-- ENDIF topics.unreplied -->
			</div>		
		</div>




	</li>
	<!-- END topics -->
</ul>

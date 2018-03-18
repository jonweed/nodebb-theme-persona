<li component="categories/category" data-cid="{../cid}" data-numRecentReplies="{../numRecentReplies}" class="ro-panel ro-panel-category-item auto">
	<meta itemprop="name" content="{../name}">
	<div class="bg-wrap">
		<div class="ro-bar">

			<div class="ro-icon" style="{function.generateCategoryBackground}">
				<i class="fa fa-fw {../icon}"></i>
			</div>

			<div class="ro-head">

				<div class="ro-title">
					<h2>
						<!-- IMPORT partials/categories/link.tpl -->
					</h2>

					<!-- IF ../supportForum -->
					<div class="ro-private">
						<i class="fa fa-user-secret"></i>
						<span>Private</span>
					</div>
					<!-- ENDIF ../supportForum -->

					<!-- IF ../descriptionParsed -->
					<div class="ro-description">
						{../descriptionParsed}
					</div>
					<!-- ENDIF ../descriptionParsed -->
				</div><!-- .ro-title -->

				<div class="ro-stats">

					<!-- IF !../link -->
					<!-- IF ../supportForum -->

					<div class="stats" component="category/topic-count">
						<span class="{../unread-class} human-readable-number" title="{../supportForum:stats.topicCount}">{../supportForum:stats.topicCount}</span><small>[[global:topics]]</small>
					</div>
					<div class="stats" component="category/post-count">
						<span class="{../unread-class} human-readable-number" title="{../supportForum:stats.postCount}">{../supportForum:stats.postCount}</span><small>[[global:posts]]</small>
					</div>

					<!-- ELSE -->

					<div class="stats" component="category/topic-count">
						<span class="{../unread-class} human-readable-number" title="{../totalTopicCount}">{../totalTopicCount}</span><small>[[global:topics]]</small>
					</div>
					<div class="stats" component="category/post-count">
						<span class="{../unread-class} human-readable-number" title="{../totalPostCount}">{../totalPostCount}</span><small>[[global:posts]]</small>
					</div>

					<!-- ENDIF ../supportForum -->
					<!-- ENDIF !../link -->

				</div><!-- .ro-stats -->

			</div><!-- .ro-head -->

		</div><!-- .ro-bar -->

		<div class="ro-box" style="border-color: {../bgColor}" component="topic/teaser">

			<!-- IF !config.hideCategoryLastPost -->
			<!-- IMPORT partials/categories/lastpost.tpl -->
			<!-- ENDIF !config.hideCategoryLastPost -->

		</div><!-- .ro-box -->
	</div><!-- .bg-wrap -->
</li><!-- .ro-panel -->

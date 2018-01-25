<li component="categories/category" data-cid="{../cid}" data-numRecentReplies="1" class="ro-panel-category-item auto">
	<meta itemprop="name" content="{../name}">

	<div class="ro-bar">

		<div class="ro-icon" style="{function.generateCategoryBackground}">
			<i class="fa fa-fw {../icon}"></i>
		</div>
		
		<div class="ro-head">

			<div class="ro-title">
				<h2>
					<!-- IMPORT partials/categories/link.tpl -->
				</h2>

				<!-- IF ../descriptionParsed -->
				<div class="ro-description">
					{../descriptionParsed}
				</div>
				<!-- ENDIF ../descriptionParsed -->
			</div><!-- .ro-title --->
			
			<div class="ro-stats">

				<!-- IF !../link -->
				<div class="stats">
					<span class="{../unread-class} human-readable-number" title="{../totalTopicCount}">{../totalTopicCount}</span><small>[[global:topics]]</small>
				</div>
				<div class="stats">
					<span class="{../unread-class} human-readable-number" title="{../totalPostCount}">{../totalPostCount}</span><small>[[global:posts]]</small>
				</div>
				<!-- ENDIF !../link -->

			</div><!-- .ro-stats --->

		</div><!-- .ro-head -->

	</div><!-- .ro-bar -->

	<div class="ro-box" style="border-color: {../bgColor}">

		<!-- IF !config.hideCategoryLastPost -->
		<!-- IMPORT partials/categories/lastpost.tpl -->
		<!-- ENDIF !config.hideCategoryLastPost -->

	</div><!-- .ro-box -->

</li><!-- .ro-panel -->	

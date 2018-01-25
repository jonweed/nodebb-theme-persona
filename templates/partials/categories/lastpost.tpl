<!-- BEGIN posts -->
<!-- IF @first -->
<div class="ro-teaser" style="border-color: {../bgColor}" component="topic/teaser">
	<div class="post-content">
		{../content}
	</div>
</div>
<div class="ro-toggle-btn">
	<a class="ro-icon" href="{config.relative_path}/user/{../user.userslug}">	
		<!-- IF ../user.picture -->
		<img class="ro-user-icon" title="{../user.username}" alt="{../user.username}" src="{../user.picture}">
		<!-- ELSE -->
		<span class="ro-user-icon" title="{../user.username}" style="background-color: {../user.icon:bgColor};">{../user.icon:text}</span>
		<!-- ENDIF ../user.picture -->
	</a>
	<div class="ro-push">
		<a class="ro-permalink" href="{config.relative_path}/topic/{../topic.slug}<!-- IF ../index -->/{../index}<!-- ENDIF ../index -->">
			<span class="timeago" title="{../timestampISO}"></span>
		</a>
	</div>
	<div class="toggle"><span>Show</span><span>Hide</span></div>
</div>
<!-- ENDIF @first -->
<!-- END posts -->

<!-- IF !../posts.length -->
<div class="ro-teaser no-reply" style="border-color: {../bgColor}">
	<div class="post-content">
		[[category:no_new_posts]]
	</div>
</div>
<!-- ENDIF !../posts.length -->

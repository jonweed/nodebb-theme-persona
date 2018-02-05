<div class="ro-card" style="border-color: {../bgColor}">
	<!-- BEGIN posts -->
	<!-- IF @first -->
	<div component="category/posts">
		<div class="ro-toggle-btn">
			<a class="ro-icon" href="{config.relative_path}/user/{../user.userslug}">	
				<!-- IF ../user.picture -->
				<img class="ro-user-icon" title="{../user.username}" alt="{../user.username}" src="{../user.picture}">
				<!-- ELSE -->
				<span class="ro-user-icon" title="{../user.username}" style="background-color: {../user.icon:bgColor};">{../user.icon:text}</span>
				<!-- ENDIF ../user.picture -->
			</a>
			<div class="ro-push">
				{../user.username} &bull;
				<a class="ro-permalink" href="{config.relative_path}/post/{posts.pid}">
					<span class="timeago" title="{../timestampISO}"></span>
				</a>				
			</div>
			<div class="toggle"></div>
		</div>

		<div class="post-content">
			<div>
				{../content}
			</div>
		</div>
	</div>
	<!-- ENDIF @first -->
	<!-- END posts -->

	<!-- IF !../posts.length -->
	<div component="category/posts">
		<div class="post-content no-reply">
			<div>
				[[category:no_new_posts]]
			</div>
		</div>
	</div>
	<!-- ENDIF !../posts.length -->
</div>

<div class="ro-usercard">
	<div class="ro-usercard-col1">
		<a href="{config.relative_path}/user/{userslug}">
			<div class="ro-usercard-picture" style="background:{icon:bgColorImage};">
				<!-- IF picture -->
				<img src="{picture}" align="left" itemprop="image" />
				<!-- ELSE -->
				{icon:text}				
				<!-- ENDIF picture -->
			</div>
		</a>
	</div>
	<div class="ro-usercard-col2">
		<div class="ro-usercard-name">
			<div class="ro-usercard-name-col1">
				<a href="{config.relative_path}/user/{userslug}">
					<span class="usercard-name"><!-- IF fullname -->{fullname}<!-- ELSE -->{username}<!-- ENDIF fullname --></span><br />
					<span class="usercard-username"><!-- IF !banned -->@{username}<!-- ELSE -->[[user:banned]]<!-- ENDIF !banned --></span>
					<!-- IF !banned -->
					<i component="user/status" class="fa fa-circle status {status}" title="[[global:{status}]]"></i>
					<!-- ENDIF !banned -->
				</a>
			</div>
		</div>
		<div class="ro-usercard-info">
			<div class="ro-usercard-posts">
				<small>[[global:posts]]</small>
				<span class="human-readable-number">{postcount}</span>
			</div>
			<div class="ro-usercard-reputation">
				<small>[[global:reputation]]</small>
				<span class="human-readable-number">{reputation}</span>
			</div>
			<div class="ro-usercard-follow">
				<button class="btn-morph fab <!-- IF banned --> hide<!-- ENDIF banned -->">
					<span>
						<span class="s1"></span>
						<span class="s2"></span>
						<span class="s3"></span>
					</span>
				</button>
			</div>
		</div>
					
	</div>
</div>

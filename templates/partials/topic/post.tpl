<div class="postbox">

	<div class="ro-post-header">

		<div class="ro-post-user-picture" component="user/picture" data-uid="{posts.user.uid}">
			<a href="<!-- IF posts.user.userslug -->{config.relative_path}/user/{posts.user.userslug}<!-- ELSE -->#<!-- ENDIF posts.user.userslug -->">
				<div data-uid="{posts.user.uid}" class="ro-post-user-icon" style="background-color: {posts.user.icon:bgColor};">
					<!-- IF posts.user.picture -->
					<img data-uid="{posts.user.uid}" class="ro-post-user-icon" src="{posts.user.picture}" align="left" itemprop="image" />
					<!-- ELSE -->
					{posts.user.icon:text}
					<!-- ENDIF posts.user.picture -->
					<i component="user/status" class="fa fa-circle status ro-status {posts.user.status}" title="[[global:{posts.user.status}]]"></i>				
				</div>
			</a>
		</div><!-- div.ro-post-user -->


		<div class="ro-post-heading">
			<a class="ro-post-username" href="<!-- IF posts.user.userslug -->{config.relative_path}/user/{posts.user.userslug}<!-- ELSE -->#<!-- ENDIF posts.user.userslug -->" itemprop="author" data-username="{posts.user.username}" data-uid="{posts.user.uid}">{posts.user.username}</a>

			<!-- IF posts.user.banned -->
			<span class="label label-danger">[[user:banned]]</span>
			<!-- ENDIF posts.user.banned -->

			<span class="visible-xs-inline-block visible-sm-inline-block visible-md-inline-block visible-lg-inline-block">

				<i class="fa fa-pencil-square pointer edit-icon <!-- IF !posts.editor.username -->hidden<!-- ENDIF !posts.editor.username -->"></i>

				<small data-editor="{posts.editor.userslug}" component="post/editor" class="hidden">[[global:last_edited_by, {posts.editor.username}]] <span class="timeago" title="{posts.editedISO}"></span></small>

				<!-- IF posts.toPid -->
				<a component="post/parent" class="btn btn-xs btn-default" data-topid="{posts.toPid}" href="/post/{posts.toPid}"><i class="fa fa-reply"></i> @<!-- IF posts.parent.username -->{posts.parent.username}<!-- ELSE -->[[global:guest]]<!-- ENDIF posts.parent.username --></a>
				<!-- ENDIF posts.toPid -->

				<span>
					<!-- IF posts.user.custom_profile_info.length -->
					&#124;
					<!-- BEGIN custom_profile_info -->
					{posts.user.custom_profile_info.content}
					<!-- END custom_profile_info -->
					<!-- ENDIF posts.user.custom_profile_info.length -->
				</span>
			</span>

			<!-- IMPORT partials/topic/badge.tpl -->

			<div class="ro-post-permalink">
				<a href="{config.relative_path}/post/{posts.pid}">
					<i class="fa fa-icon fa-link"></i>
					<span class="timeago" title="{posts.timestampISO}"></span>
				</a>
			</div><!-- div.ro-post-permalink -->
			
		</div>

		<!-- IF !reputation:disabled -->
		<div class="ro-post-votes">
			<button component="post/upvote" href="#" class="btn btn-votes  <!-- IF posts.upvoted -->upvoted<!-- ENDIF posts.upvoted -->">
				<i class="fa fa-thumbs-up"></i>
			</button>

			<div component="post/vote-count" data-votes="{posts.votes}">{posts.votes}</div>

			<!-- IF !downvote:disabled -->
			<button component="post/downvote" href="#" class="btn btn-votes <!-- IF posts.downvoted -->downvoted<!-- ENDIF posts.downvoted -->">
				<i class="fa fa-thumbs-down"></i>
			</button>
			<!-- ENDIF !downvote:disabled -->
		</div><!-- div.ro-post-votes -->
		<!-- ENDIF !reputation:disabled -->

	</div><!-- div.ro-post-header -->


	<div class="content ro-post-content" component="post/content" itemprop="text">
		{posts.content}
	</div><!-- div.ro-post-content -->

	<div class="clearfix post-footer ro-post-footer">
		<!-- IF posts.user.signature -->
		<div component="post/signature" data-uid="{posts.user.uid}" class="post-signature">{posts.user.signature}</div>
		<!-- ENDIF posts.user.signature -->

		<small class="pull-right">
			<!-- IF !hideReplies -->
			<div class="btn-group">
				<button component="post/reply" href="#" class="btn btn-sm btn-primary no-select <!-- IF !privileges.topics:reply -->hidden<!-- ENDIF !privileges.topics:reply -->"><i class="fa fa-icon fa-reply"></i><span class="ro-hidden-xxs"> [[topic:reply]]</span></button>
				<button component="post/quote" href="#" class="btn btn-sm btn-default no-select <!-- IF !privileges.topics:reply -->hidden<!-- ENDIF !privileges.topics:reply -->"><i class="fa fa-icon fa-quote-right"></i></button>
			</div>
			<!-- ELSE -->
			<span class="post-tools">
				<a component="post/reply" href="#" class="no-select <!-- IF !privileges.topics:reply -->hidden<!-- ENDIF !privileges.topics:reply -->">[[topic:reply]]</a>
				<a component="post/quote" href="#" class="no-select <!-- IF !privileges.topics:reply -->hidden<!-- ENDIF !privileges.topics:reply -->">[[topic:quote]]</a>
			</span>
			<!-- ENDIF !hideReplies -->

			<!-- IMPORT partials/topic/post-menu.tpl -->
		</small>

		<!-- IF !hideReplies -->
		<a component="post/reply-count" href="#" class="threaded-replies no-select <!-- IF !posts.replies.count -->hidden<!-- ENDIF !posts.replies.count -->">
			<span component="post/reply-count/avatars" class="avatars <!-- IF posts.replies.hasMore -->hasMore<!-- ENDIF posts.replies.hasMore -->">
				<!-- BEGIN posts.replies.users -->
				<!-- IF posts.replies.users.picture -->
				<span><img component="user/picture" data-uid="{posts.replies.users.uid}" title="{posts.replies.users.username}" class="avatar" src="{posts.replies.users.picture}"  itemprop="image" /></span>
				<!-- ELSE -->
				<div component="user/picture" data-uid="{posts.replies.users.uid}" title="{posts.replies.users.username}" class="user-icon" style="background-color: {posts.replies.users.icon:bgColor};">{posts.replies.users.icon:text}</div>
				<!-- ENDIF posts.replies.users.picture -->
				<!-- END posts.replies.users -->
			</span>

			<span class="replies-count" component="post/reply-count/text" data-replies="{posts.replies.count}">{posts.replies.text}</span>
			<span class="replies-last hidden-xs">[[topic:last_reply_time]] <span class="timeago" title="{posts.replies.timestampISO}"></span></span>

			<i class="fa fa-fw fa-chevron-right" component="post/replies/open"></i>
			<i class="fa fa-fw fa-chevron-down hidden" component="post/replies/close"></i>
			<i class="fa fa-fw fa-spin fa-spinner hidden" component="post/replies/loading"></i>
		</a>
		<!-- ENDIF !hideReplies -->
	</div><!-- div.ro-post-footer -->
</div><!-- div.postbox -->

<!-- IF !hideReplies -->
<div class="post-replies-placeholder"></div>
<!-- ENDIF !hideReplies -->

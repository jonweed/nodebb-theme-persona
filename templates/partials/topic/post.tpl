<li component="post" class="ro-panel-post<!-- IF posts.deleted --> deleted<!-- ENDIF posts.deleted -->" <!-- IMPORT partials/data/topic.tpl -->>

	<a component="post/anchor" data-index="{posts.index}" id="{posts.index}"></a>
	<meta itemprop="datePublished" content="{posts.timestampISO}">
	<meta itemprop="dateModified" content="{posts.editedISO}">


	<div class="ro-grid">
		<!-- IMPORT partials/topic/post-head.tpl -->

		<div class="ro-box">

			<div class="ro-drawer">
				<!-- IF !reputation:disabled -->
				<div class="ro-vote-sm" style="display:none">
					<div component="post/upvote" class="ro-upvote <!-- IF posts.upvoted -->upvoted<!-- ENDIF posts.upvoted -->">
						<i class="fa fa-thumbs-up"></i><span>Upvote</span>
					</div>
					<!-- IF !downvote:disabled -->
					<div component="post/downvote" class="ro-downvote <!-- IF posts.downvoted -->downvoted<!-- ENDIF posts.downvoted -->">
						<i class="fa fa-thumbs-down"></i><span>Downvote</span>
					</div>
					<!-- ENDIF !downvote:disabled -->
				</div>
				<!-- ENDIF !reputation:disabled -->
			</div><!-- .ro-drawer -->

			<div class="ro-body">

				<div component="post/content" itemprop="text">
				{posts.content}
				</div>

				<!-- IF posts.user.signature -->
				<div component="post/signature" data-uid="{posts.user.uid}" class="post-signature">{posts.user.signature}</div>
				<!-- ENDIF posts.user.signature -->

				<div class="post-tools">
					<a component="post/reply" href="#" class="no-select <!-- IF !privileges.topics:reply -->hidden<!-- ENDIF !privileges.topics:reply -->">[[topic:reply]]</a>
					<a component="post/quote" href="#" class="no-select <!-- IF !privileges.topics:reply -->hidden<!-- ENDIF !privileges.topics:reply -->">[[topic:quote]]</a>
					<!-- IMPORT partials/topic/post-menu.tpl -->
				</div><!-- .post-tools -->

			</div><!-- .ro-body -->

			<i class="fa fa-fw fa-spinner ro-spinner"></i>

		</div><!-- .ro-box -->
	</div>

	<!-- IF !hideReplies -->
	<div class="ro-replies">
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
			<i class="fa fa-fw fa-chevron-right" component="post/replies/open"></i>
			<i class="fa fa-fw fa-chevron-down hidden" component="post/replies/close"></i>
			<i class="fa fa-fw fa-spin fa-spinner hidden" component="post/replies/loading"></i>
			<span class="replies-last hidden-xs">[[topic:last_reply_time]] <span class="timeago" title="{posts.replies.timestampISO}"></span></span>
		</a>

	</div>
	<!-- ENDIF !hideReplies -->

</li>

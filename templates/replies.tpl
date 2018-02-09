<!-- BEGIN posts -->
<li component="post" class="ro-panel-post-reply<!-- IF posts.deleted --> deleted<!-- ENDIF posts.deleted -->" <!-- IMPORT partials/data/topic.tpl -->>

	<a component="post/anchor" data-index="{posts.index}" id="{posts.index}"></a>
	<meta itemprop="datePublished" content="{posts.timestampISO}">
	<meta itemprop="dateModified" content="{posts.editedISO}">


	<div class="ro-grid">

    <div component="user/picture" data-uid="{posts.user.uid}" href="<!-- IF posts.user.userslug -->{config.relative_path}/user/{posts.user.userslug}<!-- ELSE -->#<!-- ENDIF posts.user.userslug -->">
      <i class="fa fa-check ro-selected"></i>
      <a data-uid="{posts.user.uid}" class="ro-user-icon" <!-- IF !posts.user.picture -->style="background-image: {posts.user.icon:bgColorImage};"<!-- ENDIF !posts.user.picture -->>
        <!-- IF posts.user.picture -->
        <img data-uid="{posts.user.uid}" class="ro-post-user-icon" src="{posts.user.picture}" align="left" itemprop="image" />
        <!-- ELSE -->
        {posts.user.icon:text}
        <!-- ENDIF posts.user.picture -->
        <i component="user/status" class="fa fa-circle status ro-status {posts.user.status}" title="[[global:{posts.user.status}]]"></i>
      </a>
    </div><!-- userpic -->


		<div class="ro-box" component="box">

      <div class="ro-toggle-head">

        <a class="ro-username" href="<!-- IF posts.user.userslug -->{config.relative_path}/user/{posts.user.userslug}<!-- ELSE -->#<!-- ENDIF posts.user.userslug -->" itemprop="author" data-username="{posts.user.username}" data-uid="{posts.user.uid}">
          {posts.user.username}
          <!-- IF posts.user.banned -->
          <span class="label label-danger">[[user:banned]]</span>
          <!-- ENDIF posts.user.banned -->
        </a>

        <a class="ro-permalink timeago" href="{config.relative_path}/post/{posts.pid}" title="{posts.timestampISO}"></a>

        <div class="ro-icons-block">
          <!-- IMPORT partials/topic/badge.tpl -->
        </div>

        <div class="ro-icons-block">

          <!-- IF supportForum -->
          <div class="ro-private">
            <i class="fa fa-user-secret"></i>
            <span>Private</span>
          </div>
          <!-- ENDIF supportForum -->

          <span class="visible-xs-inline-block visible-sm-inline-block visible-md-inline-block visible-lg-inline-block">
            <i class="fa fa-pencil pointer edit-icon ro-edit-icon <!-- IF !posts.editor.username -->hidden<!-- ENDIF !posts.editor.username -->"></i>
            <small data-editor="{posts.editor.userslug}" component="post/editor" class="hidden">
              [[global:last_edited_by, {posts.editor.username}]] <span class="timeago" title="{posts.editedISO}"></span>
            </small>

            <!-- IF posts.user.custom_profile_info.length -->
            <span>
              &#124;
              <!-- BEGIN custom_profile_info -->
              {posts.user.custom_profile_info.content}
              <!-- END custom_profile_info -->
            </span>
            <!-- ENDIF posts.user.custom_profile_info.length -->
          </span>

        </div>

        <!-- IF !reputation:disabled -->
        <div class="ro-vote">
        <div component="post/upvote" class="ro-upvote <!-- IF posts.upvoted -->upvoted<!-- ENDIF posts.upvoted -->">
        <i class="fa fa-thumbs-up"></i>
        </div>
        <div class="ro-votecount" component="post/vote-count">{posts.votes}</div>
        <!-- IF !downvote:disabled -->
        <div component="post/downvote" class="ro-downvote <!-- IF posts.downvoted -->downvoted<!-- ENDIF posts.downvoted -->">
        <i class="fa fa-thumbs-down"></i>
        </div>
        <!-- ENDIF !downvote:disabled -->
        </div><!-- .ro-vote -->

        <div class="ro-toggle-vote<!-- IF posts.upvoted --> upvoted<!-- ENDIF posts.upvoted --> <!-- IF posts.downvoted --> downvoted<!-- ENDIF posts.downvoted -->">
          <i class="fa fa-thumbs-up"></i>
          <span class="ro-votecount human-readable-number">{posts.votes}</span>
        </div>
        <!-- ENDIF !reputation:disabled -->

        <div class="toggle" data-box="post/body"></div>


      </div>


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

			<div class="ro-body" box="post/body">

				<div component="post/content" itemprop="text">
				{posts.content}

				<div class="post-tools">
					<a component="post/reply" href="#" class="no-select <!-- IF !privileges.topics:reply -->hidden<!-- ENDIF !privileges.topics:reply -->">[[topic:reply]]</a>
					<a component="post/quote" href="#" class="no-select <!-- IF !privileges.topics:reply -->hidden<!-- ENDIF !privileges.topics:reply -->">[[topic:quote]]</a>
					<!-- IMPORT partials/topic/post-menu.tpl -->
				</div><!-- .post-tools -->
				</div>

				<!-- IF posts.user.signature -->
				<div component="post/signature" data-uid="{posts.user.uid}" class="post-signature">{posts.user.signature}</div>
				<!-- ENDIF posts.user.signature -->



			</div><!-- .ro-body -->

			<i class="fa fa-fw fa-spinner ro-spinner"></i>

		</div><!-- .ro-box -->
	</div>
</li>
<!-- END posts -->

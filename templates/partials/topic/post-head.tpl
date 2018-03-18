<div class="ro-head">

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
  </div><!-- component="user/picture" -->

  <div class="ro-author">
    <a class="ro-username" href="<!-- IF posts.user.userslug -->{config.relative_path}/user/{posts.user.userslug}<!-- ELSE -->#<!-- ENDIF posts.user.userslug -->" itemprop="author" data-username="{posts.user.username}" data-uid="{posts.user.uid}">
      {posts.user.username}
      <!-- IF posts.user.banned -->
      <span class="label label-danger">[[user:banned]]</span>
      <!-- ENDIF posts.user.banned -->
    </a><!-- .ro-username -->

    <!-- IMPORT partials/topic/badge.tpl -->
  </div>

  <!-- IF supportForum -->
  <div class="ro-private">
    <i class="fa fa-user-secret"></i>
    <span>Private</span>
  </div><!-- .ro-private -->
  <!-- ENDIF supportForum -->

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

</div><!-- .ro-head -->

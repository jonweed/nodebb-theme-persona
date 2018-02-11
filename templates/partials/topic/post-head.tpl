<div class="ro-head">

  <div class="ro-block">
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
    <div class="ro-head-block">
      <a class="ro-username" href="<!-- IF posts.user.userslug -->{config.relative_path}/user/{posts.user.userslug}<!-- ELSE -->#<!-- ENDIF posts.user.userslug -->" itemprop="author" data-username="{posts.user.username}" data-uid="{posts.user.uid}">
        {posts.user.username}
        <!-- IF posts.user.banned -->
        <span class="label label-danger">[[user:banned]]</span>
        <!-- ENDIF posts.user.banned -->
      </a>

      <!-- IMPORT partials/topic/badge.tpl -->

      <!-- IF posts.toPid -->
      <a component="post/parent" data-topid="{posts.toPid}" href="/post/{posts.toPid}">
        <i class="fa fa-reply"></i><span>@<!-- IF posts.parent.username -->{posts.parent.username}<!-- ELSE -->[[global:guest]]<!-- ENDIF posts.parent.username --></span></a>
      <!-- ENDIF posts.toPid -->



      <!-- IF supportForum -->
      <div class="ro-private">
        <i class="fa fa-user-secret"></i>
        <span>Private</span>
      </div>
      <!-- ENDIF supportForum -->

    </div>
  </div><!-- .ro-block -->

</div><!-- .ro-head -->

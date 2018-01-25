<!-- IF posts.user.selectedGroup.slug -->
<a class="ro-group-label" href="{config.relative_path}/groups/{posts.user.selectedGroup.slug}" style="color: {posts.user.selectedGroup.labelColor};">
	<i class="fa <!-- IF posts.user.selectedGroup.icon -->{posts.user.selectedGroup.icon}<!-- ELSE -->fa-user-circle-o<!-- ENDIF posts.user.selectedGroup.icon -->"></i><span>{posts.user.selectedGroup.userTitle}</span>
</a>
<!-- ENDIF posts.user.selectedGroup.slug -->

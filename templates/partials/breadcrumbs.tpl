<!-- IF breadcrumbs.length -->
<ol class="breadcrumb">
	<li class="first menu-toggle visible-xs" itemscope="itemscope" itemtype="http://data-vocabulary.org/Breadcrumb"><a><span itemprop="title"><i class="fa fa-th"></i></span></a></li>
	<!-- BEGIN breadcrumbs -->
	<!-- IF !@last -->
	<li <!-- IF @first -->class="first"<!-- ENDIF @first --> itemscope="itemscope" itemtype="http://data-vocabulary.org/Breadcrumb"><a href="{breadcrumbs.url}" itemprop="url"><span itemprop="title">{breadcrumbs.text}</span></a></li>
	<!-- ENDIF !@last -->
	<!-- IF @last -->
	<li component="breadcrumb/current" itemscope="itemscope" itemtype="http://data-vocabulary.org/Breadcrumb" class="active <!-- IF !rssFeedUrl -->norss<!-- ENDIF !rssFeedUrl -->"><a><span itemprop="title">{breadcrumbs.text}</span></a></li>
	<!-- IF !feeds:disableRSS -->
	<!-- IF rssFeedUrl -->
	<a target="_blank" href="{rssFeedUrl}"><i class="fa fa-rss-square"></i></a>
	<!-- ENDIF rssFeedUrl -->
	<!-- ENDIF !feeds:disableRSS -->
	<!-- ENDIF @last -->
	<!-- END breadcrumbs -->
</ol>
<div class="breadcrumb-menu visible-xs">
	<div class="ro-wrap">
		<!-- BEGIN breadcrumbs -->
		<!-- IF !@last -->
		<a href="{breadcrumbs.url}" itemprop="url"><span itemprop="title">{breadcrumbs.text}</span></a>
		<!-- ENDIF !@last -->
		<!-- END breadcrumbs -->

		<!-- IF !feeds:disableRSS -->
		<!-- IF rssFeedUrl -->
		<a target="_blank" href="{rssFeedUrl}"><i class="fa fa-rss-square"></i></a>
		<!-- ENDIF rssFeedUrl -->
		<!-- ENDIF !feeds:disableRSS -->
	</div>
</div>
<!-- ENDIF breadcrumbs.length -->

<div id="wrapper">
	<!-- header  start -->
	<header id="header">

		<div class="holder-operatop">
			<div class="holder-avater">
				<a href="/admin/profile/">
					<span class="name">{if !empty($USER->info.lastName)}{$USER->info.firstName} {$USER->info.lastName}{else}{$USER->GetLogin()}{/if}</span>
					<span class="avatar">
						<!--<img src="images/img.jpg" alt="image" />-->
					</span>
				</a>
			</div>
			<a class="login" href="/logout/">login</a>
		</div>
	</header>
	<div id="main">
		{$CUSTOM_CONTENT|default}
	</div>
</div>
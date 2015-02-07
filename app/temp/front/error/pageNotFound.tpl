<div id="wrapper">
	<!-- header  start -->
	<header id="header">

		<div class="holder-operatop">
			<div class="holder-avater">
				<a href="/admin/profile/">
					<span class="name">{if !empty($USER)}{if !empty($USER->info.lastName)}{$USER->info.firstName} {$USER->info.lastName}{else}{$USER->GetLogin()}{/if}{/if}</span>
					<span class="avatar">
						<!--<img src="images/img.jpg" alt="image" />-->
					</span>
				</a>
			</div>
			<a class="login" href="/logout/">login</a>
		</div>
	</header>
	<div id="main">
		<h1>Страница не найдена.</h1>

		<p>Запрашиваемой страницы не существует на сайте. Используйте навигационное меню.</p>
	</div>
</div>
{assign var="level" value=1}
<div class="content-inner">
	<div class="sitemap">
		{if isset($PAGES_TREE)}
		{include file="front/sitemap/menu.tpl" sitemap=$PAGES_TREE level=$level}
		{/if}
	</div>
</div>

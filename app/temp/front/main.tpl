{include file="front/top.tpl"}
	<body {if !empty($BODY_CLASS)}class="{$BODY_CLASS}"{/if}>
		{if isset($CONTENT)}{$CONTENT}{/if}
		{if isset($CONTENT_TPL)}
			{include file="$CONTENT_TPL"}
		{/if}
	</body>
</html>
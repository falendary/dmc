<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
{*	<meta name="viewport" content="width=device-width" />*}
    <meta name="viewport" content="width=1000" />
	{if isset($PAGE.description)}<meta name="description" content="{$PAGE.description}" />{/if}
    {if isset($PAGE.keywords)}<meta name="keywords" content="{$PAGE.keywords}" />{/if}
	<title>{if isset($PAGE.title)}{$PAGE.title}{/if}</title>
	{*<link rel="stylesheet" type="text/css" href="{$STYLES_ALIAS}style.css" media="all" />*}
	<link rel="stylesheet" type="text/css" href="{$STYLES_ALIAS}all.css" media="all" />
	<link rel="stylesheet" type="text/css" href="{$STYLES_ALIAS}myStyles.css" />
	<link rel="stylesheet" type="text/css" href="{$LIBS_ALIAS}jQuery/jgrowl/jquery.jgrowl.css" />

	{if isset($STYLE_FILE)}
		{foreach from=$STYLE_FILE item=FILE}
			<link rel="stylesheet" href="{$FILE}" type="text/css" />
		{/foreach}
    {/if}

    {if isset($JS_VARS)}
		<script type="text/javascript">
			{foreach from=$JS_VARS item=JS_VAR}
				{foreach from=$JS_VAR item=JS_VAR_VALUE key=JS_VAR_NAME}
					{if is_array($JS_VAR_VALUE) || is_object($JS_VAR_VALUE)}
						var {$JS_VAR_NAME} = {$JS_VAR_VALUE|@json_encode};
					{else}
						var {$JS_VAR_NAME} = "{$JS_VAR_VALUE}";
					{/if}
				{/foreach}
			{/foreach}
		</script>
    {/if}

	<script src="http://api-maps.yandex.ru/2.1/?lang=ru-RU&load=package.standard,package.clusters" type="text/javascript"></script>
	<script type="text/javascript" src="{$LIBS_ALIAS}jQuery/jquery-1.10.2.min.js"></script>
	<script type="text/javascript" src="{$SCRIPTS_ALIAS}jquery-ui-1.10.3.custom.min.js"></script>
	{*<script type="text/javascript" src="{$LIBS_ALIAS}jQuery/validator/validate.js"></script><!-- Валидатор форм -->
    <script type="text/javascript" src="{$LIBS_ALIAS}jQuery/validator/validate.ext.js"></script><!-- Локализатор валидатора форм -->
    <script type="text/javascript" src="{$LIBS_ALIAS}jQuery/jquery.form.js"></script>*}
	<script type="text/javascript" src="{$LIBS_ALIAS}jQuery/jgrowl/jquery.jgrowl_minimized.js"></script>
	<script type="text/javascript" src="{$SCRIPTS_ALIAS}jquery.elastic.source.js"></script>
	<script type="text/javascript" src="{$SCRIPTS_ALIAS}loader.js"></script>
	<link rel="stylesheet" type="text/css" href="{$LIBS_ALIAS}jQuery/timeentry/jquery.timeentry.css">
	<script type="text/javascript" src="{$LIBS_ALIAS}jQuery/timeentry/jquery.plugin.min.js"></script>
	<script type="text/javascript" src="{$LIBS_ALIAS}jQuery/timeentry/jquery.timeentry.min.js"></script>
    <link rel="stylesheet" type="text/css" href="{$LIBS_ALIAS}select2-3.5.1/select2.css">
    <script type="text/javascript" src="{$LIBS_ALIAS}select2-3.5.1/select2.min.js"></script>
    <script type="text/javascript" src="{$LIBS_ALIAS}select2-3.5.1/select2_locale_ru.js"></script>

	<!--[if lte IE 8]>
		<script type="text/javascript" src="{$SCRIPTS_ALIAS}PIE.js"></script>
		<script type="text/javascript" src="{$SCRIPTS_ALIAS}modernizr-1.7.min.js"></script>
	<![endif]-->

	{if isset($SCRIPT_FILE)}
		{foreach from=$SCRIPT_FILE item=FILE}
			<script type="text/javascript" src="{$FILE}"></script>
		{/foreach}
    {/if}

	<script type="text/javascript" src="{$SCRIPTS_ALIAS}jquery.main.js"></script>
	<script type="text/javascript" src="{$SCRIPTS_ALIAS}script.js"></script>
</head>
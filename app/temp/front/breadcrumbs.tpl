{if isset($BREADCRUMBS)}
        <ul class="breadcrumbs">
                <li><a href="/">Главная </a>&gt;</li>
                {foreach from=$BREADCRUMBS key=KEY item=BREADCRUMB}
                        {if (($BREADCRUMBS|@count-1) !== $KEY)}
                                <li><a href="{$BREADCRUMB.alias}">{$BREADCRUMB.name} </a>&gt;</li>
                        {else}
                                <li>{$BREADCRUMB.name}</li>
                        {/if}
                {/foreach}
        </ul>
{/if}
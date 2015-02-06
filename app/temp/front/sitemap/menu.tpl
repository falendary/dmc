<ul>
{foreach from=$sitemap item="item"}
{*
    {if isset($item.children) and $level > 1}
        <br/>
    {/if}
*}
    <li>
        {if !empty($item.location)}
            {*if $level < 3}
                <b><a href="http://{$smarty.server.HTTP_HOST}{$item.location}">{$item.name}</a></b>
            {else*}
                <a href="http://{$smarty.server.HTTP_HOST}{$item.location}">{$item.name}</a>
            {*/if*}
        {else}
        <b>{$item.name}</b>
        {/if}
    {if isset($item.children)}
        {include file="front/sitemap/menu.tpl" sitemap=$item.children level=$level+1}
    {/if}
    </li>
{/foreach}
</ul><br/>
{foreach from=$sitemap item="item"}
{if !empty($item.location)}
<url>
    <loc>http://{$smarty.server.HTTP_HOST}{$item.location}</loc>
    <changefreq>weekly</changefreq>
    <priority>{$item.priority|number_format:2:".":""}</priority>
</url>
{/if}
{if isset($item.children)}
{include file="front/sitemap/XMLlist.tpl" sitemap=$item.children}
{/if}
{/foreach}
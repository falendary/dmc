{foreach from=$sitemap item="item"}
{if !empty($item.fullAlias)}
<offer id="{$item.pageID}" type="vendor.model" available="true">
    <url>http://{$smarty.server.HTTP_HOST}{$item.fullAlias}</url>
    <price>{$item.data.price}</price>
    <currencyId>RUR</currencyId>
    <categoryId type="Own">{$item.parentID}</categoryId>
    <picture>http://{$smarty.server.HTTP_HOST}{$item.data.srcSmall}</picture>
    <delivery>true</delivery>
    <local_delivery_cost>300</local_delivery_cost>
{*    <typePrefix></typePrefix>*}
    <vendor>1C</vendor>
{*    <vendorCode>Q7533A</vendorCode>    *}
    <model>{$item.data.name}</model>
    <description>
        {$item.data.descriptionShort}
    </description>
    <manufacturer_warranty>true</manufacturer_warranty>
    <country_of_origin>Россия</country_of_origin>
</offer>
{/if}
{if isset($item.children)}
{include file="front/sitemap/XMLlist.tpl" sitemap=$item.children}
{/if}
{/foreach}
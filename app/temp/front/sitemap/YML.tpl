<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE yml_catalog SYSTEM "shops.dtd">
<yml_catalog date="{$smarty.now|date_format:"%Y-%m-%d %T"}">
    <shop>
        <name>{$SETTINGS.general.siteName}</name>
        <company>{$SETTINGS.general.siteName}</company>
        <url>http://{$HOST_NAME}/</url>

        <currencies>
            <currency id="RUR" rate="1" plus="0"/>
        </currencies>

        <categories>
            {foreach from=$CATS item=item}
                <category id="{$item.pageID}"{if $item.parentID != 0} parentId="{$item.parentID}"{/if}>{$item.name}</category>
            {/foreach}
        </categories>
        <local_delivery_cost>300</local_delivery_cost>
        <offers>
            {include file="front/sitemap/YMLlist.tpl" sitemap=$PAGES_TREE}
        </offers>
    </shop>
</yml_catalog>

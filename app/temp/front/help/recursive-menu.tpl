{foreach from=$menu item=item}
    <ul>
        <li {if $item.pageID==$PAGE.pageID}class='active'{/if}>
            <a href="{$item.fullAlias}">{$item.caption}</a>
            {if !empty($item.children)}
                {include file='front/help/recursive-menu.tpl' menu=$item.children}
            {/if}
        </li>
    </ul>
{/foreach}
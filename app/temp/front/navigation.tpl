   <!-- NAVIGATION -->
        <div id="main_menu">
            <h3>Меню</h3>
            <ul>
                {if isset($MAIN_MENU)}
                {foreach from=$MAIN_MENU item=MENU_ITEM}
                    <li class="{if ($MENU_ACTIVE_ALIAS == $MENU_ITEM.alias)}active{/if}">
                        <a href="{$MENU_ITEM.fullAlias}">{$MENU_ITEM.caption}</a>
                    </li>
                {/foreach}
                {/if}
            </ul>
        </div>
    <!-- /NAVIGATION -->
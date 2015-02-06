<!-- wrapper  start -->
<div id="wrapper">
    <!-- header  start -->
    <header id="header" class="beta">
        <div class="holder-time">
            <span class="time">00 : 00</span>
            <span class="date-new">2000 / 01 / 01</span>
        </div>
        <div class="top">
            <h1>Всероссийская система оперативных донесений о чрезвычайных ситуациях в реальном времени</h1>
        </div>
        <a class="russia" data-title="На карту" href="/">map</a>
        <div class="holder-operatop">
                <div class="holder-avater">
                    <a href="/admin/profile/" data-title="Профиль польователя">
                        <span class="name">{if !empty($USER->info.lastName)}{$USER->info.firstName} {$USER->info.lastName}{else}{$USER->GetLogin()}{/if}</span>
                        <span class="avatar">
                            <!--<img src="/images/img.jpg" alt="image" />-->
                        </span>
                    </a>
                </div>
                <a class="login" href="/logout/" data-title="Выход из системы">login</a>
            </div>
    </header>
    <!-- header  end
         main  start -->
    <div class="breadcrumbs">
        <ul class="breadcrumbs-list">
            {foreach from=$BREADCRUMBS item=piece}
                <li><a href='{$piece.fullAlias}'>{$piece.caption}</a></li>
            {/foreach}
        </ul>
    </div>
    <div id="main">
        <div class="help">
            <div class="wrap">
                <aside class="aside">
                    <form action="/help/search/" class="aside-search">
                        <div class="text search">
                            <button class="btn-search" type="submit">search</button>
                            <input class="text-input" type="text" value="{$QUERY|default:"поиск ..."}" name="q" alt="поиск ...">
                        </div>
                    </form>
                    {if !empty($HELP_MENU)}
                        {foreach from=$HELP_MENU item=menuItem}
                            <ul class="parent-menu{if !empty($menuItem.active)} active{/if}" >
                                <li><a href="{$menuItem.fullAlias}">{$menuItem.caption}</a>
                                    {if (!empty($menuItem.children)) && !empty($menuItem.active)}
                                        <ul class="child-menu">
                                            {foreach from=$menuItem.children item=menuItem2}
                                                <li {if $menuItem2.pageID == $PAGE.pageID}class="active"{/if}><a href="{$menuItem2.fullAlias}">{$menuItem2.caption}</a>
                                                {if !empty($menuItem2.children)}{include file='front/help/recursive-menu.tpl' menu=$menuItem2.children}{/if}
                                                </li>
                                            {/foreach}
                                        </ul>
                                    {/if}
                                </li>
                            </ul>
                        {/foreach}
                    {/if}
                </aside>
                <div class="help-area">
                    <a href="#" class="print"></a>
                    <p class="help-title">{$PAGE.caption}</p>
                    {if !empty($SUBSECTIONS)}
                        {foreach from=$SUBSECTIONS item=sect}
                            <p>{section loop=$sect.level-$CURRENT_LEVEL-1 name=margSect}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{/section}{*└*}  <a href="{$sect.fullAlias}">{$sect.caption}</a></p>
                        {/foreach}
                    {/if}
                    {$HELP_CONTENT|default}
                    {if isset($SEARCH_RESULTS)}
                        {include file='front/help/search-results.tpl'}
                    {/if}
                </div>
            </div>
            <div class="help-footer">
                {if !empty($PREV_SECTION)}
                    <div class="prev">
                        <a href="{$PREV_SECTION.fullAlias}" class="prev-btn"></a>
                        <a href="{$PREV_SECTION.fullAlias}">{$PREV_SECTION.caption}</a>
                    </div>
                {/if}
                {if !empty($NEXT_SECTION)}
                    <div class="next">
                        <a href="{$NEXT_SECTION.fullAlias}">{$NEXT_SECTION.caption}</a>
                        <a href="{$NEXT_SECTION.fullAlias}" class="next-btn"></a>
                    </div>
                {/if}
            </div>
        </div>
        <div class="footer man">
            <div class="send-info">
                <p>Оперативные сведения о чрезвычайных ситауциявх</p>
            </div>
        </div>
    </div>
</div>
<!-- wrapper  end -->
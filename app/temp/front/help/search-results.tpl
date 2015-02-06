<div class='search-results'>
{if !empty($SEARCH_RESULTS)}
    {foreach from=$SEARCH_RESULTS item=result}
        <div class='result'>
            <strong><a href='{$result.fullAlias}'>{$result.caption}</a></strong>
            <p class='result-short'>
                {$result.pageContent|strip_tags:false|mb_truncate:200}
            </p>
        </div>
    {/foreach}
{else}
    <p>По вашему запросу "<strong>{$QUERY}</strong>" ничего не найдено</p>
{/if}
</div>
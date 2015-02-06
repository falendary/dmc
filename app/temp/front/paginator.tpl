{if isset($PAGINATOR)}
<div class="tabset">
	<ul class="pagination">
		{if ($PAGINATOR.pageCurrent > 1)}
                    <li class="prev"><a href="?page={$PAGINATOR.pageCurrent-1}">пред</a></li>
                {/if}
                {if (($PAGINATOR.pageCurrent-3) >= 1)}
                    <li><a href="?page=1">1</a></li>
                    {if ($PAGINATOR.pageCurrent-3 != 1)}<li><a href="?page={$PAGINATOR.pageCurrent-3}">...</a></li>{/if}
                {/if}
                {if ($PAGINATOR.pageCurrent == 1)}
                    {assign var='foo_start' value=1}
                {else}
                    {assign var='foo_start' value=$PAGINATOR.pageCurrent-2}
                {/if}
		{section name=foo start=$foo_start loop=$PAGINATOR.pageCurrent+3 step=1}
                    {if (($smarty.section.foo.index >= 1) and ($smarty.section.foo.index <= $PAGINATOR.pageCount))}
			{if ($smarty.section.foo.index == $PAGINATOR.pageCurrent)}
				<li class="active">
				  <a>{$smarty.section.foo.index}</a>
				</li>
			{else}
				<li>
				  <a href="?page={$smarty.section.foo.index}">{$smarty.section.foo.index}</a> 
				</li>
			{/if}
                    {/if}
		{/section}
                {if (($PAGINATOR.pageCurrent+3) <= $PAGINATOR.pageCount)}
                    {if ($PAGINATOR.pageCurrent+3 != $PAGINATOR.pageCount)}<li><a href="?page={$PAGINATOR.pageCurrent+3}">...</a></li>{/if}
                    <li><a href="?page={$PAGINATOR.pageCount}">{$PAGINATOR.pageCount}</a></li>
                {/if}
		{if ($PAGINATOR.pageCurrent < ($PAGINATOR.pageCount))}
                    <li class="next"><a href="?page={$PAGINATOR.pageCurrent+1}">след</a></li>
                {/if}
	</ul>
</div>
{/if}
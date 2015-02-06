<div class="info important">
    <h1>Источник информации</h1>
    <ul class="list-info">
        <li>
            <div class="top">
                <div class="bottom">
                    <span class="info1">Состояние на:</span>
                    <span class="info2 center-text{if empty($REPORT) && $EDITABLE} generated{/if}">{if !empty($REPORT.createdDatetime)}{$REPORT.createdDatetime|date_format:$DATE_FORMAT}{else}{$smarty.now|date_format:$DATE_FORMAT}{/if}</span>
                    {if empty($REPORT.createdDatetime)}<input type='hidden' name='createdDatetime' value='{$smarty.now|date_format:$DATE_FORMAT}' />{/if}
                    <span class="info2 center-text{if !empty($CHECKING)} generated{/if}">{if !empty($REPORT.reviewedDatetime)}{$REPORT.reviewedDatetime|date_format:$DATE_FORMAT}{elseif !empty($CHECKING)}{$smarty.now|date_format:$DATE_FORMAT}{/if}</span>
                    {if empty($REPORT.reviewedDatetime) && !empty($CHECKING)}<input type='hidden' name='reviewedDatetime' value='{$smarty.now|date_format:$DATE_FORMAT}' />{/if}
                </div>
            </div>
        </li>
        <li>
            <div class="top">
                <div class="bottom">
                    <span class="info1">Наименование организации, направившей донесение:</span>
                    <span class="info2 center-text{if empty($REPORT) && $EDITABLE} generated{/if}">{if !empty($REPORT.createdOrganization)}{$REPORT.createdOrganization.name}{else}{$ORGANIZATION.name}{/if}</span>
                    <span class="info2 center-text{if !empty($CHECKING)} generated{/if}">{if !empty($REPORT.reviewedOrganization)}{$REPORT.reviewedOrganization.name}{elseif !empty($CHECKING)}{$CHECKER.organization.name}{/if}</span>
                </div>
            </div>
        </li>
        <li>
            <div class="top">
                <div class="bottom">
                    <span class="info1">Логотип организации</span>
                    <span class="info2 center-text">{if !empty($REPORT.createdOrganization.logoSmall)}<img src="{$REPORT.createdOrganization.logoSmall}" />{/if}{if !empty($ORGANIZATION.logoSmall)}<img src="{$ORGANIZATION.logoSmall}" />{/if}</span>
                    <span class="info2 center-text">{if !empty($REPORT.reviewedOrganization.logoSmall)}<img src="{$REPORT.reviewedOrganization.logoSmall}" />{/if}{if !empty($CHECKER.organization.logoSmall)}<img src="{$CHECKER.organization.logoSmall}" />{/if}</span>
                </div>
            </div>
        </li>
        <li>
            <div class="top">
                <div class="bottom">
                    <span class="info1">Федеральный округ:</span>
                    <span class="info2 center-text{if empty($REPORT) && $EDITABLE} generated{/if}">{if !empty($REPORT.createdOrganization.district)}{$REPORT.createdOrganization.district}{/if}{if !empty($ORGANIZATION.district)}{$ORGANIZATION.district}{/if}</span>
                </div>
            </div>
        </li>
    </ul>
</div>
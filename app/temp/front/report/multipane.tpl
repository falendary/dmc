{*    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta name="viewport" content="width=device-width">
        <title>operreport | new inner (line version)</title>

        <link rel="stylesheet" href="css/unique.css">
        <link rel="stylesheet" href="css/elements.css">
        <link rel="stylesheet" href="css/header.css">
        <link rel="stylesheet" href="css/footer.css">
        <link rel="stylesheet" href="css/new-inner.css">
        <link rel="stylesheet" href="css/all.css">

        <script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
        <script type="text/javascript" src="js/jquery-ui-1.10.3.custom.min.js"></script>
        <script type="text/javascript" src="js/jquery.elastic.source.js"></script>
        <!--[if IE]>
           <style>
               .inner-col .info {
                   display: block !important;
               }
           </style>
        <![endif]-->
        <!--[if lte IE 9]>
            <link rel="stylesheet" type="text/css" href="css/ie.css" media="screen"/>
            <script type="text/javascript" src="js/PIE.js"></script>
        <![endif]-->
        <!--[if lte IE 8]>
            <script type="text/javascript" src="js/modernizr-1.7.min.js"></script>
        <![endif]-->
        <script type="text/javascript" src="js/jquery.main.js"></script>
    </head>

    <body>*}
<div id="wrapper">
    <!-- header -->
    <header id="header" class="inner-new">
        <div class="toolbar">
            <div class="time-and-date">
                <div class="title-time time">0:00</div>
                <div class="round"></div>
                <div class="title-date date-new">2015/01/01</div>
            </div>
            <div class="title-app">
                <h2 class="title-app-tag"> ВСЕРОССИЙСКАЯ СИСТЕМА ОПЕРАТИВНЫХ ДОНЕСЕНИЙ ПО ЛИКВИДАЦИИ МЕДИКО-САНИТАРНЫХ ПОСЛЕДСТВИЙ ЧС </h2>
            </div>
        </div>
        <div class="arrow-button">
            <a href="/"><span></span></a>
        </div>
        <div class="icon-block">
            <i class="clock"></i>
            <i class="download"></i>
            <div class="one-strip{if empty($PANES_NUM) || 1==$PANES_NUM} active{/if}"></div>
            <div class="two-strip{if 2==$PANES_NUM} active{/if}"></div>
            {if !empty($TOTAL_PANES) && 3==$TOTAL_PANES}<div class="three-strip{if 3==$PANES_NUM} active{/if}"></div>{/if}
        </div>
        <div class="holder-operatop">
            <div class="holder-avater">
                <a href="/admin/profile/">
                    <span class="name">{if !empty($USER->info.lastName)}{$USER->info.firstName} {$USER->info.lastName}{else}{$USER->GetLogin()}{/if}</span>
                    <span class="avatar"></span>
                </a>
            </div>
            <a class="login" href="/logout/" data-title="Выход из системы">login</a>
        </div>
    </header>

    <!-- main -->
    <div id="main" class="inner-new">
        <div class="holder-form multipane">
            <form action="" method='post' id='multipane-form' class="form{if !empty($EDITABLE) && $EDITABLE} enabled{else} disabled{/if}{if !empty($LOCKED)} locked{/if}" autocomplete="off">
                <fieldset>
                    {include file='front/report/parts/locked_info.tpl'}
                    {if 'final'==$MODE}
                        {if !empty($REPORT.finalReportID)}<input type='hidden' name='finalReportID' value='{$REPORT.finalReportID}' />{/if}
                    {else}
                        {if !empty($REPORT.subsequentReportID)}<input type='hidden' name='subsequentReportID' value='{$REPORT.subsequentReportID}' />{/if}
                    {/if}
                    <div class="inner-line">
                        {if !empty($PANES.initial)}
                        <div class="col inner-col">
                            <div class="title-block">
                                <a href="/initial/{$PANES.initial.initialReportID}"><strong class="status orange-status">первичное донесение  /  {$PANES.initial.reportHID}</strong></a>
                                <a class="lock-icon close"></a>
                            </div>
                        </div>
                        {/if}
                        {if !empty($PANES.subsequent)}
                        <div class="col inner-col">
                            <div class="title-block">
                                <a href="/subsequent/{$PANES.subsequent.subsequentReportID}"><strong class="status">последующее донесение №{$PANES.subsequent.sequenceNumber}/ {$PANES.subsequent.reportHID}</strong></a>
                                <a class="lock-icon close"></a>
                            </div>
                        </div>
                        {/if}
                        <div class="col inner-col open">
                            <div class="title-block">
                                <strong class="status {if 'final'==$MODE}green-status{/if}">{if 'final'==$MODE}заключительное{else}последующее{/if} донесение{if 'subsequent'==$MODE} №{$REPORT.sequenceNumber}{/if} / {$REPORT.reportHID}</strong>
                                <a class="lock-icon open"></a>
                            </div>
                        </div>
                    </div>

                    <div class="inner-line">
                        {if !empty($PANES.initial)}
                        <div class="col inner-col">
                            <div class="info">
                                <h2>Источник информации</h2>
                                <ul class="inner-list">
                                    <li>
                                        <p>
                                            Состояние на:
                                            <span class="black-color">{$PANES.initial.createdDatetime|date_format:$DATE_FORMAT}</span>
                                        </p>
                                        <div class="status-resource">
                                            {if !empty($PANES.initial.createdOrganization.logoSmall)}<img src="{$PANES.initial.createdOrganization.logoSmall}" style="width: 32px" />{/if}
                                        <span class="black-color">
                                            {$PANES.initial.createdOrganization.name}
                                        </span>
                                        </div>
                                    </li>
                                    <li>
                                        <p>Состояние на:
                                            <span class="black-color">{$PANES.initial.reviewedDatetime|date_format:$DATE_FORMAT}</span>
                                        </p>
                                        <div class="status-resource">
                                            {if !empty($PANES.initial.reviewedOrganization.logoSmall)}<img src="{$PANES.initial.reviewedOrganization.logoSmall}" style="width: 32px" />{/if}
                                        <span class="black-color">
                                            {$PANES.initial.reviewedOrganization.name}
                                        </span>
                                        </div>
                                    </li>

                                </ul>
                            </div>
                        </div>
                        {/if}

                        {if !empty($PANES.subsequent)}
                        <div class="col inner-col">
                            <div class="info">
                                <h2>Источник информации</h2>
                                <ul class="inner-list">
                                    <li>
                                        <p>
                                            Состояние на:
                                            <span class="black-color">{$PANES.subsequent.createdDatetime|date_format:$DATE_FORMAT}</span>
                                        </p>
                                        <div class="status-resource">
                                            {if !empty($PANES.subsequent.createdOrganization.logoSmall)}<img src="{$PANES.subsequent.createdOrganization.logoSmall}" style="width: 32px" />{/if}
                                        <span class="black-color">
                                            {$PANES.subsequent.createdOrganization.name}
                                        </span>
                                        </div>
                                    </li>
                                    <li>
                                        <p>Состояние на:
                                            <span class="black-color">{$PANES.subsequent.reviewedDatetime|date_format:$DATE_FORMAT}</span>
                                        </p>
                                        <div class="status-resource">
                                            {if !empty($PANES.subsequent.reviewedOrganization.logoSmall)}<img src="{$PANES.subsequent.reviewedOrganization.logoSmall}" style="width: 32px" />{/if}
                                        <span class="black-color">
                                            {$PANES.subsequent.reviewedOrganization.name}
                                        </span>
                                        </div>
                                    </li>

                                </ul>
                            </div>
                        </div>
                        {/if}

                        <div class="col inner-col open">
                            <div class="info">
                                <h2>Источник информации</h2>
                                <ul class="inner-list">
                                    <li>
                                        <p>
                                            Состояние на:
                                            <span class="black-color{if empty($REPORT) && $EDITABLE} generated{/if}">{if !empty($REPORT.createdDatetime)}{$REPORT.createdDatetime|date_format:$DATE_FORMAT}{else}{$smarty.now|date_format:$DATE_FORMAT}{/if}</span>
											{if empty($REPORT.createdDatetime)}<input type='hidden' name='createdDatetime' value='{$smarty.now|date_format:$DATE_FORMAT}' />{/if}
                                        </p>
                                        <div class="status-resource">
                                            {if !empty($REPORT.createdOrganization.logoSmall)}<img src="{$REPORT.createdOrganization.logoSmall}" style="width: 32px" />{/if}{if !empty($ORGANIZATION.logoSmall)}<img src="{$ORGANIZATION.logoSmall}" style="width: 32px" />{/if}
                                        <span class="black-color{if empty($REPORT) && $EDITABLE} generated{/if}">
                                            {if !empty($REPORT.createdOrganization)}{$REPORT.createdOrganization.name}{else}{$ORGANIZATION.name}{/if}
                                        </span>
                                        </div>
                                    </li>
                                    <li>
                                        <p>Состояние на:
                                            <span class="black-color{if !empty($CHECKING)} generated{/if}">{if !empty($REPORT.reviewedDatetime)}{$REPORT.reviewedDatetime|date_format:$DATE_FORMAT}{elseif !empty($CHECKING)}{$smarty.now|date_format:$DATE_FORMAT}{/if}</span>
											{if empty($REPORT.reviewedDatetime) && !empty($CHECKING)}<input type='hidden' name='reviewedDatetime' value='{$smarty.now|date_format:$DATE_FORMAT}' />{/if}
                                        </p>
                                        <div class="status-resource">
                                            {if !empty($REPORT.reviewedOrganization.logoSmall)}<img src="{$REPORT.reviewedOrganization.logoSmall}" style="width: 32px" />{/if}{if !empty($CHECKER.organization.logoSmall)}<img src="{$CHECKER.organization.logoSmall}" style="width: 32px" />{/if}
                                        <span class="black-color{if !empty($CHECKING)} generated{/if}">
                                            {if !empty($REPORT.reviewedOrganization)}{$REPORT.reviewedOrganization.name}{elseif !empty($CHECKING)}{$CHECKER.organization.name}{/if}
                                        </span>
                                        </div>
                                    </li>

                                </ul>
                            </div>
                        </div>
                    </div>


                    <div class="inner-line">
                        {if !empty($PANES.initial)}
                        <div class="col inner-col first-inner-col">
                            <div class="info character">
                                <h2>Характер чс</h2>
                                <div class="wrap-form">
                                    <div class="double">
                                        <label>Округа РФ</label>
                                        <div class="hold-text">
                                            <p>{$PANES.initial.createdOrganization.district|default}</p>
                                            <p>{$PANES.initial.createdOrganization.military_district|default}</p>
                                        </div>
                                    </div>
                                    <div class="double">
                                        <label for='scaleID_initial'>Масштаб ЧС</label>
                                        <div class="hold-select">
                                            <select class="customSelect" disabled="disabled" id='scaleID_initial'>
                                                {foreach from=$ES_SCALES item=SCALE key=KEY}
													<option value="{$KEY}" {if !empty($PANES.initial.scaleID) && $PANES.initial.scaleID==$KEY}selected='selected'{/if}>{$SCALE}</option>
												{/foreach}
                                            </select>
                                        </div>
                                    </div>
                                    <div class="double">
                                        <label for='kindID_initial'>Вид ЧС</label>
                                        <div class="hold-select">
                                            <select class="customSelect" disabled="disabled" id='kindID_initial'>
                                                {foreach from=$ES_KINDS key=KEY item=KIND}
													<option value="{$KIND.kindID}" {if !empty($KIND.criterion)}data-text="{$KIND.criterion}"{/if} {if !empty($PANES.initial.kindID) && $PANES.initial.kindID==$KIND.kindID}selected='selected'{/if}>{$KIND.name}</option>
												{/foreach}
                                            </select>
                                        </div>
                                    </div>
                                    <div class="double">
                                        <label for='typeID_initial'>Тип ЧС</label>
                                        <div class="hold-select">
                                            <select class="customSelect" disabled="disabled" id='typeID_initial'>
                                                {if !empty($ES_TYPES)}
													{foreach from=$ES_TYPES key=KEY item=TYPE}
														<option value="{$TYPE.typeID}" {if !empty($TYPE.criterion)}data-text="{$TYPE.criterion}"{/if} {if !empty($PANES.initial.typeID) && $PANES.initial.typeID==$TYPE.typeID}selected='selected'{/if}>{$TYPE.name}</option>
													{/foreach}
												{/if}
                                                {*<option>Транспортного характера (катастрофа)</option>
                                                <option>Пожары, взрывы, угроза взрывов</option>
                                                <option>Аварии с выбросом химически опасных веществ</option>*}
                                            </select>
                                        </div>
                                    </div>
                                    <div class="double">
                                        <div class="holl">
                                            <label for='locationName_initial'>Место ЧС</label>
                                            <div class="hold-map-box disabled">
                                                <div class="holder-inp">
                                                    <input type="text" disabled="disabled" id='locationName_initial' value='{$PANES.initial.locationName|default}'>
                                                </div>
                                                <div class="holder-list">
                                                    <div class="custom-scroll">
                                                        <ul></ul>
                                                    </div>
                                                </div>
                                                <a class="buttom-map disabled" data-class="buttom-map" href="#map-small">buttom-map</a>
                                                <a class="link-description" href="#">&nbsp;</a>
                                            </div>
                                        </div>
                                        <div class="box-hide open">
                                            <div class="box">
                                                <label for='locationComment_initial'><span>Комментарий</span></label>
                                                <div class="hold">
                                                    <textarea  placeholder="—" disabled="disabled" id='locationComment_initial'>{$PANES.initial.locationComment|default}</textarea>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="double">
                                        <label class="with-desc" for='datetimeEs_initial'>Дата и время ЧС <span>(Московское)</span></label>
                                        <div class="hold-data">
                                            <input type="text" readonly="readonly" disabled="disabled" id='datetimeEs_initial' value='{$PANES.initial.datetimeEs|date_format:$DATE_FORMAT}'>
                                            <a class="ui-datepicker-trigger disabled" href="#date">data</a>
                                        </div>
                                    </div>
                                    <div class="double">
                                        <label for='esName_initial'>Характеристика и обстоятельства ЧС</label>
                                        <div class="hold-data">
                                            <input type="text" disabled="disabled" id='esName_initial' value='{$PANES.initial.esName|default}'>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        {/if}

                        {if !empty($PANES.subsequent)}
                        <div class="col inner-col{if empty($PANES.initial)} first-inner-col{/if}">
                            <div class="info character">
                                <h2>Характер чс</h2>
                                <div class="wrap-form">
                                    <div class="double">
                                        <label>Округа РФ</label>
                                        <div class="hold-text">
                                            <p>{$PANES.subsequent.createdOrganization.district|default}</p>
                                            <p>{$PANES.subsequent.createdOrganization.military_district|default}</p>
                                        </div>
                                    </div>
                                    <div class="double">
                                        <label for='scaleID_subsequent'>Масштаб ЧС</label>
                                        <div class="hold-select">
                                            <select class="customSelect" disabled="disabled" id='scaleID_subsequent'>
                                                {foreach from=$ES_SCALES item=SCALE key=KEY}
													<option value="{$KEY}" {if !empty($PANES.subsequent.scaleID) && $PANES.subsequent.scaleID==$KEY}selected='selected'{/if}>{$SCALE}</option>
												{/foreach}
                                            </select>
                                        </div>
                                    </div>
                                    <div class="double">
                                        <label for='kindID_initial'>Вид ЧС</label>
                                        <div class="hold-select">
                                            <select class="customSelect" disabled="disabled" id='kindID_initial'>
                                                {foreach from=$ES_KINDS key=KEY item=KIND}
													<option value="{$KIND.kindID}" {if !empty($KIND.criterion)}data-text="{$KIND.criterion}"{/if} {if !empty($PANES.subsequent.kindID) && $PANES.subsequent.kindID==$KIND.kindID}selected='selected'{/if}>{$KIND.name}</option>
												{/foreach}
                                            </select>
                                        </div>
                                    </div>
                                    <div class="double">
                                        <label for='typeID_subsequent'>Тип ЧС</label>
                                        <div class="hold-select">
                                            <select class="customSelect" disabled="disabled" id='typeID_initial'>
                                                {if !empty($ES_TYPES)}
                                                    {foreach from=$ES_TYPES key=KEY item=TYPE}
                                                        <option value="{$TYPE.typeID}" {if !empty($TYPE.criterion)}data-text="{$TYPE.criterion}"{/if} {if !empty($PANES.subsequent.typeID) && $PANES.subsequent.typeID==$TYPE.typeID}selected='selected'{/if}>{$TYPE.name}</option>
                                                    {/foreach}
                                                {/if}
                                            </select>
                                        </div>
                                    </div>
                                    <div class="double">
                                        <div class="holl">
                                            <label for='locationName_subsequent'>Место ЧС</label>
                                            <div class="hold-map-box disabled">
                                                <div class="holder-inp">
                                                    <input type="text" disabled="disabled" id='locationName_subsequent' value='{$PANES.subsequent.locationName|default}'>
                                                </div>
                                                <div class="holder-list">
                                                    <div class="custom-scroll">
                                                        <ul></ul>
                                                    </div>
                                                </div>
                                                <a class="buttom-map disabled" data-class="buttom-map" href="#map-small">buttom-map</a>
                                                <a class="link-description" href="#">&nbsp;</a>
                                            </div>
                                        </div>
                                        <div class="box-hide open">
                                            <div class="box">
                                                <label for='locationComment_subsequent'><span>Комментарий</span></label>
                                                <div class="hold">
                                                    <textarea  placeholder="—" disabled="disabled" id='locationComment_subsequent'>{$PANES.subsequent.locationComment|default}</textarea>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="double">
                                        <label class="with-desc" for='datetimeEs_subsequent'>Дата и время ЧС <span>(Московское)</span></label>
                                        <div class="hold-data">
                                            <input type="text" readonly="readonly" disabled="disabled" id='datetimeEs_subsequent' value='{$PANES.subsequent.datetimeEs|date_format:$DATE_FORMAT}'>
                                            <a class="ui-datepicker-trigger disabled" href="#date">data</a>
                                        </div>
                                    </div>
                                    <div class="double">
                                        <label for='esName_subsequent'>Характеристика и обстоятельства ЧС</label>
                                        <div class="hold-data">
                                            <input type="text" disabled="disabled" id='esName_subsequent' value='{$PANES.subsequent.esName|default}'>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        {/if}

                        <div class="col inner-col open">
                            <div class="info character">
                                <h2>Характер чс</h2>
                                <div class="wrap-form">
                                    <div class="double">
                                        <label>Округа РФ</label>
                                        <div class="hold-text{if empty($REPORT) && $EDITABLE} generated{/if}">
                                            <p>{if !empty($REPORT.createdOrganization.district)}{$REPORT.createdOrganization.district}{/if}{if !empty($ORGANIZATION.district)}{$ORGANIZATION.district}{/if}</p>
                                             <p>{if !empty($REPORT.createdOrganization.military_district)}{$REPORT.createdOrganization.military_district}{/if}{if !empty($ORGANIZATION.military_district)}{$ORGANIZATION.military_district}{/if}</p>
                                        </div>
                                    </div>
                                    <div class="double">
                                        <label>Масштаб ЧС</label>
                                        <div class="hold-select">
                                            <select class="customSelect" name='scaleID' id='scaleID' {if empty($EDITABLE)}disabled='disabled'{/if}>
                                                {foreach from=$ES_SCALES item=SCALE key=KEY}
													<option value="{$KEY}" {if !empty($REPORT.scaleID) && $REPORT.scaleID==$KEY}selected='selected'{/if}>{$SCALE}</option>
												{/foreach}
                                            </select>
                                        </div>
                                    </div>
                                    <div class="double">
                                        <label>Вид ЧС</label>
                                        <div class="hold-select">
                                            <select class="customSelect" name='kindID' id='kindID' {if empty($EDITABLE)}disabled='disabled'{/if}>
                                                {foreach from=$ES_KINDS key=KEY item=KIND}
													<option value="{$KIND.kindID}" {if !empty($KIND.criterion)}data-text="{$KIND.criterion}"{/if} {if !empty($REPORT.kindID) && $REPORT.kindID==$KIND.kindID}selected='selected'{/if}>{$KIND.name}</option>
												{/foreach}
                                            </select>
											{if empty($ES_TYPES)}
												{literal}
												<script type="text/javascript">$(document).ready(function() {$('#kindID').trigger('change')});</script>
												{/literal}
											{/if}
                                        </div>
                                    </div>
                                    <div class="double">
                                        <label>Тип ЧС</label>
                                        <div class="hold-select">
                                            <select class="customSelect" name='typeID' id='typeID' {if empty($EDITABLE)}disabled='disabled'{/if}>
                                                {if !empty($ES_TYPES)}
													{*<option value="">-</option>*}
													{foreach from=$ES_TYPES key=KEY item=TYPE}
														<option value="{$TYPE.typeID}" {if !empty($TYPE.criterion)}data-text="{$TYPE.criterion}"{/if} {if !empty($REPORT.typeID) && $REPORT.typeID==$TYPE.typeID}selected='selected'{/if}>{$TYPE.name}</option>
													{/foreach}
												{/if}
                                            </select>
                                        </div>
                                    </div>

                                    <div class="double">
                                        <div class="holl">
                                            <label>Место ЧС</label>
                                            <div class="hold-map-box">
                                                <div class="holder-inp">
                                                    <input type="text" class="no-clear" placeholder="" autocomplete="off" name='locationName' id='locationName' {if !empty($REPORT.locationName)}data-tainted="true"{/if} value='{$REPORT.locationName|default}' {if empty($EDITABLE)}disabled='disabled'{/if} >
                                                </div>
                                                <input type="hidden" name="locationCoords" />
                                                <div class="holder-list">
                                                    <div class="custom-scroll">
                                                        <ul>
                                                            <li><a href="#">Краснодарский край, Усть-Лабинский район</a> </li>
                                                            <li><a href="#">Московская область, г. Обнинск</a> </li>
                                                            <li><a href="#">Казань</a></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                                <a class="buttom-map buttom-map-actual" data-class="buttom-map-actual" href="#map-small">buttom-map</a>
                                                <a class="link-description" href="#">&nbsp;</a>
                                            </div>
                                        </div>
                                        <div class="box-hide open">
                                            <div class="box">
                                                <label><span>Комментарий</span></label>
                                                <div class="hold">
                                                    <textarea  placeholder="—" name="locationComment" id="locationComment" {if empty($EDITABLE)}disabled='disabled'{/if}>{$REPORT.locationComment|default}</textarea>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="double">
                                        <label class="with-desc">Дата и время ЧС <span>(Московское)</span></label>
                                        <div class="hold-data">
                                            <input type="text" placeholder="" readonly="readonly" name='datetimeEs' id='datetimeEs' value='{if !empty($REPORT.datetimeEs)}{$REPORT.datetimeEs|date_format:$DATE_FORMAT}{/if}' {if empty($EDITABLE)}disabled='disabled'{/if} >
                                            <a class="ui-datepicker-trigger datepicker-actual{if empty($EDITABLE)} disabled{/if}" data-class="datepicker-actual" href="#date">data</a>
                                        </div>
                                    </div>
                                    <div class="double">
                                        <label>Характеристика и обстоятельства ЧС</label>
                                        <div class="hold-data">
                                            <input type="text" name='esName' id='esName' {if empty($EDITABLE)}disabled='disabled'{/if} value="{$REPORT.esName|default}" >
                                        </div>
                                    </div>
									{if 'final'==$MODE}
										<div class="double">
											<label class="with-desc">Продолжительность<br>ЧС</label>
											<div class="hold-data">
												<input type="text">
											</div>
										</div>
									{/if}
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="inner-line">
                        {if !empty($PANES.initial)}
                        <div class="col inner-col">
                            <div class="info">
                                <h2>Пострадавшие</h2>
                                <div class="holder-triple">
                                    <div class="triple">
                                        <div class="left">
                                            <label class="only" for='victimsTotal_initial'>Всего</label>
											<span class="inf-only">
												<span class="text-center">
													<span class="text-inner">
														<span class="text-last sm-text sm-line">в т. ч. погибших, всего</span>
													</span>
												</span>
											</span>
                                        </div>
                                        <div class="right">
                                            <div class="holder-small">
                                                <span><input type="text" disabled="disabled" id='victimsTotal_initial' value='{$PANES.initial.victimsTotal|default:0}'></span>
                                                <label class="sm-text" for='victimsChildren_initial'>из них детей</label>
                                                <span><input type="text" disabled="disabled" id='victimsChildren_initial' value='{$PANES.initial.victimsChildren|default:0}'></span>
                                            </div>
                                            <div class="holder-small">
                                                <input type="text" disabled="disabled" value='{$PANES.initial.victimsDeadTotal|default:0}'>
                                                <label class="sm-text" for='victimsDeadChildren_initial'>из них детей</label>
                                                <input type="text" disabled="disabled" id='victimsDeadChildren_initial' value='{$PANES.initial.victimsDeadChildren|default:0}'>
                                            </div>
                                        </div>
                                    </div>
                                    <strong class="title has-border">медицинская эвакуация</strong>
                                    <div class="triple">
                                        <div class="left">
                                            <label class="only" for='evacuatedTotal_initial'>Всего</label>
                                            <span class="inf-only">
                                                <span class="text-center">
                                                    <span class="text-inner">
                                                        <span class="text-last sm-text sm-line">в т. ч. авиатранспортом, всего</span>
                                                    </span>
                                                </span>
                                            </span>
                                        </div>
                                        <div class="right">
                                            <div class="holder-small">
                                                <input type="text" disabled="disabled" id='evacuatedTotal_initial' value='{$PANES.initial.evacuatedTotal|default:0}'>
                                                <label class="sm-text" for='evacuatedChildren_initial'>из них детей</label>
                                                <input type="text" disabled="disabled" id='evacuatedChildren_initial' value='{$PANES.initial.evacuatedChildren|default:0}'>
                                            </div>
                                            <div class="holder-small">
                                                <input type="text" disabled="disabled" id='evacuatedByAirTotal_initial' value='{$PANES.initial.evacuatedByAirTotal|default:0}'>
                                                <label class="sm-text" for='evacuatedByAirChildren_initial'>из них детей</label>
                                                <input type="text" disabled="disabled" id='evacuatedByAirChildren_initial' value='{$PANES.initial.evacuatedByAirChildren|default:0}'>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        {/if}

                        {if !empty($PANES.subsequent)}
                        <div class="col inner-col">
                            <div class="info">
                                <h2>Пострадавшие</h2>
                                <div class="holder-triple">
                                    <div class="triple">
                                        <div class="left">
                                            <label class="only" for='victimsTotal_subsequent'>Всего</label>
                                            <span class="inf-only">
                                                <span class="text-center">
                                                    <span class="text-inner">
                                                        <span class="text-last sm-text sm-line">в т. ч. погибших, всего</span>
                                                    </span>
                                                </span>
                                            </span>
                                        </div>
                                        <div class="right">
                                            <div class="holder-small">
                                                <span><input type="text" disabled="disabled" id='victimsTotal_subsequent' value='{$PANES.subsequent.victimsTotal|default:0}'></span>
                                                <label class="sm-text" for='victimsChildren_subsequent'>из них детей</label>
                                                <span><input type="text" disabled="disabled" id='victimsChildren_subsequent' value='{$PANES.subsequent.victimsChildren|default:0}'></span>
                                            </div>
                                            <div class="holder-small">
                                                <input type="text" disabled="disabled" value='{$PANES.subsequent.victimsDeadTotal|default:0}'>
                                                <label class="sm-text" for='victimsDeadChildren_subsequent'>из них детей</label>
                                                <input type="text" disabled="disabled" id='victimsDeadChildren_subsequent' value='{$PANES.subsequent.victimsDeadChildren|default:0}'>
                                            </div>
                                        </div>
                                    </div>
                                    <strong class="title has-border">медицинская эвакуация</strong>
                                    <div class="triple">
                                        <div class="left">
                                            <label class="only" for='evacuatedTotal_subsequent'>Всего</label>
                                            <span class="inf-only">
                                                <span class="text-center">
                                                    <span class="text-inner">
                                                        <span class="text-last sm-text sm-line">
                                                            в т. ч. авиатранспортом, всего
                                                        </span>
                                                    </span>
                                                </span>
                                            </span>
                                        </div>
                                        <div class="right">
                                            <div class="holder-small">
                                                <input type="text" disabled="disabled" id='evacuatedTotal_initial' value='{$PANES.subsequent.evacuatedTotal|default:0}'>
                                                <label class="sm-text" for='evacuatedChildren_subsequent'>из них детей</label>
                                                <input type="text" disabled="disabled" id='evacuatedChildren_initial' value='{$PANES.subsequent.evacuatedChildren|default:0}'>
                                            </div>
                                            <div class="holder-small">
                                                <input type="text" disabled="disabled" id='evacuatedByAirTotal_initial' value='{$PANES.subsequent.evacuatedByAirTotal|default:0}'>
                                                <label class="sm-text" for='evacuatedByAirChildren_subsequent'>из них детей</label>
                                                <input type="text" disabled="disabled" id='evacuatedByAirChildren_initial' value='{$PANES.subsequent.evacuatedByAirChildren|default:0}'>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        {/if}

                        <div class="col inner-col open">
                            <div class="info">
                                <h2>Пострадавшие</h2>
                                <div class="holder-triple">
                                    <div class="triple">
                                        <div class="left">
                                            <label for='victimsTotal' class="only">Всего</label>
                                            <span class="inf-only">
                                                <span class="text-center">
                                                    <span class="text-inner">
                                                        <span class="text-last sm-text sm-line">в т. ч. погибших, всего</span>
                                                    </span>
                                                </span>
                                            </span>
                                        </div>
                                        <div class="right">
                                            <div class="holder-small">
                                                <span><input type="text" min="0" placeholder="" class="numeric" name='victimsTotal' id='victimsTotal' value='{$REPORT.victimsTotal|default}' {if empty($EDITABLE)}disabled='disabled'{/if}></span>
                                                <label class="sm-text">из них детей</label>
                                                <span><input type="text" min="0" placeholder="" class="numeric" name='victimsChildren' id='victimsChildren' value='{$REPORT.victimsChildren|default}' {if empty($EDITABLE)}disabled='disabled'{/if}></span>
                                            </div>
                                            <div class="holder-small">
                                                <input type="text" min="0" placeholder="" class="numeric" name='victimsDeadTotal' id='victimsDeadTotal' value='{$REPORT.victimsDeadTotal|default}' {if empty($EDITABLE)}disabled='disabled'{/if}>
                                                <label class="sm-text">из них детей</label>
                                                <input type="text" min="0" placeholder="" class="numeric" name='victimsDeadChildren' id='victimsDeadChildren' value='{$REPORT.victimsDeadChildren|default}' {if empty($EDITABLE)}disabled='disabled'{/if}>
                                            </div>
                                        </div>
                                    </div>
                                    <strong class="title has-border">медицинская эвакуация</strong>
                                    <div class="triple">
                                        <div class="left">
                                            <label class="only" for='evacuatedTotal'>Всего</label>
                                            <span class="inf-only">
                                                <span class="text-center">
                                                    <span class="text-inner">
                                                        <span class="text-last sm-text sm-line">
                                                            в т. ч. авиатранспортом, всего
                                                        </span>
                                                    </span>
                                                </span>
                                            </span>
                                        </div>
                                        <div class="right">
                                            <div class="holder-small">
                                                <input type="text" min="0" placeholder="" class="numeric" name='evacuatedTotal' id='evacuatedTotal' value='{$REPORT.evacuatedTotal|default}' {if empty($EDITABLE)}disabled='disabled'{/if}>
                                                <label class="sm-text" for='evacuatedChildren'>из них детей</label>
                                                <input type="text" min="0" placeholder="" class="numeric" name='evacuatedChildren' id='evacuatedChildren' value='{$REPORT.evacuatedChildren|default}' {if empty($EDITABLE)}disabled='disabled'{/if}>
                                            </div>
                                            <div class="holder-small">
                                                <input type="text" min="0" placeholder="" class="numeric" name='evacuatedByAirTotal' id='evacuatedByAirTotal' value='{$REPORT.evacuatedByAirTotal|default}' {if empty($EDITABLE)}disabled='disabled'{/if}>
                                                <label class="sm-text" for='evacuatedByAirChildren'>из них детей</label>
                                                <input type="text" min="0" placeholder="" class="numeric" name='evacuatedByAirChildren' id='evacuatedByAirChildren' value='{$REPORT.evacuatedByAirChildren|default}' {if empty($EDITABLE)}disabled='disabled'{/if}>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="inner-line">
                        {if !empty($PANES.initial)}
                        <div class="col inner-col">
                            <div class="info">
                                <h2>медицинские бригады</h2>
                                <div class="medical holder-triple additional-strength">
                                    <div class="holder-triple">
                                    {foreach from=$MEDICAL_TEAMS item=MEDICAL_TEAM}
										{if !$MEDICAL_TEAM.isSecondary}
											<div class="triple">
												<div class="left">
													<label for="medicalTeam_{$MEDICAL_TEAM.medicalTeamID}" {if !empty($MEDICAL_TEAM.hint)}data-title='{$MEDICAL_TEAM.hint}'{/if}>{$MEDICAL_TEAM.name}, всего</label>
													<figure>
														<img src="{$MEDICAL_TEAM.imageSrcSmall|default}" alt="{$MEDICAL_TEAM.name}" {if !empty($MEDICAL_TEAM.hint)}data-title='{$MEDICAL_TEAM.hint}'{/if}>
													</figure>
												</div>
												<div class="right">
													<div class="holder-small">
														<input type="text" min="0" placeholder="-" class="numeric" name='medicalTeams[{$MEDICAL_TEAM.medicalTeamID}][number]' id='medicalTeam_{$MEDICAL_TEAM.medicalTeamID}' value='{$PANES.initial.medicalTeams[$MEDICAL_TEAM.medicalTeamID].number|default:0}' disabled='disabled' data-title='Всего'>
													</div>
                                                    <div class="holder-big normal-tarea">
                                                        <textarea cols="10" rows="30" placeholder="-" name='medicalTeams[{$MEDICAL_TEAM.medicalTeamID}][comment]' disabled='disabled' data-title='Комментарий' >{$PANES.initial.medicalTeams[$MEDICAL_TEAM.medicalTeamID].comment|default}</textarea>
                                                    </div>
												</div>
											</div>
										{/if}
									{/foreach}
                                    </div>
                                </div>
                            </div>
                        </div>
                        {/if}

                        {if !empty($PANES.subsequent)}
                        <div class="col inner-col">
                            <div class="info">
                                <h2>медицинские бригады</h2>
                                <div class="medical holder-triple additional-strength">
                                    <div class="holder-triple">
                                    {foreach from=$MEDICAL_TEAMS item=MEDICAL_TEAM}
										{if !$MEDICAL_TEAM.isSecondary}
											<div class="triple">
												<div class="left">
													<label for="medicalTeam_{$MEDICAL_TEAM.medicalTeamID}" {if !empty($MEDICAL_TEAM.hint)}data-title='{$MEDICAL_TEAM.hint}'{/if}>{$MEDICAL_TEAM.name}, всего</label>
													<figure>
														<img src="{$MEDICAL_TEAM.imageSrcSmall|default}" alt="{$MEDICAL_TEAM.name}" {if !empty($MEDICAL_TEAM.hint)}data-title='{$MEDICAL_TEAM.hint}'{/if}>
													</figure>
												</div>
												<div class="right">
													<div class="holder-small">
														<input type="text" min="0" placeholder="-" class="numeric" name='medicalTeams[{$MEDICAL_TEAM.medicalTeamID}][number]' id='medicalTeam_{$MEDICAL_TEAM.medicalTeamID}' value='{$PANES.subsequent.medicalTeams[$MEDICAL_TEAM.medicalTeamID].number|default:0}' disabled='disabled' data-title='Всего'>
													</div>
                                                    <div class="holder-big normal-tarea">
                                                        <textarea cols="10" rows="30" placeholder="-" name='medicalTeams[{$MEDICAL_TEAM.medicalTeamID}][comment]' disabled='disabled' data-title='Комментарий' >{$PANES.subsequent.medicalTeams[$MEDICAL_TEAM.medicalTeamID].comment|default}</textarea>
                                                    </div>
												</div>
											</div>
										{/if}
									{/foreach}
                                    </div>
                                </div>
                                <div class="hight-box additional-strength">
                                    <a class="title" href="#"><strong class="title has-border">дополнительные медицинские силы</strong></a>
                                    <div class="box-new">
                                        <div class="medical holder-triple box">
                                            {foreach from=$MEDICAL_TEAMS item=MEDICAL_TEAM}
												{if $MEDICAL_TEAM.isSecondary}
													<div class="triple">
														<div class="left">
															<label for='medicalTeam_{$MEDICAL_TEAM.medicalTeamID}' data-title='{$MEDICAL_TEAM.hint}'>{$MEDICAL_TEAM.name}</label>
															<figure>
																<img src="{$MEDICAL_TEAM.imageSrcSmall|default}" alt="{$MEDICAL_TEAM.name}" data-title='{$MEDICAL_TEAM.hint}' >
															</figure>
														</div>
														<div class="right">
															<div class="holder-small">
																<input type="text" placeholder="-" class="numeric" name='medicalTeams[{$MEDICAL_TEAM.medicalTeamID}][number]' id='medicalTeam_{$MEDICAL_TEAM.medicalTeamID}' value='{$PANES.subsequent.medicalTeams[$MEDICAL_TEAM.medicalTeamID].number|default:0}' disabled='disabled' data-title='Всего'>
															</div>
                                                            <div class="holder-big normal-tarea">
                                                                <textarea cols="10" rows="30" placeholder="-" name='medicalTeams[{$MEDICAL_TEAM.medicalTeamID}][comment]' disabled='disabled' data-title='Комментарий' >{$PANES.subsequent.medicalTeams[$MEDICAL_TEAM.medicalTeamID].comment|default}</textarea>
                                                            </div>
														</div>
													</div>
												{/if}
											{/foreach}
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        {/if}

                        <div class="col inner-col open {if 'final'==$MODE}final-report{/if}">
                            <div class="info">
                                <h2>медицинские бригады</h2>
                                <div class="medical holder-triple additional-strength">
                                     <div class="medical holder-triple box">
									{foreach from=$MEDICAL_TEAMS item=MEDICAL_TEAM}
										{if !$MEDICAL_TEAM.isSecondary}
											<div class="triple">
												<div class="left">
                                                    {if 'final'==$MODE}
                                                        <div class="lbl-block">
                                                            <label class="only" for="medicalTeam_{$MEDICAL_TEAM.medicalTeamID}" {if !empty($MEDICAL_TEAM.hint)}data-title='{$MEDICAL_TEAM.hint}'{/if}>{$MEDICAL_TEAM.name}</label>
                                                            <div class="sub-lbl-block-right">
                                                                <label class="only sub-label">всего</label>
                                                            </div>
                                                            <div class="sub-lbl-block">
                                                                <label class="only sub-label">из них штатных формирований</label>
                                                            </div>
                                                        </div>
                                                    {else}
                                                        <label for="medicalTeam_{$MEDICAL_TEAM.medicalTeamID}" {if !empty($MEDICAL_TEAM.hint)}data-title='{$MEDICAL_TEAM.hint}'{/if}>{$MEDICAL_TEAM.name}, всего</label>
                                                    {/if}
                                                    <figure>
                                                        <img src="{$MEDICAL_TEAM.imageSrcSmall|default}" alt="{$MEDICAL_TEAM.name}" {if !empty($MEDICAL_TEAM.hint)}data-title='{$MEDICAL_TEAM.hint}'{/if}>
                                                    </figure>
												</div>
												<div class="right">
													<div class="holder-small">
														<input type="text" min="0" placeholder="-" class="numeric" name='medicalTeams[{$MEDICAL_TEAM.medicalTeamID}][number]' id='medicalTeam_{$MEDICAL_TEAM.medicalTeamID}' value='{$REPORT.medicalTeams[$MEDICAL_TEAM.medicalTeamID].number|default:0}' {if empty($EDITABLE)}disabled='disabled'{/if} data-title='Всего'>
                                                        {if 'final'==$MODE}
                                                            <input type="text" min="0" placeholder="-" class="numeric" name='medicalTeams[{$MEDICAL_TEAM.medicalTeamID}][staffUnits]' id='medicalTeam_{$MEDICAL_TEAM.medicalTeamID}_staff' data-atmost="medicalTeam_{$MEDICAL_TEAM.medicalTeamID}" value='{$REPORT.medicalTeams[$MEDICAL_TEAM.medicalTeamID].staffUnits|default:0}' {if empty($EDITABLE)}disabled='disabled'{/if} data-title='Из них штатных формирований'>
                                                        {/if}
													</div>
                                                    <div class="holder-big large-tarea">
                                                        <textarea cols="10" rows="30" {if 'final'!=$MODE}style="height: 16px"{/if} placeholder="-" name='medicalTeams[{$MEDICAL_TEAM.medicalTeamID}][comment]' {if empty($EDITABLE)}disabled='disabled'{/if} data-title='Комментарий' >{$REPORT.medicalTeams[$MEDICAL_TEAM.medicalTeamID].comment|default}</textarea>
                                                    </div>
												</div>
											</div>
										{/if}
									{/foreach}
                                    </div>
                                </div>
                                <div class="hight-box additional-strength">
                                    <a class="title" href="#"><strong class="title has-border">дополнительные медицинские силы</strong></a>
                                    <div class="box-new">
                                        <div class="medical holder-triple box">
											{foreach from=$MEDICAL_TEAMS item=MEDICAL_TEAM}
												{if $MEDICAL_TEAM.isSecondary}
													<div class="triple">
														<div class="left">
                                                            {if 'final'==$MODE}
                                                                <div class="lbl-block">
                                                                    <label class="only" for='medicalTeam_{$MEDICAL_TEAM.medicalTeamID}' data-title='{$MEDICAL_TEAM.hint}'>{$MEDICAL_TEAM.name}</label>
                                                                    <div class="sub-lbl-block-right">
                                                                        <label class="only sub-label">всего</label>
                                                                    </div>
                                                                    <div class="sub-lbl-block">
                                                                        <label class="only sub-label">из них штатных формирований</label>
                                                                    </div>
                                                                </div>
                                                            {else}
                                                                <label for="medicalTeam_{$MEDICAL_TEAM.medicalTeamID}" {if !empty($MEDICAL_TEAM.hint)}data-title='{$MEDICAL_TEAM.hint}'{/if}>{$MEDICAL_TEAM.name}, всего</label>
                                                            {/if}
                                                            <figure>
                                                                <img src="{$MEDICAL_TEAM.imageSrcSmall|default}" alt="{$MEDICAL_TEAM.name}" data-title='{$MEDICAL_TEAM.hint}' >
                                                            </figure>
														</div>
														<div class="right">
                                                            <div class="holder-small">
                                                                <input type="text" min="0" placeholder="-" class="numeric" name='medicalTeams[{$MEDICAL_TEAM.medicalTeamID}][number]' id='medicalTeam_{$MEDICAL_TEAM.medicalTeamID}' value='{$REPORT.medicalTeams[$MEDICAL_TEAM.medicalTeamID].number|default:0}' {if empty($EDITABLE)}disabled='disabled'{/if} data-title='Всего'>
                                                                {if 'final'==$MODE}
                                                                    <input type="text" min="0" placeholder="-" class="numeric" name='medicalTeams[{$MEDICAL_TEAM.medicalTeamID}][staffUnits]' id='medicalTeam_{$MEDICAL_TEAM.medicalTeamID}_staff' data-atmost='medicalTeam_{$MEDICAL_TEAM.medicalTeamID}' value='{$REPORT.medicalTeams[$MEDICAL_TEAM.medicalTeamID].staffUnits|default:0}' {if empty($EDITABLE)}disabled='disabled'{/if} data-title='Из них штатных формирований'>
                                                                {/if}
                                                            </div>
                                                            <div class="holder-big large-tarea">
                                                                <textarea cols="10" rows="30" {if 'final'!=$MODE}style="height: 16px"{/if} placeholder="-" name='medicalTeams[{$MEDICAL_TEAM.medicalTeamID}][comment]' {if empty($EDITABLE)}disabled='disabled'{/if} data-title='Комментарий' >{$REPORT.medicalTeams[$MEDICAL_TEAM.medicalTeamID].comment|default}</textarea>
                                                            </div>
														</div>
													</div>
												{/if}
											{/foreach}
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="inner-line">

                        {if !empty($PANES.initial)}
                        <div class="col inner-col"></div>
                        {/if}

                        {if !empty($PANES.subsequent)}
                        <div class="col inner-col">
                            <div class="info check-people">
                                <h2>Госпитализация</h2>
                                <strong class="title has-border">пораженные по тяжести состояния</strong>
                                <div class="holder-triple">
                                    <div class="triple triple-big">
                                        <div class="left">
                                            <label class="only">Всего</label>
                                            <div class="sub-lbl-block">
                                                <label class="only sub-label">взрослых</label>
                                            </div>
                                            <div class="sub-lbl-block">
                                                <label class="only sub-label">детей</label>
                                            </div>
                                        </div>
                                        <div class="right">
                                            <div class="holder-small">
                                                <input class="new-small-inp" type="text">
                                            </div>
                                            <div class="holder-small">
                                                <div class="block main-in">
                                                    <input type="text" disabled="disabled">
                                                </div>
                                                <div class="block red">
                                                    <span class="top"></span>
                                                    <input type="text" data-title="tex ..." disabled="disabled" value="">
                                                    <a class="plus" href="#"></a>
                                                    <div class="tolltip">
                                                        <a class="add-new disabled" href="#">add-new</a>
                                                        <span class="top-tool">&nbsp;</span>
                                                        <strong class="title-in">Состояние: крайне тяжелые</strong>
                                                        <div class="holder-lab">
                                                            <label>Госпит. чел</label>
                                                            <label>Навание МО</label>
                                                            <label>Местонахождение</label>
                                                        </div>
                                                        <ul class="list-lin">
                                                            {if empty($PANES.subsequent.hospitalized.total.extHeavy)}
                                                                <li>
                                                                    <input type="text" class="numeric" disabled="disabled" />
                                                                    <input type="text" disabled="disabled" />
                                                                    <input type="text" class="text-big" disabled="disabled" />
                                                                    <a class="close-n disabled" href="#">close</a>
                                                                </li>
                                                            {else}
                                                                {foreach from=$PANES.subsequent.hospitalized.total.extHeavy item=HOSP_DATA}
                                                                    <li>
                                                                        <input type="text" class="numeric" value="{$HOSP_DATA.peopleNumber}" disabled="disabled" />
                                                                        <input type="text" value="{$HOSP_DATA.medicalOrganization}" disabled="disabled" />
                                                                        <input type="text" class="text-big" value="{$HOSP_DATA.location}" disabled="disabled" />
                                                                        <a class="close-n disabled" href="#">close</a>
                                                                    </li>
                                                                {/foreach}
                                                            {/if}
                                                        </ul>
                                                    </div>
                                                </div>
                                                <div class="block orange">
                                                    <span class="top"></span>
                                                    <input type="text" data-title="tex ..." disabled="disabled">
                                                    <a class="plus" href="#"></a>
                                                    <div class="tolltip">
                                                        <a class="add-new disabled" href="#">add-new</a>
                                                        <span class="top-tool">&nbsp;</span>
                                                        <strong class="title-in">Состояние: тяжелые</strong>
                                                        <div class="holder-lab">
                                                            <label>Госпит. чел</label>
                                                            <label>Навание МО</label>
                                                            <label>Местонахождение</label>
                                                        </div>
                                                        <ul class="list-lin">
                                                            {if empty($PANES.subsequent.hospitalized.total.heavy)}
                                                                <li>
                                                                    <input type="text" class="numeric" disabled="disabled" />
                                                                    <input type="text" disabled="disabled" />
                                                                    <input type="text" class="text-big" disabled="disabled" />
                                                                    <a class="close-n disabled" href="#">close</a>
                                                                </li>
                                                            {else}
                                                                {foreach from=$PANES.subsequent.hospitalized.total.heavy item=HOSP_DATA}
                                                                    <li>
                                                                        <input type="text" class="numeric" value="{$HOSP_DATA.peopleNumber}" disabled="disabled" />
                                                                        <input type="text" value="{$HOSP_DATA.medicalOrganization}" disabled="disabled" />
                                                                        <input type="text" class="text-big" value="{$HOSP_DATA.location}" disabled="disabled" />
                                                                        <a class="close-n disabled" href="#">close</a>
                                                                    </li>
                                                                {/foreach}
                                                            {/if}
                                                        </ul>
                                                    </div>
                                                </div>
                                                <div class="block yellow">
                                                    <span class="top"></span>
                                                    <input type="text" data-title="tex ..." disabled="disabled">
                                                    <a class="plus" href="#"></a>
                                                    <div class="tolltip">
                                                        <a class="add-new disabled" href="#">add-new</a>
                                                        <span class="top-tool">&nbsp;</span>
                                                        <strong class="title-in">Состояние: средние</strong>
                                                        <div class="holder-lab">
                                                            <label>Госпит. чел</label>
                                                            <label>Навание МО</label>
                                                            <label>Местонахождение</label>
                                                        </div>
                                                        <ul class="list-lin">
                                                            {if empty($PANES.subsequent.hospitalized.total.medium)}
                                                                <li>
                                                                    <input type="text" class="numeric" disabled="disabled" />
                                                                    <input type="text" disabled="disabled" />
                                                                    <input type="text" class="text-big" disabled="disabled" />
                                                                    <a class="close-n disabled" href="#">close</a>
                                                                </li>
                                                            {else}
                                                                {foreach from=$PANES.subsequent.hospitalized.total.medium item=HOSP_DATA}
                                                                    <li>
                                                                        <input type="text" class="numeric" value="{$HOSP_DATA.peopleNumber}" disabled="disabled" />
                                                                        <input type="text" value="{$HOSP_DATA.medicalOrganization}" disabled="disabled" />
                                                                        <input type="text" class="text-big" value="{$HOSP_DATA.location}" disabled="disabled" />
                                                                        <a class="close-n disabled href="#">close</a>
                                                                    </li>
                                                                {/foreach}
                                                            {/if}
                                                        </ul>
                                                    </div>
                                                </div>
                                                <div class="block green">
                                                    <span class="top"></span>
                                                    <input type="text" data-title="tex ..." disabled="disabled">
                                                    <a class="plus" href="#"></a>
                                                    <div class="tolltip">
                                                        <a class="add-new disabled" href="#">add-new</a>
                                                        <span class="top-tool">&nbsp;</span>
                                                        <strong class="title-in">Состояние: легкие</strong>
                                                        <div class="holder-lab">
                                                            <label>Госпит. чел</label>
                                                            <label>Навание МО</label>
                                                            <label>Местонахождение</label>
                                                        </div>
                                                        <ul class="list-lin">
                                                            {if empty($PANES.subsequent.hospitalized.total.light)}
                                                                <li>
                                                                    <input type="text" class="numeric" />
                                                                    <input type="text" />
                                                                    <input type="text" class="text-big" />
                                                                    <a class="close-n disabled" href="#">close</a>
                                                                </li>
                                                            {else}
                                                                {foreach from=$PANES.subsequent.hospitalized.total.light item=HOSP_DATA}
                                                                    <li>
                                                                        <input type="text" class="numeric" disabled="disabled" />
                                                                        <input type="text" disabled="disabled" />
                                                                        <input type="text" class="text-big" disabled="disabled" />
                                                                        <a class="close-n disabled" href="#">close</a>
                                                                    </li>
                                                                {/foreach}
                                                            {/if}
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="holder-small">
                                                <div class="block main-in">
                                                    <input type="text" disabled="disabled">
                                                </div>
                                                <div class="block red">
                                                    <span class="top"></span>
                                                    <input type="text" data-title="tex ..." disabled="disabled">
                                                    <a class="plus" href="#"></a>
                                                    <div class="tolltip">
                                                        <a class="add-new disabled" href="#">add-new</a>
                                                        <span class="top-tool">&nbsp;</span>
                                                        <strong class="title-in">Состояние: крайне тяжелые</strong>
                                                        <div class="holder-lab">
                                                            <label>Госпит. чел</label>
                                                            <label>Навание МО</label>
                                                            <label>Местонахождение</label>
                                                        </div>
                                                        <ul class="list-lin">
                                                            {if empty($PANES.subsequent.hospitalized.children.extHeavy)}
                                                                <li>
                                                                    <input type="text" class="numeric" disabled="disabled" />
                                                                    <input type="text" disabled="disabled" />
                                                                    <input type="text" class="text-big" disabled="disabled" />
                                                                    <a class="close-n disabled" href="#">close</a>
                                                                </li>
                                                            {else}
                                                                {foreach from=$PANES.subsequent.hospitalized.children.extHeavy item=HOSP_DATA}
                                                                    <li>
                                                                        <input type="text" class="numeric" value="{$HOSP_DATA.peopleNumber}" disabled="disabled" />
                                                                        <input type="text" value="{$HOSP_DATA.medicalOrganization}" disabled="disabled" />
                                                                        <input type="text" class="text-big" value="{$HOSP_DATA.location}" disabled="disabled" />
                                                                        <a class="close-n disabled" href="#">close</a>
                                                                    </li>
                                                                {/foreach}
                                                            {/if}
                                                        </ul>
                                                    </div>
                                                </div>
                                                <div class="block orange">
                                                    <span class="top"></span>
                                                    <input type="text" data-title="tex ..." disabled="disabled">
                                                    <a class="plus" href="#"></a>
                                                    <div class="tolltip">
                                                        <a class="add-new disabled" href="#">add-new</a>
                                                        <span class="top-tool">&nbsp;</span>
                                                        <strong class="title-in">Состояние: тяжелые</strong>
                                                        <div class="holder-lab">
                                                            <label>Госпит. чел</label>
                                                            <label>Навание МО</label>
                                                            <label>Местонахождение</label>
                                                        </div>
                                                        <ul class="list-lin">
                                                            {if empty($PANES.subsequent.hospitalized.children.heavy)}
                                                                <li>
                                                                    <input type="text" class="numeric" disabled="disabled" />
                                                                    <input type="text" disabled="disabled" />
                                                                    <input type="text" class="text-big" disabled="disabled" />
                                                                    <a class="close-n disabled" href="#">close</a>
                                                                </li>
                                                            {else}
                                                                {foreach from=$PANES.subsequent.hospitalized.children.heavy item=HOSP_DATA}
                                                                    <li>
                                                                        <input type="text" class="numeric" value="{$HOSP_DATA.peopleNumber}" disabled="disabled" />
                                                                        <input type="text" value="{$HOSP_DATA.medicalOrganization}" disabled="disabled" />
                                                                        <input type="text" class="text-big" value="{$HOSP_DATA.location}" disabled="disabled" />
                                                                        <a class="close-n disabled" href="#">close</a>
                                                                    </li>
                                                                {/foreach}
                                                            {/if}
                                                        </ul>
                                                    </div>
                                                </div>
                                                <div class="block yellow">
                                                    <span class="top"></span>
                                                    <input type="text" data-title="tex ..." disabled="disabled">
                                                    <a class="plus" href="#"></a>
                                                    <div class="tolltip">
                                                        <a class="add-new disabled" href="#">add-new</a>
                                                        <span class="top-tool">&nbsp;</span>
                                                        <strong class="title-in">Состояние: средние</strong>
                                                        <div class="holder-lab">
                                                            <label>Госпит. чел</label>
                                                            <label>Навание МО</label>
                                                            <label>Местонахождение</label>
                                                        </div>
                                                        <ul class="list-lin">
                                                            {if empty($PANES.subsequent.hospitalized.children.medium)}
                                                                <li>
                                                                    <input type="text" class="numeric" disabled="disabled" />
                                                                    <input type="text" disabled="disabled" />
                                                                    <input type="text" class="text-big" disabled="disabled" />
                                                                    <a class="close-n disabled" href="#">close</a>
                                                                </li>
                                                            {else}
                                                                {foreach from=$PANES.subsequent.hospitalized.children.medium item=HOSP_DATA}
                                                                    <li>
                                                                        <input type="text" class="numeric" value="{$HOSP_DATA.peopleNumber}" disabled="disabled" />
                                                                        <input type="text" value="{$HOSP_DATA.medicalOrganization}" disabled="disabled" />
                                                                        <input type="text" class="text-big" value="{$HOSP_DATA.location}" disabled="disabled" />
                                                                        <a class="close-n disabled" href="#">close</a>
                                                                    </li>
                                                                {/foreach}
                                                            {/if}
                                                        </ul>
                                                    </div>
                                                </div>
                                                <div class="block green">
                                                    <span class="top"></span>
                                                    <input type="text" data-title="tex ..." disabled="disabled">
                                                    <a class="plus" href="#"></a>
                                                    <div class="tolltip">
                                                        <a class="add-new disabled" href="#">add-new</a>
                                                        <span class="top-tool">&nbsp;</span>
                                                        <strong class="title-in">Состояние: легкие</strong>
                                                        <div class="holder-lab">
                                                            <label>Госпит. чел</label>
                                                            <label>Навание МО</label>
                                                            <label>Местонахождение</label>
                                                        </div>
                                                        <ul class="list-lin">
                                                            {if empty($PANES.subsequent.hospitalized.children.light)}
                                                                <li>
                                                                    <input type="text" class="numeric" disabled="disabled" />
                                                                    <input type="text" disabled="disabled" />
                                                                    <input type="text" class="text-big" disabled="disabled" />
                                                                    <a class="close-n  disabled" href="#">close</a>
                                                                </li>
                                                            {else}
                                                                {foreach from=$PANES.subsequent.hospitalized.children.light item=HOSP_DATA}
                                                                    <li>
                                                                        <input type="text" class="numeric" value="{$HOSP_DATA.peopleNumber}" disabled="disabled" />
                                                                        <input type="text" value="{$HOSP_DATA.medicalOrganization}" disabled="disabled" />
                                                                        <input type="text" class="text-big" value="{$HOSP_DATA.location}" disabled="disabled" />
                                                                        <a class="close-n disabled" href="#">close</a>
                                                                    </li>
                                                                {/foreach}
                                                            {/if}
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="triple">
                                        <div class="left">
                                            <label class="only sm-text with-desc">Направлено на амбулаторное лечение</label>
                                        </div>
                                        <div class="right">
                                            <div class="holder-small">
                                                <span><input type="text"></span>
                                                <label class="sm-line sm-text">из них детей</label>
                                                <span><input type="text"></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="triple">
                                        <div class="left">
                                            <label class="only sm-text with-desc">Ожидающих госпитализацию, всего</label>
                                        </div>
                                        <div class="right">
                                            <div class="holder-small">
                                                <span><input type="text"></span>
                                                <label class="sm-line sm-text">из них детей</label>
                                                <span><input type="text"></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        {/if}

                        <div class="col inner-col open">
                            <div class="info check-people">
                                <h2>Госпитализация</h2>

                                <strong class="title has-border">пораженные по тяжести состояния</strong>
                                <div class="holder-triple">

                                    <div class="triple triple-big">
                                        <div class="left">
                                            <label class="only">Всего</label>
                                            <div class="sub-lbl-block">
                                                <label class="only sub-label">взрослых</label>
                                            </div>
                                            <div class="sub-lbl-block">
                                                <label class="only sub-label">детей</label>
                                            </div>
                                        </div>
                                        <div class="right">
                                            <div class="holder-small">
                                                <input class="new-small-inp numeric" type="text" disabled="disabled" id='hospitalizedTotal' >
                                            </div>
                                            <div class="holder-small">
                                                <div class="block main-in">
                                                    <input type="text" disabled="disabled" id='hospitalizedAdult' value='{$REPORT.hospitalizedAdult|default}'>
                                                </div>
                                                <div class="block red">
                                                    <span class="top"></span>
                                                    <input type="text" data-title="tex ..."  disabled="disabled" id='hospitalizedTotalExtHeavy' value='{$REPORT.hospitalizedTotalExtHeavy|default}'>
                                                    <a class="plus" href="#"></a>
                                                    <div class="tolltip">
                                                        <a class="add-new{if empty($EDITABLE)} disabled{/if}" href="#">add-new</a>
                                                        <span class="top-tool">&nbsp;</span>
                                                        <strong class="title-in">Состояние: крайне тяжелые</strong>
                                                        <div class="holder-lab">
                                                            <label>Госпит. чел</label>
                                                            <label>Навание МО</label>
                                                            <label>Местонахождение</label>
                                                        </div>
                                                        <ul class="list-lin">
                                                            {if empty($REPORT.hospitalized.total.extHeavy)}
                                                                <li>
                                                                    <input type="text" class="numeric" name="hospitalized[total][extHeavy][peopleNumber][]" {if empty($EDITABLE)}disabled="disabled"{/if} />
                                                                    <input type="text" name="hospitalized[total][extHeavy][medicalOrganization][]" {if empty($EDITABLE)}disabled="disabled"{/if} />
                                                                    <input type="text" class="text-big" name="hospitalized[total][extHeavy][location][]" {if empty($EDITABLE)}disabled="disabled"{/if} />
                                                                    <a class="close-n{if empty($EDITABLE)} disabled{/if}" href="#">close</a>
                                                                </li>
                                                            {else}
                                                                {foreach from=$REPORT.hospitalized.total.extHeavy item=HOSP_DATA}
                                                                    <li>
                                                                        <input type="text" class="numeric" name="hospitalized[total][extHeavy][peopleNumber][]" value="{$HOSP_DATA.peopleNumber}" {if empty($EDITABLE)}disabled="disabled"{/if} />
                                                                        <input type="text" name="hospitalized[total][extHeavy][medicalOrganization][]" value="{$HOSP_DATA.medicalOrganization}" {if empty($EDITABLE)}disabled="disabled"{/if} />
                                                                        <input type="text" class="text-big" name="hospitalized[total][extHeavy][location][]" value="{$HOSP_DATA.location}" {if empty($EDITABLE)}disabled="disabled"{/if} />
                                                                        <a class="close-n{if empty($EDITABLE)} disabled{/if}" href="#">close</a>
                                                                    </li>
                                                                {/foreach}
                                                            {/if}
                                                        </ul>
                                                    </div>
                                                </div>
                                                <div class="block orange">
                                                    <span class="top"></span>
                                                    <input type="text" data-title="tex ..." disabled="disabled" id='hospitalizedTotalHeavy' value='{$REPORT.hospitalizedTotalHeavy|default}'>
                                                    <a class="plus" href="#"></a>
                                                    <div class="tolltip">
                                                        <a class="add-new{if empty($EDITABLE)} disabled{/if}" href="#">add-new</a>
                                                        <span class="top-tool">&nbsp;</span>
                                                        <strong class="title-in">Состояние: тяжелые</strong>
                                                        <div class="holder-lab">
                                                            <label>Госпит. чел</label>
                                                            <label>Навание МО</label>
                                                            <label>Местонахождение</label>
                                                        </div>
                                                        <ul class="list-lin">
                                                            {if empty($REPORT.hospitalized.total.heavy)}
                                                                <li>
                                                                    <input type="text" class="numeric" name="hospitalized[total][heavy][peopleNumber][]" {if empty($EDITABLE)}disabled="disabled"{/if} />
                                                                    <input type="text" name="hospitalized[total][heavy][medicalOrganization][]" {if empty($EDITABLE)}disabled="disabled"{/if} />
                                                                    <input type="text" class="text-big" name="hospitalized[total][heavy][location][]" {if empty($EDITABLE)}disabled="disabled"{/if} />
                                                                    <a class="close-n{if empty($EDITABLE)} disabled{/if}" href="#">close</a>
                                                                </li>
                                                            {else}
                                                                {foreach from=$REPORT.hospitalized.total.heavy item=HOSP_DATA}
                                                                    <li>
                                                                        <input type="text" class="numeric" name="hospitalized[total][heavy][peopleNumber][]" value="{$HOSP_DATA.peopleNumber}" {if empty($EDITABLE)}disabled="disabled"{/if} />
                                                                        <input type="text" name="hospitalized[total][heavy][medicalOrganization][]" value="{$HOSP_DATA.medicalOrganization}" {if empty($EDITABLE)}disabled="disabled"{/if} />
                                                                        <input type="text" class="text-big" name="hospitalized[total][heavy][location][]" value="{$HOSP_DATA.location}" {if empty($EDITABLE)}disabled="disabled"{/if} />
                                                                        <a class="close-n{if empty($EDITABLE)} disabled{/if}" href="#">close</a>
                                                                    </li>
                                                                {/foreach}
                                                            {/if}
                                                        </ul>
                                                    </div>
                                                </div>
                                                <div class="block yellow">
                                                    <span class="top"></span>
                                                    <input type="text" data-title="tex ..." disabled="disabled" id='hospitalizedTotalMedium' value='{$REPORT.hospitalizedTotalMedium|default}'>
                                                    <a class="plus" href="#"></a>
                                                    <div class="tolltip">
                                                        <a class="add-new{if empty($EDITABLE)} disabled{/if}" href="#">add-new</a>
                                                        <span class="top-tool">&nbsp;</span>
                                                        <strong class="title-in">Состояние: средние</strong>
                                                        <div class="holder-lab">
                                                            <label>Госпит. чел</label>
                                                            <label>Навание МО</label>
                                                            <label>Местонахождение</label>
                                                        </div>
                                                        <ul class="list-lin">
                                                            {if empty($REPORT.hospitalized.total.medium)}
                                                                <li>
                                                                    <input type="text" class="numeric" name="hospitalized[total][medium][peopleNumber][]" {if empty($EDITABLE)}disabled="disabled"{/if} />
                                                                    <input type="text" name="hospitalized[total][medium][medicalOrganization][]" {if empty($EDITABLE)}disabled="disabled"{/if} />
                                                                    <input type="text" class="text-big" name="hospitalized[total][medium][location][]" {if empty($EDITABLE)}disabled="disabled"{/if} />
                                                                    <a class="close-n{if empty($EDITABLE)} disabled{/if}" href="#">close</a>
                                                                </li>
                                                            {else}
                                                                {foreach from=$REPORT.hospitalized.total.medium item=HOSP_DATA}
                                                                    <li>
                                                                        <input type="text" class="numeric" name="hospitalized[total][medium][peopleNumber][]" value="{$HOSP_DATA.peopleNumber}" {if empty($EDITABLE)}disabled="disabled"{/if} />
                                                                        <input type="text" name="hospitalized[total][medium][medicalOrganization][]" value="{$HOSP_DATA.medicalOrganization}" {if empty($EDITABLE)}disabled="disabled"{/if} />
                                                                        <input type="text" class="text-big" name="hospitalized[total][medium][location][]" value="{$HOSP_DATA.location}" {if empty($EDITABLE)}disabled="disabled"{/if} />
                                                                        <a class="close-n{if empty($EDITABLE)} disabled{/if}" href="#">close</a>
                                                                    </li>
                                                                {/foreach}
                                                            {/if}
                                                        </ul>
                                                    </div>
                                                </div>
                                                <div class="block green">
                                                    <span class="top"></span>
                                                    <input type="text" data-title="tex ..." disabled="disabled" id='hospitalizedTotalLight' value='{$REPORT.hospitalizedTotalLight|default}'>
                                                    <a class="plus" href="#"></a>
                                                    <div class="tolltip">
                                                        <a class="add-new{if empty($EDITABLE)} disabled{/if}" href="#">add-new</a>
                                                        <span class="top-tool">&nbsp;</span>
                                                        <strong class="title-in">Состояние: легкие</strong>
                                                        <div class="holder-lab">
                                                            <label>Госпит. чел</label>
                                                            <label>Навание МО</label>
                                                            <label>Местонахождение</label>
                                                        </div>
                                                        <ul class="list-lin">
                                                            {if empty($REPORT.hospitalized.total.light)}
                                                                <li>
                                                                    <input type="text" class="numeric" name="hospitalized[total][light][peopleNumber][]" />
                                                                    <input type="text" name="hospitalized[total][light][medicalOrganization][]" />
                                                                    <input type="text" class="text-big" name="hospitalized[total][light][location][]" />
                                                                    <a class="close-n{if empty($EDITABLE)} disabled{/if}" href="#">close</a>
                                                                </li>
                                                            {else}
                                                                {foreach from=$REPORT.hospitalized.total.light item=HOSP_DATA}
                                                                    <li>
                                                                        <input type="text" class="numeric" name="hospitalized[total][light][peopleNumber][]" value="{$HOSP_DATA.peopleNumber}" {if empty($EDITABLE)}disabled="disabled"{/if} />
                                                                        <input type="text" name="hospitalized[total][light][medicalOrganization][]" value="{$HOSP_DATA.medicalOrganization}" {if empty($EDITABLE)}disabled="disabled"{/if} />
                                                                        <input type="text" class="text-big" name="hospitalized[total][light][location][]" value="{$HOSP_DATA.location}" {if empty($EDITABLE)}disabled="disabled"{/if} />
                                                                        <a class="close-n{if empty($EDITABLE)} disabled{/if}" href="#">close</a>
                                                                    </li>
                                                                {/foreach}
                                                            {/if}
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="holder-small">
                                                <div class="block main-in">
                                                    <input type="text" disabled="disabled" id='hospitalizedChildren' value='{$REPORT.hospitalizedChildren|default}'>
                                                </div>
                                                <div class="block red">
                                                    <span class="top"></span>
                                                    <input type="text" data-title="tex ..." disabled="disabled" id='hospitalizedChildrenExtHard' value='{$REPORT.hospitalizedChildrenExtHard|default}'>
                                                    <a class="plus" href="#"></a>
                                                    <div class="tolltip">
                                                        <a class="add-new{if empty($EDITABLE)} disabled{/if}" href="#">add-new</a>
                                                        <span class="top-tool">&nbsp;</span>
                                                        <strong class="title-in">Состояние: крайне тяжелые</strong>
                                                        <div class="holder-lab">
                                                            <label>Госпит. чел</label>
                                                            <label>Навание МО</label>
                                                            <label>Местонахождение</label>
                                                        </div>
                                                        <ul class="list-lin">
                                                            {if empty($REPORT.hospitalized.children.extHeavy)}
                                                                <li>
                                                                    <input type="text" class="numeric" name="hospitalized[children][extHeavy][peopleNumber][]" {if empty($EDITABLE)}disabled="disabled"{/if} />
                                                                    <input type="text" name="hospitalized[children][extHeavy][medicalOrganization][]" {if empty($EDITABLE)}disabled="disabled"{/if} />
                                                                    <input type="text" class="text-big" name="hospitalized[children][extHeavy][location][]" {if empty($EDITABLE)}disabled="disabled"{/if} />
                                                                    <a class="close-n{if empty($EDITABLE)} disabled{/if}" href="#">close</a>
                                                                </li>
                                                            {else}
                                                                {foreach from=$REPORT.hospitalized.children.extHeavy item=HOSP_DATA}
                                                                    <li>
                                                                        <input type="text" class="numeric" name="hospitalized[children][extHeavy][peopleNumber][]" value="{$HOSP_DATA.peopleNumber}" {if empty($EDITABLE)}disabled="disabled"{/if} />
                                                                        <input type="text" name="hospitalized[children][extHeavy][medicalOrganization][]" value="{$HOSP_DATA.medicalOrganization}" {if empty($EDITABLE)}disabled="disabled"{/if} />
                                                                        <input type="text" class="text-big" name="hospitalized[children][extHeavy][location][]" value="{$HOSP_DATA.location}" {if empty($EDITABLE)}disabled="disabled"{/if} />
                                                                        <a class="close-n{if empty($EDITABLE)} disabled{/if}" href="#">close</a>
                                                                    </li>
                                                                {/foreach}
                                                            {/if}
                                                        </ul>
                                                    </div>
                                                </div>
                                                <div class="block orange">
                                                    <span class="top"></span>
                                                    <input type="text" data-title="tex ..." disabled="disabled" id='hospitalizedChildrenHard' value='{$REPORT.hospitalizedChildrenHard|default}'>
                                                    <a class="plus" href="#"></a>
                                                    <div class="tolltip">
                                                        <a class="add-new{if empty($EDITABLE)} disabled{/if}" href="#">add-new</a>
                                                        <span class="top-tool">&nbsp;</span>
                                                        <strong class="title-in">Состояние: тяжелые</strong>
                                                        <div class="holder-lab">
                                                            <label>Госпит. чел</label>
                                                            <label>Навание МО</label>
                                                            <label>Местонахождение</label>
                                                        </div>
                                                        <ul class="list-lin">
                                                            {if empty($REPORT.hospitalized.children.heavy)}
                                                                <li>
                                                                    <input type="text" class="numeric" name="hospitalized[children][heavy][peopleNumber][]" />
                                                                    <input type="text" name="hospitalized[children][heavy][medicalOrganization][]" />
                                                                    <input type="text" class="text-big" name="hospitalized[children][heavy][location][]" />
                                                                    <a class="close-n{if empty($EDITABLE)} disabled{/if}" href="#">close</a>
                                                                </li>
                                                            {else}
                                                                {foreach from=$REPORT.hospitalized.children.heavy item=HOSP_DATA}
                                                                    <li>
                                                                        <input type="text" class="numeric" name="hospitalized[children][heavy][peopleNumber][]" value="{$HOSP_DATA.peopleNumber}" {if empty($EDITABLE)}disabled="disabled"{/if} />
                                                                        <input type="text" name="hospitalized[children][heavy][medicalOrganization][]" value="{$HOSP_DATA.medicalOrganization}" {if empty($EDITABLE)}disabled="disabled"{/if} />
                                                                        <input type="text" class="text-big" name="hospitalized[children][heavy][location][]" value="{$HOSP_DATA.location}" {if empty($EDITABLE)}disabled="disabled"{/if} />
                                                                        <a class="close-n{if empty($EDITABLE)} disabled{/if}" href="#">close</a>
                                                                    </li>
                                                                {/foreach}
                                                            {/if}
                                                        </ul>
                                                    </div>
                                                </div>
                                                <div class="block yellow">
                                                    <span class="top"></span>
                                                    <input type="text" data-title="tex ..." disabled="disabled" id='hospitalizedChildrenMedium' value='{$REPORT.hospitalizedChildrenMedium|default}'>
                                                    <a class="plus" href="#"></a>
                                                    <div class="tolltip">
                                                        <a class="add-new{if empty($EDITABLE)} disabled{/if}" href="#">add-new</a>
                                                        <span class="top-tool">&nbsp;</span>
                                                        <strong class="title-in">Состояние: средние</strong>
                                                        <div class="holder-lab">
                                                            <label>Госпит. чел</label>
                                                            <label>Навание МО</label>
                                                            <label>Местонахождение</label>
                                                        </div>
                                                        <ul class="list-lin">
                                                            {if empty($REPORT.hospitalized.children.medium)}
                                                                <li>
                                                                    <input type="text" class="numeric" name="hospitalized[children][medium][peopleNumber][]" {if empty($EDITABLE)}disabled="disabled"{/if} />
                                                                    <input type="text" name="hospitalized[children][medium][medicalOrganization][]" {if empty($EDITABLE)}disabled="disabled"{/if} />
                                                                    <input type="text" class="text-big" name="hospitalized[children][medium][location][]" {if empty($EDITABLE)}disabled="disabled"{/if} />
                                                                    <a class="close-n{if empty($EDITABLE)} disabled{/if}" href="#">close</a>
                                                                </li>
                                                            {else}
                                                                {foreach from=$REPORT.hospitalized.children.medium item=HOSP_DATA}
                                                                    <li>
                                                                        <input type="text" class="numeric" name="hospitalized[children][medium][peopleNumber][]" value="{$HOSP_DATA.peopleNumber}" {if empty($EDITABLE)}disabled="disabled"{/if} />
                                                                        <input type="text" name="hospitalized[children][medium][medicalOrganization][]" value="{$HOSP_DATA.medicalOrganization}" {if empty($EDITABLE)}disabled="disabled"{/if} />
                                                                        <input type="text" class="text-big" name="hospitalized[children][medium][location][]" value="{$HOSP_DATA.location}" {if empty($EDITABLE)}disabled="disabled"{/if} />
                                                                        <a class="close-n{if empty($EDITABLE)} disabled{/if}" href="#">close</a>
                                                                    </li>
                                                                {/foreach}
                                                            {/if}
                                                        </ul>
                                                    </div>
                                                </div>
                                                <div class="block green">
                                                    <span class="top"></span>
                                                    <input type="text" data-title="tex ..." disabled="disabled" id='hospitalizedChildrenLight' value='{$REPORT.hospitalizedChildrenLight|default}'>
                                                    <a class="plus" href="#"></a>
                                                    <div class="tolltip">
                                                        <a class="add-new{if empty($EDITABLE)} disabled{/if}" href="#">add-new</a>
                                                        <span class="top-tool">&nbsp;</span>
                                                        <strong class="title-in">Состояние: легкие</strong>
                                                        <div class="holder-lab">
                                                            <label>Госпит. чел</label>
                                                            <label>Навание МО</label>
                                                            <label>Местонахождение</label>
                                                        </div>
                                                        <ul class="list-lin">
                                                            {if empty($REPORT.hospitalized.children.light)}
                                                                <li>
                                                                    <input type="text" class="numeric" name="hospitalized[children][light][peopleNumber][]" {if empty($EDITABLE)}disabled="disabled"{/if} />
                                                                    <input type="text" name="hospitalized[children][light][medicalOrganization][]" {if empty($EDITABLE)}disabled="disabled"{/if} />
                                                                    <input type="text" class="text-big" name="hospitalized[children][light][location][]" {if empty($EDITABLE)}disabled="disabled"{/if} />
                                                                    <a class="close-n{if empty($EDITABLE)} disabled{/if}" href="#">close</a>
                                                                </li>
                                                            {else}
                                                                {foreach from=$REPORT.hospitalized.children.light item=HOSP_DATA}
                                                                    <li>
                                                                        <input type="text" class="numeric" name="hospitalized[children][light][peopleNumber][]" value="{$HOSP_DATA.peopleNumber}" {if empty($EDITABLE)}disabled="disabled"{/if} />
                                                                        <input type="text" name="hospitalized[children][light][medicalOrganization][]" value="{$HOSP_DATA.medicalOrganization}" {if empty($EDITABLE)}disabled="disabled"{/if} />
                                                                        <input type="text" class="text-big" name="hospitalized[children][light][location][]" value="{$HOSP_DATA.location}" {if empty($EDITABLE)}disabled="disabled"{/if} />
                                                                        <a class="close-n{if empty($EDITABLE)} disabled{/if}" href="#">close</a>
                                                                    </li>
                                                                {/foreach}
                                                            {/if}
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="triple">
                                        <div class="left">
                                            <label class="only sm-text sm-line">Направлено на амбулаторное лечение</label>
                                        </div>
                                        <div class="right">
                                            <div class="holder-small">
                                                <span><input type="text"></span>
                                                <label class="sm-line sm-text">из них детей</label>
                                                <span><input type="text"></span>
                                            </div>
                                        </div>
                                    </div>
                                    {if 'subsequent'==$MODE}
                                        <div class="triple">
                                            <div class="left">
                                                <label class="only sm-text with-desc">Ожидающих госпитализацию, всего</label>
                                            </div>
                                            <div class="right">
                                                <div class="holder-small">
                                                    <span><input type="text"></span>
                                                    <label class="sm-line sm-text">из них детей</label>
                                                    <span><input type="text"></span>
                                                </div>
                                            </div>
                                        </div>
                                    {/if}
                                </div>
                                {if 'final'==$MODE}
                                    <strong class="title has-border">пораженные по видам медицинской помощи</strong>
                                    <div class="holder-triple">
                                        <div class="multi-inf triple">
                                            <div class="left">
                                                <label class="only sm-line sm-text">Первичная медико-санитарная помощь, всего</label>
                                                <span class="inf-only">
                                                    <span class="text-center">
                                                        <span class="text-inner">
                                                            <span class="text-last sm-text sm-line">
                                                                доврачебная
                                                            </span>
                                                        </span>
                                                    </span>
                                                </span>
                                                <span class="inf-only">
                                                    <span class="text-center">
                                                        <span class="text-inner">
                                                            <span class="text-last sm-text sm-line">
                                                                врачебная
                                                            </span>
                                                        </span>
                                                    </span>
                                                </span>
                                                <span class="inf-only">
                                                    <span class="text-center">
                                                        <span class="text-inner">
                                                            <span class="text-last sm-text sm-line">
                                                                специализированная
                                                            </span>
                                                        </span>
                                                    </span>
                                                </span>
                                            </div>
                                            <div class="right">
                                                <div class="holder-small">
                                                    <span><input type="text" placeholder="" alt="" class="numeric no-clear" name='caretypeHealthCareTotal' id='caretypeHealthCareTotal' value='{$REPORT.caretypeHealthCareTotal|default:0}' readonly="readonly" data-sumof="caretypeHealthCarePredoctorTotal,caretypeHealthCareMedicalTotal,caretypeHealthCareSpecializedTotal" /></span>
                                                    <label class="sm-line sm-text">из них детей</label>
                                                    <span><input type="text" placeholder="" alt="" class="numeric no-clear" name='caretypeHealthCareChildren' id='caretypeHealthCareChildren' value='{$REPORT.caretypeHealthCareChildren|default:0}' readonly="readonly" data-sumof='caretypeHealthCarePredoctorChildren,caretypeHealthCareMedicalChildren,caretypeHealthCareSpecializedChildren' /></span>
                                                </div>
                                                <div class="holder-small">
                                                    <input type="number" min="0" placeholder="" alt="" class="numeric" name='caretypeHealthCarePredoctorTotal' id='caretypeHealthCarePredoctorTotal' value='{$REPORT.caretypeHealthCarePredoctorTotal|default:0}' {if empty($EDITABLE)}disabled='disabled'{/if} />
                                                    <label class="sm-line sm-text">из них детей</label>
                                                    <input type="number" min="0" placeholder="" alt="" class="numeric" name='caretypeHealthCarePredoctorChildren' id='caretypeHealthCarePredoctorChildren' value='{$REPORT.caretypeHealthCarePredoctorChildren|default:0}' {if empty($EDITABLE)}disabled='disabled'{/if} />
                                                </div>
                                                <div class="holder-small">
                                                    <input type="number" min="0" placeholder="" alt="" class="numeric" name='caretypeHealthCareMedicalTotal' id='caretypeHealthCareMedicalTotal' value='{$REPORT.caretypeHealthCareMedicalTotal|default:0}' {if empty($EDITABLE)}disabled='disabled'{/if} />
                                                    <label class="sm-line sm-text">из них детей</label>
                                                    <input type="number" min="0" placeholder="" alt="" class="numeric" name='caretypeHealthCareMedicalChildren' id='caretypeHealthCareMedicalChildren' value='{$REPORT.caretypeHealthCareMedicalChildren|default:0}' {if empty($EDITABLE)}disabled='disabled'{/if} />
                                                </div>
                                                <div class="holder-small">
                                                    <input type="number" min="0" placeholder="" alt="" class="numeric" name='caretypeHealthCareSpecializedTotal' id='caretypeHealthCareSpecializedTotal' value='{$REPORT.caretypeHealthCareSpecializedTotal|default:0}' {if empty($EDITABLE)}disabled='disabled'{/if} />
                                                    <label class="sm-line sm-text">из них детей</label>
                                                    <input type="number" min="0" placeholder="" alt="" class="numeric" name='caretypeHealthCareSpecializedChildren' id='caretypeHealthCareSpecializedChildren' value='{$REPORT.caretypeHealthCareSpecializedChildren|default:0}' {if empty($EDITABLE)}disabled='disabled'{/if}/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="triple">
                                            <div class="left">
                                                <label class="only sm-line sm-text">Специализированная помощь</label>
                                            </div>
                                            <div class="right">
                                                <div class="holder-small">
                                                    <span><input type="number" min="0" placeholder="" alt="" class="numeric" name='caretypeSpecializedTotal' id='caretypeSpecializedTotal' value='{$REPORT.caretypeSpecializedTotal|default:0}' {if empty($EDITABLE)}disabled='disabled'{/if} /></span>
                                                    <label class="sm-line sm-text">из них детей</label>
                                                    <span><input type="number" min="0" placeholder="" alt="" class="numeric" name='caretypeSpecializedChildren' id='caretypeSpecializedChildren' value='{$REPORT.caretypeSpecializedChildren|default:0}' {if empty($EDITABLE)}disabled='disabled'{/if} /></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="triple">
                                            <div class="left">
                                                <label class="only sm-line sm-text">Скорая специализированная</label>
                                            </div>
                                            <div class="right">
                                                <div class="holder-small">
                                                    <span><input type="number" min="0" placeholder="" alt="" class="numeric" name='caretypeAmbulanceTotal' id='caretypeAmbulanceTotal' value='{$REPORT.caretypeAmbulanceTotal|default:0}' {if empty($EDITABLE)}disabled='disabled'{/if} /></span>
                                                    <label class="sm-line sm-text">из них детей</label>
                                                    <span><input type="number" min="0" placeholder="" alt="" class="numeric" name='caretypeAmbulanceChildren' id='caretypeAmbulanceChildren' value='{$REPORT.caretypeAmbulanceChildren|default:0}' {if empty($EDITABLE)}disabled='disabled'{/if} /></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="triple has-top-border">
                                            <div class="left">
                                                <label class="only">Всего</label>
                                            </div>
                                            <div class="right">
                                                <div class="holder-small">
                                                    <span><input type="text" placeholder="" alt="" class="numeric no-clear" name='caretypeTotal' id='caretypeTotal' value='{$REPORT.caretypeTotal|default:0}' readonly='readonly' data-sumof='caretypeFirstaidTotal,caretypeHealthCareTotal,caretypeSpecializedTotal,caretypeAmbulanceTotal' /></span>
                                                    <label class="sm-line sm-text">из них детей</label>
                                                    <span><input type="text" placeholder="" alt="" class="numeric no-clear" name='caretypeChildren' id='caretypeChildren' value='{$REPORT.caretypeChildren|default:0}' readonly='readonly' data-sumof='caretypeFirstaidChildren,caretypeHealthCareChildren,caretypeSpecializedChildren,caretypeAmbulanceChildren' /></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                {/if}
                            </div>
						</div>
                    </div>
                    <div class="inner-line">
                        {if !empty($PANES.initial)}
                        <div class="col inner-col">
                            <div class="info">
                                <h2>Источник информации</h2>
                                <div class="wrap-form">
                                    <div class="double">
                                        <label>Должность</label>
                                        <div class="hold-two-input">
                                            <input type="text" disabled="disabled" value='{$PANES.initial.createdUser.post|default}'>
                                            <input type="text" disabled="disabled" value='{$PANES.initial.reviewedUser.post|default}'>
                                        </div>
                                    </div>
                                    <div class="double">
                                        <label>Ф.И.О.</label>
                                        <div class="hold-two-input">
                                            <input type="text" disabled="disabled" value='{if !empty($PANES.initial.createdUser)}{$PANES.initial.createdUser.lastName} {$PANES.initial.createdUser.firstName|mb_truncate:1:''}.{$PANES.initial.createdUser.middleName|mb_truncate:1:''}.{/if}'>
                                            <input type="text" disabled="disabled" value='{if !empty($PANES.initial.reviewedUser)}{$PANES.initial.reviewedUser.lastName} {$PANES.initial.reviewedUser.firstName|mb_truncate:1:''}.{$PANES.initial.reviewedUser.middleName|mb_truncate:1:''}.{/if}'>
                                        </div>
                                    </div>
                                    <div class="double">
                                        <label>Телефоны</label>
                                        <div class="hold-two-input">
                                            <input type="text" disabled="disabled" value='{$PANES.initial.createdUser.phone|default}'>
                                            <input type="text" disabled="disabled" value='{$PANES.initial.reviewedUser.phone|default}'>
                                        </div>
                                    </div>
                                    <div class="double">
                                        <label class="sm-line">Время создания/проверки</label>
                                        <div class="hold-two-input">
                                            <input type="text" disabled="disabled" value='{if !empty($PANES.initial.createdTimestamp)}{$PANES.initial.createdTimestamp|date_format:$DATE_FORMAT}{/if}'>
                                            <input type="text" disabled="disabled" value='{if !empty($PANES.initial.reviewedTimestamp)}{$PANES.initial.reviewedTimestamp|date_format:$DATE_FORMAT}{/if}'>
                                        </div>
                                    </div>
                                    <div class="double">
                                        <label class="sm-line">Должность руководителя</label>
                                        <div class="hold-two-input">
                                            <input type="text" disabled="disabled" value='{$PANES.initial.createdSignedUser.post|default}'>
                                            <input type="text" disabled="disabled" value='{$PANES.initial.reviewedSignedUser.post|default}'>
                                        </div>
                                    </div>
                                    <div class="double">
                                        <label>Ф.И.О руководителя</label>
                                        <div class="hold-two-input">
                                            <input type="text" disabled="disabled" value='{if !empty($PANES.initial.createdSignedUser)}{$PANES.initial.createdSignedUser.lastName} {$PANES.initial.createdSignedUser.firstName|mb_truncate:1:''}.{$PANES.initial.createdSignedUser.middleName|mb_truncate:1:''}.{/if}'>
                                            <input type="text" disabled="disabled" value='{if !empty($PANES.initial.reviewedSignedUser)}{$PANES.initial.reviewedSignedUser.lastName} {$PANES.initial.reviewedSignedUser.firstName|mb_truncate:1:''}.{$PANES.initial.reviewedSignedUser.middleName|mb_truncate:1:''}.{/if}'>
                                        </div>
                                    </div>
                                    <div class="double">
                                        <label class="sm-line">Время утверждения</label>
                                        <div class="hold-two-input">
                                            <input type="text" disabled="disabled" value='{if !empty($PANES.initial.createdSignedTimestamp)}{$PANES.initial.createdSignedTimestamp|date_format:$DATE_FORMAT}{/if}'>
                                            <input type="text" disabled="disabled" value='{if !empty($PANES.initial.reviewedSignedTimestamp)}{$PANES.initial.reviewedSignedTimestamp|date_format:$DATE_FORMAT}{/if}'>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        {/if}
                        {if !empty($PANES.subsequent)}
                        <div class="col inner-col">
                            <div class="info">
                                <h2>Источник информации</h2>
                                <div class="wrap-form">
                                    <div class="double">
                                        <label>Должность</label>
                                        <div class="hold-two-input">
                                            <input type="text" disabled="disabled" value='{$PANES.subsequent.createdUser.post|default}'>
                                            <input type="text" disabled="disabled" value='{$PANES.subsequent.reviewedUser.post|default}'>
                                        </div>
                                    </div>
                                    <div class="double">
                                        <label>Ф.И.О.</label>
                                        <div class="hold-two-input">
                                            <input type="text" disabled="disabled" value='{if !empty($PANES.subsequent.createdUser)}{$PANES.subsequent.createdUser.lastName} {$PANES.subsequent.createdUser.firstName|mb_truncate:1:''}.{$PANES.subsequent.createdUser.middleName|mb_truncate:1:''}.{/if}'>
                                            <input type="text" disabled="disabled" value='{if !empty($PANES.subsequent.reviewedUser)}{$PANES.subsequent.reviewedUser.lastName} {$PANES.subsequent.reviewedUser.firstName|mb_truncate:1:''}.{$PANES.subsequent.reviewedUser.middleName|mb_truncate:1:''}.{/if}'>
                                        </div>
                                    </div>
                                    <div class="double">
                                        <label>Телефоны</label>
                                        <div class="hold-two-input">
                                            <input type="text" disabled="disabled" value='{$PANES.subsequent.createdUser.phone|default}'>
                                            <input type="text" disabled="disabled" value='{$PANES.subsequent.reviewedUser.phone|default}'>
                                        </div>
                                    </div>
                                    <div class="double">
                                        <label class="sm-line">Время создания/проверки</label>
                                        <div class="hold-two-input">
                                            <input type="text" disabled="disabled" value='{if !empty($PANES.subsequent.createdTimestamp)}{$PANES.subsequent.createdTimestamp|date_format:$DATE_FORMAT}{/if}'>
                                            <input type="text" disabled="disabled" value='{if !empty($PANES.subsequent.reviewedTimestamp)}{$PANES.subsequent.reviewedTimestamp|date_format:$DATE_FORMAT}{/if}'>
                                        </div>
                                    </div>
                                    <div class="double">
                                        <label class="sm-line">Должность руководителя</label>
                                        <div class="hold-two-input">
                                            <input type="text" disabled="disabled" value='{$PANES.subsequent.createdSignedUser.post|default}'>
                                            <input type="text" disabled="disabled" value='{$PANES.subsequent.reviewedSignedUser.post|default}'>
                                        </div>
                                    </div>
                                    <div class="double">
                                        <label>Ф.И.О руководителя</label>
                                        <div class="hold-two-input">
                                            <input type="text" disabled="disabled" value='{if !empty($PANES.subsequent.createdSignedUser)}{$PANES.subsequent.createdSignedUser.lastName} {$PANES.subsequent.createdSignedUser.firstName|mb_truncate:1:''}.{$PANES.subsequent.createdSignedUser.middleName|mb_truncate:1:''}.{/if}'>
                                            <input type="text" disabled="disabled" value='{if !empty($PANES.subsequent.reviewedSignedUser)}{$PANES.subsequent.reviewedSignedUser.lastName} {$PANES.subsequent.reviewedSignedUser.firstName|mb_truncate:1:''}.{$PANES.subsequent.reviewedSignedUser.middleName|mb_truncate:1:''}.{/if}'>
                                        </div>
                                    </div>
                                    <div class="double">
                                        <label class="sm-line">Время утверждения</label>
                                        <div class="hold-two-input">
                                            <input type="text" disabled="disabled" value='{if !empty($PANES.subsequent.createdSignedTimestamp)}{$PANES.subsequent.createdSignedTimestamp|date_format:$DATE_FORMAT}{/if}'>
                                            <input type="text" disabled="disabled" value='{if !empty($PANES.subsequent.reviewedSignedTimestamp)}{$PANES.subsequent.reviewedSignedTimestamp|date_format:$DATE_FORMAT}{/if}'>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        {/if}
                        <div class="col inner-col open">
                            <div class="info">
                                <h2>Источник информации</h2>
                                <div class="wrap-form">
                                    <div class="double">
                                        <label>Должность</label>
                                        <div class="hold-two-input">
                                            <input type="text" class='{if empty($REPORT) && !empty($EDITABLE)}generated{/if}' disabled='disabled' value='{if !empty($REPORT)}{$REPORT.createdUser.post}{elseif $EDITABLE}{$USER->info.post}{/if}'>
                                            <input type="text" class='{if !empty($CHECKING)}generated{/if}' disabled='disabled' value='{if !empty($REPORT.reviewedUser)}{$REPORT.reviewedUser.post}{elseif !empty($CHECKING)}{$CHECKER.post}{/if}'>
                                        </div>
                                    </div>
                                    <div class="double">
                                        <label>Ф.И.О.</label>
                                        <div class="hold-two-input">
                                            <input type="text" class='{if empty($REPORT) && !empty($EDITABLE)}generated{/if}' disabled='disabled' value='{if !empty($REPORT.createdUser)}{$REPORT.createdUser.lastName} {$REPORT.createdUser.firstName|mb_truncate:1:''}.{$REPORT.createdUser.middleName|mb_truncate:1:''}.{elseif $EDITABLE}{$USER->info.lastName} {$USER->info.firstName|mb_truncate:1:''}.{$USER->info.middleName|mb_truncate:1:''}.{/if}'>
                                            <input type="text" class='{if !empty($CHECKING)}generated{/if}' disabled='disabled' value='{if !empty($REPORT.reviewedUser)}{$REPORT.reviewedUser.lastName} {$REPORT.reviewedUser.firstName|mb_truncate:1:''}.{$REPORT.reviewedUser.middleName|mb_truncate:1:''}.{elseif !empty($CHECKING)}{$CHECKER.lastName} {$CHECKER.firstName|mb_truncate:1:''}.{$CHECKER.middleName|mb_truncate:1:''}.{/if}'>
                                        </div>
                                    </div>
                                    <div class="double">
                                        <label>Телефоны</label>
                                        <div class="hold-two-input">
                                            <input type="text" class='{if empty($REPORT) && $EDITABLE} generated{/if}' disabled='disabled' value='{if !empty($REPORT)}{$REPORT.createdUser.phone}{elseif $EDITABLE}{$USER->info.phone}{/if}' >
                                            <input type="text" class='{if !empty($CHECKING)} generated{/if}' disabled='disabled' value='{if !empty($REPORT.reviewedUser)}{$REPORT.reviewedUser.phone}{elseif !empty($CHECKING)}{$CHECKER.phone}{/if}'>
                                        </div>
                                    </div>
                                    <div class="double">
                                        <label class="sm-line">Время создания/проверки</label>
                                        <div class="hold-two-input">
                                            <input type="text" class='{if empty($REPORT) && $EDITABLE}generated{/if}' disabled='disabled' value='{if !empty($REPORT.createdTimestamp)}{$REPORT.createdTimestamp|date_format:$DATE_FORMAT}{else}<проставляется при сохранении>{/if}'>
                                            <input type="text" class='{if !empty($CHECKING)}generated{/if}' disabled='disabled' value='{if !empty($REPORT.reviewedTimestamp) && empty($CHECKING)}{$REPORT.reviewedTimestamp|date_format:$DATE_FORMAT}{elseif !empty($CHECKING)}<проставляется при сохранении>{/if}'>
                                        </div>
                                    </div>
                                    <div class="double">
                                        <label class="sm-line">Должность руководителя</label>
                                        <div class="hold-two-input">
                                            <input type="text" class='{if empty($REPORT.createdSigned) && !empty($CREATED_SIGNER)}generated{/if}' disabled='disabled' value='{if !empty($REPORT.createdSigned)}{$REPORT.createdSignedUser.post|default}{elseif !empty($CREATED_SIGNER)}{$CREATED_SIGNER.post|default}{/if}'>
                                            <input type="text" class='{if empty($REPORT.reviewedSignedUser) && !empty($REVIEWED_SIGNER)}generated{/if}' disabled='disabled' value='{if !empty($REPORT.reviewedSignedUser)}{$REPORT.reviewedSignedUser.post|default}{elseif !empty($REVIEWED_SIGNER)}{$REVIEWED_SIGNER.post|default}{/if}'>
                                        </div>
                                    </div>
                                    <div class="double">
                                        <label>Ф.И.О руководителя</label>
                                        <div class="hold-two-input">
                                            <input type="text" class='{if empty($REPORT.createdSigned) && !empty($CREATED_SIGNER)}generated{/if}' disabled='disabled' value='{if !empty($REPORT.createdSigned)}{if !empty($REPORT.createdSignedUser)}{$REPORT.createdSignedUser.lastName} {$REPORT.createdSignedUser.firstName|mb_truncate:1:''}.{$REPORT.createdSignedUser.middleName|mb_truncate:1:''}.{/if}{elseif !empty($CREATED_SIGNER)}{$CREATED_SIGNER.lastName} {$CREATED_SIGNER.firstName|mb_truncate:1:''}.{$CREATED_SIGNER.middleName|mb_truncate:1:''}.{/if}'>
                                            <input type="text" class='{if empty($REPORT.reviewedSignedUser) && !empty($REVIEWED_SIGNER)}generated{/if}' disabled='disabled' value='{if !empty($REPORT.reviewedSignedUser)}{$REPORT.reviewedSignedUser.lastName} {$REPORT.reviewedSignedUser.firstName|mb_truncate:1:''}.{$REPORT.reviewedSignedUser.middleName|mb_truncate:1:''}.{elseif !empty($REVIEWED_SIGNER)}{$REVIEWED_SIGNER.lastName} {$REVIEWED_SIGNER.firstName|mb_truncate:1:''}.{$REVIEWED_SIGNER.middleName|mb_truncate:1:''}.{/if}'>
                                        </div>
                                    </div>
                                    <div class="double">
                                        <label class="sm-line">Время утверждения</label>
                                        <div class="hold-two-input">
                                            <input type="text" class='{if empty($REPORT.createdSigned) && !empty($CREATED_SIGNER)}generated{/if}'disabled='disabled' value='{if !empty($REPORT.createdSignedTimestamp)}{$REPORT.createdSignedTimestamp|date_format:$DATE_FORMAT}{elseif !empty($CREATED_SIGNER)}<проставляется при сохранении>{/if}'>
                                            <input type="text" class='{if empty($REPORT.reviewedSignedTimestamp) && !empty($REVIEWED_SIGNER)}generated{/if}' disabled='disabled' value='{if !empty($REPORT.reviewedSignedTimestamp)}{$REPORT.reviewedSignedTimestamp|date_format:$DATE_FORMAT}{elseif !empty($REVIEWED_SIGNER)}<проставляется при сохранении>{/if}'>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </fieldset>
                <div class="holder-nav-new holder-nav-new--inner-new">
                    <ul class="list">
                        <li> <a class="main-link" href="/"></a></li>
                    </ul>
                    <div class="buttons">
                        {if empty($LOCKED)}
                            {if !empty($CHECKING)}
                                <button class="btn" type="submit" name="{if 'final'==$MODE}finalSubmit{else}subsequentSubmit{/if}" value='doCheck'>проверить</button>
                            {elseif !empty($SIGNING)}
                                <button class="btn" type="submit" name="{if 'final'==$MODE}finalSubmit{else}subsequentSubmit{/if}" value='doSign'>утвердить</button>
                            {elseif !empty($EDITABLE)}
                                <button class="btn" type="submit" form="multipane-form" name="{if 'final'==$MODE}finalSubmit{else}subsequentSubmit{/if}" value='doSave'>сохранить</button>
                            {/if}

                            {if !empty($SIGNING) && $REPORT.stage == 3}
                                <button class="btn minzdrav" type="submit" name="{if 'final'==$MODE}finalSubmit{else}subsequentSubmit{/if}" value='doSignAndSend'>утвердить и отправить в минздрав</button>
                            {/if}
                            {if 'subsequent'==$MODE && !empty($SUBSEQUENT_ENABLED)}
                                <button class="btn" type="submit" style='width: 298px; background-position: 253px 7px' name="subsequentSubmit" value='doSubsequent'>создать последующее</button>
                            {/if}
                            {if 'subsequent'==$MODE && !empty($FINAL_ENABLED)}
                                <button class="btn wider" type="submit" name="subsequentSubmit" value="doFinal">создать заключительное</button>
                            {/if}
                            {if !empty($CAN_DELETE)}
                                <button class="btn" type="button" name="deleteButton" id="deleteButton" data-esid="{$REPORT.esID}" value='doDelete'>Удалить ЧС #{$REPORT.esID}</button>
                            {/if}
                        {/if}
                    </div>
                    <a class="print" href="#"></a>
                    <div class="es-display">
                        <label for="inStats">ЧС отображается в статистике</label>
                        <input type="checkbox" name="inStats" id="inStats" value="on" {if empty($REPORT) || !empty($REPORT.inStats)}checked="checked"{/if} {if empty($EDITABLE)}disabled='disabled'{/if} />
                    </div>
                </div>
            </form>
        </div>

        <!-- footer -->
        <div class="footer in-page">
            <div class="his-hol">
                <div class="holder-history">
                    {if !empty($ES_HISTORY.final)}
                        <div class="holder-top">
                            <strong class="status grey-status">заключительное донесение</strong>
                        </div>
                        <ul class="list-history">
                            <li class="{if 'final'==$MODE && $ES_HISTORY.final.finalReportID==$REPORT.finalReportID}active{else}active-bg{/if}">
                                <span class="t1"><span class="text">{$ES_HISTORY.final.createdTimestamp|date_format:$DATE_FORMAT}</span></span>
                                <span class="t2"><span class="text">{$ES_HISTORY.final.stageText}</span></span>
                                <span class="t3">
                                    {if !empty($ES_HISTORY.final.dumpRegional)}
                                        <span class="text">региональный</span>
                                        <a class="pdf" target="_blank" href="{$ES_HISTORY.final.dumpRegional.pdf}" data-title="Экспорт в PDF"></a>
                                        <a class="doc" href="{$ES_HISTORY.final.dumpRegional.docx}" data-title="Экспорт в DOC"></a>
                                    {/if}
                                </span>
                                <span class="t4">
                                    {if !empty($ES_HISTORY.final.dumpFederal)}
                                        <span class="text">федеральный</span>
                                        <a class="pdf" target="_blank" href="{$ES_HISTORY.final.dumpFederal.pdf}" data-title="Экспорт в PDF"></a>
                                        <a class="doc" href="{$ES_HISTORY.final.dumpFederal.docx}" data-title="Экспорт в DOC"></a>
                                    {/if}
                                    {if 'final'!=$MODE || $ES_HISTORY.final.finalReportID!=$REPORT.finalReportID}<a class="next" href="/final/{$ES_HISTORY.final.finalReportID}/"></a>{/if}
                                </span>
                            </li>
                        </ul>
                    {/if}
                </div>
                {if !empty($ES_HISTORY.subsequent)}
                    <div class="holder-history">
                        <div class="holder-top">
                            <strong class="status grey-status">последующее донесение</strong>
                        </div>
                        <ul class="list-history">
                            {foreach from=$ES_HISTORY.subsequent item=REP}
                            <li class="{if 'subsequent'==$MODE && $REP.subsequentReportID==$REPORT.subsequentReportID}active{else}active-bg{/if}">
                                <span class="t1"><span class="text">{$REP.createdTimestamp|date_format:$DATE_FORMAT}</span></span>
                                <span class="t2"><span class="text">{$REP.stageText}</span></span>
                                <span class="t3">
                                    {if !empty($REP.dumpRegional)}
                                        <span class="text">региональный</span>
                                        <a class="pdf" target="_blank" href="{$REP.dumpRegional.pdf}" data-title="Экспорт в PDF"></a>
                                        <a class="doc"  href="{$REP.dumpRegional.docx}" data-title="Экспорт в DOC"></a>
                                    {/if}
                                </span>
                                <span class="t4">
                                    {if !empty($REP.dumpFederal)}
                                        <span class="text">федеральный</span>
                                        <a class="pdf" target="_blank" href="{$REP.dumpFederal.pdf}" data-title="Экспорт в PDF"></a>
                                        <a class="doc" href="{$REP.dumpFederal.docx}" data-title="Экспорт в DOC"></a>
                                    {/if}
                                    {if 'subsequent'!=$MODE || $REP.subsequentReportID!=$REPORT.subsequentReportID}<a class="next" href="/subsequent/{$REP.subsequentReportID}"></a>{/if}
                                </span>
                            </li>
                            {/foreach}
                        </ul>
                    </div>
                {/if}
                <div class="holder-history">
                    <div class="holder-top">
                        <strong class="status">первичное донесение</strong>
                    </div>
                    <ul class="list-history">
                        <li>
                            <span class="t1"><span class="text">{$ES_HISTORY.initial.createdTimestamp|date_format:$DATE_FORMAT}</span></span>
                            <span class="t2"><span class="text">{$ES_HISTORY.initial.stageText}</span></span>
                            <span class="t3">
                                {if !empty($ES_HISTORY.initial.dumpRegional)}
                                    <span class="text">региональный</span>
                                    <a class="pdf" target="_blank" href="{$ES_HISTORY.initial.dumpRegional.pdf}" data-title="Экспорт в PDF"></a>
                                    <a class="doc" href="{$ES_HISTORY.initial.dumpRegional.docx}" data-title="Экспорт в DOC"></a>
                                {/if}
                            </span>
                            <span class="t4">
                                {if !empty($ES_HISTORY.initial.dumpFederal)}
                                    <span class="text">федеральный</span>
                                    <a class="pdf" target="_blank" href="{$ES_HISTORY.initial.dumpFederal.pdf}" data-title="Экспорт в PDF"></a>
                                    <a class="doc" href="{$ES_HISTORY.initial.dumpFederal.docx}" data-title="Экспорт в DOC"></a>
                                {/if}
                                <a class="next" href="/initial/{$ES_HISTORY.initial.initialReportID}/"></a>
                            </span>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="send-info">
                <p>Оперативные сведения о чрезвычайных ситауциявх</p>
            </div>
        </div>
    </div>
    {include file='front/report/modal.tpl'}
</div>
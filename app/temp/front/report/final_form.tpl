<!-- wrapper  start -->
<div id="wrapper">
	<!-- header  start -->
	<header id="header" class="inner-new one-column-header">
        <div class="one-column-header__status">
            <strong class="status grey-status">заключительное донесение</strong>
        </div>
        <div class="arrow-button">
            <a href="/"><span></span></a>
            <span>ЧС: {$REPORT.esID|default:$ESID}, ИД донесения: {$REPORT.reportHID}</span>
        </div>
        <div class="icon-block">
            <div class="one-strip{if empty($PANES_NUM) || 1==$PANES_NUM} active{/if}"></div>
            {if !empty($TOTAL_PANES) && $TOTAL_PANES>=2}<div class="two-strip{if !empty($PANES_NUM) && 2==$PANES_NUM} active{/if}"></div>{/if}
            {if !empty($TOTAL_PANES) && 3==$TOTAL_PANES}<div class="three-strip{if !empty($PANES_NUM) && 3==$PANES_NUM} active{/if}"></div>{/if}
        </div>
		<div class="holder-operatop">
			<div class="holder-avater">
				<a href="/admin/profile/" data-title="Профиль польователя">
					<span class="name">{if !empty($USER->info.lastName)}{$USER->info.firstName} {$USER->info.lastName}{else}{$USER->GetLogin()}{/if}</span>
					<span class="avatar"><!--<img src="images/img.jpg" alt="image" />--></span>
				</a>
			</div>
			<a class="login" href="/logout/" data-title="Выход из системы">login</a>
		</div>
	</header>
	<!-- header  end
		 main  start -->
	<div id="main">
		{if !empty($REPORT) || (!empty($NEW_REPORT) && !empty($ESID))}
		<div class="holder-form">
            <form method="post" id="final-form" action="" autocomplete="off" class="form {if !empty($EDITABLE) && $EDITABLE}enabled{else}disabled{/if}{if !empty($LOCKED)} locked{/if}">
				{if !empty($REPORT.finalReportID)}<input type='hidden' name='finalReportID' value='{$REPORT.finalReportID}' />{/if}
				<fieldset>
                    {include file='front/report/parts/locked_info.tpl'}
                    {include file='front/report/parts/info_source.tpl'}
					<div class="info">
						<h2>Характер чс</h2>
						<div class="wrap-form">
							<div class="double">
								<label for="scaleID">Масштаб ЧС</label>
								<div class="hold-select">
									<select class="customSelect" name='scaleID' id='scaleID' {if empty($EDITABLE)}disabled='disabled'{/if}>
										{foreach from=$ES_SCALES item=SCALE key=KEY}
											<option value="{$KEY}" {if !empty($REPORT.scaleID) && $REPORT.scaleID==$KEY}selected='selected'{/if}>{$SCALE}</option>
										{/foreach}
									</select>
								</div>
							</div>
							<div class="double">
								<div class="holl">
									<label for='locationName'>Место ЧС</label>
									<div class="hold-map-box">
                                        <input type="text" class="no-clear" placeholder="" autocomplete="off" name='locationName' id='locationName' {if !empty($REPORT.locationName)}data-tainted="true"{/if} value='{$REPORT.locationName|default}' {if empty($EDITABLE)}disabled='disabled'{/if} />
										<input type="hidden" name="locationCoords" />
                                        <div class="holder-list">
											<div class="custom-scroll"><ul></ul></div>
										</div>
										<a class="buttom-map{if empty($EDITABLE)} disabled{/if}" data-class="buttom-map" href="#map-small" data-title="Выбрать точку на карте">buttom-map</a>
										<a class="link-description" href="#" data-title="Комментарий">&nbsp;</a>
									</div>
								</div>
								<div class="box-hide open">
									<div class="box">
										<label for="locationComment">Комментарий</label>
										<div class="hold">
											<textarea  placeholder="— " name="locationComment" id="locationComment" {if empty($EDITABLE)}disabled='disabled'{/if}>{$REPORT.locationComment|default}</textarea>
										</div>
									</div>
								</div>
							</div>
							<div class="double">
								<label for='datetimeEs'>Дата и время ЧС (Московское)</label>
								<div class="hold-data">
									<input type="text" placeholder="" readonly="readonly" name='datetimeEs' id='datetimeEs' value='{if !empty($REPORT.datetimeEs)}{$REPORT.datetimeEs|date_format:$DATE_FORMAT}{/if}' {if empty($EDITABLE)}disabled='disabled'{/if} />
									<a class="ui-datepicker-trigger{if empty($EDITABLE)} disabled{/if}" data-class="ui-datepicker-trigger" href="#date">data</a>
								</div>
							</div>
							<div class="double">
								<label for='kindID'>Вид ЧС</label>
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
								<label for='typeID'>Тип ЧС</label>
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
								<label for='esName'>Характеристика и обстоятельства ЧС</label>
								<div class="hold">
									<textarea  placeholder="— Введите характеристику ЧС" name='esName' id='esName' {if empty($EDITABLE)}disabled='disabled'{/if}>{$REPORT.esName|default}</textarea>
								</div>
							</div>
							<div class="double">
								<label for='eliminatingTime'>Время устранения ЧС (ч)</label>
								<div class="hold">
									<input type="number" min="0" placeholder="" alt="" autocomplete="off" class="numeric" name="eliminatingTime" value="{$REPORT.eliminatingTime|default}" {if empty($EDITABLE)}disabled='disabled'{/if} />
								</div>
							</div>
						</div>
					</div>
					<div class="info">
						<h3>Пострадавшие</h3>
						<div class="holder-triple">
							<div class="triple">
								<div class="left">
									<label for='victimsTotal' class="only">Всего</label>
									<span class="inf-only">
										<span class="text-center">
											<span class="text-inner">
												<span class="text-last">
													в том числе погибших, всего
												</span>
											</span>
										</span>
									</span>
								</div>
								<div class="right">
									<div class="holder-small">
										<input type="number" min="0" placeholder="" class="numeric" name='victimsTotal' id='victimsTotal' value='{$REPORT.victimsTotal|default}' {if empty($EDITABLE)}disabled='disabled'{/if} />
										<label for='victimsChildren'>из них детей</label>
										<input type="number" min="0" placeholder="" class="numeric" name='victimsChildren' id='victimsChildren' value='{$REPORT.victimsChildren|default}' {if empty($EDITABLE)}disabled='disabled'{/if} />
									</div>
									<div class="holder-small">
										<input type="number" min="0" placeholder="" class="numeric" name='victimsDeadTotal' id='victimsDeadTotal' value='{$REPORT.victimsDeadTotal|default}' {if empty($EDITABLE)}disabled='disabled'{/if} />
										<label for='victimsDeadChildren'>из них детей</label>
										<input type="number" min="0" placeholder="" class="numeric" name='victimsDeadChildren' id='victimsDeadChildren' value='{$REPORT.victimsDeadChildren|default}' {if empty($EDITABLE)}disabled='disabled'{/if} />
									</div>
								</div>
							</div>
							<strong class="title">медицинская эвакуация</strong>
							<div class="triple">
								<div class="left">
									<label class="only" for='evacuatedTotal'>Всего</label>
									<span class="inf-only">
										<span class="text-center">
											<span class="text-inner">
												<span class="text-last">
													в том числе авиационным транспортом, всего
												</span>
											</span>
										</span>
									</span>
								</div>
								<div class="right">
									<div class="holder-small">
										<input type="number" min="0" placeholder="" class="numeric" name='evacuatedTotal' id='evacuatedTotal' value='{$REPORT.evacuatedTotal|default}' {if empty($EDITABLE)}disabled='disabled'{/if} />
										<label for='evacuatedChildren'>из них детей</label>
										<input type="number" min="0" placeholder="" class="numeric" name='evacuatedChildren' id='evacuatedChildren' value='{$REPORT.evacuatedChildren|default}' {if empty($EDITABLE)}disabled='disabled'{/if} />
									</div>
									<div class="holder-small">
										<input type="number" min="0" placeholder="" class="numeric" name='evacuatedByAirTotal' id='evacuatedByAirTotal' value='{$REPORT.evacuatedByAirTotal|default}' {if empty($EDITABLE)}disabled='disabled'{/if} />
										<label for='evacuatedByAirChildren'>из них детей</label>
										<input type="number" min="0" placeholder="" class="numeric" name='evacuatedByAirChildren' id='evacuatedByAirChildren' value='{$REPORT.evacuatedByAirChildren|default}' {if empty($EDITABLE)}disabled='disabled'{/if} />
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="info check-people">
						<div class="overlay-small"></div>
						<h3>Госпитализация <small>(Сведения о пораженных по видам медицинской помощи и состоянию)</small></h3>
						<div class="new-box">
							<h4>Пораженные по видам медицинской помощи</h4>
							<div class="holder-triple">
								<div class="triple triple-t10">
									<div class="left">
										<label class="only">Первая помощь, всего</label>
									</div>
									<div class="right">
										<div class="holder-small">
											<input type="number" min="0" placeholder="" alt="" class="numeric" name='caretypeFirstaidTotal' id='caretypeFirstaidTotal' value='{$REPORT.caretypeFirstaidTotal|default:0}' {if empty($EDITABLE)}disabled='disabled'{/if} />
											<label>из них детей</label>
											<input type="number" min="0" placeholder="" alt="" class="numeric" name='caretypeFirstaidChildren' id='caretypeFirstaidChildren' value='{$REPORT.caretypeFirstaidChildren|default:0}' {if empty($EDITABLE)}disabled='disabled'{/if} />
										</div>
									</div>
								</div>
							</div>
							<div class="holder-triple">
								<div class="triple tp triple-t10">
									<div class="left">
										<label class="only">Первичная <br/>медико-санитарная помощь, <br/>всего</label>
									</div>
									<div class="right">
										<div class="holder-small holder-small-top">
											<input type="text" placeholder="" alt="" class="numeric no-clear" name='caretypeHealthCareTotal' id='caretypeHealthCareTotal' value='{$REPORT.caretypeHealthCareTotal|default:0}' readonly="readonly" data-sumof="caretypeHealthCarePredoctorTotal,caretypeHealthCareMedicalTotal,caretypeHealthCareSpecializedTotal" />
											<label>из них детей</label>
											<input type="text" placeholder="" alt="" class="numeric no-clear" name='caretypeHealthCareChildren' id='caretypeHealthCareChildren' value='{$REPORT.caretypeHealthCareChildren|default:0}' readonly="readonly" data-sumof='caretypeHealthCarePredoctorChildren,caretypeHealthCareMedicalChildren,caretypeHealthCareSpecializedChildren' />
										</div>
									</div>
								</div>
							</div>
							<div class="holder-triple">
								<div class="triple triple-top">
									<div class="left">
										<span class="inf-only">
											<span class="text-center">
												<span class="text-inner">
													<span class="text-last">
														доврачебная
													</span>
												</span>
											</span>
										</span>
									</div>
									<div class="right">
										<div class="holder-small">
											<input type="number" min="0" placeholder="" alt="" class="numeric" name='caretypeHealthCarePredoctorTotal' id='caretypeHealthCarePredoctorTotal' value='{$REPORT.caretypeHealthCarePredoctorTotal|default:0}' {if empty($EDITABLE)}disabled='disabled'{/if} />
											<label>из них детей</label>
											<input type="number" min="0" placeholder="" alt="" class="numeric" name='caretypeHealthCarePredoctorChildren' id='caretypeHealthCarePredoctorChildren' value='{$REPORT.caretypeHealthCarePredoctorChildren|default:0}' {if empty($EDITABLE)}disabled='disabled'{/if} />
										</div>
									</div>
								</div>
							</div>
							<div class="holder-triple">
								<div class="triple triple-top">
									<div class="left">
										<span class="inf-only">
											<span class="text-center">
												<span class="text-inner">
													<span class="text-last">
														врачебная
													</span>
												</span>
											</span>
										</span>
									</div>
									<div class="right">
										<div class="holder-small">
											<input type="number" min="0" placeholder="" alt="" class="numeric" name='caretypeHealthCareMedicalTotal' id='caretypeHealthCareMedicalTotal' value='{$REPORT.caretypeHealthCareMedicalTotal|default:0}' {if empty($EDITABLE)}disabled='disabled'{/if} />
											<label>из них детей</label>
											<input type="number" min="0" placeholder="" alt="" class="numeric" name='caretypeHealthCareMedicalChildren' id='caretypeHealthCareMedicalChildren' value='{$REPORT.caretypeHealthCareMedicalChildren|default:0}' {if empty($EDITABLE)}disabled='disabled'{/if} />
										</div>
									</div>
								</div>
							</div>
							<div class="holder-triple">
								<div class="triple triple-top">
									<div class="left">
										<span class="inf-only">
											<span class="text-center">
												<span class="text-inner">
													<span class="text-last">
														специализированная
													</span>
												</span>
											</span>
										</span>
									</div>
									<div class="right">
										<div class="holder-small">
											<input type="number" min="0" placeholder="" alt="" class="numeric" name='caretypeHealthCareSpecializedTotal' id='caretypeHealthCareSpecializedTotal' value='{$REPORT.caretypeHealthCareSpecializedTotal|default:0}' {if empty($EDITABLE)}disabled='disabled'{/if} />
											<label>из них детей</label>
											<input type="number" min="0" placeholder="" alt="" class="numeric" name='caretypeHealthCareSpecializedChildren' id='caretypeHealthCareSpecializedChildren' value='{$REPORT.caretypeHealthCareSpecializedChildren|default:0}' {if empty($EDITABLE)}disabled='disabled'{/if}/>
										</div>
									</div>
								</div>
							</div>
							<div class="holder-triple">
								<div class="triple tp">
									<div class="left">
										<label class="only">Специализированная <br/> (высокотехнологичная) <br/> помощь</label>
									</div>
									<div class="right">
										<div class="holder-small holder-small-top">
											<input type="number" min="0" placeholder="" alt="" class="numeric" name='caretypeSpecializedTotal' id='caretypeSpecializedTotal' value='{$REPORT.caretypeSpecializedTotal|default:0}' {if empty($EDITABLE)}disabled='disabled'{/if} />
											<label>из них детей</label>
											<input type="number" min="0" placeholder="" alt="" class="numeric" name='caretypeSpecializedChildren' id='caretypeSpecializedChildren' value='{$REPORT.caretypeSpecializedChildren|default:0}' {if empty($EDITABLE)}disabled='disabled'{/if} />
										</div>
									</div>
								</div>
							</div>
							<div class="holder-triple">
								<div class="triple triple-top-10">
									<div class="left">
										<label class="only">Скорая, в т.ч. <br/>скорая специализированная</label>
									</div>
									<div class="right">
										<div class="holder-small holder-small-10">
											<input type="number" min="0" placeholder="" alt="" class="numeric" name='caretypeAmbulanceTotal' id='caretypeAmbulanceTotal' value='{$REPORT.caretypeAmbulanceTotal|default:0}' {if empty($EDITABLE)}disabled='disabled'{/if} />
											<label>из них детей</label>
											<input type="number" min="0" placeholder="" alt="" class="numeric" name='caretypeAmbulanceChildren' id='caretypeAmbulanceChildren' value='{$REPORT.caretypeAmbulanceChildren|default:0}' {if empty($EDITABLE)}disabled='disabled'{/if} />
										</div>
									</div>
								</div>
							</div>
							<div class="holder-triple">
								<div class="triple line">
									<div class="left">
										<label class="only">Всего</label>
									</div>
									<div class="right">
										<div class="holder-small">
											<input type="text" placeholder="" alt="" class="numeric no-clear" name='caretypeTotal' id='caretypeTotal' value='{$REPORT.caretypeTotal|default:0}' readonly='readonly' data-sumof='caretypeFirstaidTotal,caretypeHealthCareTotal,caretypeSpecializedTotal,caretypeAmbulanceTotal' />
											<label>из них детей</label>
											<input type="text" placeholder="" alt="" class="numeric no-clear" name='caretypeChildren' id='caretypeChildren' value='{$REPORT.caretypeChildren|default:0}' readonly='readonly' data-sumof='caretypeFirstaidChildren,caretypeHealthCareChildren,caretypeSpecializedChildren,caretypeAmbulanceChildren' />
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="new-box">
							<div class="holder-triple">
								<strong class="title">Пораженные по тяжести состояния</strong>
								<div class="triple triple-t10">
									<div class="box-b-n">
										<div class="box">
											<div class="left">
												<label class="only" for="ambulatoryTotal">Направлено на амбулаторное лечение, всего</label>
											</div>
											<div class="right">
												<div class="holder-small">
													<input type="number" min="0" placeholder="" class="numeric" name="ambulatoryTotal" id="ambulatoryTotal" value="{$REPORT.ambulatoryTotal|default:0}" {if empty($EDITABLE)}disabled="disabled"{/if} />
													<label>из них детей</label>
													<input type="number" min="0" placeholder="" class="numeric" name="ambulatoryChildren" id="ambulatoryChildren" value="{$REPORT.ambulatoryChildren|default:0}" {if empty($EDITABLE)}disabled="disabled"{/if} />
												</div>
											</div>
										</div>
									</div>
								</div>
                                {include file='front/report/parts/hospitalized.tpl'}
							</div>
						</div>
					</div>
					<div class="info">
						<h4>медицинские бригады</h4>
						<div class="holder-medicine holder-medicine-new">
							{foreach from=$MEDICAL_TEAMS item=MEDICAL_TEAM}
								{if !$MEDICAL_TEAM.isSecondary}
								<div class="medicine">
									<label for='medicalTeam_{$MEDICAL_TEAM.medicalTeamID}' {if !empty($MEDICAL_TEAM.hint)}data-title='{$MEDICAL_TEAM.hint}'{/if}>
										<span class="text">{$MEDICAL_TEAM.name}</span>
										<span class="first-line">всего</span>
										<span class="inf-only">
											<span class="text-center">
												<span class="text-inner">
													<span class="text-last"> из них штатных формирований </span>
												</span>
											</span>
										</span>
									</label>
									<figure class="logo-organization">
										<img src="{$MEDICAL_TEAM.imageSrcSmall|default}" alt="{$MEDICAL_TEAM.name}" {if !empty($MEDICAL_TEAM.hint)}data-title='{$MEDICAL_TEAM.hint}'{/if} />
									</figure>
									<div class="hold">
										<div class="wrap">
											<input type="number" min="0" placeholder="-" class="numeric" name='medicalTeams[{$MEDICAL_TEAM.medicalTeamID}][number]' id='medicalTeam_{$MEDICAL_TEAM.medicalTeamID}' value='{$REPORT.medicalTeams[$MEDICAL_TEAM.medicalTeamID].number|default:0}' {if empty($EDITABLE)}disabled='disabled'{/if} data-title='Всего' />
											<input type="number" min="0" placeholder="-" class="numeric" name='medicalTeams[{$MEDICAL_TEAM.medicalTeamID}][staffUnits]' id='medicalTeam_{$MEDICAL_TEAM.medicalTeamID}_staff' data-atmost="medicalTeam_{$MEDICAL_TEAM.medicalTeamID}" value='{$REPORT.medicalTeams[$MEDICAL_TEAM.medicalTeamID].staffUnits|default:0}' {if empty($EDITABLE)}disabled='disabled'{/if} data-title='Из них штатных формирований' />
										</div>
										<textarea cols="10" rows="30" placeholder="-" name='medicalTeams[{$MEDICAL_TEAM.medicalTeamID}][comment]' {if empty($EDITABLE)}disabled='disabled'{/if} data-title='Комментарий' >{$REPORT.medicalTeams[$MEDICAL_TEAM.medicalTeamID].comment|default}</textarea>
									</div>
								</div>
								{/if}
							{/foreach}
						</div>
						<div class="hight-box">
							<a class="title" href="#"><span>дополнительные медицинские силы</span></a>
							<div class="box-new">
								<div class="holder-medicine box holder-medicine-new">
									{foreach from=$MEDICAL_TEAMS item=MEDICAL_TEAM}
										{if $MEDICAL_TEAM.isSecondary}
										<div class="medicine">
											<label for='medicalTeam_{$MEDICAL_TEAM.medicalTeamID}' data-title='{$MEDICAL_TEAM.hint}' >
												<span class="text">{$MEDICAL_TEAM.name}</span>
												<span class="first-line">всего</span>
												<span class="inf-only">
													<span class="text-center">
														<span class="text-inner">
															<span class="text-last"> из них штатных формирований </span>
														</span>
													</span>
												</span>
											</label>
											<figure class="logo-organization">
												<img src="{$MEDICAL_TEAM.imageSrcSmall|default}" alt="{$MEDICAL_TEAM.name}" data-title='{$MEDICAL_TEAM.hint}' />
											</figure>
											<div class="hold">
												<div class="wrap">
													<input type="number" min="0" placeholder="-" class="numeric" name='medicalTeams[{$MEDICAL_TEAM.medicalTeamID}][number]' id='medicalTeam_{$MEDICAL_TEAM.medicalTeamID}' value='{$REPORT.medicalTeams[$MEDICAL_TEAM.medicalTeamID].number|default:0}' {if empty($EDITABLE)}disabled='disabled'{/if} data-title='Всего' />
													<input type="number" min="0" placeholder="-" class="numeric" name='medicalTeams[{$MEDICAL_TEAM.medicalTeamID}][staffUnits]' id='medicalTeam_{$MEDICAL_TEAM.medicalTeamID}_staff' data-atmost='medicalTeam_{$MEDICAL_TEAM.medicalTeamID}' value='{$REPORT.medicalTeams[$MEDICAL_TEAM.medicalTeamID].staffUnits|default:0}' {if empty($EDITABLE)}disabled='disabled'{/if} data-title='Из них штатных формирований' />
												</div>
												<textarea cols="10" rows="30" placeholder="-" name='medicalTeams[{$MEDICAL_TEAM.medicalTeamID}][comment]' {if empty($EDITABLE)}disabled='disabled'{/if} data-title='Комментарий' >{$REPORT.medicalTeams[$MEDICAL_TEAM.medicalTeamID].comment|default}</textarea>
											</div>
										</div>
										{/if}
									{/foreach}
								</div>
								<div class="hight-box">
									<strong class="title">
										<a href="#"></a>
									</strong>
									<div class="box">

									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="info important">
						<h1>Источник информации</h1>
						<ul class="list-info">
							<li>
								<div class="top">
									<div class="bottom">
										<span class="info1">Должность</span>
										<span class="info2{if empty($REPORT) && !empty($EDITABLE)} generated{/if}">{if !empty($REPORT)}{$REPORT.createdUser.post}{elseif !empty($EDITABLE)}{$USER->info.post}{/if}</span>
										<span class="info2{if !empty($CHECKING)} generated{/if}">{if !empty($REPORT.reviewedUser)}{$REPORT.reviewedUser.post}{elseif !empty($CHECKING)}{$CHECKER.post}{/if}</span>
									</div>
								</div>
							</li>
							<li>
								<div class="top">
									<div class="bottom">
										<span class="info1">Ф.И.О.</span>
										<span class="info2{if empty($REPORT) && !empty($EDITABLE)} generated{/if}">{if !empty($REPORT.createdUser)}{$REPORT.createdUser.lastName} {$REPORT.createdUser.firstName|mb_truncate:1:''}.{$REPORT.createdUser.middleName|mb_truncate:1:''}.{elseif !empty($EDITABLE)}{$USER->info.lastName} {$USER->info.firstName|mb_truncate:1:''}.{$USER->info.middleName|mb_truncate:1:''}.{/if}</span>
										<span class="info2{if !empty($CHECKING)} generated{/if}">{if !empty($REPORT.reviewedUser)}{$REPORT.reviewedUser.lastName} {$REPORT.reviewedUser.firstName|mb_truncate:1:''}.{$REPORT.reviewedUser.middleName|mb_truncate:1:''}.
										{elseif !empty($CHECKING)}{$CHECKER.lastName} {$CHECKER.firstName|mb_truncate:1:''}.{$CHECKER.middleName|mb_truncate:1:''}.{/if}</span>
									</div>
								</div>
							</li>
							<li>
								<div class="top">
									<div class="bottom">
										<span class="info1">Телефоны</span>
										<span class="info2{if empty($REPORT) && $EDITABLE} generated{/if}">{if !empty($REPORT)}{$REPORT.createdUser.phone}{elseif $EDITABLE}{$USER->info.phone}{/if}</span>
										<span class="info2{if !empty($CHECKING)} generated{/if}">{if !empty($REPORT.reviewedUser)}{$REPORT.reviewedUser.phone}{elseif !empty($CHECKING)}{$CHECKER.phone}{/if}</span>
									</div>
								</div>
							</li>
							<li>
								<div class="top">
									<div class="bottom">
										<span class="info1">Время создания/проверки</span>
										<span class="info2{if empty($REPORT) && $EDITABLE} generated{/if}">{if !empty($REPORT.createdTimestamp)}{$REPORT.createdTimestamp|date_format:$DATE_FORMAT}{else}<проставляется при сохранении>{/if}</span>
										<span class="info2{if !empty($CHECKING)} generated{/if}">{if !empty($REPORT.reviewedTimestamp) && empty($CHECKING)}{$REPORT.reviewedTimestamp|date_format:$DATE_FORMAT}{elseif !empty($CHECKING)}<проставляется при сохранении>{/if}</span>
									</div>
								</div>
							</li>
                            <li class="wide-top">
								<div class="top">
									<div class="bottom">
										<span class="info1">Должность руководителя</span>
										<span class="info2{if empty($REPORT.createdSigned) && !empty($CREATED_SIGNER)} generated{/if}">
                                            {if !empty($REPORT.createdSigned)}
                                                {$REPORT.createdSignedUser.post|default}
                                            {elseif !empty($CREATED_SIGNER)}
                                                {$CREATED_SIGNER.post|default}
                                            {/if}
                                        </span>
										<span class="info2{if empty($REPORT.reviewedSignedUser) && !empty($REVIEWED_SIGNER)} generated{/if}">
                                            {if !empty($REPORT.reviewedSignedUser)}
												{$REPORT.reviewedSignedUser.post|default}
											{elseif !empty($REVIEWED_SIGNER)}
                                                {$REVIEWED_SIGNER.post|default}
											{/if}
                                        </span>
									</div>
								</div>
							</li>
							<li>
								<div class="top">
									<div class="bottom">
										<span class="info1">Ф.И.О. руководителя</span>
										<span class="info2{if empty($REPORT.createdSigned) && !empty($CREATED_SIGNER)} generated{/if}">
											{if !empty($REPORT.createdSigned)}
												{if !empty($REPORT.createdSignedUser)}{$REPORT.createdSignedUser.lastName} {$REPORT.createdSignedUser.firstName|mb_truncate:1:''}.{$REPORT.createdSignedUser.middleName|mb_truncate:1:''}.{/if}
											{elseif !empty($CREATED_SIGNER)}
												{$CREATED_SIGNER.lastName} {$CREATED_SIGNER.firstName|mb_truncate:1:''}.{$CREATED_SIGNER.middleName|mb_truncate:1:''}.
											{/if}
										</span>
										<span class="info2{if empty($REPORT.reviewedSignedUser) && !empty($REVIEWED_SIGNER)} generated{/if}">
											{if !empty($REPORT.reviewedSignedUser)}
												{$REPORT.reviewedSignedUser.lastName} {$REPORT.reviewedSignedUser.firstName|mb_truncate:1:''}.{$REPORT.reviewedSignedUser.middleName|mb_truncate:1:''}.
											{elseif !empty($REVIEWED_SIGNER)}
                                                {$REVIEWED_SIGNER.lastName} {$REVIEWED_SIGNER.firstName|mb_truncate:1:''}.{$REVIEWED_SIGNER.middleName|mb_truncate:1:''}.
											{/if}
										</span>
									</div>
								</div>
							</li>
                            <li>
								<div class="top">
									<div class="bottom">
										<span class="info1">Время утверждения</span>
										<span class="info2{if empty($REPORT.createdSignedTimestamp) && !empty($CREATED_SIGNER)} generated{/if}">{if !empty($REPORT.createdSignedTimestamp)}{$REPORT.createdSignedTimestamp|date_format:$DATE_FORMAT}{elseif !empty($CREATED_SIGNER)}<проставляется при сохранении>{/if}</span>
										<span class="info2{if empty($REPORT.reviewedSignedTimestamp) && !empty($REVIEWED_SIGNER)} generated{/if}">{if !empty($REPORT.reviewedSignedTimestamp)}{$REPORT.reviewedSignedTimestamp|date_format:$DATE_FORMAT}{elseif !empty($REVIEWED_SIGNER)}<проставляется при сохранении>{/if}</span>
									</div>
								</div>
							</li>
						</ul>
					</div>
					<div class="footer in-page">
						<div class="holder-nav-new">
							<ul class="list">
								<li>
									<a class="main-link" href="/" data-title="Назад к карте"></a>
								</li>
								{if !empty($REPORT.esID) || !empty($ESID)}
									<li>
										ЧС: {$REPORT.esID|default:$ESID}, ИД донесения: {$REPORT.reportHID}
									</li>
								{/if}
							</ul>
                            <div class="es-display one-column-report">
                                <label for="inStats">ЧС отображается в статистике</label>
                                <input type="checkbox" name="inStats" id="inStats" value="on" {if empty($REPORT) || (!empty($REPORT.inStats))}checked="checked"{/if} {if empty($EDITABLE)}disabled='disabled'{/if}/>
                            </div>
							{if empty($LOCKED)}
								{if !empty($CHECKING)}
									<button class="btn" type="submit" name="finalSubmit" value='doCheck'>проверить</button>
                                {elseif !empty($SIGNING)}
                                    <button class="btn" type="submit" name="finalSubmit" value='doSign'>утвердить</button>
                                {elseif !empty($EDITABLE)}
									<button class="btn" type="submit" name="finalSubmit" value='doSave'>сохранить</button>
								{/if}
                                {if !empty($SIGNING) && $REPORT.stage == 3}
                                    <div style="clear:both; padding-top: 20px">
                                        <button class="btn minzdrav" type="submit" name="finalSubmit" value='doSignAndSend'>утвердить и отправить в минздрав</button>
                                    </div>
                                {/if}
                                {if !empty($CAN_DELETE)}
                                    <div style="clear:both; padding-top: 20px">
                                        <button class="btn" type="button" name="deleteButton" id="deleteButton" data-esid="{$REPORT.esID}" value='doDelete'>Удалить ЧС #{$REPORT.esID}</button>
                                    </div>
                                {/if}
							{/if}
						</div>
						{if !empty($ES_HISTORY)}
							<div class="his-hol">
								<div class="holder-history">
									<div class="holder-top">
										<strong class="status grey-status">заключительное донесение</strong>
									</div>
									<ul class="list-history">
										<li class='active'>
                                            <span class="t1">
                                                <span class="text">{$ES_HISTORY.final.createdTimestamp|date_format:$DATE_FORMAT}</span>
                                            </span>
                                            <span class="t2">
                                                <span class="text">{$ES_HISTORY.final.stageText}</span>
                                            </span>
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
                                            </span>
										</li>
									</ul>
								</div>
								{if !empty($ES_HISTORY.subsequent)}
								<div class="holder-history">
									<div class="holder-top">
										<strong class="status grey-status">последующее донесение</strong>
									</div>
									<ul class="list-history">
										{foreach from=$ES_HISTORY.subsequent item=REP}
											<li>
                                                <span class="t1">
                                                    <span class="text">{$REP.createdTimestamp|date_format:$DATE_FORMAT}</span>
                                                </span>
                                                <span class="t2">
                                                    <span class="text">{$REP.stageText}</span>
                                                </span>
                                                <span class="t3">
                                                    {if !empty($REP.dumpRegional)}
                                                        <span class="text">региональный</span>
                                                        <a class="pdf" target="_blank" href="{$REP.dumpRegional.pdf}" data-title="Экспорт в PDF"></a>
                                                        <a class="doc" href="{$REP.dumpRegional.docx}" data-title="Экспорт в DOC"></a>
                                                    {/if}
                                                </span>
                                                <span class="t4">
                                                    {if !empty($REP.dumpFederal)}
                                                        <span class="text">федеральный</span>
                                                        <a class="pdf" target="_blank" href="{$REP.dumpFederal.pdf}" data-title="Экспорт в PDF"></a>
                                                        <a class="doc" href="{$REP.dumpFederal.docx}" data-title="Экспорт в DOC"></a>
                                                    {/if}
                                                    <a class="next" href="/subsequent/{$REP.subsequentReportID}/"></a>
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
                                            <span class="t1">
                                                <span class="text">{$ES_HISTORY.initial.createdTimestamp|date_format:$DATE_FORMAT}</span>
                                            </span>
                                            <span class="t2">
                                                <span class="text">{$ES_HISTORY.initial.stageText}</span>
                                            </span>
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
						{/if}
						<div class="send-info">
							<p>Оперативные сведения о чрезвычайных ситуациях</p>
						</div>
					</div>
				</fieldset>
			</form>
		</div>
		{else}
			<h1>Ошибка</h1>
			<p>Донесение не найдено</p>
		{/if}
	</div>
    {include file='front/report/modal.tpl'}
</div>
<!-- wrapper  end -->
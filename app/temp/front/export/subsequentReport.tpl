{literal}
<style>
* {
	line-height: 150%;
}
</style>
{/literal}

<table border="0" style="width: 100%">
	<tr>
		<td style="width: 35%">&nbsp;</td>
		<td>
			к приказу Министерства здравоохранения Российской Федерации<br />
			от «___»  ____________  2013г.  №___<br />
			Медицинская документация<br />
			Форма 165/у<br />
			Утверждена приказом Министерства здравоохранения Российской Федерации<br />
			от «___»  ___________  2013г.  №____<br />
		</td>
	</tr>
</table>
<br style="clear: both" /><br />
<center>
	<h1 style="font-size: 14pt; font-weight: bold;">Донесение о чрезвычайной ситуации последующее</h1>
	По состоянию на <u>{$REPORT.createdTimestamp|date_format:'%H:%M'}</u>,  <u>{$REPORT.createdTimestamp|date_format:'%d.%m.%Y'}</u> г.
</center>


<ol style="line-height: 150%">
<li>Дата ЧС <u>{$REPORT.datetimeEs|date_format:'%d.%m.%Y'}</u> 1.1. Время (московское) <u>{$REPORT.datetimeEs|date_format:'%H:%M'}</u></li>
<li>Наименование, место, характеристика и обстоятельства ЧС <u>{$REPORT.esName}, {$REPORT.locationName}</u></li>
<li>Число пострадавших:     всего <u>{$REPORT.victimsTotal}</u> ,   из них детей   <u>{$REPORT.victimsChildren}</u></li>
<li>Число эвакуированных с места ЧС:    всего <u>{$REPORT.evacuatedTotal}</u>,   из них  детей  <u>{$REPORT.evacuatedChildren}</u><br />
	в т. ч.: авиационным транспортом,   всего <u>{$REPORT.evacuatedByAirTotal}</u>,  из них детей <u>{$REPORT.evacuatedByAirChildren}</u>
</li>
<li>Число госпитализированных,  всего <u>{$REPORT.hospitalizedTotal}</u>    из них детей <u>{$REPORT.hospitalizedChildren}</u></li>
<li>Место  госпитализации (мед. организация, отделение, степень тяжести)
<u>
	{foreach from=$HOSPITALIZED item=HOSP}
		<br />{$HOSP.peopleNumber} ч., {$HOSP.medicalOrganization}, {$HOSP.location}, {$HOSP.severity}
	{/foreach}
</u>
</li>
<li>Количество привлеченных медицинских бригад <u>{$REPORT.ambulanceTeams+$REPORT.REMCTeams+$REPORT.aeromedicalTeams+$REPORT.ambulanceAdditionalTeams}</u></li>
<li>Дополнительные медицинские силы, привлекавшиеся для консультации и лечения пострадавших (БрСМП и др.)
<u>
	{if $REPORT.additionalAmbulanceTeams}<br />{$REPORT.additionalAmbulanceTeams} выездных бригад СМП{/if}
	{if $REPORT.additionalFieldHospitals}<br />{$REPORT.additionalFieldHospitals} полевых многопрофильных госпиталей{/if}
	{if $REPORT.additionalAeromedicalTeams}<br />{$REPORT.additionalAeromedicalTeams} авиамедицинских бригад{/if}
	{if $REPORT.additionalAmbulanceAdditionalTeams}<br />{$REPORT.additionalAmbulanceAdditionalTeams} дополнительных медицинских сил{/if}
</u></li>
<li>Оказана первичная медико-санитарная помощь, всего <u>{$REPORT.ambulatoryTotal}</u> из них детям <u>{$REPORT.ambulatoryChildren}</u></li>
<li>Число погибших, всего <u>{$REPORT.victimsDeadTotal}</u>,     из них детей <u>{$REPORT.victimsDeadChildren}</u></li>

<li>Должность, ФИО, телефон лица, подписавшего донесение <u>{if !empty($REPORT.reviewedUser)}{$REPORT.reviewedUser.post|default}, {$REPORT.reviewedUser.lastName|default} {$REPORT.reviewedUser.firstName|default|mb_truncate:1:''}.{$REPORT.reviewedUser.middleName|default|mb_truncate:1:''}., т. {$REPORT.reviewedUser.phone|default}{else}-{/if}</u></li>
</ol>
{*TODO: сделать отступ с помощью margin*}
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
<center style="text-align: center"><h1 style="font-size: 14pt; font-weight: bold;">Донесение о чрезвычайной ситуации
первичное</h1></center>


<ol style="line-height: 150%">
<li>Дата ЧС <u>{$REPORT.datetimeEs|date_format:'%Y-%m-%d'}</u> 1.1. Время (московское) <u>{$REPORT.datetimeEs|date_format:'%H:%M'}</u></li>
<li>Наименование, место, характеристика и обстоятельства ЧС <u>{$REPORT.esName}, {$REPORT.locationName}</u></li>
<li>Предварительное число пострадавших:     всего <u>{$REPORT.victimsTotal}</u> ,   из них детей   <u>{$REPORT.victimsChildren}</u><br />
       в том числе  погибших:   всего <u>{$REPORT.victimsDeadTotal}</u>,    из них детей   <u>{$REPORT.victimsDeadChildren}</u></li>
<li>Число эвакуированных:    всего <u>{$REPORT.evacuatedTotal}</u>,   из них  детей  <u>{$REPORT.evacuatedChildren}</u></li>
<li>Количество привлеченных медицинских бригад <u>{$REPORT.ambulanceTeams+$REPORT.REMCTeams+$REPORT.aeromedicalTeams+$REPORT.ambulanceAdditionalTeams}</u></li>
<li>Должность, ФИО, телефон лица, подписавшего донесение <u>{if !empty($REPORT.reviewedUser)}{$REPORT.reviewedUser.post|default}, {$REPORT.reviewedUser.lastName|default} {$REPORT.reviewedUser.firstName|default|mb_truncate:1:''}.{$REPORT.reviewedUser.middleName|default|mb_truncate:1:''}., т. {$REPORT.reviewedUser.phone|default}{else}-{/if}</u></li>
</ol>
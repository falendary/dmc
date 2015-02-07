<div class="modal" id="date">
	<a class="close" href="#">close</a>
	<div class="holder-date">
		<form action="#" class="form">
			<fieldset>
				<div class="text">
					<label>время:</label>
					<input type="time" class="text-input no-clear time" id="time-input" value="{$smarty.now|date_format:'%H:%M'}" />
				</div>
			</fieldset>
		</form>
	</div>
	<div id="datepicker"></div>
</div>
<div class="modal-map" id="map-small">
	<form action="#" class="form">
		<fieldset>
			<div class="dab-text">
				<div class="text gps">
					<input type="text" class="text-input map2-x" placeholder="широта ..." value="{$REPORT.locationLat|default}" />
				</div>
				<div class="text">
					<input type="text" class="text-input map2-y" placeholder="долгота ..." value="{$REPORT.locationLon|default}" />
				</div>
                {*<div class="text wide">
                    <input type="text" class="text-input location-search" autocomplete="off" placeholder="ПОИСК..." />
                </div>*}
                <div class="holder-list">
                    <div class="custom-scroll">
                        <ul>
                            <li>
                                <a href="#"></a>
                            </li>
                            <li>
                                <a href="#"></a>
                            </li>
                            <li>
                                <a href="#"></a>
                            </li>
                        </ul>
                    </div>
                </div>
			</div>
		</fieldset>
	</form>
	<div id="map2" class="holder-map-new">
		{*<img src="images/map2.jpg" alt="image" width="472" height="336" />*}
	</div>
</div>
<a href="#message" class="simplebox" id="save-message" style="display: none;"></a>
<div class="modal message-pop" id="message">
	<a class="close" href="#">close</a>
	<div class="info-content">
		<strong class="title">внимание!</strong>
		<strong class="info-text">донесение не сохранено</strong>
		<p>Для экспорта донесение должно быть сохранено!</p>
	</div>
	<div class="holder-link">
		<a class="link-cl" href="#">закрыть</a>
		<a class="save" href="#">сохранить и экспортировать</a>
	</div>
</div>
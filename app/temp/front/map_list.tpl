<!-- wrapper  start -->
<div id="wrapper">
	<div class="overlay">
    </div>
    <div class="spinner-wrap">
         <div class="spinner">
            <img src="images/spinner.png" height="24" width="864" alt="">
        </div>
    </div>
	<!-- header  start -->
	<header id="header">
        <div class="holder-time">
            <span class="time">00 : 00</span>
            <span class="date-new">2000 / 01 / 01</span>
        </div>
            
        <div class="top">
            <h1>Всероссийская система оперативных донесений о чрезвычайных ситуациях в реальном времени</h1>
        </div>
		<a class="add" href="{$NEW_REPORT_URL}" data-title="создание донесения">add</a>
		<nav id="nav">
			<div class="drop">
				<a class="sample" href="#"><span>выборка</span></a>
				<div class="has-drop">
					<div class="holder">
                        <form action="" method="post" autocomplete="off" class="search" id="map-search-form">
							<fieldset>
								<div class="hold-checkbox">
									<input class="customCheckbox" type="checkbox" name="last" id="checkbox01" />
									<label for="checkbox01">последнее</label>
								</div>
								<div class="text">
                                    <button class="btn-reset" id="resetButton" type="reset">Сбросить выборку</button>
                                    <label for="resetButton" class="reset-fields">Сбросить выборку</label>
                                </div>
                                <div class="text search">
                                    <button class="btn-search" type="submit">search</button>
                                    <input class="text-input" type="text" value="" placeholder="Поиск..." name="search" alt="поиск ...">
                                </div>
                                <div class="field-block">
                                    <div class="columns">
                                        <div class="col-1">
                                            <div class="selects">
                                                <label for="reportType">Тип донесения</label>
                                                <div class="hold-select">
                                                    <select name="reportType" id="reportType" class="customSelect_ select2 smallSelect">
                                                        <option selected value=""> - </option>
                                                        {html_options options=$REPORT_TYPES}
                                                    </select>
                                                </div>
                                                <label for="kindID">Вид ЧС</label>
                                                <div class="hold-select">
                                                    <select name="kindID" id="kindID" class="customSelect_ select2 smallSelect">
                                                        <option selected value=""> - </option>
                                                        {foreach from=$KINDS item=row key=id}
                                                            <option value="{$id}">{$row.name}</option>
                                                        {/foreach}
                                                    </select>
                                                </div>
                                                <label for="organizationID">Наименование организации</label>
                                                <div class="hold-select">
                                                    <select name="organizationID" id="organizationID" class="customSelect_ select2 smallSelect">
                                                        <option selected value=""> - </option>
                                                        {foreach from=$ORGANIZATIONS item=row key=id}
                                                            <option value="{$id}">{if !empty($row.shortName)}{$row.shortName}{else}{$row.name}{/if}</option>
                                                        {/foreach}
                                                    </select>
                                                </div>
                                            </div>
                                            <label for="victimsTotalFrom" class="title">Пострадавшие</label>
                                            <div class="injured">
                                                <div class="row-1">
                                                    <label for="victimsTotalFrom">всего</label>
                                                    от <input type="text" class="sm-input numeric" name="victimsTotalFrom" id="victimsTotalFrom"> до <input type="text" class="sm-input numeric" name="victimsTotalTo" id="victimsTotalTo">
                                                </div>
                                                <div class="row-2">
                                                    <label for="victimsChildrenFrom">в т.ч. детей</label>
                                                    от <input type="text" class="sm-input numeric" name="victimsChildrenFrom" id="victimsChildrenFrom"> до <input type="text" class="sm-input numeric" name="victimsChildrenTo" id="victimsChildrenTo">
                                                </div>
                                            </div>
                                            <label for="victimsDeadTotalFrom" class="title">Погибшие</label>
                                            <div class="dead">
                                                <div class="row-1">
                                                    <label for="victimsDeadTotalFrom">всего</label>
                                                    от <input type="text" class="sm-input numeric" name="victimsDeadTotalFrom" id="victimsDeadTotalFrom"> до <input type="text" class="sm-input numeric" name="victimsDeadTotalTo" id="victimsDeadTotalTo">
                                                </div>
                                                <div class='row-2'>
                                                    <label for="victimsDeadChildrenFrom">в т.ч. детей</label>
                                                    от <input type="text" class="sm-input numeric" name="victimsDeadChildrenFrom" id="victimsDeadChildrenFrom"> до <input type="text"class="sm-input numeric" name="victimsDeadChildrenTo" id="victimsDeadChildrenTo">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-2">
                                            <div class="selects">
                                                <label for="typeID">Тип ЧС</label>
                                                <div class="hold-select">
                                                    <select name="typeID" id="typeID" class="customSelect_ select2 optional smallSelect">
                                                        <option selected value=""> - </option>
                                                        {foreach from=$TYPES item=row key=id}
                                                            <option value="{$id}">{$row.name}</option>
                                                        {/foreach}
                                                    </select>
                                                </div>
                                                <label for="">Масштаб ЧС</label>
                                                <div class="hold-select">
                                                    <select name="scaleID" id="scaleID" class="customSelect_ select2 smallSelect">
                                                        <option selected value=""> - </option>
                                                        {foreach from=$SCALES item=row key=id}
                                                            <option value="{$id}">{$row.name}</option>
                                                        {/foreach}
                                                    </select>
                                                </div>
                                                    
                                                    <label for="LastName">Фамилия</label>
                                                <div class="hold-select">
                                                    <select name="LastName" id="LastName" class="customSelect_ select2 optional smallSelect">
                                                        <option selected value=""> - </option>
                                                        
                                                        {foreach from=$LAST_NAME item=row key=id}
                                                            <option value="{$id}">{$row.lastName} {$row.firstName} {$row.middleName}</option>
                                                        {/foreach}
                                                    </select>
                                                </div>
                                                
                                                
                                            </div>
                                            <label for="evacuatedTotalFrom" class="title">Мед. эвакуация</label>
                                            <div class="evacuation">
                                                <div >
                                                    <label for="evacuatedTotalFrom">всего</label>
                                                    от <input type="text" class="sm-input numeric" name="evacuatedTotalFrom" id="evacuatedTotalFrom"> до <input type="text" class="sm-input numeric" name="evacuatedTotalTo" id="evacuatedTotalTo">
                                                </div>
                                                <div class="row-2">
                                                    <label for="evacuatedChildrenFrom">в т.ч. детей</label>
                                                    от <input type="text" class="sm-input numeric" name="evacuatedChildrenFrom" id="evacuatedChildrenFrom"> до <input type="text" class="sm-input numeric" name="evacuatedChildrenTo" id="evacuatedChildrenTo">
                                                </div>
                                                <div class="row-3">
                                                    <label for="evacuatedByAirTotalFrom">авиа <br/>транспортом</label>
                                                    от <input type="text" class="sm-input numeric" name="evacuatedByAirTotalFrom" id="evacuatedByAirTotalFrom"> до <input type="text" class="sm-input numeric" name="evacuatedByAirTotalTo" id="evacuatedByAirTotalTo">
                                                </div>
                                                <div class="row-4">
                                                    <label for="evacuatedByAirChildrenFrom">в т.ч. детей</label>
                                                    от <input type="text" class="sm-input numeric" name="evacuatedByAirChildrenFrom" id="evacuatedByAirChildrenFrom"> до <input type="text" class="sm-input numeric" name="evacuatedByAirChildrenTo" id="evacuatedByAirChildrenTo">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-3">
                                            <div class="selects">
                                                <label for="">Дата создания донесения</label>
                                                <div class="date-create">
                                                    <div class="hold-data2">
                                                        <input  type="text" value="" name="createdTimestampFrom" id="createdTimestampFrom" readonly="readonly" placeholder="">
                                                        <a class="dateTimePicker" data-for="#createdTimestampFrom">data</a>
                                                    </div>
                                                    <div class="hold-data2">
                                                        <input type="text" value="" name="createdTimestampTo" id="createdTimestampTo" readonly="readonly" placeholder="">
                                                        <a class="dateTimePicker" data-for="#createdTimestampTo">data</a>
                                                    </div>
                                                </div>
                                                <label for="datetimeEsFrom">Дата и время ЧС</label>
                                                <div class="date-event">
                                                    <div class="hold-data2">
                                                        <input type="text" value="" name="datetimeEsFrom" id="datetimeEsFrom" readonly="readonly" placeholder="">
                                                        <a class="dateTimePicker" data-for="#datetimeEsFrom">data</a>
                                                    </div>
                                                    <div class="hold-data2">
                                                        <input type="text" value="" name="datetimeEsTo" id="datetimeEsTo" readonly="readonly" placeholder="">
                                                        <a class="dateTimePicker" data-for="#datetimeEsTo">data</a>
                                                    </div>
                                                </div>
                                            </div>
                                            <label for="hospitalizedTotalFrom" class="title">Госпитализировано</label>
                                            <div class="hospitalized">
                                                <div class="row-1">
                                                    <label for="hospitalizedTotalFrom">всего</label>
                                                    от <input type="text" class="sm-input numeric" name="hospitalizedTotalFrom" id="hospitalizedTotalFrom"> до <input type="text" class="sm-input numeric" name="hospitalizedTotalTo" id="hospitalizedTotalTo">
                                                </div>
                                                <div class="row-2">
                                                    <label for="hospitalizedChildrenFrom">в т.ч. детей</label>
                                                    от <input type="text" class="sm-input numeric" name="hospitalizedChildrenFrom" id="hospitalizedChildrenFrom"> до <input type="text" class="sm-input numeric" name="hospitalizedChildrenTo" id="hospitalizedChildrenTo">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <footer>
                                        <a href="#" class="field-search">найти</a>
                                    </footer>
                                </div>
							</fieldset>
						</form>
					</div>
				</div>
			</div>
			<ul class="view">
				<li class="active"><a class="view-map" href="#">карта</a></li>
				<li><a class="view-list" href="#">список</a></li>
			</ul>
		</nav>
        <div class="holder-operatop">
            <div class="holder-avater">
                <a href="/admin/profile/" data-title="Профиль польователя">
                    <span class="name">{if !empty($USER->info.lastName)}{$USER->info.firstName} {$USER->info.lastName}{else}{$USER->GetLogin()}{/if}</span>
                    <span class="avatar">
                        <!--<img src="images/img.jpg" alt="image" />-->
                    </span>
                </a>
            </div>
            <a class="login" href="/logout/" data-title="Выход из системы">login</a>
        </div>
	</header>
	<!-- header  end
		 map  start -->
	<div id="map">
		<!--img src="images/map.jpg" alt="image" width="1920" height="1080" /-->
		<div class="holder-post" {*data-url="/get/messages/"*}></div>
	</div>
	<!-- map  end -->
	<div class="holder-situation">
		 <ul class="pagination">
			<li class="prev"><a href="#">prev</a></li>
			<li class="page"><a href="#">1</a></li>
			<li class="next"><a href="#">next</a></li>
		</ul>
		<ul class="list-situation">
			<li>
				<a href="#" >
					<span class="bg-transition">&nbsp;</span>
					<span class="top">
						<span class="left">
							<span class="figure">
								<img src="images/img01.png" alt="image" width="72" height="60" />
							</span>
							<span class="date">2013-12-18  /  9:25</span>
						</span>
						<span class="right">
							<strong class="title">Столкновение 3-х легковых автомобилей</strong>
							<span class="text">Краснодарский край, Усть лабинский район</span>
						</span>
					</span>
					<span class="bottom">
						<span class="left">
							<strong class="title">первичное донесение</strong>
						</span>
						<span class="right">
							<span class="dl">
								<span class="dt">Масштаб ЧС</span>
								<span class="dd">Локальная ЧС</span>
							</span>
							<span class="dl">
								<span class="dt">Вид ЧС</span>
								<span class="dd">Техногенного характера</span>
							</span>
							<span class="dl">
								<span class="dt">Тип ЧС</span>
								<span class="dd">Транспортные аварии (катастрофы)</span>
							</span>
						</span>
					</span>
				</a>
			</li>
			<li>
				<a href="#" >
					<span class="bg-transition">&nbsp;</span>
					<span class="top">
						<span class="left">
							<span class="figure">
								<img src="images/img02.png" alt="image" width="66" height="60" />
							</span>
							<span class="date">2013-12-18  /  9:25</span>
						</span>
						<span class="right">
							<strong class="title">Взрыв газа</strong>
							<span class="text">Краснодарский край, Усть лабинский район</span>
						</span>
					</span>
					<span class="bottom">
						<span class="left">
							<strong class="title grey">первичное донесение</strong>
						</span>
						<span class="right">
							<span class="dl">
								<span class="dt">Масштаб ЧС</span>
								<span class="dd">Локальная ЧС</span>
							</span>
							<span class="dl">
								<span class="dt">Вид ЧС</span>
								<span class="dd">Техногенного характера</span>
							</span>
							<span class="dl">
								<span class="dt">Тип ЧС</span>
								<span class="dd">Транспортные аварии (катастрофы)</span>
							</span>
						</span>
					</span>
				</a>
			</li>
			<li>
				<a href="#" >
					<span class="bg-transition">&nbsp;</span>
					<span class="top">
						<span class="left">
							<span class="figure">
								<img src="images/img03.png" alt="image" width="88" height="60" />
							</span>
							<span class="date">2013-12-18  /  9:25</span>
						</span>
						<span class="right">
							<strong class="title">Столкновение 3-х легковых автомобилей</strong>
							<span class="text">Краснодарский край, Усть лабинский район</span>
						</span>
					</span>
					<span class="bottom">
						<span class="left">
							<strong class="title">первичное донесение</strong>
						</span>
						<span class="right">
							<span class="dl">
								<span class="dt">Масштаб ЧС</span>
								<span class="dd">Локальная ЧС</span>
							</span>
							<span class="dl">
								<span class="dt">Вид ЧС</span>
								<span class="dd">Техногенного характера</span>
							</span>
							<span class="dl">
								<span class="dt">Тип ЧС</span>
								<span class="dd">Транспортные аварии (катастрофы)</span>
							</span>
						</span>
					</span>
				</a>
			</li>
			<li>
				<a href="#" >
					<span class="bg-transition">&nbsp;</span>
					<span class="top">
						<span class="left">
							<span class="figure">
								<img src="images/img03.png" alt="image" width="88" height="60" />
							</span>
							<span class="date">2013-12-18  /  9:25</span>
						</span>
						<span class="right">
							<strong class="title">Утечка радиации на АЭС</strong>
							<span class="text">Краснодарский край, Усть лабинский район</span>
						</span>
					</span>
					<span class="bottom">
						<span class="left">
							<strong class="title grey">первичное донесение</strong>
						</span>
						<span class="right">
							<span class="dl">
								<span class="dt">Масштаб ЧС</span>
								<span class="dd">Локальная ЧС</span>
							</span>
							<span class="dl">
								<span class="dt">Вид ЧС</span>
								<span class="dd">Техногенного характера</span>
							</span>
							<span class="dl">
								<span class="dt">Тип ЧС</span>
								<span class="dd">Транспортные аварии (катастрофы)</span>
							</span>
						</span>
					</span>
				</a>
			</li>
			<li>
				<a href="#" >
					<span class="bg-transition">&nbsp;</span>
					<span class="top">
						<span class="left">
							<span class="figure">
								<img src="images/img01.png" alt="image" width="72" height="60" />
							</span>
							<span class="date">2013-12-18  /  9:25</span>
						</span>
						<span class="right">
							<strong class="title">Столкновение 3-х легковых автомобилей</strong>
							<span class="text">Краснодарский край, Усть лабинский район</span>
						</span>
					</span>
					<span class="bottom">
						<span class="left">
							<strong class="title">первичное донесение</strong>
						</span>
						<span class="right">
							<span class="dl">
								<span class="dt">Масштаб ЧС</span>
								<span class="dd">Локальная ЧС</span>
							</span>
							<span class="dl">
								<span class="dt">Вид ЧС</span>
								<span class="dd">Техногенного характера</span>
							</span>
							<span class="dl">
								<span class="dt">Тип ЧС</span>
								<span class="dd">Транспортные аварии (катастрофы)</span>
							</span>
						</span>
					</span>
				</a>
			</li>
		</ul>
		<ul class="pagination">
			<li class="prev"><a href="#">prev</a></li>
			<li class="page"><a href="#">1</a></li>
			<li class="next"><a href="#">next</a></li>
		</ul>
	</div>
    <div class="download-popup modal" id="download-popup">
        <a href="#" class="close"></a>
        <p class="download-popup-title">Скачайте документ в удобном<br/> для вас формате:</p>
        <div class="regional-download-btns">
            <p>РЕГИОНАЛЬНЫЙ</p>
            <a href="#" target="_blank" class="doc-download"></a>
            <a href="#" target="_blank" class="pdf-download"></a>
        </div>
        <div class="local-download-btns">
            <p>ФЕДЕРАЛЬНЫЙ</p>
            <a href="#" target="_blank" class="doc-download"></a>
            <a href="#" target="_blank" class="pdf-download"></a>
        </div>
    </div>
</div>
<!-- wrapper  end -->
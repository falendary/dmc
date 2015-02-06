<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=1000" />
	<title>Авторизация</title>
	<link rel="stylesheet" href="{$STYLES_ALIAS}supersized.css" media="all" />
	<link rel="stylesheet" href="{$STYLES_ALIAS}all.css" media="all" />
    <link rel="stylesheet" type="text/css" href="{$LIBS_ALIAS}jQuery/jgrowl/jquery.jgrowl.css" />
	<script type="text/javascript" src="{$LIBS_ALIAS}jQuery/jquery-1.10.2.min.js"></script>
	{*<script type="text/javascript" src="{$SCRIPTS_ALIAS}supersized.3.2.7.min.js"></script>*}
	<!--[if lte IE 9]>
		<link rel="stylesheet" type="text/css" href="{$STYLES_ALIAS}ie.css" media="screen"/>
		<script type="text/javascript" src="{$SCRIPTS_ALIAS}PIE.js"></script>
	<![endif]-->
	<!--[if lte IE 8]>
		<script type="text/javascript" src="{$SCRIPTS_ALIAS}modernizr-1.7.min.js"></script>
	<![endif]-->
	<script type="text/javascript" src="{$LIBS_ALIAS}jQuery/jquery.form.js"></script><!--  AJAX forms-->
    <script type="text/javascript" src="{$LIBS_ALIAS}jQuery/validator/validate.min.js"></script><!-- Валидатор форм -->
    <script type="text/javascript" src="{$LIBS_ALIAS}jQuery/jgrowl/jquery.jgrowl_minimized.js"></script>
	<script type="text/javascript" src="{$SCRIPTS_ALIAS}jquery.main.js"></script>
	<script type="text/javascript" src="{$SCRIPTS_ALIAS}script.js"></script>
	<script type="text/javascript" src="{$SCRIPTS_ALIAS}jquery-ui-1.10.3.custom.min.js"></script>
    <link rel="stylesheet" type="text/css" href="{$LIBS_ALIAS}select2-3.5.1/select2.css">
    <script type="text/javascript" src="{$LIBS_ALIAS}select2-3.5.1/select2.min.js"></script>
    <script type="text/javascript" src="{$LIBS_ALIAS}select2-3.5.1/select2_locale_ru.js"></script>

    <link rel="stylesheet" type="text/css" href="{$STYLES_ALIAS}myStyles.css" />
</head>
<body class="login-main">
	<!-- wrapper  start -->
	<div id="wrapper">
        <div class="login-new">
           	<h1>всероссийская система оперативных донесений<br/> о чрезвычайных ситуациях</h1>
        	<strong class="logo-login-new"><a href="/">operreport</a></strong>
			<form action="" class="form-log" id="loginForm" method="post">
				<fieldset>
					<div class="text"><input type="text" class="text-input" placeholder="user" name="username" id="username" /></div>
					<div class="text">
						<input type="password" class="text-input" placeholder="Пароль" name="userpass" id="userpass" />
						<button class="btn-login" type="submit">submit</button>
					</div>
				</fieldset>
			</form>
			<div class="auth-info">
				<a href="#" class="registration">Регистрация</a>
				<div class="auth-info-divider"></div>
				<a href="#" class="about-system">О системе</a>
			</div>
		</div>
	</div>
	<div class="registration-popup-overlay"></div>
	<div class="registration-popup">

		<form action="" method='post' id='registrationForm'>
            <a href="#" class="close-modal">x</a>

			<div class="registration-popup-body">
				<div class="disclaimer-column">
					<p class="disclaimer-title">РЕГИСТРАЦИЯ</p>
					<p>
					Нажимая кнопку «Отправить данные»,<br/>
					я подтверждаю, что ознакомился<br/> с <a href="#" class="disclaimer-rights">Правилами использования системы.</a>
		 			</p>
				</div>
				<div class="label-column">
					<label for="reg-login">Логин</label>
					<label for="reg-email">E-Mail</label>
					<label for="reg-family">Фамилия</label>
					<label for="reg-name">Имя</label>
					<label for="reg-patronymic">Отчество</label>
					<label for="reg-firma">Организация</label>
					<label for="reg-post">Должность</label>
					<label for="reg-telephone">Телефон</label>
					<label for="reg-birthday">Дата рождения</label>
					<label for="reg-gender">Пол</label>
				</div>
				<div class="input-column">
					<input type="text" id="reg-login" name='login' required> *
					<input type="text" id="reg-email" name='email' required> *
					<input type="text" id="reg-family" name='lastName' required> *
					<input type="text" id="reg-name" name='firstName' required> *
					<input type="text" id="reg-patronymic" name='middleName' required> *
					<div class="hold-select">
						<select name="organizationID" id="organizationID" class="customSelect_ select2" required>
                            {foreach from=$ORGANIZATIONS item=org}
                                <option value="{$org.organizationID}">{if !empty($org.shortName)}{$org.shortName}{else}{$org.name}{/if}</option>
                            {/foreach}
						</select>
						<span>*</span>
					</div>
					<input type="text" id="reg-post" name='post' required> *
					<input type="text" placeholder="_ (_ _ _) _ _ _ - _ _ - _ _" id="reg-telephone" name='phone' required>
					<div class="birthday" id="reg-birthday">
						<div class="hold-select">
							<select name="bDay" id="reg-birthday-day" class="customSelect">
                                <option value="" selected>День</option>
								{section start=1 loop=32 name=daySect}
                                    <option>{$smarty.section.daySect.index}</option>
                                {/section}
							</select>
						</div>
						<div class="hold-select">
							<select name="bMonth" id="reg-birthday-month" class="customSelect">
								<option value="" selected>Месяц</option>
	                            <option value="1">Январь</option>
	                            <option value="2">Февраль</option>
	                            <option value="3">Март</option>
	                            <option value="4">Апрель</option>
	                            <option value="5">Май</option>
								<option value="6">Июнь</option>
								<option value="7">Июль</option>
								<option value="8">Август</option>
	                            <option value="9">Сентябрь</option>
	                            <option value="10">Октябрь</option>
	                            <option value="11">Ноябрь</option>
	                            <option value="12">Декабрь</option>
							</select>
						</div>
						<div class="hold-select">
							<select name="bYear" id="reg-birthday-year" class="customSelect">
								<option value="" selected>Год</option>
								{section start=1929 loop='Y'|date name=yearSect}
	                                <option>{$smarty.section.yearSect.index-9}</option>
	                            {/section}
							</select>
						</div>
					</div>
					<div class="gender" id="reg-gender">
                        <input type="radio" id="gender-male" name="gender" value='m' checked ><label for="gender-male" class="gender-male-label"></label>Мужской
                        <input type="radio" id="gender-female" name="gender" value='f'><label for="gender-female" class="gender-female-label"></label>Женский
					</div>
				</div>
			</div>
			<div class="registration-popup-footer">
				<p class="required-fields-index">* - обязательное поле</p>
				<div class="captcha">
					<img src="/getcaptcha/" alt="captcha-code" class="captcha-img">
					<input type="text" name='captcha' placeholder="Символы с картинки*" required>
				</div>
				<button type="submit" class="confirm-registration" name='doRegister'>Отправить данные</button>
			</div>
		</form>
	</div>
	<!-- wrapper  end -->
    <div id="regMessage" class="modal message-pop" style='width: auto'>
        <a href="#" class="close">close</a>
        <div class="info-content">
            <strong class="title">Регистрация</strong>
            {*<strong class="info-text">донесение не сохранено</strong>*}
            <p>Регистраиця прошла успешно. Для получения возможности входа администратор должен активировать Вашу учетную запись.</p>
        </div>
    </div>
</body>

jQuery(document).ready ->
	if typeof ymaps == 'object'
		ymaps.ready(()->
			init()
			return
		)
	#order()
	jQuery('.nearhospitals .body').mCustomScrollbar()
	return

init = () ->
	mapBalloons =
	stopTime =
	sformXHR =
	arr = []

	# Инициализируем карту

	globalMap = new ymaps.Map("map",
		center: [48.9253,40.4075]
		type: 'yandex#map'
		zoom: 4
		controls: []
		behaviors:['default', 'scrollZoom']
	)
	# Инициализируем хранилище кластеров
	clusterer = new ymaps.Clusterer(
		preset: 'twirl#redClusterIcons'
		clusterNumbers: [10000]
		clusterHideIconOnBalloonOpen: false
		geoObjectHideIconOnBalloonOpen: false
		gridSize: 150
		zoomMargin: [170,80,30,80]
		maxZoom: 17
	)
	# Создаем кластеры
	clusterer.createCluster = (center, geoObjects) -> 
		clusterPlacemark = ymaps.Clusterer.prototype.createCluster.call(this, center, geoObjects)
		geoObjectsAll = clusterPlacemark.getGeoObjects()
		type = ''
		for i in geoObjectsAll
			if type != 'red'
				if(type != 'orange')
					type = i.scale
			else
				if i.scale == 'red'
					type = 'red'
		clusterPlacemark.options.set('clusterIconIcons', customClusterIcons[type])
		return clusterPlacemark
	# Иконки кластеров 
	customClusterIcons = 
	    'yellow': [{
	        href: 'images/cluster_yellow.png'
	
	        size: [74, 74]
	        offset: [-37, -37]
	    }]
	    'orange': [{
	        href: 'images/cluster_orange.png'
	        size: [74, 74]
	        offset: [-37, -37]
	    }]
	    'red': [{
	        href: 'images/cluster_red.png'
	        size: [74, 101]
	        offset: [-37, -37]
	    }]
	# Загружаем аяксом пробный json
	sformXHR = $.ajax(
		type: 'GET'
		dataType: 'json'
		url: 'inc/data.json'
		success: (msg) ->
			jQuery.each(arr, (i, obj) ->
				globalMap.geoObjects.remove(obj)
				return
			)
			arr = []
			mapBalloons = msg
			createIcons()
		error: (jqHXR, status,	errorThrown)->
			if 'abort' != status
				console.warn('Server is unavailable. Refresh the page within 15 seconds. ' + status + ' ' + errorThrown)
	) 
	# Создаем иконки
	createIcons = ->
		clusterer.removeAll()
		# Запихиваем в ball значения из json, создаем подробную табличку и время пути
		jQuery.each(mapBalloons, (i, obj) ->
				ball = 	'<div id="b'+obj.id+'" class="holder-bull open">'+
						'	<div class="detailed">'+
						'		<div class="head">'+
						'			<a href="#" class="close-new">x</a>'+
						'			<div class="name">'+obj.name+'</div>'+
						'			<div class="addres">'+obj.addres+'</div>'+
						'		</div>'+
						'		<div class="body">'+
						'			<div class="row">'+
						'				<dl class="item beds">'+
						'					<dt>КОЙКИ ВЗРОСЛЫЕ (ВСЕГО):</dt>'+
						'					<dd>'+obj.bedAlladult+'</dd>'+
						'				</dl>'+
						'			</div>'+
						' 			<div class="row">'+
						'				<dl class="item">'+
						'					<dt>ТЕРАПЕВТИЧЕСКИЕ:</dt>'+
						'					<dd>'+obj.therapeutic+'</dd>'+
						'				</dl>'+
						'				<dl class="item">'+
						'					<dt>НЕЙРОХИРУРГИЧЕСКИе, ВЗРОСЛЫЕ:</dt>'+
						'					<dd>'+obj.neurosurgicalAdult+'</dd>'+
						'				</dl>'+
						'				<dl class="item">'+
						'					<dt>ИНФЕКЦИОННЫЕ, ВЗРОСЛЫЕ:</dt>'+
						'					<dd>'+obj.infectiousAdult+'</dd>'+
						'				</dl>'+
						'			</div>'+
						' 			<div class="row">'+
						'				<dl class="item">'+
						'					<dt>ХИРУРГИЧЕСКИЕ, ВЗРОСЛЫЕ:</dt>'+
						'					<dd>'+obj.surgialAdult+'</dd>'+
						'				</dl>'+
						'				<dl class="item">'+
						'					<dt>ОЖОГОВЫЕ:</dt>'+
						'					<dd>'+obj.ambustial+'</dd>'+
						'				</dl>'+
						'			</div>'+
						' 			<div class="row">'+
						'				<dl class="item">'+
						'					<dt>ТРАВМАТОЛОГИЧЕСКИЕ, ВЗРОСЛЫЕ:</dt>'+
						'					<dd>'+obj.traumaAdult+'</dd>'+
						'				</dl>'+
						'				<dl class="item">'+
						'					<dt>ТУБЕРКУЛЕЗНЫЕ, ВЗРОСЛЫЕ::</dt>'+
						'					<dd>'+obj.tuberculousAdult+'</dd>'+
						'				</dl>'+
						'			</div>'+
						'			<div class="row">'+
						'				<dl class="item beds">'+
						'					<dt>КОЙКИ детские (ВСЕГО):</dt>'+
						'					<dd>'+obj.bedAllkid+'</dd>'+
						'				</dl>'+
						'			</div>'+
						'	 	</div>'+
						'	</div>'+
						#'	<div class="timepath">'+
						#'		<div class="time"><span>16</span>мин</div>'+
						#'		<div class="distance"><span>9</span>км</div>'+
						#'	</div>'+
						'</div>'
				# Превьюшка при наведении
				preview = 	'<div class="preview">'+
							'	<p>'+obj.shortname+'</p>'+
							'	<div class="row"><div class="item beds">'+obj.bedAlladult+'</div><div class="item beds">'+obj.doctorsAll+'</div></div>'+
							'	<div class="row"><div class="item">'+obj.therapeutic+'</div><div class="item">'+obj.docTherapeutic+'</div></div>'+
							'	<div class="row"><div class="item">'+obj.surgialAdult+'</div><div class="item">'+obj.docSurgial+'</div></div>'+
							'	<div class="row"><div class="item">'+obj.traumaAdult+'</div><div class="item">'+obj.docTraumatolog+'</div></div>'+
							'	<div class="row"><div class="item">'+obj.neurosurgicalAdult+'</div><div class="item">'+obj.docNeurosurgical+'</div></div>'+
							'	<div class="row"><div class="item">'+obj.ambustial+'</div><div class="item">'+obj.docCombustiol+'</div></div>'+
							'	<div class="row"><div class="item">'+obj.tuberculousAdult+'</div><div class="item">'+obj.docPhysia+'</div></div>'+
							'	<div class="row"><div class="item">'+obj.infectiousAdult+'</div><div class="item">'+obj.docInfectios+'</div></div>'+
							'</div>'

				obj.center[0] = parseFloat(obj.center[0])
				obj.center[1] = parseFloat(obj.center[1])

				# Создаем маркер
				myPlacemark = new ymaps.Placemark(obj.center, 
					balloonContent: ball
					iconContent:"<div id='i"+obj.id+"' class='icon-content'>"+
								"</div>"
					hintContent: preview
								,
				hideIconOnBalloonOpen: false
				iconLayout: 'default#imageWithContent'	
				iconImageHref: 'images/boll.png'
				iconImageSize: [74, 101]
				iconImageOffset: [-34, -87]
				balloonContentSize: [5, 5]
				openHintOnHover: true
				cursor: "pointer"
				balloonLayout: "default#imageWithContent"
				balloonImageHref: ' '
				balloonImageOffset: [0, -93]
				balloonShadow: false
				)

				myPlacemark.elementballoon = 'b'+obj.id
				myPlacemark.elementIcon = 'i'+obj.id
				myPlacemark.coords = obj.center
				myPlacemark.scale = obj.description.scaleType

				#active стейты
				myPlacemark.events.add('balloonclose', (e) ->
					$('#'+myPlacemark.elementIcon).removeClass('active')
					return
				)
				# Ховер стейты
				myPlacemark.events.add('mouseenter', (e) ->
					jQuery('#'+myPlacemark.elementIcon).addClass('hover')
					return
				)
				myPlacemark.events.add('mouseleave', (e) ->
					jQuery('#'+myPlacemark.elementIcon).removeClass('hover')
					return
				)
				arr.push(myPlacemark)
				return
			)
		#добавляем в массив класетеров наши маркеры
		clusterer.add(arr)
		#добавляем в geoObjects кластеры
		globalMap.geoObjects.add(clusterer)
		return
	# Обрабатываем состояние active
	clusterer.events.add('balloonopen',  (e) ->
		target = e.get('target')
		type = e.get('type')
		if typeof target.getGeoObjects != 'undefined'
			return
		else 
			$('#'+target.elementIcon).addClass('active')
			setTimeout(()->
				globalMap.panTo(target.coords, {delay: 10})
			, 50)
			jQuery('.holder-bull .close-new').click(() ->
				nowOpenBalloon = []
				target.balloon.close()
				return false
			)
			nowOpenBalloon = target.coords
			return
		return
	)

	return

order = () ->
	jQuery('.order').bind('click', () ->
		jQuery(this).toggleClass('active')
		jQuery('.nearhospitals tbody').append(jQuery('.nearhospitals tr').get().reverse())
		return
	)
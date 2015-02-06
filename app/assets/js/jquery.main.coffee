jQuery(document).ready ->
	init()
init = ->
	stopTime =
	sformXHR =
	ymaps.ready(()->
		myMap = new ymaps.Map("map",
			center: [65.639419,103.054514]
			type: 'yandex#map'
			zoom: 10
			controls: []
			behaviors:['default', 'scrollZoom']
		)
		clusterer = new ymaps.Clusterer(
			preset: 'twirl#redClusterIcons'
			clusterNumbers: [10000]
			clusterHideIconOnBalloonOpen: false
			geoObjectHideIconOnBalloonOpen: false
			gridSize: 150
			zoomMargin: [170,80,30,80]
			maxZoom: 17
		)
		clusterer.createCluster (center, geoObjects) -> 
			clusterPlacemark = ymaps.Clusterer.prototype.createCluster.call(this, center, geoObjects)
			geoObjectsAll = clusterPlacemark.getGeoObjects()
			type = ''
			for i in geoObjectsAll
				if type != 'red'
					if(type != 'orange')
						type = geoObjectsAll[i].scale
				else
					if geoObjectsAll[i].scale == 'red'
						type = 'red'
			clusterPlacemark.options.set('clusterIconIcons', customClusterIcons[type])
			return clusterPlacemark
	)
	customClusterIcons = 
	    'yellow': [{
	        href: 'uploaded/mapicons/cluster_yellow.png'
	        size: [74, 74]
	        offset: [-37, -37]
	    }]
	    'orange': [{
	        href: 'uploaded/mapicons/cluster_orange.png'
	        size: [74, 74]
	        offset: [-37, -37]
	    }]
	    'red': [{
	        href: 'uploaded/mapicons/cluster_red.png'
	        size: [74, 74]
	        offset: [-37, -37]
	    }]
	

	if stopTime
		clearTimeout(stopTime)
	if sformXHR
		sformXHR.abort()
	sformXHR = $.ajax(
		type: 'POST'
		data: form.serialize()
		dataType: 'json'
		url: 'inc/data.json'
		success: (msg) ->
			$.each(arr, (i, obj) ->
				myMap.geoObjects.remove(obj)
			)
			arr = []
			mapBalloons = msg
			createIcons()
		error: (jqHXR, status,	errorThrown) ->
			if 'abort' != status
				console.warn('Server is unavailable. Refresh the page within 15 seconds. ' + status + ' ' + errorThrown)
	)
	setInterval(() ->
		if stopTime 
			clearTimeout(stopTime)
		if sformXHR
			sformXHR.abort()
		sformXHR = $.ajax(
			type: 'POST'
			data: form.serialize()
			dataType: 'json'
			url: 'inc/data.json'
			success: (msg) ->
				$.each(arr, (i, obj) ->
					myMap.geoObjects.remove(obj)
				)
				arr = []
				mapBalloons = msg
				createIcons()
			error: (jqHXR, status,	errorThrown)->
				if 'abort' != status
					console.warn('Server is unavailable. Refresh the page within 15 seconds. ' + status + ' ' + errorThrown)
		) 
	1000)
	createIcons() ->
		list.empty()
		clusterer.removeAll()
		createMessages(mapBalloons)
		clusterer.add(arr)
		console.log(clusterer);
		myMap.geoObjects.add(clusterer)
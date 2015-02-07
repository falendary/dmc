<<<<<<< HEAD
var init, order;

jQuery(document).ready(function() {
  if (typeof ymaps === 'object') {
    ymaps.ready(function() {
      init();
    });
  }
  order();
});

init = function() {
  var arr, clusterer, createIcons, customClusterIcons, globalMap, mapBalloons, sformXHR, stopTime;
  mapBalloons = stopTime = sformXHR = arr = [];
  globalMap = new ymaps.Map("map", {
    center: [48.9253, 40.4075],
    type: 'yandex#map',
    zoom: 4,
    controls: [],
    behaviors: ['default', 'scrollZoom']
  });
  clusterer = new ymaps.Clusterer({
    preset: 'twirl#redClusterIcons',
    clusterNumbers: [10000],
    clusterHideIconOnBalloonOpen: false,
    geoObjectHideIconOnBalloonOpen: false,
    gridSize: 150,
    zoomMargin: [170, 80, 30, 80],
    maxZoom: 17
  });
  clusterer.createCluster = function(center, geoObjects) {
    var clusterPlacemark, geoObjectsAll, i, type, _i, _len;
    clusterPlacemark = ymaps.Clusterer.prototype.createCluster.call(this, center, geoObjects);
    geoObjectsAll = clusterPlacemark.getGeoObjects();
    type = '';
    for (_i = 0, _len = geoObjectsAll.length; _i < _len; _i++) {
      i = geoObjectsAll[_i];
      if (type !== 'red') {
        if (type !== 'orange') {
          type = i.scale;
        }
      } else {
        if (i.scale === 'red') {
          type = 'red';
        }
      }
    }
    clusterPlacemark.options.set('clusterIconIcons', customClusterIcons[type]);
    return clusterPlacemark;
  };
  customClusterIcons = {
    'yellow': [
      {
        href: 'images/cluster_yellow.png',
=======
var init;

jQuery(document).ready(function() {
  return init();
});

init = function() {
  var customClusterIcons, sformXHR, stopTime;
  stopTime = sformXHR = ymaps.ready(function() {
    var clusterer, myMap;
    myMap = new ymaps.Map("map", {
      center: [65.639419, 103.054514],
      type: 'yandex#map',
      zoom: 10,
      controls: [],
      behaviors: ['default', 'scrollZoom']
    });
    clusterer = new ymaps.Clusterer({
      preset: 'twirl#redClusterIcons',
      clusterNumbers: [10000],
      clusterHideIconOnBalloonOpen: false,
      geoObjectHideIconOnBalloonOpen: false,
      gridSize: 150,
      zoomMargin: [170, 80, 30, 80],
      maxZoom: 17
    });
    return clusterer.createCluster(function(center, geoObjects) {
      var clusterPlacemark, geoObjectsAll, i, type, _i, _len;
      clusterPlacemark = ymaps.Clusterer.prototype.createCluster.call(this, center, geoObjects);
      geoObjectsAll = clusterPlacemark.getGeoObjects();
      type = '';
      for (_i = 0, _len = geoObjectsAll.length; _i < _len; _i++) {
        i = geoObjectsAll[_i];
        if (type !== 'red') {
          if (type !== 'orange') {
            type = geoObjectsAll[i].scale;
          }
        } else {
          if (geoObjectsAll[i].scale === 'red') {
            type = 'red';
          }
        }
      }
      clusterPlacemark.options.set('clusterIconIcons', customClusterIcons[type]);
      return clusterPlacemark;
    });
  });
  customClusterIcons = {
    'yellow': [
      {
        href: 'uploaded/mapicons/cluster_yellow.png',
>>>>>>> 0b4984b58677e0992393756ee1a06e5d9f6389eb
        size: [74, 74],
        offset: [-37, -37]
      }
    ],
    'orange': [
      {
<<<<<<< HEAD
        href: 'images/cluster_orange.png',
=======
        href: 'uploaded/mapicons/cluster_orange.png',
>>>>>>> 0b4984b58677e0992393756ee1a06e5d9f6389eb
        size: [74, 74],
        offset: [-37, -37]
      }
    ],
    'red': [
      {
<<<<<<< HEAD
        href: 'images/cluster_red.png',
        size: [74, 101],
=======
        href: 'uploaded/mapicons/cluster_red.png',
        size: [74, 74],
>>>>>>> 0b4984b58677e0992393756ee1a06e5d9f6389eb
        offset: [-37, -37]
      }
    ]
  };
<<<<<<< HEAD
  sformXHR = $.ajax({
    type: 'GET',
    dataType: 'json',
    url: 'inc/data.json',
    success: function(msg) {
      jQuery.each(arr, function(i, obj) {
        globalMap.geoObjects.remove(obj);
      });
      arr = [];
      mapBalloons = msg;
      createIcons();
=======
  if (stopTime) {
    clearTimeout(stopTime);
  }
  if (sformXHR) {
    sformXHR.abort();
  }
  sformXHR = $.ajax({
    type: 'POST',
    data: form.serialize(),
    dataType: 'json',
    url: 'inc/data.json',
    success: function(msg) {
      var arr, mapBalloons;
      $.each(arr, function(i, obj) {
        return myMap.geoObjects.remove(obj);
      });
      arr = [];
      mapBalloons = msg;
      return createIcons();
>>>>>>> 0b4984b58677e0992393756ee1a06e5d9f6389eb
    },
    error: function(jqHXR, status, errorThrown) {
      if ('abort' !== status) {
        return console.warn('Server is unavailable. Refresh the page within 15 seconds. ' + status + ' ' + errorThrown);
      }
    }
  });
<<<<<<< HEAD
  createIcons = function() {
    clusterer.removeAll();
    jQuery.each(mapBalloons, function(i, obj) {
      var ball, myPlacemark, preview;
      ball = '<div id="b' + obj.id + '" class="holder-bull open">' + '	<div class="detailed">' + '		<div class="head">' + '			<a href="#" class="close-new">x</a>' + '			<div class="name">' + obj.name + '</div>' + '			<div class="addres">' + obj.addres + '</div>' + '		</div>' + '		<div class="body">' + '			<div class="row">' + '				<dl class="item beds">' + '					<dt>КОЙКИ ВЗРОСЛЫЕ (ВСЕГО):</dt>' + '					<dd>' + obj.bedAlladult + '</dd>' + '				</dl>' + '			</div>' + ' 			<div class="row">' + '				<dl class="item">' + '					<dt>ТЕРАПЕВТИЧЕСКИЕ:</dt>' + '					<dd>' + obj.therapeutic + '</dd>' + '				</dl>' + '				<dl class="item">' + '					<dt>НЕЙРОХИРУРГИЧЕСКИе, ВЗРОСЛЫЕ:</dt>' + '					<dd>' + obj.neurosurgicalAdult + '</dd>' + '				</dl>' + '				<dl class="item">' + '					<dt>ИНФЕКЦИОННЫЕ, ВЗРОСЛЫЕ:</dt>' + '					<dd>' + obj.infectiousAdult + '</dd>' + '				</dl>' + '			</div>' + ' 			<div class="row">' + '				<dl class="item">' + '					<dt>ХИРУРГИЧЕСКИЕ, ВЗРОСЛЫЕ:</dt>' + '					<dd>' + obj.surgialAdult + '</dd>' + '				</dl>' + '				<dl class="item">' + '					<dt>ОЖОГОВЫЕ:</dt>' + '					<dd>' + obj.ambustial + '</dd>' + '				</dl>' + '			</div>' + ' 			<div class="row">' + '				<dl class="item">' + '					<dt>ТРАВМАТОЛОГИЧЕСКИЕ, ВЗРОСЛЫЕ:</dt>' + '					<dd>' + obj.traumaAdult + '</dd>' + '				</dl>' + '				<dl class="item">' + '					<dt>ТУБЕРКУЛЕЗНЫЕ, ВЗРОСЛЫЕ::</dt>' + '					<dd>' + obj.tuberculousAdult + '</dd>' + '				</dl>' + '			</div>' + '			<div class="row">' + '				<dl class="item beds">' + '					<dt>КОЙКИ детские (ВСЕГО):</dt>' + '					<dd>' + obj.bedAllkid + '</dd>' + '				</dl>' + '			</div>' + '	 	</div>' + '	</div>' + '	<div class="timepath">' + '		<div class="time"><span>16</span>мин</div>' + '		<div class="distance"><span>9</span>км</div>' + '	</div>' + '</div>';
      preview = '<div class="preview">' + '	<p>' + obj.shortname + '</p>' + '	<div class="row"><div class="item beds">' + obj.bedAlladult + '</div></div>' + '	<div class="row"><div class="item">' + obj.neurosurgicalAdult + '</div><div class="item">' + obj.therapeutic + '</div></div>' + '	<div class="row"><div class="item">' + obj.traumaAdult + '</div><div class="item">' + obj.tuberculousAdult + '</div></div>' + '	<div class="row"><div class="item">' + obj.bedAllkid + '</div><div class="item">' + obj.therapeutic + '</div></div>' + '	<div class="row"><div class="item">' + obj.surgialAdult + '</div><div class="item">' + obj.ambustial + '</div></div>' + '	<div class="row"><div class="item">' + obj.tuberculousAdult + '</div><div class="item">' + obj.infectiousAdult + '</div></div>' + '	<div class="row"><div class="item">' + obj.neurosurgicalAdult + '</div><div class="item">' + obj.therapeutic + '</div></div>' + '	<div class="row"><div class="item">' + obj.neurosurgicalAdult + '</div><div class="item">' + obj.therapeutic + '</div></div>' + '</div>';
      obj.center[0] = parseFloat(obj.center[0]);
      obj.center[1] = parseFloat(obj.center[1]);
      myPlacemark = new ymaps.Placemark(obj.center, {
        balloonContent: ball,
        iconContent: "<div id='i" + obj.id + "' class='icon-content'>" + "</div>",
        hintContent: preview
      }, {
        hideIconOnBalloonOpen: false,
        iconLayout: 'default#imageWithContent',
        iconImageHref: 'images/boll.png',
        iconImageSize: [74, 101],
        iconImageOffset: [-34, -87],
        balloonContentSize: [5, 5],
        openHintOnHover: true,
        cursor: "pointer",
        balloonLayout: "default#imageWithContent",
        balloonImageHref: ' ',
        balloonImageOffset: [0, -93],
        balloonShadow: false
      });
      myPlacemark.elementballoon = 'b' + obj.id;
      myPlacemark.elementIcon = 'i' + obj.id;
      myPlacemark.coords = obj.center;
      myPlacemark.scale = obj.description.scaleType;
      myPlacemark.events.add('balloonclose', function(e) {
        $('#' + myPlacemark.elementIcon).removeClass('active');
      });
      myPlacemark.events.add('mouseenter', function(e) {
        jQuery('#' + myPlacemark.elementIcon).addClass('hover');
      });
      myPlacemark.events.add('mouseleave', function(e) {
        jQuery('#' + myPlacemark.elementIcon).removeClass('hover');
      });
      arr.push(myPlacemark);
    });
    clusterer.add(arr);
    globalMap.geoObjects.add(clusterer);
  };
  clusterer.events.add('balloonopen', function(e) {
    var nowOpenBalloon, target, type;
    target = e.get('target');
    type = e.get('type');
    if (typeof target.getGeoObjects !== 'undefined') {
      return;
    } else {
      $('#' + target.elementIcon).addClass('active');
      setTimeout(function() {
        return globalMap.panTo(target.coords, {
          delay: 10
        });
      }, 50);
      jQuery('.holder-bull .close-new').click(function() {
        var nowOpenBalloon;
        nowOpenBalloon = [];
        target.balloon.close();
        return false;
      });
      nowOpenBalloon = target.coords;
      return;
    }
  });
};

order = function() {
  return jQuery('.order').bind('click', function() {
    jQuery(this).toggleClass('active');
    jQuery('.nearhospitals tbody').append(jQuery('.nearhospitals tr').get().reverse());
=======
  setInterval(function() {
    if (stopTime) {
      clearTimeout(stopTime);
    }
    if (sformXHR) {
      sformXHR.abort();
    }
    return sformXHR = $.ajax({
      type: 'POST',
      data: form.serialize(),
      dataType: 'json',
      url: 'inc/data.json',
      success: function(msg) {
        var arr, mapBalloons;
        $.each(arr, function(i, obj) {
          return myMap.geoObjects.remove(obj);
        });
        arr = [];
        mapBalloons = msg;
        return createIcons();
      },
      error: function(jqHXR, status, errorThrown) {
        if ('abort' !== status) {
          return console.warn('Server is unavailable. Refresh the page within 15 seconds. ' + status + ' ' + errorThrown);
        }
      }
    });
  }, 1000);
  return createIcons()(function() {
    list.empty();
    clusterer.removeAll();
    createMessages(mapBalloons);
    clusterer.add(arr);
    console.log(clusterer);
    return myMap.geoObjects.add(clusterer);
>>>>>>> 0b4984b58677e0992393756ee1a06e5d9f6389eb
  });
};

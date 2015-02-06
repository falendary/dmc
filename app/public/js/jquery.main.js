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
        size: [74, 74],
        offset: [-37, -37]
      }
    ],
    'orange': [
      {
        href: 'uploaded/mapicons/cluster_orange.png',
        size: [74, 74],
        offset: [-37, -37]
      }
    ],
    'red': [
      {
        href: 'uploaded/mapicons/cluster_red.png',
        size: [74, 74],
        offset: [-37, -37]
      }
    ]
  };
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
    },
    error: function(jqHXR, status, errorThrown) {
      if ('abort' !== status) {
        return console.warn('Server is unavailable. Refresh the page within 15 seconds. ' + status + ' ' + errorThrown);
      }
    }
  });
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
  });
};

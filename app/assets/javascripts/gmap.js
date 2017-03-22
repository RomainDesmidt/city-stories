
//init map option

var styleOut =
[  {
    "elementType": "labels",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "administrative",
    "elementType": "labels",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "administrative",
    "elementType": "labels.text",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "landscape",
    "elementType": "labels",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "landscape.man_made",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#0f1416"
      }
    ]
  },
  {
    "featureType": "landscape.natural",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#0f1416"
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#0f1416"
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "labels",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "labels.text",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "poi.medical",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#0f1416"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#0f1416"
      }
    ]
  },
  {
    "featureType": "poi.place_of_worship",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#0f1416"
      }
    ]
  },
  {
    "featureType": "poi.school",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#0f1416"
      }
    ]
  },
  {
    "featureType": "poi.sports_complex",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#0f1416"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#0f1416"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "labels",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "labels.text",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "road.local",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#2b383e"
      },
      {
        "weight": 0.5
      }
    ]
  },
  {
    "featureType": "transit",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#0f1416"
      }
    ]
  },
  {
    "featureType": "transit",
    "elementType": "labels",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "transit",
    "elementType": "labels.text",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#00a5b7"
      },
      {
        "weight": 2
      }
    ]
  }
];

var gmapStyle = document.getElementsByName("mystylegmap")[0].value
// La Cordee Nantes Lat Lng
var centerMap = new google.maps.LatLng(47.211905, -1.546881);
var myOptions = {
  zoom: 16,
  center: centerMap,
  scrollwheel: false,
  mapTypeId: google.maps.MapTypeId.ROADMAP,
  styles: styleOut
};
var map = new google.maps.Map(document.getElementById('map'), myOptions);


// http://freeiconbox.com/icon/256/34338.png
// http://maps.google.com/mapfiles/kml/shapes/flag.png
// http://maps.google.com/mapfiles/kml/shapes/arrow.png
// http://www.freeiconspng.com/uploads/illuminati-icon-png-29.png
// mapx50.png
// -----------------------------------------------------------
var ico = "dollarx50.png";
var titre = "La Cordee";
var blue = '#0000FF';
var green = '#00FF00';
var red = '#FF0000';
var yellow = '#F0F000';
var purple = '#FF1AFF';
var orange = '#ff6600';



// -----------------------------------------------------------
function marquePoi(lat,lng,ico,titre, visibility) {
  var maLatLng = new google.maps.LatLng(lat, lng);
  var marqueur = new google.maps.Marker({
  position: maLatLng,
  map: map,
  title: titre,
  //icon: ico,
  visible: visibility
  });
  return marqueur;
};

function addToCoordinatesObjectArray(coordinatesArray, lat, lng){
  var newLatLng = new google.maps.LatLng(lat, lng)
  coordinatesArray.push(newLatLng);
};

function createParcours(hashDanslArray, color) {
  var coordinatesArray = []
    for(var i = 0; i < hashDanslArray.length; i++) {
      var lat = hashDanslArray[i]["lat"];
      var lng = hashDanslArray[i]["lng"]
      addToCoordinatesObjectArray(coordinatesArray, lat, lng);
      marquePoi(lat,lng, ico, titre, true)
    }
  var parcoursPath = new google.maps.Polyline({
    path: coordinatesArray,
    geodesic: true,
    strokeColor: color,
    strokeOpacity: 0.5,
    strokeWeight: 10,
  });
  parcoursPath.setMap(map);
};

function getCoordinatesonClick() {
  var infowindow = null;
  var marqueur = null;
  map.addListener("click", function (event) {
    if (infowindow) {
      infowindow.close();
    }
    var lat = event.latLng.lat();
    var lng = event.latLng.lng();
    infowindow = new google.maps.InfoWindow({
      content: lat + ', ' + lng
    });
    marqueur = marquePoi(lat, lng, ico, "", false)
    infowindow.open(map, marqueur);
  });
};

// -----------------------------------------------------------


hashDanslArray = [
  {lat: 47.203549031023535, lng: -1.546175479888916},
  {lat: 47.20876778904724, lng: -1.5497159957885742},
  {lat: 47.211905, lng: -1.546881 },
  {lat: 47.213551, lng: -1.548048 },
  {lat: 47.2153952, lng: -1.5468317}
];

hashDanslArRotule =[
  {lat: 47.211905, lng: -1.546881},
  {lat: 47.211788, lng: -1.5457677},
  {lat: 47.215184, lng: -1.5495447},
  {lat: 47.22522246489705, lng: -1.5627622604370117}
];

hashOther = [
{lat: 47.22851570160647, lng: -1.5333867073059082},
{lat: 47.21169764879896, lng: -1.5566253662109375},
{lat: 47.21647836591959, lng: -1.5874385833740234}
];

hashNowSixElements = [
{lat: 47.20382601711648, lng:  -1.5516471862792969},
{lat: 47.21467107231053, lng:  -1.5148258209228516},
{lat: 47.241016480767314, lng:  -1.4996337890625},
{lat: 47.248707802221624, lng:  -1.5095901489257812},
{lat: 47.24538668677013, lng: -1.5174007415771484},
{lat: 47.231517323193515, lng:  -1.6373062133789062}
];

hashSixElements = [
{lat: 47.20964239099345, lng:  -1.570444107055664},
{lat: 47.21130409495898, lng:  -1.559007167816162},
{lat: 47.21054613118688, lng:  -1.5557670593261719},
{lat: 47.20531297036713, lng:  -1.5546727180480957},
{lat: 47.20362192224085, lng:  -1.5702080726623535},
{lat: 47.19984602541013, lng:  -1.5732765197753906}
];

createParcours(hashDanslArray, '#E59500');
createParcours(hashDanslArRotule, '#F44336');
createParcours(hashOther, '#E5DADA');
createParcours(hashNowSixElements, '#52DEE5');
// createParcours(hashSixElements, orange);
getCoordinatesonClick();

'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "version.json": "edac6610d63f93aebfb1c09a76230248",
"index.html": "0d9f87f21a28807d5c12d4b905ccc222",
"/": "0d9f87f21a28807d5c12d4b905ccc222",
"main.dart.js": "1e9e8017e5bcb1b26e167b966516279d",
"favicon.png": "d1a6c17c4bfb835f69f59d7a8bd98468",
"icons/Icon-192.png": "1c6653f85131c5f67ce7ceeb96cd1aa8",
"icons/favicon.png": "d1a6c17c4bfb835f69f59d7a8bd98468",
"icons/Icon-512.png": "fc4389c48df38a40b01206ba8816648b",
"manifest.json": "ce22741b7b2400eebf69f747d0151c04",
"assets/AssetManifest.json": "bdfd80211ec14f13cf035b8232ea7b35",
"assets/NOTICES": "37585a52ab90fe60926f7ba5c5fa1359",
"assets/FontManifest.json": "fe56b5e9707fa43a2bcb0b7d7b243958",
"assets/fonts/MaterialIcons-Regular.otf": "7e7a6cccddf6d7b20012a548461d5d81",
"assets/assets/images/simple_dash_large.png": "c3100434238b1fe0f6b8e6d074ccd80e",
"assets/assets/images/audio_control/simple_on.png": "63e24186aec21d19e6f82f88d656a951",
"assets/assets/images/audio_control/dashatar_on.png": "927040d878eeeb9c0700d50fac87674f",
"assets/assets/images/audio_control/yellow_dashatar_off.png": "f1606e5fb255a5a48dbadc722a983060",
"assets/assets/images/audio_control/green_dashatar_off.png": "8aae7e7135d47a7536b2cca91d877c2a",
"assets/assets/images/audio_control/blue_dashatar_off.png": "fb9cf31f68997341215e5484252350fe",
"assets/assets/images/audio_control/simple_off.png": "ecac9ec0e8dc5d526e204651b5e62dcc",
"assets/assets/images/simple_dash_small.png": "b3f2ec92db7be8297f529f94d8e38136",
"assets/assets/images/shuffle_icon.png": "32ebb4a7c6f9b07157a57f537f254619",
"assets/assets/images/timer_icon.png": "284049eb59c25888ebe6ecf864728727",
"assets/assets/images/logo_coidon_white.png": "c0b0cf7679682ff457be9c5f25610d02",
"assets/assets/images/facebook_icon.png": "284d2a1d2782e5e24b1f9bce25f3ea9a",
"assets/assets/images/simple_dash_medium.png": "4e2fd9dee5fbd150653f06a83be3accf",
"assets/assets/images/coidon/success/elephant.png": "1d873d102afbbd4a609ecf5195b772b7",
"assets/assets/images/coidon/success/tiger.png": "ef784e2890f7cd43b66f5ae31355d84f",
"assets/assets/images/coidon/success/panda.png": "cea17555e02bd2d484a9cd7e2d42d961",
"assets/assets/images/coidon/success/wolf.png": "46ffc8cb31e2b8ef9e24e99b6e187338",
"assets/assets/images/coidon/gallery/elephant.png": "a23205cbaa085dffce5f72f87bbd7589",
"assets/assets/images/coidon/gallery/tiger.png": "701969bb223470f070307ad4e33a2163",
"assets/assets/images/coidon/gallery/panda.png": "0afc0c85b9009c4ee617083be83d4366",
"assets/assets/images/coidon/gallery/wolf.png": "42a48edd424458fbe9c65f58fe6ddab3",
"assets/assets/images/coidon/panda/8.png": "102c5d3d613e136c31cd7b691c6fe68b",
"assets/assets/images/coidon/panda/9.png": "b36f0ab3add14058874d76f3b2ec7efe",
"assets/assets/images/coidon/panda/14.png": "67f61f2c14f37122f0eafe9f70a3d728",
"assets/assets/images/coidon/panda/15.png": "20a0947166bf9c18c65b2740ed34f1b3",
"assets/assets/images/coidon/panda/12.png": "55b3703bb5373b9c6a7b1aedeb957c28",
"assets/assets/images/coidon/panda/13.png": "d102ed1e6bb088a690aaf5b25d6ced26",
"assets/assets/images/coidon/panda/11.png": "e565235723ad5a81c3d2f0e8d2d50995",
"assets/assets/images/coidon/panda/10.png": "10b0cd978c1f854e1153d1676a0ea45f",
"assets/assets/images/coidon/panda/4.png": "ee41fb4a93deb805bb0373f91383b11d",
"assets/assets/images/coidon/panda/5.png": "e590442e980aa615c17a3a5eaa22acda",
"assets/assets/images/coidon/panda/7.png": "2c52004eae22dfabbf35b7491834ac09",
"assets/assets/images/coidon/panda/6.png": "3b1b2115cb2a71700e37e4cc941951af",
"assets/assets/images/coidon/panda/2.png": "a8eb4686f009a8feee04cb26343efbf5",
"assets/assets/images/coidon/panda/3.png": "7d19685018d6560e80be22abe5c2061f",
"assets/assets/images/coidon/panda/1.png": "22570c8d869bc40c21e044634f4945db",
"assets/assets/images/coidon/tiger/8.png": "1f7b041051928a400decb1792bb2049e",
"assets/assets/images/coidon/tiger/9.png": "148b565ac5ca9bcaeb58ad2e1f558f0c",
"assets/assets/images/coidon/tiger/14.png": "a31070bc6842cea19270f3f2b9a9fb53",
"assets/assets/images/coidon/tiger/15.png": "387a2aaac7b35dc324a0ab7ce2108412",
"assets/assets/images/coidon/tiger/12.png": "c3d2746e08c467ad30e661f894c0e841",
"assets/assets/images/coidon/tiger/13.png": "4c6fdf6d7509de6676dbcd9316d6c18a",
"assets/assets/images/coidon/tiger/11.png": "024333918aeaf43fe82e8800df3b8b80",
"assets/assets/images/coidon/tiger/10.png": "4d9bced26ac11cb2142a2c93d9c1c29d",
"assets/assets/images/coidon/tiger/4.png": "4c4f03b481ab628cfec91ce0f19c5c67",
"assets/assets/images/coidon/tiger/5.png": "0311bc78f9f5118ac05f8f86b7293c89",
"assets/assets/images/coidon/tiger/7.png": "6be28c82393294c66a2759b7b13b7ac9",
"assets/assets/images/coidon/tiger/6.png": "b9a3a888db68c5752df55bd2dc785ac1",
"assets/assets/images/coidon/tiger/2.png": "243d49424ccaeea50eab61ad246b4e52",
"assets/assets/images/coidon/tiger/3.png": "6f81f24e294f2ea916f9c050f1b7ca6e",
"assets/assets/images/coidon/tiger/1.png": "28a6cc910779d36ac65ff67bf120f7fe",
"assets/assets/images/coidon/wolf/8.png": "13b4b5a2c8c30e12696a2dc73a987d1e",
"assets/assets/images/coidon/wolf/9.png": "517df381b8cbdf424128fe65ad576850",
"assets/assets/images/coidon/wolf/14.png": "2bdb48057f5ae5feb7b83561a714211e",
"assets/assets/images/coidon/wolf/15.png": "730877539960cabc21df87a5fecb42f4",
"assets/assets/images/coidon/wolf/12.png": "671735f22058e208637e037bf84e6aaf",
"assets/assets/images/coidon/wolf/13.png": "35c64023f825e20088c4f0abe6854ce4",
"assets/assets/images/coidon/wolf/11.png": "495de79746b112f6062a62fc4f7bdf88",
"assets/assets/images/coidon/wolf/10.png": "499ee9dddccd457969eb82606c889a72",
"assets/assets/images/coidon/wolf/4.png": "db7b0e07a056463209ef5f145c131b2b",
"assets/assets/images/coidon/wolf/5.png": "a6de7c0943a0b5d6eb60b1485d4cb81f",
"assets/assets/images/coidon/wolf/7.png": "e3f5b99783a35d8b87adce4cf823dfaf",
"assets/assets/images/coidon/wolf/6.png": "47794ffa83e55a7805b6675706fda962",
"assets/assets/images/coidon/wolf/2.png": "27b7f6e5a075f6cedd3bc0a4c72adb05",
"assets/assets/images/coidon/wolf/3.png": "d08018cab9195e331a3efe309e6846e6",
"assets/assets/images/coidon/wolf/1.png": "f97e290c20742b398c5d716783e601c8",
"assets/assets/images/coidon/elephant/8.png": "efac2a60c91d2e0f4a50e6f11ec23db5",
"assets/assets/images/coidon/elephant/9.png": "c44b6299ca985d207c9c313aa49c945a",
"assets/assets/images/coidon/elephant/14.png": "167bc701b98f46e7956fa720eff4e352",
"assets/assets/images/coidon/elephant/15.png": "5f3fb2c7c42c60eee31cda3ca437892d",
"assets/assets/images/coidon/elephant/12.png": "fa318199cc4d97acbd849959af476791",
"assets/assets/images/coidon/elephant/13.png": "f33165d977a6743c17b818c231e2ea99",
"assets/assets/images/coidon/elephant/11.png": "c7795b1d5219cf63855d9625a540039c",
"assets/assets/images/coidon/elephant/10.png": "4321f4ee89a217e25a37eb0bbcf566a8",
"assets/assets/images/coidon/elephant/4.png": "693c0c5cb6a9389ce02f7bb93e0426ec",
"assets/assets/images/coidon/elephant/5.png": "21f4f6cf409f87bdefff82d0cef2b436",
"assets/assets/images/coidon/elephant/7.png": "46dc65115b083f82476f34db5e531cb5",
"assets/assets/images/coidon/elephant/6.png": "5dc0fd8202792236667a7ebb2e5192ef",
"assets/assets/images/coidon/elephant/2.png": "de373ae51223a44f21039d61e3e722fb",
"assets/assets/images/coidon/elephant/3.png": "37824464a41742f4601d3437823d2ad0",
"assets/assets/images/coidon/elephant/1.png": "66bf1d64e752c07e003d7ebcb31c5200",
"assets/assets/images/twitter_icon.png": "f9a8b83fc280f6a6363783cdbdd81573",
"assets/assets/audio/sandwich.mp3": "5a3cf659842b0db22ab9495ea2cdc80a",
"assets/assets/audio/skateboard.mp3": "13e460479dc92b0ff1574d35a5204392",
"assets/assets/audio/tile_move.mp3": "f4056eec1581ee5264ab8f481a59d5d3",
"assets/assets/audio/shuffle.mp3": "0ac82d67f08b71d43046256dbc2db12d",
"assets/assets/audio/click.mp3": "7b257864b73a219a79572b785910e685",
"assets/assets/audio/success.mp3": "746679b7331cf687df94188b40ff6f67",
"assets/assets/audio/dumbbell.mp3": "aa341eb857b4fd972767430aa5babb30",
"assets/assets/fonts/MetalMania-Regular.ttf": "5d1b72fc11eaa5474e58c96ce5243a9d",
"canvaskit/canvaskit.js": "f00de1f742223b7cf4cec1c2a0cd9764",
"canvaskit/profiling/canvaskit.js": "411ee45f5abb57975ee5243310c6953e",
"canvaskit/profiling/canvaskit.wasm": "c6681b1a749ad902eefcba11fed1cb3f",
"canvaskit/canvaskit.wasm": "efe4a5da0205bb8d8c5aca7dad981abd"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}

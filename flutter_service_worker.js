'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"version.json": "e6f89dde059a9aa64a1b71cfee92b9cf",
"index.html": "797df4eea179f5aed125c75f0ce9fba9",
"/": "797df4eea179f5aed125c75f0ce9fba9",
"main.dart.js": "ebede22c07fae4ff2f4b71b7ee744a20",
"flutter.js": "6fef97aeca90b426343ba6c5c9dc5d4a",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "7d19e184bb7915dede8810c50876185a",
"assets/AssetManifest.json": "1e95a182c48d374122f13f551260834e",
"assets/NOTICES": "09b7ea83b0634b8b8c768d170c4a7602",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "57d849d738900cfd590e9adc7e208250",
"assets/packages/fluttertoast/assets/toastify.js": "56e2c9cedd97f10e7e5f1cebd85d53e3",
"assets/packages/fluttertoast/assets/toastify.css": "a85675050054f179444bc5ad70ffc635",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"assets/AssetManifest.smcbin": "947339296671ece40366a83fe85bc5cc",
"assets/fonts/MaterialIcons-Regular.otf": "0a71451c56198632cab1452bdc8ab952",
"assets/assets/translations.zip": "a7c17a0bca57d9440cc7f50681368eab",
"assets/assets/labels.txt": "7a8b74175808962e39496fac1bb620ef",
"assets/assets/model_unquant.tflite": "879c84184b90bf110599510d1c57c4a4",
"assets/assets/icon/search.svg": "7fde9aa3b17acb74342239a2911e772d",
"assets/assets/icon/icon.png": "ec98fae6a8e29dc793bb349d58197b4d",
"assets/assets/icon/check_active.svg": "0fb23d5396329cf887ade5bbb14df5f0",
"assets/assets/icon/gowok.jpeg": "7bcfc0538ed864adb085f387f6ad001e",
"assets/assets/icon/bottom_nav_accept.svg": "2b4d86dda798077fe1c7728b1ef1c204",
"assets/assets/icon/bugi_loading_backup.gif": "ba8206a97d26074eac040ac79b237d17",
"assets/assets/icon/arrow_back.svg": "e5274fc4e885946014920b50f34caaad",
"assets/assets/icon/app_icon.png": "bb1d3ea2e75682e45cc5b8d8c3dc1155",
"assets/assets/icon/bar_logo.svg": "887868f6bd4553e380ad070a66b77e0b",
"assets/assets/icon/appLogo.png": "031ef96516bd8a4384ee4c09726927d7",
"assets/assets/icon/earthIcon.png": "cb91bbec7646db3697cb820431a3fb53",
"assets/assets/icon/check_plus.svg": "c0a8afae1f628b3b089b48e49870812a",
"assets/assets/icon/calender.svg": "ad193499cf215b03e28e9bfd42860f0d",
"assets/assets/icon/bar_logo.png": "70f2df767f291f5d5e46c990ac896953",
"assets/assets/icon/adBanner.png": "a1d82fb47e8c5a739acd237cd73e21ad",
"assets/assets/icon/BusanExpo.svg": "1f76b7410f9e39428ece16ebcadb3e6d",
"assets/assets/icon/minrack.jpg": "335e49411269ab27c2973a9ddacff723",
"assets/assets/icon/samik_2.jpg": "eb9713bcde334867521ee3356f036f43",
"assets/assets/icon/sijang.jpg": "cdcce7ae26dcb8839bd258e404cc4103",
"assets/assets/icon/arrow_up.svg": "f3c4ea9ca004fc5e5edcf43447d2551d",
"assets/assets/icon/arrow_right.svg": "4f2b53e6ca1966d6021c41a10293ad7f",
"assets/assets/icon/chatLoading.gif": "3e85ffdc7ead464095d07c4b7980c3c4",
"assets/assets/icon/bottom_nav_foot.svg": "4f0c81d84e60e044dc5e45a7f91ad3fb",
"assets/assets/icon/gowok.jpg": "a2dfd2a5a35a6f72b6da9953cf65c967",
"assets/assets/icon/homeLogo.png": "b85c9b2b098900651dcf7dd274832d47",
"assets/assets/icon/icon_black.png": "9b271973c73c2a5110d7e3f3f52b7183",
"assets/assets/icon/arrow_down.svg": "e5630e74eadcf24cbee00846a043697c",
"assets/assets/icon/camera.svg": "710a07e05b39a050a5d703322524b37c",
"assets/assets/icon/write.svg": "c99177a8065d92fc0585ec751b6079cb",
"assets/assets/icon/bottom_nav_home.svg": "bd52c6ce5fd29bc43c3da00e504273f5",
"assets/assets/icon/tonshow.jpg": "22a22c76f15f5c3cc4e423f6879b0d07",
"assets/assets/icon/bottom_nav_know.svg": "54eb1c27205dab9a28c8adc5291a13a9",
"assets/assets/icon/minrack.jpeg": "c56889bda3e2a0e267babd190a78eed9",
"assets/assets/icon/home_logo.svg": "9b64db9e76cd66d362c6a2f363997e80",
"assets/assets/icon/question_message.svg": "e91ec93759b529b14be354de2ca6f979",
"assets/assets/icon/bottom_nav_hire.svg": "e68bd38d983248c6012766e32b8de9b6",
"assets/assets/icon/bottom_nav_calender.svg": "ffe21209cfb9cd5f3328b95460238d2a",
"assets/assets/icon/arrow_right_pink.svg": "fb8405cd17c359a46af8d844da134feb",
"assets/assets/icon/bottom_nav_my.svg": "611915b12b4aa95f2bb9f150692c9467",
"assets/assets/icon/location.svg": "0db2b8044a9a4a67536516e50b0dbe8c",
"assets/assets/icon/check_disable.svg": "b3d1adc02319e6cb4cdd2961498aebfe",
"assets/assets/icon/arrow_left_pink.svg": "26fef545a4f21ef5df28b420e10a9a1f",
"assets/assets/icon/board.svg": "bead8c1e7835474aece3b34d15f69e81",
"assets/assets/icon/bugi_loading.gif": "1bdf9c972d7be3b7b01eda9b53abe75d",
"assets/assets/icon/remove.svg": "7f6bfe2370a60dc97721fd9990bbac5e",
"assets/assets/icon/cho.jpg": "b5424548774031bb65585023a5969290",
"assets/assets/icon/gamchen.jpg": "c1387fb79c456cb6600d733ccd453a62",
"assets/assets/icon/logo.svg": "3d7e806f95db05ccabdd1726daed44e7",
"assets/assets/icon/help.svg": "49cb50d13c755476b5d48a16b841b828",
"assets/assets/icon/rhkddksgoqus.jpg": "a993f9cf9d6ca0bf54fc476b8d41159e",
"assets/assets/icon/sign_logo.png": "030a61f7e965302d387a8a1269f1a864",
"assets/assets/icon/sendUi.svg": "100f1e830de59f298554fc4c9afa9784",
"assets/assets/translations/ko-KR.json": "331be3fb0600dcf8ad982e6e33ba2186",
"assets/assets/translations/ja-JP.json": "7042f9d096f7b8550661e93e46fa4be9",
"assets/assets/translations/zh-CN.json": "43a846ea8ad93b78133d36f13f598ce3",
"assets/assets/translations/en-US.json": "644bf0bf58f798441cc25dfe42236bc2",
"canvaskit/skwasm.js": "1df4d741f441fa1a4d10530ced463ef8",
"canvaskit/skwasm.wasm": "6711032e17bf49924b2b001cef0d3ea3",
"canvaskit/chromium/canvaskit.js": "8c8392ce4a4364cbb240aa09b5652e05",
"canvaskit/chromium/canvaskit.wasm": "fc18c3010856029414b70cae1afc5cd9",
"canvaskit/canvaskit.js": "76f7d822f42397160c5dfc69cbc9b2de",
"canvaskit/canvaskit.wasm": "f48eaf57cada79163ec6dec7929486ea",
"canvaskit/skwasm.worker.js": "19659053a277272607529ef87acf9d8a"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
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
        // Claim client to enable caching on first launch
        self.clients.claim();
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
      // Claim client to enable caching on first launch
      self.clients.claim();
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
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
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

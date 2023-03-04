'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "favicon.png": "5dcef449791fa27946b3d35ad8803796",
"manifest.json": "9409e0e567ac7cac3c58e242bfb95827",
"version.json": "6c3d8871007a841ccbee9328173d7fed",
"canvaskit/canvaskit.js": "97937cb4c2c2073c968525a3e08c86a3",
"canvaskit/canvaskit.wasm": "3de12d898ec208a5f31362cc00f09b9e",
"canvaskit/profiling/canvaskit.js": "c21852696bc1cc82e8894d851c01921a",
"canvaskit/profiling/canvaskit.wasm": "371bc4e204443b0d5e774d64a046eb99",
"flutter.js": "a85fcf6324d3c4d3ae3be1ae4931e9c5",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/images/undraw_Add_files_re_v09g.png": "6209e0b4e0ef318a7783d01b2cc754a0",
"assets/images/undraw_empty_cart_co35.png": "c51344813c4b3e6748f1618b8ca756d3",
"assets/images/logo3.png": "f6c989045d62789227ada069cc65e71d",
"assets/images/login_bottom.png": "b473d9b1b30607e274348f114273a094",
"assets/images/main_top.png": "cd3220e276bb9dee0a1c7d18126aad72",
"assets/images/signup_top.png": "6eaad7a7b0febd05500366722015bd6d",
"assets/images/no-image-available.png": "5261fd4f3309cc2a739380ce875cc159",
"assets/images/404.png": "5b4567672b17c44f4e63eb35a9169cc0",
"assets/images/undraw_By_my_car_re_g0c3.png": "f9e948e5ee6de98e671010df5b538a13",
"assets/images/main_bottom.png": "322c8b4cda43fe21e0d78a1f30f387ce",
"assets/images/qr-code.png": "8e8e15983742bdda9ec8b75783135651",
"assets/images/car-tries.JPG": "ad038471e5f0855a6e13617228627354",
"assets/images/undraw_apartment_rent_o0ut.png": "d57f7f47ff71fbe813efd6ac7a5f5b5d",
"assets/images/car-wheel.PNG": "07a373555179fdf683eb4014c4dc8a51",
"assets/images/pp_white.png": "d3b8de3e1792c75fde2bb68bf7a8f85c",
"assets/images/error.png": "34a3c86257800bf5e90595c112370b19",
"assets/NOTICES": "1006f9423451c0614d41fe3758058151",
"assets/fonts/MaterialIcons-Regular.otf": "e7069dfd19b331be16bed984668fe080",
"assets/AssetManifest.json": "2efbb41d7877d10aac9d091f58ccd7b9",
"assets/icons/signup.svg": "2fa408c0387578db0675dc11edc3e0fa",
"assets/icons/undraw_access_account_re_8spm.svg": "1968c3a8b2133620d85bb39895d399b4",
"assets/icons/404.svg": "51d71eb62336d40aef9612c0169dcd38",
"assets/icons/undraw_by_my_car_re_g0c3.svg": "8d3dd45e9c51c45eb4315e296abab1e5",
"assets/icons/undraw_mobile_login_re_9ntv.svg": "065487440ff2d49a4507f5b081970856",
"assets/icons/undraw_forgot_password_re_hxwm.svg": "5e3305856b703dbfa57d983e904d4b9c",
"assets/icons/google-plus.svg": "4651560e3dee407a0a545610d5987ea3",
"assets/icons/undraw_sweet_home_dkhr.svg": "3e3b27d7fcddad0301fc214c9b3428f2",
"assets/icons/facebook.svg": "e44d4dd6594e6ae6718a89059f29cdc7",
"assets/icons/chat.svg": "6603c9da23d55c3ab75cf052cf2e5b53",
"assets/icons/undraw_add_files_re_v09g.svg": "9f55ed8a3293aa22f387a9e91b7d0c54",
"assets/icons/twitter.svg": "ce897e80d1e04fc007bce0cc770f07e7",
"index.html": "bb9edbae28a3369c1d941e85db1d08bb",
"/": "bb9edbae28a3369c1d941e85db1d08bb",
"main.dart.js": "40f235c40d8afcf86f848ad7cab311ad"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
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

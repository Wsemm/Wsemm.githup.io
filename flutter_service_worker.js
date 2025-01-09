'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "e13d5ff0b59b04921a687c69f82573c2",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "e7069dfd19b331be16bed984668fe080",
"assets/images/assets/admin/1.png": "115aa6e1ff3f03571fd7768858f64274",
"assets/images/assets/admin/10.png": "237c9c44d015da027b61d56372676c47",
"assets/images/assets/admin/11.png": "01af26f77c87ae7a8e295da4c66da5d8",
"assets/images/assets/admin/12.png": "415b930db81635aee5f1594aa8b8b6f6",
"assets/images/assets/admin/13.png": "fcfe18b8c089bf06b6ff23c9e59c9432",
"assets/images/assets/admin/14.png": "bb9bfef13daea5e2394f6e51d5ab8a32",
"assets/images/assets/admin/15.png": "be21150c85fb6ca759917459be2beff7",
"assets/images/assets/admin/16.png": "6c5c6b09971885f3301c8bd279b54634",
"assets/images/assets/admin/17.png": "f5e3c2d51777443dd414e08db3ca34f8",
"assets/images/assets/admin/2.png": "a3272170b6376fb85e4e99d14644369e",
"assets/images/assets/admin/3.png": "f70045bcc45999821eea8d80d6571e92",
"assets/images/assets/admin/4.png": "905b3db7f61a45a344b42a8c3ec65ba4",
"assets/images/assets/admin/5.png": "be0bd040811659c96ef280c266033c3c",
"assets/images/assets/admin/6.png": "eb2cee2f41183c2c726b04aae20de373",
"assets/images/assets/admin/7.png": "dc64ba00b035d663607efa01ba98e3ed",
"assets/images/assets/admin/8.png": "c15dc765f8f0b3f477edfb16979c40ad",
"assets/images/assets/admin/9.png": "600575b990ccb9c751cffced70df209c",
"assets/images/assets/admin/admin.png": "1b80e30caadff6c7957f00def6cf134d",
"assets/images/assets/delivery/1.png": "3cac230386501527edad437a879b2242",
"assets/images/assets/delivery/2.png": "2bbaad234a38a66f6e78f50033301416",
"assets/images/assets/delivery/3.png": "75b2fc3d87f9ad1b1f4f0c82a4efad45",
"assets/images/assets/delivery/4.png": "eaaab6748d99a605b536b34e22fd9d11",
"assets/images/assets/resume_1.png": "12ec2ec1785cade64fd6d3ab8b06567f",
"assets/images/assets/resume_1_1.png": "66ff7d61f8d164667771118c39e139a7",
"assets/images/assets/resume_1_2.png": "9d3fbe591e1e4ec10d1a44cd779fba98",
"assets/images/assets/resume_2.png": "b1f90c4dbba553f9c54a85e6026eb1ca",
"assets/images/assets/resume_3.png": "628757ca85d28b01ed3edaab47270b7c",
"assets/images/assets/resume_4.png": "6c8aacdffbcd608dde2f3d32050d5bc8",
"assets/images/assets/Screenshot_1.png": "664a95d025f3a27ebcb54eca4141e1fc",
"assets/images/assets/user/1.png": "f3723c16ae36c2c3c0933aef6f2c1e6f",
"assets/images/assets/user/10.png": "7500d8e13c36a0e68e57b1614b3eab8c",
"assets/images/assets/user/11.png": "401baee120f3bc7406435ed837ec328f",
"assets/images/assets/user/12.png": "0c0672e2fd7753ac1b42941b96d97b0b",
"assets/images/assets/user/13.png": "0948f5243793802a679624da97a0461d",
"assets/images/assets/user/14.png": "c7bb38253c4f526c8f38645d009a51c3",
"assets/images/assets/user/15.png": "7dff160bae281dc5874b9a34970dd6d2",
"assets/images/assets/user/16.png": "b84be982b5b1891d520a3c276872bfed",
"assets/images/assets/user/17.png": "7ca469f79a8a74f2b7d2660b4888e0ff",
"assets/images/assets/user/18.png": "32993d0dfc0038db1da5a7c6893014b6",
"assets/images/assets/user/19.png": "b02a2cac31617cfb001af635187a8e4b",
"assets/images/assets/user/2.png": "092d730e3e24c9d9749b7b1f86093cc1",
"assets/images/assets/user/20.png": "8891e84e8eec4a5e9c828719078f11f4",
"assets/images/assets/user/3.png": "761f3d3b1b186cf2ff535b5b55e65a59",
"assets/images/assets/user/4.png": "ebe4257644d022f5ecb04f738ac349cc",
"assets/images/assets/user/5.png": "53145285c964a7e704b0cdc2d8910151",
"assets/images/assets/user/6.png": "4a9a91965a546db3411e45d4c412209c",
"assets/images/assets/user/7.png": "3ca35f1534f43e9f168a9ffab82e749b",
"assets/images/assets/user/8.png": "584c486b089436432f1c72b695f3ae60",
"assets/images/assets/user/9.png": "26db005889ac9ae91153e7c6af8a0bb3",
"assets/images/assets/user/admin.png": "5354fee83d256d9ef9fe7dcf87aff7e5",
"assets/images/assets/user/delivery.png": "928bf03e355b48a13670f3d1c465d82d",
"assets/images/assets/user/test.png": "69e8f37672ce6f6759924d9f950e71d9",
"assets/images/assets/user/test1.png": "2c270f164acd7e95822c475f885af32a",
"assets/images/assets/user/test2.png": "6f9432b87782e9da351a0194c66b42e2",
"assets/images/assets/user/users.png": "163b31b16a7117b4d32f2d70416c23e7",
"assets/NOTICES": "ad61ea22a940209979f87d70a0f61a28",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"canvaskit/canvaskit.js": "97937cb4c2c2073c968525a3e08c86a3",
"canvaskit/canvaskit.wasm": "3de12d898ec208a5f31362cc00f09b9e",
"canvaskit/profiling/canvaskit.js": "c21852696bc1cc82e8894d851c01921a",
"canvaskit/profiling/canvaskit.wasm": "371bc4e204443b0d5e774d64a046eb99",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "a85fcf6324d3c4d3ae3be1ae4931e9c5",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "57db9d288f0768edca3651b2f8c5ad11",
"/": "57db9d288f0768edca3651b2f8c5ad11",
"main.dart.js": "fb0ef9d3b890feb1ba9abff5a82bfe76",
"manifest.json": "c9804b8bb8057d3a0268243480731776",
"version.json": "bc782111cf79e7f1be2389bfbe5997c7"
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

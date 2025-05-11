'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "7efe8347390cfe0d181142e3e53fc1e4",
"assets/AssetManifest.bin.json": "17de1c0b409626fdcc1056332762360a",
"assets/AssetManifest.json": "670c77babb4758610600bb1781b1e762",
"assets/assets/images/delicous/Screenshot_1746960672.png": "4b74579e63b68b0d99e39c2c59e17c6a",
"assets/assets/images/delicous/Screenshot_1746960686.png": "c9c40c8266b8e89380ce573f41d719ae",
"assets/assets/images/delicous/Screenshot_1746960690.png": "99a00092b4083dbfb7062c8030a5eb26",
"assets/assets/images/delicous/Screenshot_1746960709.png": "5a8d96197cd025bddbb126234bb5aa2d",
"assets/assets/images/delicous/Screenshot_1746960725.png": "4eaef8e992b7c3fde6ee0c857965f1ff",
"assets/assets/images/delicous/Screenshot_1746960741.png": "8790668e7b6510fee9448659cd1a9be7",
"assets/assets/images/ecommerce/Screenshot_1740924835.png": "ef65b2063dafdf0789d73f1fa30713fa",
"assets/assets/images/ecommerce/Screenshot_1740924848.png": "ac05cda6f7cc328a2a6b337e5a0728b6",
"assets/assets/images/ecommerce/Screenshot_1740924850.png": "7262506d3721adfc2a274f41a58363ce",
"assets/assets/images/ecommerce/Screenshot_1740924854.png": "6a89b0e10bfef5392de902e5656de0bf",
"assets/assets/images/ecommerce/Screenshot_1740924873.png": "7145904fad3da90ed0fd4b610cfafd57",
"assets/assets/images/ecommerce/Screenshot_1740924879.png": "202575fc6567cdff00546f9a9b454358",
"assets/assets/images/ecommerce/Screenshot_1740924898.png": "1de985f23c973bce01e0f3d8434ca2d5",
"assets/assets/images/ecommerce/Screenshot_1740924905.png": "865f8a4c946370e4f301136ee027eee8",
"assets/assets/images/ecommerce/Screenshot_1740924907.png": "476e9de40208ff8fb148732b1603b802",
"assets/assets/images/ecommerce/Screenshot_1740924909.png": "4d18af71bc5bbbd88fa52285d41bb007",
"assets/assets/images/ecommerce/Screenshot_1740924917.png": "402b5998b896ed6db69f61df6c92f6a4",
"assets/assets/images/ecommerce/Screenshot_1740924920.png": "d1a7352fb904302879199c7ba179f73d",
"assets/assets/images/ecommerce/Screenshot_1740924928.png": "c87c51c680425ef4dd47bbcf91f2cbaa",
"assets/assets/images/ecommerce/Screenshot_1740924939.png": "4e71d73f57f6ccd32bc4e08b03561d5a",
"assets/assets/images/ecommerce/Screenshot_1740924947.png": "efb552885bb9a324bf46c9d6b01242e4",
"assets/assets/images/ecommerce/Screenshot_1740924955.png": "84dcf793871391f4ba57c25371e718f7",
"assets/assets/images/ecommerce/Screenshot_1740924961.png": "812d17957860c3cf341806208f641b53",
"assets/assets/images/ecommerce/Screenshot_1740924979.png": "46079f3c9330e72c902e7dd802349bc2",
"assets/assets/images/kefak/Screenshot_1746962344.png": "1d25d11d7fc1391433310e301e56c545",
"assets/assets/images/kefak/Screenshot_1746962350.png": "0c66544ab455ced758a5baa7e57b2bb4",
"assets/assets/images/kefak/Screenshot_1746962401.png": "881a914e5f98c4f1f05da5f5b892f9c6",
"assets/assets/images/kefak/Screenshot_1746962404.png": "0c2be2dd4d36502f92d5fb9fcd1a1ba3",
"assets/assets/images/kefak/Screenshot_1746962426.png": "f4ec9f77f72a55a46608a865198d8b71",
"assets/assets/images/kefak/Screenshot_1746962437.png": "cb6e7f6a73b077748fa5c9ff1357baac",
"assets/assets/images/kefak/Screenshot_1746962768.png": "61ed9be58fc33083d8bab00e78c69297",
"assets/assets/images/kefak/Screenshot_1746962771.png": "52adbf752b5f5dad8c638eb9a29c0c41",
"assets/assets/images/kefak/Screenshot_1746962785.png": "8d12b79e71e0571f61130a316566ba26",
"assets/assets/images/kefak/Screenshot_1746962796.png": "898aedd434c2ad628191a949c458efe7",
"assets/assets/images/lemon/Screenshot_1746893685.png": "92b44c0970c552c8ffcdfdfde7b619fe",
"assets/assets/images/lemon/Screenshot_1746893696.png": "93530c1eaa39708530a985099f3b0fa6",
"assets/assets/images/lemon/Screenshot_1746893702.png": "001557634471967e6ab20877dd6bcc60",
"assets/assets/images/lemon/Screenshot_1746893705.png": "4791b933599c18c60ba034035a315ebf",
"assets/assets/images/lemon/Screenshot_1746893710.png": "5a9fe2347ea55d1974e85db9ede8f8ba",
"assets/assets/images/lemon/Screenshot_1746893717.png": "204b9fef959a54520dae68db300c7527",
"assets/assets/images/lemon/Screenshot_1746893726.png": "a9054d3ca28510484d2d6f5ddbfb5f8a",
"assets/assets/images/lemon/Screenshot_1746893737.png": "e8b74af69885fdada3101088f9604e86",
"assets/assets/images/lemon/Screenshot_1746893762.png": "b66c60883a2cb2594ddab42932d742c3",
"assets/assets/images/lemon/Screenshot_1746893785.png": "67676e8d0cfae7a0f5828460d815bbf9",
"assets/assets/images/lemon/Screenshot_1746893816.png": "0c84f4cec8b01b61b2c02af4205fa5fb",
"assets/assets/images/lemon/Screenshot_1746893837.png": "0479946939d2cdabc5e55e4d442c881c",
"assets/assets/images/lemon/Screenshot_1746893841.png": "a9d63b8f3285b3c821cfc06f6effa472",
"assets/assets/images/lemon/Screenshot_1746893867.png": "055e09f74f800a187048ea8e7d0921a0",
"assets/assets/images/lemon/Screenshot_1746893873.png": "279e53060c24a8733d555a9b97584815",
"assets/assets/images/lemon/Screenshot_1746893916.png": "b2b9f5d15bd2876361b90b66295102c5",
"assets/assets/images/lemon/Screenshot_1746893920.png": "054cffa745f0d1a861253500b41aa480",
"assets/assets/images/lemon/Screenshot_1746949585.png": "f887dee2c5eb50a53a56912d2b9d27bb",
"assets/assets/images/max-to-go/Screenshot_1746895142.png": "3dc8f788b9a6e2b21df8fa1ea94ab4d1",
"assets/assets/images/max-to-go/Screenshot_1746895245.png": "837e474ce0347baadc57ad89e852761e",
"assets/assets/images/max-to-go/Screenshot_1746895248.png": "79012b34c60c1c45aaefc24ca0b634cf",
"assets/assets/images/max-to-go/Screenshot_1746895665.png": "9173378bac6ca62fa3b096ff8f1a053a",
"assets/assets/images/max-to-go/Screenshot_1746895785.png": "6cf620bfbbb3aed154617d3f4aeed019",
"assets/assets/images/max-to-go/Screenshot_1746895803.png": "407d00985126d07a776a3c625777e290",
"assets/assets/images/max-to-go/Screenshot_1746896276.png": "e49e153dd74b57cf09e18b7b8defb0ca",
"assets/assets/images/max-to-go/Screenshot_1746896282.png": "a437d0c305e54eb1b16ccd0a036c98eb",
"assets/assets/images/max-to-go/Screenshot_1746896296.png": "ff7b9dcb643461cd6f1e7a0798d0a414",
"assets/assets/images/max-to-go/Screenshot_1746896307.png": "5720e72b988f3799b1b956cfc520d732",
"assets/assets/images/max-to-go/Screenshot_1746896314.png": "ab6f5472e355972c339393cccd2d79cc",
"assets/assets/images/max-to-go/Screenshot_1746896337.png": "1051b690970e598b3f848c14dd2f5f32",
"assets/assets/images/max-to-go/Screenshot_1746899180.png": "2ff9c8f8d9bc7bea5b6ebf6e5d021b73",
"assets/assets/images/max-to-go/Screenshot_1746899230.png": "7d51257a1cf2b31af0686179faa5b82f",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "be6364e40e1dd452e4145046bb41efec",
"assets/NOTICES": "f5a9955f19dcbace9625d360d18dce69",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "26eef3024dbc64886b7f48e1b6fb05cf",
"canvaskit/canvaskit.js.symbols": "efc2cd87d1ff6c586b7d4c7083063a40",
"canvaskit/canvaskit.wasm": "e7602c687313cfac5f495c5eac2fb324",
"canvaskit/chromium/canvaskit.js": "b7ba6d908089f706772b2007c37e6da4",
"canvaskit/chromium/canvaskit.js.symbols": "e115ddcfad5f5b98a90e389433606502",
"canvaskit/chromium/canvaskit.wasm": "ea5ab288728f7200f398f60089048b48",
"canvaskit/skwasm.js": "ac0f73826b925320a1e9b0d3fd7da61c",
"canvaskit/skwasm.js.symbols": "96263e00e3c9bd9cd878ead867c04f3c",
"canvaskit/skwasm.wasm": "828c26a0b1cc8eb1adacbdd0c5e8bcfa",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "4b2350e14c6650ba82871f60906437ea",
"flutter_bootstrap.js": "3ff68e7108bbcf3c9fa5363ef8476fce",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "ab52fa4329fc3a93833008ef07444569",
"/": "ab52fa4329fc3a93833008ef07444569",
"main.dart.js": "6c5ac196bb9fad03c1b3e9e595b48907",
"manifest.json": "d454795ec90f470ee481df70d1276310",
"version.json": "12a92ef79835b40a6093bcc932b54998"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
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

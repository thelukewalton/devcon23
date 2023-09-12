'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"version.json": "e44293df329f91bca180262a700827ff",
"index.html": "b18630a4f21ed5eb05a652f09a2f6396",
"/": "b18630a4f21ed5eb05a652f09a2f6396",
"main.dart.js": "60150200f36f7580b2994c684c719b79",
"flutter.js": "6fef97aeca90b426343ba6c5c9dc5d4a",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "d4f15494c44f3ae0c61db7af4a4dd267",
"assets/AssetManifest.json": "23d618717bac78cd79bc84641452ec12",
"assets/NOTICES": "c863682c00a5eaa045e41028724506a3",
"assets/FontManifest.json": "48780f26d25e313a410cb0b6e6bd6d6b",
"assets/packages/giphy_get/assets/img/GIPHY_light.png": "7c7ed0e459349435c6694a720236d5f4",
"assets/packages/giphy_get/assets/img/poweredby_dark.png": "e4fe68503ab5d004deb31e43636a0a7c",
"assets/packages/giphy_get/assets/img/poweredby_light.png": "439da1ed3ca70fb090eb98698485c21e",
"assets/packages/giphy_get/assets/img/GIPHY_dark.png": "13139c9681ad6a03a0f4a45030aee388",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "dfdbc03ced495f63e61ae8a788c2fd06",
"assets/packages/zeta_flutter/lib/src/assets/fonts/IBMPlexSans-Medium.otf": "6ea277ff8637af42ff46683e7b4e0d63",
"assets/packages/zeta_flutter/lib/src/assets/fonts/IBMPlexSans-Light.otf": "72ed01a73518190d1c5d36042b37a626",
"assets/packages/zeta_flutter/lib/src/assets/fonts/IBMPlexSans-Regular.otf": "05b9240dd80b2276729426b2be2e9947",
"assets/packages/material_symbols_icons/lib/fonts/MaterialSymbolsSharp%255BFILL,GRAD,opsz,wght%255D.ttf": "c783cdc04b37546d8ac439f5d9e79248",
"assets/packages/material_symbols_icons/lib/fonts/MaterialSymbolsOutlined%255BFILL,GRAD,opsz,wght%255D.ttf": "7e907fe19ba3ef9539cfff9feec9737a",
"assets/packages/material_symbols_icons/lib/fonts/MaterialSymbolsRounded%255BFILL,GRAD,opsz,wght%255D.ttf": "822361af6f05f702968361deb5244cd4",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "658b490c9da97710b01bd0f8825fce94",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "5070443340d1d8cceb516d02c3d6dee7",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "d7791ef376c159f302b8ad90a748d2ab",
"assets/packages/zds_flutter/lib/assets/strings/zh.json": "d8447e4e93ab608ee4b2a3d628a12c3d",
"assets/packages/zds_flutter/lib/assets/strings/tr.json": "e2f806c7163dd2dfe0cb8e872074e1a8",
"assets/packages/zds_flutter/lib/assets/strings/mk.json": "8fe1948d6a14887b109ccbc405f907fd",
"assets/packages/zds_flutter/lib/assets/strings/sl.json": "0a44d65ea07a863632a1c3d3c344469a",
"assets/packages/zds_flutter/lib/assets/strings/hu.json": "b604347444977b374b34c506d086945a",
"assets/packages/zds_flutter/lib/assets/strings/lt.json": "88b39031b9a7e0b76e2602b578d6e13f",
"assets/packages/zds_flutter/lib/assets/strings/zh_HK.json": "d8447e4e93ab608ee4b2a3d628a12c3d",
"assets/packages/zds_flutter/lib/assets/strings/fr_BE.json": "04355bd9ff128be081919a1fed1665e2",
"assets/packages/zds_flutter/lib/assets/strings/es_ES.json": "0dfb0ee9bad5b600d67c3882a3c4895d",
"assets/packages/zds_flutter/lib/assets/strings/nl.json": "d1fa3cb4e4e5dc796605859b5653a5c9",
"assets/packages/zds_flutter/lib/assets/strings/de_AT.json": "7b96eec3f9ef03cb51e9903915e94851",
"assets/packages/zds_flutter/lib/assets/strings/es_PE.json": "66b2471b20ac13239178b962e1d8c0c2",
"assets/packages/zds_flutter/lib/assets/strings/ja.json": "a9053469da899266d81f03449c93bbab",
"assets/packages/zds_flutter/lib/assets/strings/de.json": "7b96eec3f9ef03cb51e9903915e94851",
"assets/packages/zds_flutter/lib/assets/strings/es_CL.json": "372385b7fb4cc7054acb95383f58e0f1",
"assets/packages/zds_flutter/lib/assets/strings/ru.json": "b996cfdc6856e68c499bb50116ec667f",
"assets/packages/zds_flutter/lib/assets/strings/pl.json": "498a1515c9ac3d0cc8e390e6fcf8c73a",
"assets/packages/zds_flutter/lib/assets/strings/uk.json": "a8f970e0b974c90c370ba794c96eb9a6",
"assets/packages/zds_flutter/lib/assets/strings/en_CA.json": "6747d5f0af8fbd22711f4aa8c9c1ad57",
"assets/packages/zds_flutter/lib/assets/strings/fi.json": "c0a725d6bba269532b7d4e7f18d738a0",
"assets/packages/zds_flutter/lib/assets/strings/fr_CH.json": "04355bd9ff128be081919a1fed1665e2",
"assets/packages/zds_flutter/lib/assets/strings/sk.json": "52223c52bd839135a638bc9a36cbfdc8",
"assets/packages/zds_flutter/lib/assets/strings/pt.json": "eb4d5a03f12be77975264a47e48dcec7",
"assets/packages/zds_flutter/lib/assets/strings/en.json": "6747d5f0af8fbd22711f4aa8c9c1ad57",
"assets/packages/zds_flutter/lib/assets/strings/ka.json": "c59bf1b20ccb8af47ebc85e046cc8b4e",
"assets/packages/zds_flutter/lib/assets/strings/it.json": "53011908adb49930a61fc6e1a472f60c",
"assets/packages/zds_flutter/lib/assets/strings/sr.json": "e45e039ef6f3b4075e79008a80ff640d",
"assets/packages/zds_flutter/lib/assets/strings/hr.json": "9813be7a4f08831d2d737804cefbee5e",
"assets/packages/zds_flutter/lib/assets/strings/tl.json": "3c48afd6a922580fc31d71c698f98872",
"assets/packages/zds_flutter/lib/assets/strings/es_EC.json": "66b2471b20ac13239178b962e1d8c0c2",
"assets/packages/zds_flutter/lib/assets/strings/en_GB.json": "a1c08236d3e5c0e4434db175fa086924",
"assets/packages/zds_flutter/lib/assets/strings/de_CH.json": "492deb09c183d3725e7a872a97d75ed0",
"assets/packages/zds_flutter/lib/assets/strings/sq.json": "79f7fdfa6328eb8e247368b2001c0bce",
"assets/packages/zds_flutter/lib/assets/strings/in.json": "7013eacd720167433dc55519c7449709",
"assets/packages/zds_flutter/lib/assets/strings/bs.json": "7993650c181a0b672fa9755f573f635b",
"assets/packages/zds_flutter/lib/assets/strings/fr.json": "01ba2452bdd11b11d48d62725b7b38fc",
"assets/packages/zds_flutter/lib/assets/strings/el.json": "39fdde3f92205f60d8bb66cafedbd182",
"assets/packages/zds_flutter/lib/assets/strings/bg.json": "a6526d253874fd6214fe3c4ad60d607d",
"assets/packages/zds_flutter/lib/assets/strings/ro.json": "36f84f71983546e9a47690795fd1188f",
"assets/packages/zds_flutter/lib/assets/strings/ko.json": "f0212f1c6f34afcad209080f5f29a518",
"assets/packages/zds_flutter/lib/assets/strings/vi.json": "bf8d22c64c9c521ced872fb17f9fce2c",
"assets/packages/zds_flutter/lib/assets/strings/cs.json": "2a55d911d374d83255630caaa0b24c67",
"assets/packages/zds_flutter/lib/assets/strings/pt_BR.json": "e6a18901faeb0ccbc848c85fb190e9eb",
"assets/packages/zds_flutter/lib/assets/strings/lv.json": "95883875a01879208a2487831e9637c7",
"assets/packages/zds_flutter/lib/assets/strings/da.json": "65083263bed92c40f73844a41d7f77cf",
"assets/packages/zds_flutter/lib/assets/strings/th.json": "b462bfbad8eb75fd046068a6c6652cab",
"assets/packages/zds_flutter/lib/assets/strings/sv.json": "3c5664ee9fc8735a47753fd8a5262b23",
"assets/packages/zds_flutter/lib/assets/strings/es_UY.json": "66b2471b20ac13239178b962e1d8c0c2",
"assets/packages/zds_flutter/lib/assets/strings/es.json": "2bea7ba2b12f10f61b28f5baf1f7d76b",
"assets/packages/zds_flutter/lib/assets/strings/fr_CA.json": "364822436f4f88f6d9cc14eb88f3fa9c",
"assets/packages/zds_flutter/lib/assets/strings/ar.json": "588bb655f20d4d39126f3a8001bfc0ea",
"assets/packages/zds_flutter/lib/assets/strings/nb.json": "aa3ec0450022ad5e22e918dba4bb86e1",
"assets/packages/zds_flutter/lib/assets/strings/de_BE.json": "0a7d4bef95642311d4633186ba8d61c7",
"assets/packages/zds_flutter/lib/assets/strings/es_PR.json": "66b2471b20ac13239178b962e1d8c0c2",
"assets/packages/zds_flutter/lib/assets/images/search.svg": "79b7ce956cdf0a63c1af7c04be0956a2",
"assets/packages/zds_flutter/lib/assets/images/notes.svg": "5ca34a0734c621172f00cca3e6ee7f65",
"assets/packages/zds_flutter/lib/assets/images/load_fail.svg": "7c751f1b6a3d324f45730a20f0645706",
"assets/packages/zds_flutter/lib/assets/images/sleeping_zebra.svg": "8eb606f390f1bd27d5805790b83b4805",
"assets/packages/zds_flutter/lib/assets/images/completed_tasks.svg": "0dc32bc07940c6b4a5c9607ad7473191",
"assets/packages/zds_flutter/lib/assets/images/map.svg": "cb867dde3c42171f5149d5f47bdb1d8c",
"assets/packages/zds_flutter/lib/assets/images/cloud_fail.svg": "8a86ae2f4b82c4adcfafaeea80bc98df",
"assets/packages/zds_flutter/lib/assets/images/sad_zebra.svg": "f3c754f52a7679fb5275cb3902de459b",
"assets/packages/zds_flutter/lib/assets/images/chat.svg": "9c280d1b4a767df3784d10e463d7dee5",
"assets/packages/zds_flutter/lib/assets/images/server_fail.svg": "d20bc5ecaa1d0681198fd0289565f12f",
"assets/packages/zds_flutter/lib/assets/images/empty_box.svg": "34fcee2d89e36a035a22d687e57ccfdc",
"assets/packages/zds_flutter/lib/assets/images/punch.svg": "8e65a1dfaa58ec27ac40f7cbb88e4385",
"assets/packages/zds_flutter/lib/assets/images/calendar.svg": "8f8779a6f7c1cec4fec20ae3a5b04c6d",
"assets/packages/zds_flutter/lib/assets/images/notifications.svg": "a03c4a5e18990a6f598cc1c1c81bdaea",
"assets/packages/zds_flutter/lib/assets/fonts/selection.json": "a948f8250305213b3aabce1a325a3ee1",
"assets/packages/zds_flutter/lib/assets/fonts/zds.ttf": "a40c53c44b27664ca7da93f458594d3c",
"assets/packages/zds_flutter/lib/assets/animations/thumbs_up_approved.json": "3d1324d15e8f9b0b656f3aca3ef460f7",
"assets/packages/zds_flutter/lib/assets/animations/time_approved.json": "f231a4009d94c46fe7f2306496f9f70b",
"assets/packages/zds_flutter/lib/assets/animations/time_approved_glimmer.json": "611fe564b1e7121458985e9b1f6cb8e8",
"assets/packages/zds_flutter/lib/assets/animations/two_checks.json": "65a5bddc7a4fe4a1499be20af35c1e3c",
"assets/packages/zds_flutter/lib/assets/animations/check_glimmer.json": "1f46d17f1bd17217ba5eb116fa290287",
"assets/packages/zds_flutter/lib/assets/animations/thumbs_up.json": "087bcb9e38fab38104bf64a83faedba0",
"assets/packages/zds_flutter/lib/assets/animations/approval_stamped.json": "8f6527f26ce5c233fea820941c4adab9",
"assets/packages/zds_flutter/lib/assets/animations/check.json": "ca516f06102d727d8e25fb6fa70e747a",
"assets/packages/zds_flutter/lib/assets/animations/check_ripple.json": "74638175550f77bd357a48de6d36e4cb",
"assets/packages/zds_flutter/lib/assets/animations/check_circle.json": "0893f6c2feebfcd4bc66838ce67b3f06",
"assets/packages/zds_flutter/lib/assets/animations/time_approved_box.json": "f106c3354e66fd07eb82b382e03e7066",
"assets/packages/zds_flutter/lib/assets/animations/timecard_tapping.json": "1aa17c200fa6f3d743e4e63f61947cad",
"assets/packages/basic/assets/dash.png": "4491e8fc0a9d79cc8a630823975f6d7e",
"assets/packages/flutter_image_compress_web/assets/pica.min.js": "6208ed6419908c4b04382adc8a3053a2",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"assets/lib/assets/zebra-logo.svg.vec": "c9ef91af816ae2affb41ae759176e27d",
"assets/lib/assets/dash.png": "07fe1e8ce4fe25b97ac6f10da50b3c76",
"assets/lib/assets/MergeSemantics.svg.vec": "7b93d88e1cfd25dfdfbab11743b84bfa",
"assets/lib/assets/zebra-logo-stacked.svg.vec": "05fd4b346dfed8e6067aba2b3db04077",
"assets/lib/assets/dark_dash.png": "4718e7617e3127236e8547f261892025",
"assets/lib/assets/QChat.svg.vec": "9ab58a19055ac9d95d8432782b492255",
"assets/lib/assets/divider.png": "4494387e16468a3fcb812f33fe1f81bb",
"assets/lib/assets/comic.ttf": "69d77ab5cba970d7934a5f5bcd8fdd11",
"assets/lib/assets/voiceover.png": "5fc40c4ab8ec8002e5d5df30b405d3bf",
"assets/lib/assets/code.svg.vec": "1e24795da9779bca634c4b9636dcb674",
"assets/lib/assets/zsbapp.png": "ebb627f7fecbd37394048bc641b9c2e2",
"assets/lib/assets/intro.png": "1c04c4d069346aac85d597951740e981",
"assets/lib/assets/webviews.png": "49311ab26760b9b59690a37701fb6029",
"assets/lib/assets/logoBlack.svg.vec": "3caffa8c4e3b355ee6589e97ee6252c1",
"assets/lib/assets/blue2.jpg": "05612ed3943afee2749d79fcd8f51e8c",
"assets/lib/assets/logoWhite.svg.vec": "00431d9875775ef7f88b1c329922fb5e",
"assets/lib/assets/nativeish.png": "2b3880f41dfb85e44a40aecffe2a31c7",
"assets/lib/assets/end.png": "2d2933e161270da4da03c386025ff699",
"assets/lib/assets/IBMPlexMono.ttf": "ea96a0afddbe8ff439be465b16cbd381",
"assets/lib/assets/ID.png": "0be9e951370626ac485bb221a0a5bbf4",
"assets/lib/assets/arial.ttf": "fe6b41f2c2d2c7655ec1e44520667a13",
"assets/lib/assets/react.svg.vec": "77b6564b4828a316eab30fbe161f2488",
"assets/lib/assets/ESS.svg.vec": "5e00d7ccadd12471a4ab1ab217ad1e78",
"assets/lib/assets/qchat2.svg.vec": "9ab58a19055ac9d95d8432782b492255",
"assets/lib/assets/builtin.svg.vec": "09d0388c98a15aa58522b8704a98e2dd",
"assets/lib/assets/ExcludeSemantics.svg.vec": "64d500584102dfda0b2b033c821db29f",
"assets/lib/assets/talkback.png": "f27c35f5b4b5dbe68f02883a11cdd41c",
"assets/lib/assets/ZSB.png": "5eeb18e25716274c589a65b56638068e",
"assets/lib/assets/Semantics.svg.vec": "3ee2b9c3bf88021fbdfd7ca5de8a11b0",
"assets/lib/assets/Ess.png": "17f52fbbfcef52b4b2677efe1c4b87dd",
"assets/lib/assets/QChat.png": "b9348134718b4809149033abcb78ab1e",
"assets/AssetManifest.bin": "6e78d8d734b0a0a678280e6e35d322f1",
"assets/fonts/MaterialIcons-Regular.otf": "9dbdc0dd0048502de1f25dd31ee1ad06",
"canvaskit/skwasm.js": "95f16c6690f955a45b2317496983dbe9",
"canvaskit/skwasm.wasm": "d1fde2560be92c0b07ad9cf9acb10d05",
"canvaskit/chromium/canvaskit.js": "ffb2bb6484d5689d91f393b60664d530",
"canvaskit/chromium/canvaskit.wasm": "393ec8fb05d94036734f8104fa550a67",
"canvaskit/canvaskit.js": "5caccb235fad20e9b72ea6da5a0094e6",
"canvaskit/canvaskit.wasm": "d9f69e0f428f695dc3d66b3a83a4aa8e",
"canvaskit/skwasm.worker.js": "51253d3321b11ddb8d73fa8aa87d3b15"};
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

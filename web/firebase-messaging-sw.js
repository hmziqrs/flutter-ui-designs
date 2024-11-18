// Please see this file for the latest firebase-js-sdk version:
// https://github.com/firebase/flutterfire/blob/master/packages/firebase_core/firebase_core_web/lib/src/firebase_sdk_version.dart
console.log('[firebase-messaging-sw.js] Start loading...');
importScripts("https://www.gstatic.com/firebasejs/10.7.0/firebase-app-compat.js");
importScripts("https://www.gstatic.com/firebasejs/10.7.0/firebase-messaging-compat.js");
// importScripts('https://www.gstatic.com/firebasejs/9.0.0/firebase-app-compat.js');
// importScripts('https://www.gstatic.com/firebasejs/9.0.0/firebase-messaging-compat.js');


console.log('[firebase-messaging-sw.js] Imported scripts!');

firebase.initializeApp({
  apiKey: "AIzaSyAYQ0EZXBNVtoTNlkTQgUs7sOUYtdeTdGA",
  authDomain: "flutter-ui-challenges-hgl.firebaseapp.com",
  databaseURL: "https://flutter-ui-challenges-hgl.firebaseio.com",
  projectId: "flutter-ui-challenges-hgl",
  storageBucket: "flutter-ui-challenges-hgl.appspot.com",
  messagingSenderId: "322047224635",
  appId: "1:322047224635:web:16d105e8b9b35a62d2e51e",
  measurementId: "G-HS61TMQ4DZ"
});

console.log('[firebase-messaging-sw.js] Firebase initialized!');

// Necessary to receive background messages:
const messaging = firebase.messaging();
console.log('[firebase-messaging-sw.js] Messaging initialized!');

const isSupported = firebase.messaging.isSupported();
console.log('[firebase-messaging-sw.js] isSupported: ', isSupported);

messaging.onMessage = ((payload) => {
  console.log('[firebase-messaging-sw.js] Received foreground message ', payload);

  const notificationOptions = {
    body: payload.notification.body,
    icon: '/icons/Icon-192.png',
    badge: '/icons/Icon-192.png',
    tag: payload.notification.tag,
    data: payload.data
  };

  return self.registration.showNotification(
    payload.notification.title,
    notificationOptions
  );
});

// Optional:
messaging.onBackgroundMessage((payload) => {
  console.log('[firebase-messaging-sw.js] Received background message ', payload);

  const notificationOptions = {
    body: payload.notification.body,
    icon: '/icons/Icon-192.png',
    badge: '/icons/Icon-192.png',
    tag: payload.notification.tag,
    data: payload.data
  };

  return self.registration.showNotification(
    payload.notification.title,
    notificationOptions
  );
});

// Handle notification clicks
self.addEventListener('notificationclick', (event) => {
  console.log('[firebase-messaging-sw.js] Notification click: ', event);
  event.notification.close();
  
  // Add custom click handling here
  const urlToOpen = event.notification.data?.url || '/';
  
  event.waitUntil(
    clients.openWindow(urlToOpen)
  );
});


// messaging.

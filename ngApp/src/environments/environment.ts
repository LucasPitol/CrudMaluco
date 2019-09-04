// This file can be replaced during build by using the `fileReplacements` array.
// `ng build ---prod` replaces `environment.ts` with `environment.prod.ts`.
// The list of file replacements can be found in `angular.json`.

export const environment = {
	production: false,
	crudApiUrl: "http://localhost:11223/",

	// Your web app's Firebase configuration
	firebaseConfig: {
		apiKey: "AIzaSyAF5gAN5uJ71tydTbMKZwol1zzLTLjYFPE",
		authDomain: "crud-maluco.firebaseapp.com",
		databaseURL: "https://crud-maluco.firebaseio.com",
		projectId: "crud-maluco",
		storageBucket: "",
		messagingSenderId: "990961054227",
		appId: "1:990961054227:web:109d15e1665475ecef85e6"
	}
};

/*
 * In development mode, to ignore zone related error stack frames such as
 * `zone.run`, `zoneDelegate.invokeTask` for easier debugging, you can
 * import the following file, but please comment it out in production mode
 * because it will have performance impact when throw error
 */
// import 'zone.js/dist/zone-error';  // Included with Angular CLI.

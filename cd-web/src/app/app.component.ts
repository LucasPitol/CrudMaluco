import { Component, OnInit } from '@angular/core';
import firebase from 'firebase/app';
import 'firebase/database';

const firebaseConfig = {
  apiKey: "AIzaSyAF5gAN5uJ71tydTbMKZwol1zzLTLjYFPE",
  authDomain: "crud-maluco.firebaseapp.com",
  databaseURL: "https://crud-maluco.firebaseio.com",
  projectId: "crud-maluco",
  storageBucket: "crud-maluco.appspot.com",
  messagingSenderId: "990961054227",
  appId: "1:990961054227:web:5e98d37aaf49a682ef85e6",
  measurementId: "G-V9P5NR2LH2"
};

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})

export class AppComponent implements OnInit {
  title = 'cru-web';

  ngOnInit(): void {
    firebase.initializeApp(firebaseConfig)
    firebase.analytics()
  }
}

import { Router } from '@angular/router';
import { auth } from 'firebase/app';
import { AngularFireAuth } from '@angular/fire/auth';
import { AngularFirestore, AngularFirestoreDocument } from '@angular/fire/firestore';
import { Observable, of } from 'rxjs';
import { switchMap } from 'rxjs/operators'
import { Injectable } from '@angular/core';
import { User } from '../models/user';

@Injectable({ providedIn: 'root' })
export class AuthService {

    user: Observable<any>

    constructor(
        private afAuth: AngularFireAuth,
        private db: AngularFirestore,
        private router: Router
    ) {
        this.user = this.afAuth.authState.pipe(
            switchMap( user => {
                if (user)
                {
                    return this.db.doc<User>(`users/${user.uid}`).valueChanges()
                }
                else
                {
                    return of(null)
                }
            })
        )
    }

    async googleSignIn()
    {
        var provider = new auth.GoogleAuthProvider()

        var credential = await this.afAuth.auth.signInWithPopup(provider)

        return this.updateUserData(credential.user)
    }

    async signOut()
    {
        await this.afAuth.auth.signOut()
        return this.router.navigate(['/'])
    }

    updateUserData(user)
    {
        const userRef: AngularFirestoreDocument<User> = this.db.doc(`users/${user.uid}`)

        const data = {
            uid: user.uid,
            email: user.email,
            displayName: user.displayName,
            photoURL: user.photoURL
        }

        return userRef.set(data, { merge: true })
    }
}

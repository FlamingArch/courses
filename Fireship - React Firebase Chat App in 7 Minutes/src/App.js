import React, { useState, useRef } from "react";
import "./App.css";

import firebase from "firebase/app";
import "firebase/firestore";
import "firebase/auth";

import { useAuthState } from "react-firebase-hooks/auth";
import { useCollectionData } from "react-firebase-hooks/firestore";

firebase.initializeApp({
  apiKey: "AIzaSyA7tO2YtFAyctEBVOIDQ_QiKzoEtcmyECo",
  authDomain: "fireship-chatapp-reactfirebase.firebaseapp.com",
  projectId: "fireship-chatapp-reactfirebase",
  storageBucket: "fireship-chatapp-reactfirebase.appspot.com",
  messagingSenderId: "1053404310830",
  appId: "1:1053404310830:web:91df9022104f0753771ebf",
});

const auth = firebase.auth();
const firestore = firebase.firestore();

function App() {
  const [user] = useAuthState(auth);

  return (
    <div className="App">
      <header></header>

      <section>{user ? <ChatRoom /> : <SignIn />}</section>
    </div>
  );
}

function SignIn() {
  const signInWithGoogle = () => {
    const provider = new firebase.auth.GoogleAuthProvider();
    auth.signInWithPopup(provider);
  };
  return <button onClick={signInWithGoogle}>Sign in with Google</button>;
}

function SignOut() {
  return (
    auth.currentUser && <button onClick={() => auth.signOut()}>Sign Out</button>
  );
}

function ChatRoom() {
  const dummy = useRef();

  const messageRef = firestore.collection("messages");
  const query = messageRef.orderBy("createdAt").limit(25);

  const [messages] = useCollectionData(query, { idField: "id" });

  const [formValue, setFormValue] = useState("");

  const sendMessage = async (e) => {
    e.preventDefault();
    const { uid, photoURL } = auth.currentUser;
    await messageRef.add({
      text: formValue,
      createdAt: firebase.firestore.FieldValue.serverTimestamp(),
      uid,
      photoURL,
    });
    setFormValue("");
    dummy.current.scrollIntoView({ bheaviour: "smooth" });
  };

  return (
    <>
      <main>
        {messages &&
          messages.map((msg) => <ChatMessage key={msg.id} message={msg} />)}
      </main>
      <div ref={dummy}></div>
      <form>
        <input
          value={formValue}
          onChange={(e) => setFormValue(e.target.value)}
        />
        <button type="submit">🕊</button>
      </form>
    </>
  );
}

function ChatMessage(props) {
  const { text, uid, photoURL } = props.message;
  const messageClass = uid == auth.currentUser.uid ? "sent" : "received";
  return (
    <div className={`message ${messageClass}`}>
      <img src={photoURL} alt="" />
      <p>{{ text }}</p>
    </div>
  );
}
export default App;

// rules_version = '2';
// service cloud.firestore {
//   match /databases/{database}/documents {
  
//     match /{document=**} {
//       allow read, write: if false;
//     }
    
//     match /messages/{docId} {
//       allow read: if request.auth.uid != null;
//       allow create: if canCreateMessage();
//     }
    
//     function canCreateMessage() {
//       let isSignedIn = request.auth.uid != null;
//       let isOwner = request.auth.uid == request.resource.data.uid;
      
//       let isNotBanned = exists(
//       	/databases/${database}/documents/banned/$(request.auth.uid)
//       ) == false;
      
//       return isSignedIn && isOwner && isNotBanned;
//     }
    
//   }
// }
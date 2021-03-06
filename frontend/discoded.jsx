import React from 'react';
import configStore from './store/store';
import ReactDOM from 'react-dom';
import Root from './components/root';
//testing imports below this line

//testing imports above this line


document.addEventListener("DOMContentLoaded", () => {
  let store;
  if (window.currentUser) {
    const preloadedState = {  
      session: { currentUser: window.currentUser.id } 
    };
    store = configStore(preloadedState);
    delete window.currentUser;
  } else {
    store = configStore();
  }
  // V testing methods V
  // ^ testing methods ^
  const root = document.getElementById('root');
  ReactDOM.render(<Root store={store} />, root);
})

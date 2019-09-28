
import './scss/main.scss'
// import socket from "./socket"

const { Elm } = require('../src/Main.elm');

var jwt = localStorage.getItem('vote-monitor-cred');

var app = Elm.Main.init({flags: {jwt: (jwt ?  jwt  : "")}});


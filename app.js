var express = require("express");
var app = express();

app.get('/', function(req, res){
    res.send('Pipeline Jenkins file. Pull latest images, Deploy over ssh in Server Deploy'); 
});

// Only works on 3000 regardless of what I set environment port to or how I set [value] in app.set('port', [value]).
app.listen(3000);
// Test change commend
// them tren github
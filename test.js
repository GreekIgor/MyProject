console.log('testing');
var fb = require('firebird');
console.log(fb);
var cfg = require("./config").cfg;
var conn = fb.createConnection();
console.log(conn);
  conn.connect(cfg.db, cfg.user, cfg.password, cfg.role, function(){
     console.log("Connected to database");
    // conn.query("select * from rdb$relations", function(err,res){
	conn.query("select FIRST 20 * from CUSTOMER", function(err,res){
         if(err){ 
             console.log("error");
             console.log(err);
             return;  
         }
         console.log(res);
         var r = res.fetchSync("all",true);
         console.log(r);
         conn.disconnect();
     });
	  // Hello kitty

<<<<<<< HEAD
////***
=======

>>>>>>> 9022bceaed9647e4d72cf665706d1e5dec6aaf05
/// test proverka
});




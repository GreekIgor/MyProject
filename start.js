var fb  = require("./firebird");
sys = require("sys"); 
var con = fb.createConnection();
con.connectSync('test.fdb','sysdba','masterkey','');
con.querySync("insert into test (id,name) values (5, 'new one')");
var res = con.querySync("select * from test");
con.commitSync();
var rows = res.fetchSync("all",true);
console.log(sys.inspect(rows));

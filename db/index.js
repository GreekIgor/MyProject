


var test = function()
{
return 'HELLO 123';
}

function ConnectDB()
{
var options = {};
var Firebird = require('node-firebird');
options.host = '192.168.1.100';
options.port = 3050;
options.database = 'A4ON_DB';
options.user = 'SYSDBA';
options.password = 'masterkey';
options.lowercase_keys = false; // set to true to lowercase keys
options.role = null;            // default
options.pageSize = 4096;        // default when creating database

Firebird.attach(options, function(err, db) {

    if (err)
        throw err;

  db.query('SELECT FIRST 25 * FROM CUSTOMER', function(err, result) {
        // IMPORTANT: close the connection
		
		//console.log(result);
		//callback(result);
        db.detach();
		resolve(result); 
		});

});


}


exports = ConnectDB;
exports.test = test;




function input()
{
  var name=document.querySelector("#name");
  var name1=name.value;
  var sub=document.querySelector("#subject");
  var sub1=sub.value;
  var eml=document.querySelector("#email");
  var eml1=eml.value;
  var msg=document.querySelector("#msg1");
  var msg1=msg.value;
  alert(msg1);
  alert(name1);
  alert(sub1);
  alert(eml1);
  var mysql = require('mysql');

var con = mysql.createConnection({
host: "localhost:3306",
user: "root",
password: "",
database: "arsh"
});

con.connect(function(err) {
if (err) throw err;
console.log("Connected!");
//Insert a record in the "customers" table:
var sql = "INSERT INTO contact (Name, Email) VALUES ('ada','dadada')";
con.query(sql, function (err, result) {
if (err) throw err;
console.log("1 record inserted");
});
});

  
}
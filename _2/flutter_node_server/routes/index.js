var express = require("express");
var router = express.Router();
const mariadb = require("mariadb");

let pool = mariadb.createPool({
  host: "127.0.0.1",
  database: "mp",
  port: "3306",
  user: "root",
  password: "Gksekdud5610$",
});

// localhost:3000 로 접속 가능
function executeQuery(query) {
  return new Promise(function (resolve) {
    pool
      .getConnection()
      .then((conn) => {
        conn
          .query(query)
          .then((rows) => {
            conn.release();
            conn.end();

            resolve(rows);
          })
          .catch((err) => {
            conn.release();
            conn.end();

            console.log("query err-----------");
            console.log(err);
          });
      })
      .catch((err) => {
        console.log("connect err-----------");
        console.log(err);
      });
  });
}

/* GET home page. */
router.get("/", function (req, res, next) {
  res.render("index", { title: "Express" });
});

//get list
router.get("/list", async function (req, res, next) {
  let query = await executeQuery(`
    SELECT * FROM list;
  `);

  return res.send(query);
});

module.exports = router;

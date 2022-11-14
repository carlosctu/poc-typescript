import pg from "pg";
var Pool = pg.Pool;
var connection = new Pool({
    host: "localhost",
    port: 5432,
    user: "postgres",
    password: "123456",
    database: "moviesstore"
});
export default connection;

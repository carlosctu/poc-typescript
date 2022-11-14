var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __generator = (this && this.__generator) || function (thisArg, body) {
    var _ = { label: 0, sent: function() { if (t[0] & 1) throw t[1]; return t[1]; }, trys: [], ops: [] }, f, y, t, g;
    return g = { next: verb(0), "throw": verb(1), "return": verb(2) }, typeof Symbol === "function" && (g[Symbol.iterator] = function() { return this; }), g;
    function verb(n) { return function (v) { return step([n, v]); }; }
    function step(op) {
        if (f) throw new TypeError("Generator is already executing.");
        while (_) try {
            if (f = 1, y && (t = op[0] & 2 ? y["return"] : op[0] ? y["throw"] || ((t = y["return"]) && t.call(y), 0) : y.next) && !(t = t.call(y, op[1])).done) return t;
            if (y = 0, t) op = [op[0] & 2, t.value];
            switch (op[0]) {
                case 0: case 1: t = op; break;
                case 4: _.label++; return { value: op[1], done: false };
                case 5: _.label++; y = op[1]; op = [0]; continue;
                case 7: op = _.ops.pop(); _.trys.pop(); continue;
                default:
                    if (!(t = _.trys, t = t.length > 0 && t[t.length - 1]) && (op[0] === 6 || op[0] === 2)) { _ = 0; continue; }
                    if (op[0] === 3 && (!t || (op[1] > t[0] && op[1] < t[3]))) { _.label = op[1]; break; }
                    if (op[0] === 6 && _.label < t[1]) { _.label = t[1]; t = op; break; }
                    if (t && _.label < t[2]) { _.label = t[2]; _.ops.push(op); break; }
                    if (t[2]) _.ops.pop();
                    _.trys.pop(); continue;
            }
            op = body.call(thisArg, _);
        } catch (e) { op = [6, e]; y = 0; } finally { f = t = 0; }
        if (op[0] & 5) throw op[1]; return { value: op[0] ? op[1] : void 0, done: true };
    }
};
import connection from "../database/db.js";
//CREATE
function insertMovie(movie) {
    return __awaiter(this, void 0, void 0, function () {
        return __generator(this, function (_a) {
            return [2 /*return*/, connection.query("INSERT INTO movies (name, genre, platforms)\n    VALUES($1, $2, $3) RETURNING id;", [movie.name, movie.genre, movie.platforms])];
        });
    });
}
//READ
function getAllMovies() {
    return __awaiter(this, void 0, void 0, function () {
        return __generator(this, function (_a) {
            return [2 /*return*/, connection.query("\n    SELECT m.id, m.name, g.id as \"genreId\", g.name as \"genre\", p.id as \"platformId\", p.name as \"platform\", m.created_at\n    FROM movie_platforms mp\n    RIGHT JOIN movies m ON m.id = mp.movie_id\n    INNER JOIN platforms p ON p.id = mp.platform_id\n    LEFT JOIN genres g ON g.id = m.genre\n    GROUP BY m.id, p.id, p.name, g.id, g.name\n    ORDER BY m.id;")];
        });
    });
}
//UPDATE
function updateMovie(id, movie) {
    return __awaiter(this, void 0, void 0, function () {
        return __generator(this, function (_a) {
            return [2 /*return*/, connection.query("UPDATE movies SET name = $1, genre = $2 WHERE id = $3;", [movie.name, movie.genre, id])];
        });
    });
}
//DELETE
function deleteMovie(id) {
    return __awaiter(this, void 0, void 0, function () {
        return __generator(this, function (_a) {
            return [2 /*return*/, connection.query("DELETE FROM movies WHERE id = $1;", [id])];
        });
    });
}
function addMovieIntoPlatform(movie_id, platform_id) {
    return __awaiter(this, void 0, void 0, function () {
        return __generator(this, function (_a) {
            return [2 /*return*/, connection.query("INSERT INTO movie_platforms (movie_id, platform_id) VALUES ($1,$2);", [movie_id, platform_id])];
        });
    });
}
function getMoviesByStreamingPlatform(platformId) {
    return __awaiter(this, void 0, void 0, function () {
        return __generator(this, function (_a) {
            return [2 /*return*/, connection.query(" SELECT m.id, m.name, g.id as \"genreId\", g.name as \"genre\", p.id as \"platformId\", p.name as \"platform\", m.created_at\n    FROM movie_platforms mp\n    RIGHT JOIN movies m ON m.id = mp.movie_id\n    INNER JOIN platforms p ON p.id = mp.platform_id\n    LEFT JOIN genres g ON g.id = m.genre\n    WHERE p.id = $1\n    GROUP BY m.id, p.id, p.name, g.id, g.name\n    ORDER BY m.id;", [platformId])];
        });
    });
}
export { insertMovie, getAllMovies, updateMovie, deleteMovie, addMovieIntoPlatform, getMoviesByStreamingPlatform, };

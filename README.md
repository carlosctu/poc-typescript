# POC-TYPESCRIPT
```bash
GENRES:
1: horror,
2: comedy,
3: action,
4: adventure,
5: drama,
6: fantasy

PLATFORMS:
1: Netflix,
2: Disney+,
3: Amazon Prime,
4: CrunchyRoll

```
## Routes:

- /movies (GET)
```bash
{
  "Movies": [
    {
      "id": 30,
      "name": "TOP GUN: MAVERICK",
      "genreId": 3,
      "genre": "action",
      "platformId": 1,
      "platform": "Netflix",
      "created_at": "2022-11-14T01:20:55.432Z"
    },
    {
      "id": 30,
      "name": "TOP GUN: MAVERICK",
      "genreId": 3,
      "genre": "action",
      "platformId": 2,
      "platform": "Disney+",
      "created_at": "2022-11-14T01:20:55.432Z"
    },
  ]
 }
```
- /movies (POST)
```bash
{
  "name": "THE BATMAN",
  "genre": "2",
  "platforms": [1,2,3,4]
}
```
- /movies/:id (PUT)
```bash
{
  "name": "THE BATMAN",
  "genre": "2"
}
```
- /movies/:id (DELETE)
```bash
{
  "name": "THE BATMAN",
  "genre": "2"
}
```
- /movies/platform/:id (GET)
```bash
{
  "Movies": [
    {
      "id": 32,
      "name": "THE BATMAN",
      "genreId": 2,
      "genre": "comedy",
      "platformId": 4,
      "platform": "CrunchyRoll",
      "created_at": "2022-11-14T01:22:02.069Z"
    },
    {
      "id": 34,
      "name": "ANNABELLE",
      "genreId": 1,
      "genre": "horror",
      "platformId": 4,
      "platform": "CrunchyRoll",
      "created_at": "2022-11-14T01:22:25.433Z"
    },
  ]
 }
```

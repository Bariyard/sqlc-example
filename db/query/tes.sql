-- name: GetUser :one
SELECT * from "user"
WHERE username = $1 LIMIT 1;


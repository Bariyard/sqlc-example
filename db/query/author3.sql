
-- name: DeleteUser :exec
DELETE FROM "user"
WHERE username = $1;

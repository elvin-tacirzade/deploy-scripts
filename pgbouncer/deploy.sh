echo "load env.."
. env.sh
bash ../remove.sh "$CONTAINER_NAME"
sudo docker run --detach \
  --name "$CONTAINER_NAME" \
  --env=POSTGRESQL_USERNAME="$POSTGRESQL_USERNAME" \
  --env=POSTGRESQL_PASSWORD="$POSTGRESQL_PASSWORD" \
  --env=POSTGRESQL_DATABASE="$POSTGRESQL_DATABASE" \
  --env=PGBOUNCER_DATABASE="$PGBOUNCER_DATABASE" \
  --env=PGBOUNCER_POOL_MODE="$PGBOUNCER_POOL_MODE" \
  --network="$NETWORK" \
  --volume "$DATA_PATH":/opt/bitnami/pgbouncer/conf \
  --restart unless-stopped \
  bitnami/pgbouncer:"$VERSION"

#!/usr/bin/env bash

set -e


role=${CONTAINER_ROLE:-app}

echo "The role is: $role"


if [ "$role" = "app" ]; then

    exec apache2-foreground

elif [ "$role" = "queue" ]; then

    echo "Running the queue"
    php /var/www/html/artisan queue:work --verbose --tries=3 --timeout=90

else

    echo "Could not match the container role \"$role\""
    exit 1

fi
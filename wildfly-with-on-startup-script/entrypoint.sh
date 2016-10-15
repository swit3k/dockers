#!/bin/sh

# Turn on monitoring
set -m

# Fire up Wildfly & move it to background
./bin/standalone.sh -b 0.0.0.0 -bmanagement 0.0.0.0 -c standalone-full.xml &

# Wait until Admin's console is ready
until curl localhost:9990 --silent 1>/dev/null; do
    sleep 1
done

# Call $ON_STARTUP_SCRIPT if exists
ON_STARTUP_SCRIPT=$SCRIPTS_DIR/on_startup.sh

if [ -e $ON_STARTUP_SCRIPT ]
then
    chmod +x $ON_STARTUP_SCRIPT
    ./$ON_STARTUP_SCRIPT
else
    echo "No startup script."
fi

# Bring Wildfly back to foreground
fg

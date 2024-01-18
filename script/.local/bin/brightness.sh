#!/bin/sh

VOLUME=$(light)
# get first percent value
VOLUME=${VOLUME%%%*}
VOLUME=${VOLUME##* }

TEXT="Brightness: ${VOLUME}%"

notify-send \
    --app-name sway \
    --expire-time 800 \
    --hint string:x-canonical-private-synchronous:volume \
    --hint "int:value:$VOLUME" \
    --hint "int:transient:1" \
    "${TEXT}"

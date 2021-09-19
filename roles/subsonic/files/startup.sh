#!/bin/sh
HOME=/data
HOST=0.0.0.0
PORT=4040
SSL_PORT=4141
CONTEXT_PATH=/
MAX_MEMORY=200
MUSIC_FOLDER=/music
PODCAST_FOLDER=/podcasts
PLAYLIST_FOLDER=/playlists


SUBSONIC_USER=downloads

export LANG=POSIX
export LC_ALL=en_US.UTF-8

/opt/subsonic/subsonic.sh --home=$HOME \
                  --host=$HOST \
                  --port=$PORT \
	          --https-port=$SSL_PORT \
                  --max-memory=$MAX_MEMORY \
                  --default-music-folder=$MUSIC_FOLDER \
		  --default-podcast-folder=$PODCAST_FOLDER \
                  --default-playlist-folder=$PLAYLIST_FOLDER

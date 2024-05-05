# Ansible NAS

[![Build Status](https://img.shields.io/travis/com/davestephens/ansible-nas/master?logo=travis&style=flat-square)](https://travis-ci.com/davestephens/ansible-nas) [![Gitter chat](https://img.shields.io/gitter/room/ansible-nas/chat.svg?logo=gitter&style=flat-square)](https://gitter.im/Ansible-NAS/Chat) [![license](https://img.shields.io/github/license/DAVFoundation/api_doc.svg?style=flat-square)](https://github.com/davestephens/ansible-nas/blob/master/LICENSE) [![Ko-fi](https://img.shields.io/static/v1.svg?label=ko-fi&message=Buy%20Me%20A%20Coffee&color=orange&style=flat-square&logo=buy-me-a-coffee)](https://ko-fi.com/davestephens)

After getting burned by broken FreeNAS updates one too many times, I figured I
could do a much better job myself using just a stock Ubuntu install, some clever
Ansible config and a bunch of Docker containers.

## What Ansible-NAS Can Set Up

* An awesome dashboard to your home server (Heimdall)
* Any number of Samba shares or NFS exports for you to store your stuff
* A BitTorrent client
* A Usenet downloader
* Various media management tools - Sonarr, Sickchill, CouchPotato, Radarr, Bazarr, Lidarr
* Media streaming via Plex or Emby
* Music streaming with Airsonic
* An RSS newsfeed reader - Miniflux
* A Dropbox replacement via Nextcloud
* Various ways to see stats about your NAS - Glances, dashboards in Grafana
* A backup tool - allows scheduled backups to Amazon S3, OneDrive, Dropbox etc
* An IRC bouncer and web-based client
* Source control with Gitea
* SSL secured external access to applications via Traefik
* A Docker host with Portainer for image and container management
* An automatic dynamic DNS updater if you use Cloudflare to host your domain DNS
* A Personal finance manager
* eBook management with Calibre-web
* Content management with Joomla
* A dual panel local file manager
* Self-service media request web application

### Available Applications

* [Airsonic](https://airsonic.github.io/) - catalog and stream music
* [AudioBookShelf](retract-unwanted-celtic-aptly) - self-hosted audiobook and podcast server
* [Authentik](https://github.com/goauthentik/authentik) - an open-source Identity Provider that emphasizes flexibility and versatility
* [Bazarr](https://github.com/morpheus65535/bazarr) - companion to Radarr and Sonarr for downloading subtitles
* [Bitwarden_rs](https://github.com/dani-garcia/bitwarden_rs) - Self-Hosting port of password manager
* [Calibre-web](https://github.com/janeczku/calibre-web) - Provides a clean interface for browsing, reading and downloading eBooks using an existing Calibre database.
* [Cloud Commander](https://cloudcmd.io/) - A dual panel file manager with integrated web console and text editor
* [Cloudflare DDNS](https://hub.docker.com/r/joshuaavalon/cloudflare-ddns/) - automatically update Cloudflare with your IP address
* [CouchPotato](https://couchpota.to/) - for downloading and managing movies
* [Deluge](https://dev.deluge-torrent.org/) - A lightweight, Free Software, cross-platform BitTorrent client.
* [Dozzle](https://github.com/amir20/dozzle) - Dozzle is a small lightweight application with a web based interface to monitor Docker logs
* [Duplicati](https://www.duplicati.com/) - for backing up your stuff
* [Emby](https://emby.media/) - Media streaming and management
* [ExpressVPN](https://www.expressvpn.com/) - ExpressVPN client
* [Firefly III](https://firefly-iii.org/) - Free and open source personal finance manager
* [get_iplayer](https://github.com/get-iplayer/get_iplayer) - download programmes from BBC iplayer
* [Gitea](https://gitea.io/en-us/) - Simple self-hosted GitHub clone
* [GitLab](https://about.gitlab.com/features/) - Self-hosted GitHub clone of the highest order
* [Glances](https://nicolargo.github.io/glances/) - for seeing the state of your system via a web browser
* [Grafana](https://github.com/grafana/grafana) - Dashboarding tool
* [Guacamole](https://guacamole.apache.org/) - Web based remote desktop gateway, supports VNC, RDP and SSH
* [Heimdall](https://heimdall.site/) - Home server dashboard
* [Home Assistant](https://www.home-assistant.io) - Open source home automation
* [Immich](https://github.com/immich-app/immich) - High performance self-hosted photo and video management solution
* [InfluxDB](https://github.com/influxdata/influxdb) - Time series database used for stats collection
* [Jackett](https://github.com/Jackett/Jackett) - API Support for your favorite torrent trackers
* [Jellyfin](https://jellyfin.github.io) - The Free Software Media System
* [Joomla](https://www.joomla.org/) - Open source content management system
* [Krusader](https://krusader.org/) - Twin panel file management for your desktop
* [Lidarr](https://github.com/lidarr/Lidarr) - Music collection manager for Usenet and BitTorrent users
* [Komga](https://komga.org/) - a media server for your comics, mangas, BDs and magazines
* [MineCraft](https://www.minecraft.net) - It's MineCraft...
* [MiniDLNA](https://sourceforge.net/projects/minidlna/) - simple media server which is fully compliant with DLNA/UPnP-AV clients
* [Miniflux](https://miniflux.app/) - An RSS news reader
* [Monitorr](https://github.com/Monitorr/Monitorr) - Monitorr is a webfront to live display the status of any webapp or service
* [Mosquitto](https://mosquitto.org) - An open source MQTT broker
* [Mylar](https://github.com/evilhero/mylar) - An automated Comic Book downloader (cbr/cbz) for use with SABnzbd, NZBGet and torrents
* [MyMediaForAlexa](https://www.mymediaalexa.com/) - Lets you stream your music collection to your alexa device
* [MuxiMux](https://github.com/mescon/Muximux) - Lightweight portal to your webapps
* [n8n](https://n8n.io") - Nodemation, a node based workflow and automation service like IFTTT.
* [Netdata](https://my-netdata.io/) - An extremely comprehensive system monitoring solution
* [Nextcloud](https://nextcloud.com/) - A self-hosted Dropbox alternative
* [NZBget](https://nzbget.net/) - The most efficient usenet downloader
* [Ombi](https://ombi.io/) - web application that automatically gives your users the ability to request content
* [OpenVPN](https://openvpn.net/) - OpenVPN client
* [Organizr](https://organizr.app/) - ORGANIZR aims to be your one stop shop for your Servers Frontend.
* [Overseerr](https://github.com/sct/overseerr) - Overseerr is a free and open source software application for managing requests for your media library
* [openHAB](https://www.openhab.org/) - A vendor and technology agnostic open source automation software for your home
* [OwnCloud](https://owncloud.com/) - share files and folders, easy and secure
* [piHole](https://pi-hole.net/) - Network-wide Ad Blocking
* [Plex](https://www.plex.tv/) - Plex Media Server
* [Portainer](https://portainer.io/) - for managing Docker and running custom images
* [Prometheus](https://prometheus.io/) - Monitoring system & time series database (includes: node_exporter, cadvisor)
* [Prowlarr](https://github.com/Prowlarr/Prowlarr) - Prowlarr supports management of both Torrent Trackers and Usenet Indexers. It integrates seamlessly with Lidarr, Mylar3, Radarr, Readarr, and Sonarr
* [Pushover](https://pushover.net/) - a service to receive instant push notifications on your phone or tablet from a variety of sources.
* [pyLoad](https://pyload.net/) - A download manager with a friendly web-interface
* [PyTivo](http://pytivo.org) - An HMO and GoBack server for TiVos.
* [Radarr](https://radarr.video/) - for organising and downloading movies
* [Readarr](https://github.com/Readarr/Readarr) - Readarr is an ebook and audiobook collection manager for Usenet and BitTorrent users
* [Sabnzbd](https://sabnzbd.org/) - Free and easy binary newsreader
* [Scrutiny](https://github.com/AnalogJ/scrutiny) - WebUI for smartd S.M.A.R.T monitoring
* [Sickchill](https://sickchill.github.io/) - for managing TV episodes
* [Sonarr](https://sonarr.tv/) - for downloading and managing TV episodes
* [Speedtest-tracker](retract-unwanted-celtic-aptly) - self-hosted internet performance tracking application that runs speedtest checks against Ookla's Speedtest service
* [Syncthing](https://syncthing.net/) - sync directories with another device
* [Subsonic](http://www.subsonic.org/) - catalog and music streaming (og)
* [Tautulli](http://tautulli.com/) - Monitor Your Plex Media Server
* [Telegraf](https://github.com/influxdata/telegraf) - Metrics collection agent
* [The Lounge](https://thelounge.chat) - Web based always-on IRC client
* [TimeMachine](https://github.com/awlx/samba-timemachine) - Samba-based mac backup server
* [Traefik](https://traefik.io/) - Web proxy and SSL certificate manager
* [Transmission](https://transmissionbt.com/) - BitTorrent client (with OpenVPN if you have a supported VPN provider)
* [Trilium](https://github.com/zadam/trilium) - Trilium Notes is a hierarchical note taking application with focus on building large personal knowledge bases.
* [Ubooquity](http://vaemendis.net/ubooquity/) - Book and comic server
* [umi](https://github.com/umijs/umi) - A React Crunchyroll frontend
* [Uptime-Kuma](https://github.com/louislam/uptime-kuma) - Uptime Kuma is an easy-to-use self-hosted monitoring tool
* [uTorrent](https://www.utorrent.com/) - The best torrent downloading app for beginners
* [Varken](https://github.com/Boerderij/Varken) - aggregate data from the Plex ecosystem into InfluxDB
* [Virtual Desktop](https://github.com/RattyDAVE/docker-ubuntu-xrdp-mate-custom) - A virtual desktop running on your NAS.
* [Wallabag](https://wallabag.org/) - Save and classify articles. Read them later.
* [Watchlistarr](https://github.com/nylonee/watchlistarr) - Sync plex watchlists in realtime with Sonarr and Radarr
* [Watchtower](https://github.com/v2tec/watchtower) - Monitor your Docker containers and update them if a new version is available
* [wg-easy](https://github.com/wg-easy/wg-easy) - The easiest way to install & manage WireGuard on any Linux host
* [wyze-bridge](https://github.com/mrlt8/docker-wyze-bridge) - https://github.com/mrlt8/docker-wyze-bridge
* [YouTubeDL-Material](https://github.com/Tzahi12345/YoutubeDL-Material) - Self-hosted YouTube downloader built on Material Design
* [ZNC](https://wiki.znc.in/ZNC) - IRC bouncer to stay connected to favourite IRC networks and channels

## What This Could Do

Ansible-NAS can run anything that's in a Docker image, which is why Portainer is
included. A NAS configuration is a pretty personal thing based on what you
download, what media you view, how many photos you take...so it's difficult to
please everyone.

That said, if specific functionality you want isn't included and you think
others could benefit, add it and raise a PR!

## What This Doesn't Do

Ansible NAS doesn't set up your disk partitions, primarily because getting it wrong can be incredibly destructive.
That aside, configuring partitions is usually a one-time (or very infrequent) event, so there's not much to be
gained by automating it. Check out the [docs](https://davestephens.github.io/ansible-nas) for recommended setups.

## Installation

See [Installation](https://davestephens.github.io/ansible-nas/installation/).

## Upgrading

**The way Ansible-NAS configuration is structured has changed!** See [Upgrading](https://davestephens.github.io/ansible-nas/upgrading/) for more information. See the **Getting Help** section if you get stuck.

## Documentation

You can read the docs [here](https://davestephens.github.io/ansible-nas). PRs
for more documentation always welcome!

## Migrating from FreeNAS

Assuming that your Ubuntu system disk is separate from your storage (it should be!):

1. Ensure you have a working backup of your data.
2. Check that the working backup you think you have actually works.
3. SSH to the server and run `zpool list` to determine available ZFS pools.
4. `zpool import <pool_name>` against each of the pools you want to attach.
5. `chown -R root:root /mnt/<pool_name>` to fix the ownership of the data.
6. Follow the Quick Start instructions above.

## Requirements

* Ansible NAS targets the latest Ubuntu LTS release, which is currently Ubuntu
  Server 20.04 LTS.
* You can run Ansible-NAS on whatever you like, read the docs for more info. I
  use an HP Microserver.

## Getting Help

Getting help is easy! You can:

* Read the [docs](https://davestephens.github.io/ansible-nas)
* Start a [discussion](https://github.com/davestephens/ansible-nas/discussions)
* Raise an [issue](https://github.com/davestephens/ansible-nas/issues) if you think you've found a bug
* Chat on [Gitter](https://gitter.im/Ansible-NAS/Chat)

## Contributing

Contributions are always welcome! Please read [CONTRIBUTING.md](CONTRIBUTING.md) first.

## Support

If you've enjoyed Ansible-NAS as much as I do working on it, please consider [buying me a coffee](https://ko-fi.com/davestephens) :coffee:

## Thanks

Thanks to the awesome dudes at [JetBrains](https://www.jetbrains.com/?from=Ansible-NAS) for supplying core contributors with JetBrains Open Source licenses!

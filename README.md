# Snaplet Demo App: "VideoLet"

This is an example application (Written in RedwoodJS) that's used to demonstrate some of the power of [Snaplet](https://snaplet.dev).

For this demo to be effective try to imagine that you just got hired at "VideoLet," a struggling video rental chain (See ["Video Rental Shop"](https://en.wikipedia.org/wiki/Video_rental_shop), and [THE LAST BLOCKBUSTER](https://www.youtube.com/watch?v=Ov9ls_3tJ1Y)), as the new webmaster! Congrats... you're desperately needed to breathe fresh life into the website.

Good luck!

## Setup

```terminal
yarn install
yarn rw dev
```

In order to restore a snapshot you need access to the VideoLet organization on Snaplet.
Ask ["peterp" on Discord](https://discord.com/invite/aNSMaWtjKx) to add your to the VideoLet organization on Snaplet, then install [Snaplet CLI](https://www.notion.so/snaplet/CLI-Installation-332b17f65b8f41bc924352cbfbecee8d).

```terminal
snaplet auth
✔ Logged in as: webmaster@videolet.test

snaplet restore
Fetching latest snapshot...
```
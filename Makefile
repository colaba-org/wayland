

$ cc -o server server.c -lwayland-server
$ ./server &
Running Wayland display on wayland-1
$ WAYLAND_DISPLAY=wayland-1 ./client
Connection established!


$ cc -o client client.c -lwayland-client
$ ./client
Connection established!
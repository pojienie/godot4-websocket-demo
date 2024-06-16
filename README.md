# what is this project

This is a project for demonstrating how to set Godot web socket server and client up for testing purpose.

# steps to use this project

1. run `openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout key.key -out cert.crt`
* when entering common name, enter the server's IP address (e.g. 192.168.100.123).
* leave empty for all other fields
2. copy the `key.key` and `cert.crt` to `ssl` and `output/web` directory
3. export the project (to both Linux and web)
4. copy everything in the `output` directory to the server

# server

1. modify `output/web/webserver.py` IP address to match the server's IP address
2. run `cd output/web && python webserver.py`
3. open another terminal and run `cd output && ./godot4WebsocketDemo.x86_64 --headless`

# browser

1. access `https://<server ip>:8888` and `https://<server ip>:8443` and add exception to both web addresses
* after this is done, restart `./godot4WebsocketDemo.x86_64`
2. access `https://<server ip>:8443`
3. enter server IP
4. click on connect

# result

after all the steps, you should see a "<connection ID> connect" message on the server side. It means the Websocket server and client successfully connected to each other!

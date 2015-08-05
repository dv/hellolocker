server {
    listen 80;
    server_name hellolocker.com *.hellolocker.com;
    root /home/app/public;

    passenger_enabled on;
    passenger_user app;

    passenger_ruby /usr/bin/ruby2.2;
}

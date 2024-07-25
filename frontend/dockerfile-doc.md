```
Dockerfile Structure
├── Base Image
│   └── `FROM nginx`
│       └── Uses the official NGINX image as the base image.
│
├── Remove Default Files
│   ├── `RUN rm -rf /usr/share/nginx/html/index.html`
│   │   └── Deletes the default NGINX index.html file.
│   ├── `RUN rm -rf /etc/nginx/nginx.conf`
│   │   └── Deletes the default NGINX configuration file.
│   └── `RUN rm -rf /etc/nginx/conf.d/default.conf`
│       └── Deletes the default server configuration file.
│
├── Create and Set Permissions for Cache Directories
│   ├── `RUN mkdir -p /var/cache/nginx/client_temp`
│   │   └── Creates the directory for client temporary files.
│   ├── `RUN mkdir -p /var/cache/nginx/proxy_temp`
│   │   └── Creates the directory for proxy temporary files.
│   ├── `RUN mkdir -p /var/cache/nginx/fastcgi_temp`
│   │   └── Creates the directory for FastCGI temporary files.
│   ├── `RUN mkdir -p /var/cache/nginx/uwsgi_temp`
│   │   └── Creates the directory for uWSGI temporary files.
│   ├── `RUN mkdir -p /var/cache/nginx/scgi_temp`
│   │   └── Creates the directory for SCGI temporary files.
│   ├── `RUN chown -R nginx:nginx /var/cache/nginx`
│   │   └── Changes ownership of the cache directories to the nginx user.
│   ├── `RUN chown -R nginx:nginx /etc/nginx/`
│   │   └── Changes ownership of the NGINX configuration directory to the nginx user.
│   ├── `RUN chmod -R 755 /etc/nginx/`
│   │   └── Sets permissions of the NGINX configuration directory to 755.
│   └── `RUN chown -R nginx:nginx /var/log/nginx`
│       └── Changes ownership of the NGINX log directory to the nginx user.
│
├── Create and Set Permissions for PID File
│   ├── `RUN touch /var/run/nginx.pid`
│   │   └── Creates an empty PID file for NGINX.
│   └── `RUN chown -R nginx:nginx /var/run/nginx.pid /run/nginx.pid`
│       └── Changes ownership of the PID file to the nginx user.
│
├── Copy Configuration and Code
│   ├── `COPY expense.conf /etc/nginx/nginx.conf`
│   │   └── Copies a custom NGINX configuration file to replace the default one.
│   └── `COPY code /usr/share/nginx/html/`
│       └── Copies the website code to the NGINX HTML directory.
│
└── Switch to Non-Root User
    └── `USER nginx`
        └── Changes the user context to `nginx` for running the container.


server {
  listen 80;
  server_name basic.local.com;
  return 301 https://$host$request_uri;
}

server {
  listen 443;
  server_name basic.local.com;

  ssl                  on;
  ssl_certificate      /etc/nginx/certs/_wildcard.local.com.pem;
  ssl_certificate_key  /etc/nginx/certs/_wildcard.local.com-key.pem;

  ssl_session_timeout  5m;

  ssl_protocols  SSLv2 SSLv3 TLSv1;
  ssl_ciphers  HIGH:!aNULL:!MD5;
  ssl_prefer_server_ciphers   on;

  root /www/project-basic/public;
  index index.php;

  location / {
    try_files $uri $uri/ /index.php$is_args$args;
  }

  location ~ \.php$ {
    fastcgi_split_path_info ^(.+\.php)(/.+)$;
    fastcgi_pass unix:/var/run/php-fpm.sock;
    fastcgi_index index.php;
    include fastcgi_params;
    fastcgi_read_timeout 600;
    fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
    fastcgi_param PATH_INFO $fastcgi_path_info;
  }
}

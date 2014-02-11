server {
	server_name  virtualmock.thewoolleyweb.com;
	index  index.html index.htm;
	root   /var/www/virtualmock.thewoolleyweb.com;

	access_log  /var/log/nginx/virtualmock.thewoolleyweb.com.access.log;

	location / {
	}

	error_page   500 502 503 504  /50x.html;
	location = /50x.html {
		root   /var/www/virtualmock.thewoolleyweb.com;
	}
}

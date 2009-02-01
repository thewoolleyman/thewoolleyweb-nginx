server {
	server_name  ci.thewoolleyweb.com;

	access_log  /var/log/nginx/ci.thewoolleyweb.com.access.log;

	location / {
		proxy_pass http://localhost:3333;
		proxy_redirect false;
	}
}

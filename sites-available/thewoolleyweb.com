# You may add here your
# server {
#	...
# }
# statements for each of your virtual hosts

server {
	listen   80;
	server_name  thewoolleyweb.com;

	access_log  /var/log/nginx/thewoolleyweb.com.access.log;

	location / {
		root   /var/www/thewoolleyweb.com;
		index  index.html index.htm;
	}

	#error_page  404  /404.html;

	# redirect server error pages to the static page /50x.html
	#
	error_page   500 502 503 504  /50x.html;
	location = /50x.html {
		root   /var/www/thewoolleyweb.com;
	}


	# deny access to .htaccess files, if Apache's document root
	# concurs with nginx's one
	#
	#location ~ /\.ht {
		#deny  all;
	#}
}

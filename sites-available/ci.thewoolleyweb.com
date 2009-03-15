upstream mongrel_cluster {
	server 127.0.0.1:3333;
}

server {
	listen   80;
	server_name  ci.thewoolleyweb.com;

	access_log  /var/log/nginx/ci.thewoolleyweb.com.access.log;

       location / {
		proxy_pass          http://mongrel_cluster;
		proxy_redirect      off;
		proxy_set_header    Host             $host;
		proxy_set_header    X-Real-IP        $remote_addr;
		proxy_set_header    X-Forwarded-For  $proxy_add_x_forwarded_for;
		proxy_set_header    X-Client-Verify  SUCCESS;
		proxy_set_header    X-SSL-Subject    $ssl_client_s_dn;
		proxy_set_header    X-SSL-Issuer     $ssl_client_i_dn;
		proxy_read_timeout  65;
        }
}

# Nginx Real IP for Cloudflare IPs
Bash script for setting nginx config to show real ips.

```
#!/bin/bash

echo "#Cloudflare ip addresses" > /etc/nginx/conf.d/00_real_ip_cloudflare_00.conf;
echo "" >> /etc/nginx/conf.d/00_real_ip_cloudflare_00.conf;

echo "# - IPv4" >> /etc/nginx/conf.d/00_real_ip_cloudflare_00.conf;
for i in `curl https://www.cloudflare.com/ips-v4`; do
        echo "set_real_ip_from $i;" >> /etc/nginx/conf.d/00_real_ip_cloudflare_00.conf;
done

echo "" >> /etc/nginx/conf.d/00_real_ip_cloudflare_00.conf;
echo "# - IPv6" >> /etc/nginx/conf.d/00_real_ip_cloudflare_00.conf;
for i in `curl https://www.cloudflare.com/ips-v6`; do
        echo "set_real_ip_from $i;" >> /etc/nginx/conf.d/00_real_ip_cloudflare_00.conf;
done

echo "" >> /etc/nginx/conf.d/00_real_ip_cloudflare_00.conf;
echo "real_ip_header CF-Connecting-IP;" >> /etc/nginx/conf.d/00_real_ip_cloudflare_00.conf;

service nginx configtest && service nginx reload

```

# Nginx Real IP
 Since CloudFlare acts as a reverse proxy, all connections now come from one of CloudFlare's IP addresses. CloudFlare follows industry standards and includes the originating IP address in the X-Forwarded-For header. The CF-Connecting-IP header may also be used. To preserve the originating IP of your visitor, use the following Nginx module and parameters:

http://nginx.org/en/docs/http/ngx_http_realip_module.html
```
#Cloudflare ip addresses

# - IPv4
set_real_ip_from 173.245.48.0/20;
set_real_ip_from 103.21.244.0/22;
set_real_ip_from 103.22.200.0/22;
set_real_ip_from 103.31.4.0/22;
set_real_ip_from 141.101.64.0/18;
set_real_ip_from 108.162.192.0/18;
set_real_ip_from 190.93.240.0/20;
set_real_ip_from 188.114.96.0/20;
set_real_ip_from 197.234.240.0/22;
set_real_ip_from 198.41.128.0/17;
set_real_ip_from 162.158.0.0/15;
set_real_ip_from 104.16.0.0/12;
set_real_ip_from 172.64.0.0/13;
set_real_ip_from 131.0.72.0/22;

# - IPv6
set_real_ip_from 2400:cb00::/32;
set_real_ip_from 2606:4700::/32;
set_real_ip_from 2803:f800::/32;
set_real_ip_from 2405:b500::/32;
set_real_ip_from 2405:8100::/32;
set_real_ip_from 2a06:98c0::/29;
set_real_ip_from 2c0f:f248::/32;

real_ip_header CF-Connecting-IP;

```

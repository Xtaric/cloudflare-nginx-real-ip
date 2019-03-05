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

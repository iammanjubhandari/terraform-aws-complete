#!/bin/bash


apt-get update -y


apt-get install -y nginx


systemctl enable nginx
systemctl start nginx



mkdir -p /var/www/html/app1


cat <<EOF > /var/www/html/index.html
<h1>Welcome to My Ubuntu Nginx Server</h1>
<p>Deployed using EC2 User Data.</p>
EOF


cat <<EOF > /var/www/html/app1/index.html
<!DOCTYPE html>
<html>
<body style="background-color:#eaf3ff;">
<h1>App1 - Nginx Demo</h1>
<p>Version: v1</p>
</body>
</html>
EOF


TOKEN=$(curl -X PUT "http://169.254.169.254/latest/api/token" \
        -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")


curl -H "X-aws-ec2-metadata-token: $TOKEN" \
     http://169.254.169.254/latest/dynamic/instance-identity/document \
     -o /var/www/html/app1/metadata.html

systemctl restart nginx
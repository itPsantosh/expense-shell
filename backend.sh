curl -sL https://rpm.nodesource.com/setup_lts.x | bash

dnf install nodejs -y

cp backend.service/etc/systemd/system/backend.service
useradd expense
mkdir /app

curl -o /tmp/backend.zip https://expense-artifacts.s3.amazonaws.com/backend.zip
cd /app
unzip /tmp/backend.zip


npm install

systemctl daemon-reload
systemctl enable backend
systemctl start backend
dnf install mysql -y
mysql -h mysql.santosh75.online -uroot -pExpenbackend.santosh75.onlineseApp@1 < /app/schema/backend.sql

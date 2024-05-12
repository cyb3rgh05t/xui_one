#XUI ONE CRACKED
FROM ubuntu:24.04

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y wget unzip python3 lsb-release libfreetype6 sudo

# Install systemd
RUN apt-get update && \
    apt-get install -y systemd && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p /XUI/setup /XUI/crack

RUN wget https://update.xui.one/XUI_1.5.12.zip -P /XUI/setup/ && unzip /XUI/setup/XUI_1.5.12.zip -d /XUI/setup/

WORKDIR /XUI/setup

RUN chmod +x /XUI/setup/install && echo "y" | /XUI/setup/install

WORKDIR /XUI/crack

RUN wget -O xui_crack.tar.gz https://www.dropbox.com/s/309znmesn7j9xn3/xui_crack.tar.gz?dl=1 && tar -xf xui_crack.tar.gz

RUN chmod +x /XUI/crack/install.sh && /XUI/crack/install.sh

RUN systemctl enable xuione

WORKDIR /XUI/crack

CMD ["/lib/systemd/systemd"]

#XUI ONE CRACKED
FROM ubuntu:20.04

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y wget unzip python3 lsb-release libfreetype6 sudo

RUN mkdir -p /XUI/setup /XUI/crack

RUN wget https://update.xui.one/XUI_1.5.12.zip -P /XUI/setup/ && unzip /XUI/setup/XUI_1.5.12.zip -d /XUI/setup/

WORKDIR /XUI/setup

RUN chmod +x /XUI/setup/install && echo "y" | /XUI/setup/install

WORKDIR /XUI/crack

RUN wget -O xui_crack.tar.gz https://mega.nz/file/91l2xT7J#TmEZs5_y503LUJmaSVJ_6OWMR9sdsy-Soc63pB2GDB4 && tar -xf xui_crack.tar.gz

RUN chmod +x /XUI/crack/install.sh && /XUI/crack/install.sh

RUN systemctl enable xuione

WORKDIR /XUI/crack

CMD ["/lib/systemd/systemd"]

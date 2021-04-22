#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate
# 主机名
sed -i 's/OpenWrt/Sun/g' package/base-files/files/bin/config_generate
# 时区
sed -i 's/UTC/Asia/Shanghai/g' package/base-files/files/bin/config_generate
# 主题
sed -i 's/luci-theme-bootstrap/luci-theme-edge/g' feeds/luci/collections/luci/Makefile
# SSID
sed -i 's/OpenWrt/GB329/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh


#:<<TRUE
[ -e package ] && mkdir package/d -p && cd package/d
git clone https://github.com/garypang13/luci-app-eqos.git
git clone https://github.com/vernesong/OpenClash.git
#git clone https://github.com/pymumu/luci-app-smartdns.git -b lede
#git clone https://github.com/pymumu/openwrt-smartdns.git
git clone https://github.com/garypang13/luci-app-dnsfilter.git
git clone https://github.com/garypang13/luci-theme-edge.git -b 18.06
git clone https://github.com/rufengsuixing/luci-app-adguardhome.git
git clone https://github.com/Lienol/openwrt-OpenAppFilter.git
git clone https://github.com/jerrykuku/lua-maxminddb
git clone https://github.com/garypang13/smartdns-le.git
git clone https://github.com/garypang13/luci-app-bypass.git
cd ../../
find package/*/ feeds/*/ -maxdepth 2 -path "*luci-app-bypass/Makefile" | xargs -i sed -i 's/shadowsocksr-libev-ssr-redir/shadowsocksr-libev-alt/g' {}
find package/*/ feeds/*/ -maxdepth 2 -path "*luci-app-bypass/Makefile" | xargs -i sed -i 's/shadowsocksr-libev-ssr-server/shadowsocksr-libev-server/g' {}
#TRUE

# garypang13
#[ -e package ] && mkdir package/d -p && cd package/d
#git clone https://github.com/garypang13/openwrt-packages.git
#mv openwrt-packages/lua-maxminddb lua-maxminddb
#rm -rf openwrt-packages

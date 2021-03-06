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

sed -i 's/luci-theme-bootstrap/luci-theme-edge/g' feeds/luci/collections/luci/Makefile

[ -e package ] && mkdir package/d -p && cd package/d
git clone https://github.com/garypang13/luci-app-eqos.git
git clone https://github.com/vernesong/OpenClash.git
git clone git clone https://github.com/pymumu/luci-app-smartdns.git -b lede
git clone https://github.com/pymumu/openwrt-smartdns.git
git clone https://github.com/garypang13/luci-app-dnsfilter.git
git clone https://github.com/garypang13/luci-theme-edge.git
git clone https://github.com/rufengsuixing/luci-app-adguardhome.git
git clone https://github.com/Lienol/openwrt-OpenAppFilter.git
#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default

# passwall
#sed -i '$a src-git diy1 https://github.com/xiaorouji/openwrt-passwall.git;main' feeds.conf.default


# 超频
sed -i 's/+111,89/+111,93/g' target/linux/ramips/patches-5.4/102-mt7621-fix-cpu-clk-add-clkdev.patch
sed -i 's/cpu_clk, bus_clk/cpu_clk, bus_clk, i/g' target/linux/ramips/patches-5.4/102-mt7621-fix-cpu-clk-add-clkdev.patch
sed -i '156a +\t\tfor(i=0;i<1024;i++);' target/linux/ramips/patches-5.4/102-mt7621-fix-cpu-clk-add-clkdev.patch
sed -i '156a +\t\trt_memc_w32(pll,MEMC_REG_CPU_PLL);' target/linux/ramips/patches-5.4/102-mt7621-fix-cpu-clk-add-clkdev.patch
sed -i '156a +\t\tpll |=  (0x312);' target/linux/ramips/patches-5.4/102-mt7621-fix-cpu-clk-add-clkdev.patch
sed -i '156a +\t\tpll &= ~(0x7ff);' target/linux/ramips/patches-5.4/102-mt7621-fix-cpu-clk-add-clkdev.patch

# garypang13
[ -e package ] && mkdir package/d -p && cd package/d
#git clone https://github.com/garypang13/openwrt-packages.git
#mv openwrt-packages/lua-maxminddb lua-maxminddb
#rm -rf openwrt-packages
git clone https://github.com/jerrykuku/lua-maxminddb
git clone https://github.com/garypang13/smartdns-le.git
git clone https://github.com/garypang13/luci-app-bypass.git
cd ../../
find package/*/ feeds/*/ -maxdepth 2 -path "*luci-app-bypass/Makefile" | xargs -i sed -i 's/shadowsocksr-libev-ssr-redir/shadowsocksr-libev-alt/g' {}
find package/*/ feeds/*/ -maxdepth 2 -path "*luci-app-bypass/Makefile" | xargs -i sed -i 's/shadowsocksr-libev-ssr-server/shadowsocksr-libev-server/g' {}

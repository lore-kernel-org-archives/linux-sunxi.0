Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A87F1DDF5
	for <linux-sunxi@lists.linux.dev>; Thu,  2 Jan 2025 13:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735822958; cv=none; b=H17P7Ah3L6xYd8R1ravEB6uZwC7cW06059bDo1qRvN3EPjL7Pg11xSVIDc+q3UfmhTCJVT+FDk5C6Ir7YAYtgLLVUe0DvUEaWrir4jZgiYoNBfeVnSOXA2GNFYwVLxuzud+Cpi1t2JSmSn0c7f15uGnU6K3MA0iPzNJ33l2QPt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735822958; c=relaxed/simple;
	bh=qwv/ml6m04igwYBQshsuREDWFNr/HO4WTAUZlzJTdgI=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=M+5YjU7s/RCipyt55rSk1q1C0v/OnmkAaz37tMNLLSW3pkPYo/pm+XkOrecoEJmtT9pJ4AKZi6J9GKtrYDl4fihKHza8wLVFNmlIB6C61wauS9LNSugMiuAMZaMH74aJ9Xqp62VcLon0e/fOqQOqK+yFin1Q7snLRfpjElcSzTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bv3TgCkN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bv3TgCkN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 821CFC4CED0;
	Thu,  2 Jan 2025 13:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735822957;
	bh=qwv/ml6m04igwYBQshsuREDWFNr/HO4WTAUZlzJTdgI=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=bv3TgCkNPbxCha4NJMHRyarSYhwo3fajGBIjKhqCFq0LDNqsWjCKHPCw0HDoXCK/x
	 vQI2yw7aMYW3XIe8LvzN8ccaUl82j/V9zorIjZpFKHw/8tHeKC4iItKQmRxmFWe+v7
	 /0i0cuC15Jlzi+V2Rso/XOvyN5C1hzOLmM0uodCFxfSOGt42tmhw8e/kqAah4g9kMJ
	 xTH7Ktaiazk4a0nNp6fVNP7RtVVngexz8qMbtBKjvZ0e1eUYX0nl6Q/LCBP8C1OHs6
	 JFX32KEK1gY5zbhNXZyR8LtiXfaKWe1kNrJGpNgilVXawngc8rq1irOwRBHT3M5+pC
	 Q2N8LL1GPs5ww==
Date: Thu, 02 Jan 2025 07:02:35 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-sunxi@lists.linux.dev
To: Lukas Schmid <lukas.schmid@netcube.li>
In-Reply-To: <20250102121859.3547-1-lukas.schmid@netcube.li>
References: <20250102121859.3547-1-lukas.schmid@netcube.li>
Message-Id: <173582291654.3833727.12086095920611903179.robh@kernel.org>
Subject: Re: [PATCH 1/1] ARM: dts: sunxi: add support for NetCube Systems
 Kumquat


On Thu, 02 Jan 2025 12:18:59 +0000, Lukas Schmid wrote:
> NetCube Systems Kumquat is a board based on the Allwinner V3s SoC,
> including:
> 
> - 64MB DDR2 included in SoC
> - 10/100 Mbps Ethernet
> - USB-C DRD
> - Audio Codec
> - Isolated CAN-FD
> - ESP32 over SDIO
> - 8MB SPI-NOR Flash for bootloader
> - I2C EEPROM for MAC addresses
> - SDIO Connector for eMMC or SD-Card
> - 8x 12/24V IOs, 4x normally open relays
> - DS3232 RTC
> - QWIIC connectors for external I2C devices
> 
> Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
> ---
>  arch/arm/boot/dts/allwinner/Makefile          |   2 +
>  .../allwinner/sun8i-v3s-netcube-kumquat.dts   | 269 ++++++++++++++++++
>  2 files changed, 271 insertions(+)
>  create mode 100644 arch/arm/boot/dts/allwinner/sun8i-v3s-netcube-kumquat.dts
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y allwinner/sun8i-v3s-netcube-kumquat.dtb' for 20250102121859.3547-1-lukas.schmid@netcube.li:

arch/arm/boot/dts/allwinner/sun8i-v3s-netcube-kumquat.dtb: /: compatible: 'oneOf' conditional failed, one must be fixed:
	['netcube,kumquat', 'allwinner,sun8i-v3s'] is too short
	'allwinner,a100-perf1' was expected
	'allwinner,sun8i-a23-evb' was expected
	'allwinner,app4-evb1' was expected
	'allwinner,h8homlet-v2' was expected
	'allwinner,ga10h-v1.1' was expected
	'allwinner,gt90h-v4' was expected
	'allwinner,parrot' was expected
	'anbernic,rg-nano' was expected
	'anbernic,rg35xx-2024' was expected
	'anbernic,rg35xx-h' was expected
	'anbernic,rg35xx-plus' was expected
	'anbernic,rg35xx-sp' was expected
	'amarula,a64-relic' was expected
	'allwinner,auxtek-t003' was expected
	'allwinner,auxtek-t004' was expected
	'allwinner,ba10-tvbox' was expected
	'lemaker,bananapi' was expected
	'sinovoip,bpi-m1-plus' was expected
	'sinovoip,bpi-m2' was expected
	'sinovoip,bpi-m2-berry' was expected
	'sinovoip,bpi-m2-plus' was expected
	'bananapi,bpi-m2-plus-v1.2' was expected
	'sinovoip,bananapi-m2m' was expected
	'sinovoip,bpi-m2-ultra' was expected
	'sinovoip,bpi-m2-zero' was expected
	'sinovoip,bpi-m3' was expected
	'sinovoip,bananapi-m64' was expected
	'lemaker,bananapro' was expected
	'azw,beelink-gs1' was expected
	'roofull,beelink-x2' was expected
	'bigtreetech,cb1-manta' was expected
	'bigtreetech,pi' was expected
	'chuwi,v7-cw0825' was expected
	'colorfly,e708-q1' was expected
	'csq,cs908' was expected
	'cubietech,a10-cubieboard' was expected
	'cubietech,cubieboard2' was expected
	'cubietech,a80-cubieboard4' was expected
	'cubietech,cubietruck' was expected
	'cubietech,cubietruck-plus' was expected
	'difrnce,dit4350' was expected
	'dserve,dsrv9703c' was expected
	'elimo,impetus' was expected
	'elimo,initium' was expected
	'empire-electronix,d709' was expected
	'empire-electronix,m712' was expected
	'forlinx,oka40i-c' was expected
	'friendlyarm,nanopi-a64' was expected
	'friendlyarm,nanopi-duo2' was expected
	'friendlyarm,nanopi-m1' was expected
	'friendlyarm,nanopi-m1-plus' was expected
	'friendlyarm,nanopi-neo' was expected
	'friendlyarm,nanopi-neo2' was expected
	'friendlyarm,nanopi-neo-air' was expected
	'friendlyarm,nanopi-neo-plus2' was expected
	'friendlyarm,nanopi-r1' was expected
	'friendlyarm,nanopi-r1s-h5' was expected
	'friendlyarm,zeropi' was expected
	'gemei,g9' was expected
	'hyundai,a7hd' was expected
	'hsg,h702' was expected
	'allwinner,i12-tvbox' was expected
	'incircuit,icnova-a20-adb4006' was expected
	'incircuit,icnova-a20-swac' was expected
	'inet-tek,inet1' was expected
	'primux,inet86dz' was expected
	'inet-tek,inet9f-rev03' was expected
	'primux,inet97fv2' was expected
	'primux,inet98v-rev2' was expected
	'primux,inet-d978-rev2' was expected
	'inet-tek,inet-q972' was expected
	'itead,itead-ibox-a20' was expected
	'itead,iteaduino-plus-a10' was expected
	'jesurun,q5' was expected
	'lamobo,lamobo-r1' was expected
	'lctech,pi-f1c200s' was expected
	'libretech,all-h3-cc-h2-plus' was expected
	'libretech,all-h3-cc-h3' was expected
	'libretech,all-h3-cc-h5' was expected
	'libretech,all-h3-it-h5' was expected
	'libretech,all-h5-cc-h5' was expected
	'licheepi,licheepi-nano' was expected
	'licheepi,licheepi-one' was expected
	'licheepi,licheepi-zero' was expected
	'licheepi,licheepi-zero-dock' was expected
	'sipeed,lichee-zero-plus' was expected
	'linksprite,a10-pcduino' was expected
	'linksprite,a10-pcduino2' was expected
	'linksprite,pcduino3' was expected
	'linksprite,pcduino3-nano' was expected
	'linutronix,testbox-v2' was expected
	'haoyu,a10-marsboard' was expected
	'haoyu,a20-marsboard' was expected
	'mapleboard,mp130' was expected
	'mele,a1000' was expected
	'mele,a1000g-quad' was expected
	'mele,i7' was expected
	'mele,m3' was expected
	'mele,m9' was expected
	'merrii,a20-hummingbird' was expected
	'merrii,a31-hummingbird' was expected
	'merrii,a80-optimus' was expected
	'miniand,hackberry' was expected
	'allwinner,mk802' was expected
	'allwinner,a10s-mk802' was expected
	'allwinner,mk802ii' was expected
	'allwinner,mk808c' was expected
	'msi,primo81' was expected
	'emlid,neutis-n5-devboard' was expected
	'emlid,neutis-n5h3-devboard' was expected
	'nextthing,chip' was expected
	'nextthing,chip-pro' was expected
	'nextthing,gr8-evb' was expected
	'nintendo,nes-classic' was expected
	'nintendo,super-nes-classic' was expected
	'oceanic,5205-5inmfd' was expected
	'olimex,a10-olinuxino-lime' was expected
	'olimex,a10s-olinuxino-micro' was expected
	'olimex,a13-olinuxino' was expected
	'olimex,a13-olinuxino-micro' was expected
	'olimex,a20-olimex-som-evb' was expected
	'olimex,a20-olimex-som-evb-emmc' was expected
	'olimex,a20-olinuxino-lime' was expected
	'olimex,a20-olinuxino-lime-emmc' was expected
	'olimex,a20-olinuxino-lime2' was expected
	'olimex,a20-olinuxino-lime2-emmc' was expected
	'olimex,a20-olinuxino-micro' was expected
	'olimex,a20-olinuxino-micro-emmc' was expected
	'olimex,a20-olimex-som204-evb' was expected
	'olimex,a20-olimex-som204-evb-emmc' was expected
	'olimex,a33-olinuxino' was expected
	'olimex,a64-olinuxino' was expected
	'olimex,a64-olinuxino-emmc' was expected
	'olimex,a64-teres-i' was expected
	'pine64,pine64' was expected
	'pine64,pine64-plus' was expected
	'pine64,pinecube' was expected
	'pine64,pine-h64' was expected
	'pine64,pine-h64-model-b' was expected
	'pine64,pine64-lts' was expected
	'pine64,pinebook' was expected
	'pine64,pinephone-1.0' was expected
	'pine64,pinephone-1.1' was expected
	'pine64,pinephone-1.2' was expected
	'pine64,pinetab' was expected
	'pine64,pinetab-early-adopter' was expected
	'pine64,sopine-baseboard' was expected
	'pineriver,mini-xplus' was expected
	'pocketbook,touch-lux-3' was expected
	'pocketbook,614-plus' was expected
	'pov,protab2-ips9' was expected
	'polaroid,mid2407pxe03' was expected
	'polaroid,mid2809pxe04' was expected
	'allwinner,q8-a13' was expected
	'allwinner,q8-a23' was expected
	'allwinner,q8-a33' was expected
	'qihua,t3-cqa3t-bv3' was expected
	'allwinner,r7-tv-dongle' was expected
	'jide,remix-mini-pc' was expected
	'rervision,a33-vstar' was expected
	'rervision,h3-dvk' was expected
	'sinlinx,sina31s' was expected
	'sinlinx,sina31s-sdk' was expected
	'sinlinx,sina33' was expected
	'sipeed,longan-pi-3h' was expected
	'sourceparts,popstick-v1.1' was expected
	'allwinner,sl631-imx179' was expected
	'oranth,tanix-tx1' was expected
	'oranth,tanix-tx6' was expected
	'oranth,tanix-tx6-mini' was expected
	'tbs-biometrics,a711' was expected
	'topwise,a721' was expected
	'transpeed,8k618-t' was expected
	'utoo,p66' was expected
	'wexler,tab7200' was expected
	'widora,mangopi-mq-r-t113' was expected
	'wits,colombus' was expected
	'wits,pro-a20-dkt' was expected
	'wobo,a10s-wobo-i5' was expected
	'yones-toptech,bs1078-v2' was expected
	'hechuang,x96-mate' was expected
	'xunlong,orangepi' was expected
	'xunlong,orangepi-2' was expected
	'xunlong,orangepi-3' was expected
	'xunlong,orangepi-lite' was expected
	'xunlong,orangepi-lite2' was expected
	'xunlong,orangepi-mini' was expected
	'xunlong,orangepi-one' was expected
	'xunlong,orangepi-one-plus' was expected
	'xunlong,orangepi-pc' was expected
	'xunlong,orangepi-pc2' was expected
	'xunlong,orangepi-pc-plus' was expected
	'xunlong,orangepi-plus' was expected
	'xunlong,orangepi-plus2e' was expected
	'xunlong,orangepi-prime' was expected
	'xunlong,orangepi-r1' was expected
	'xunlong,orangepi-win' was expected
	'xunlong,orangepi-zero' was expected
	'xunlong,orangepi-zero-plus' was expected
	'xunlong,orangepi-zero-plus2' was expected
	'xunlong,orangepi-zero-plus2-h3' was expected
	'xunlong,orangepi-zero2' was expected
	'xunlong,orangepi-zero2w' was expected
	'xunlong,orangepi-zero3' was expected
	'allwinner,sun50i-a100' was expected
	'allwinner,sun8i-a23' was expected
	'allwinner,sun6i-a31' was expected
	'allwinner,sun8i-a83t' was expected
	'allwinner,sun8i-a33' was expected
	'allwinner,sun50i-h700' was expected
	'allwinner,sun50i-a64' was expected
	'allwinner,sun5i-a10s' was expected
	'allwinner,sun4i-a10' was expected
	'allwinner,sun7i-a20' was expected
	'allwinner,sun6i-a31s' was expected
	'allwinner,sun8i-r40' was expected
	'allwinner,sun8i-h3' was expected
	'allwinner,sun50i-h5' was expected
	'allwinner,sun8i-h2-plus' was expected
	'allwinner,sun50i-h6' was expected
	'bigtreetech,cb1' was expected
	'allwinner,sun50i-h616' was expected
	'allwinner,sun9i-a80' was expected
	'allwinner,sun5i-a13' was expected
	'sochip,s3' was expected
	'forlinx,feta40i-c' was expected
	'incircuit,icnova-a20' was expected
	'allwinner,suniv-f1c200s' was expected
	'allwinner,suniv-f1c100s' was expected
	'emlid,neutis-n5' was expected
	'emlid,neutis-n5h3' was expected
	'allwinner,sun5i-r8' was expected
	'nextthing,gr8' was expected
	'allwinner,sun8i-r16' was expected
	'allwinner,sun50i-r18' was expected
	'pine64,pinephone' was expected
	'pine64,sopine' was expected
	'allwinner,sun8i-t3' was expected
	'allwinner,sun50i-h64' was expected
	'rervision,a33-core1' was expected
	'sipeed,longan-module-3h' was expected
	'sourceparts,popstick' was expected
	'allwinner,sl631' was expected
	'allwinner,sun50i-h618' was expected
	'allwinner,sun8i-t113s' was expected
	from schema $id: http://devicetree.org/schemas/arm/sunxi.yaml#
arch/arm/boot/dts/allwinner/sun8i-v3s-netcube-kumquat.dtb: /: failed to match any schema with compatible: ['netcube,kumquat', 'allwinner,sun8i-v3s']
arch/arm/boot/dts/allwinner/sun8i-v3s-netcube-kumquat.dtb: pinctrl@1c20800: 'gpio-reserved-ranges' does not match any of the regexes: '^([rs]-)?(([a-z0-9]{3,}|[a-oq-z][a-z0-9]*?)?-)+?(p[a-ilm][0-9]*?-)??pins?$', '^vcc-p[a-ilm]-supply$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/pinctrl/allwinner,sun4i-a10-pinctrl.yaml#
arch/arm/boot/dts/allwinner/sun8i-v3s-netcube-kumquat.dtb: eeprom@50: Unevaluated properties are not allowed ('eth0_macaddress@FA' was unexpected)
	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml#






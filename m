Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E661662FA;
	Thu, 11 Jul 2024 14:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720707627; cv=none; b=XNc/vzsgNsxIcTzPOQC35Sj9DvZOWHmrwXWc6Qf7A1xSv8KYCXiG5KKkB+pSb1nJRyY6qYKchnayT6llu88p7790HO6cmF3M44gfV8iZbNqb0BTJsb+pUbRDXlzXbkyXYiud5SWJYQAv6zVg+fnRpmsRn3slq/iibWFRlTybBTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720707627; c=relaxed/simple;
	bh=Rslb4hqj97b8vWaPd5sPG+jb+GupF9VBuAZiJ+DdSCw=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=YcAYj/iLjzuWwkwiiwu6f4qnSSD8yT7urRPIxO8bZC2Cmm987kwgqhvGD4i27m76QgT/GJnyw9BdOuS+KVNLvhhFIvxEy9zdt0QrFEmOZz0JUIvi+YW3Puy03K1o3BG7rpMT1hDf0PmttK3D4Ma5PkopK3E/LlgkfZxl1+U7H7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bi0UHooI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bi0UHooI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C84DC116B1;
	Thu, 11 Jul 2024 14:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720707625;
	bh=Rslb4hqj97b8vWaPd5sPG+jb+GupF9VBuAZiJ+DdSCw=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=Bi0UHooILd6FYyGt+RBGuA80AOnkyi/zzvvbFLYhloZ2ftd1+BhnNQ6Q7MOZRcESp
	 RieqgJfsfkKvmxPQA0eSjKwMpwbv3zCLtxEGlrK1OaPJhRbCMkKiFKdfhtF9cx6cH8
	 S5GIbZhhp27VEuWZHt0J1xbhThgY2aAsYSThtROCZwlXSBJsYp7XkFZGui6XG0uRJY
	 WNPCcMIaCJ7e/h3h7kK01C7E+5jOJGXNqtxKjTZkqutaVJFwBqeYWAkYySXeglzj8n
	 7gxHXDKJ5xDPKTgBsl4oTh1YVINSvrLbVktErPFRU4bDrYdAtf7ZPFfLkZq5gvbuZO
	 tPDNH82nIuHxg==
Date: Thu, 11 Jul 2024 08:20:24 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Chris Morgan <macroalpha82@gmail.com>
Cc: andre.przywara@arm.com, linux-sunxi@lists.linux.dev, ryan@testtoast.com, 
 jernej.skrabec@gmail.com, samuel@sholland.org, wens@csie.org, 
 krzk+dt@kernel.org, Chris Morgan <macromorgan@hotmail.com>, 
 conor+dt@kernel.org, mripard@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20240710231718.106894-1-macroalpha82@gmail.com>
References: <20240710231718.106894-1-macroalpha82@gmail.com>
Message-Id: <172070684741.2129319.15850493754001416062.robh@kernel.org>
Subject: Re: [PATCH V3 0/4] Add Anbernic RG35XX-SP


On Wed, 10 Jul 2024 18:17:14 -0500, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add support for the Anbernic RG35XX-SP handheld gaming device. The
> Anbernic RG35XX-SP is a clamshell device, but hardware wise is very
> similar to the RG35XX-Plus. The RG35XX-SP has a lid-switch and an
> external RTC that necessitate a distinct device tree.
> 
> Please note that this series may have a soft pre-requisite on the patch
> series here [1].
> 
> [1] https://lore.kernel.org/linux-sunxi/20240418000736.24338-1-andre.przywara@arm.com/
> 
> Changes from V2:
>  - Corrected commit message for device tree bindings.
>  - Added a fixes tag to i2c pinmux additions in sun50i-h616.dtsi file
>    based on recommendation from Andre Przywara.
> 
> Changes from V1:
>  - Switched all RG35XX devices from the r_rsb bus to the r_i2c bus for
>    the PMIC to keep it consistent.
>  - Added missing pinctrl nodes in sun50i-h616.dtsi file for the r_i2c
>    bus.
>  - Modified devicetree documentation to keep definition of the RG35XX
>    series consistent with other Allwinner devices.
> 
> Chris Morgan (4):
>   dt-bindings: arm: sunxi: Add Anbernic RG35XXSP
>   arm64: dts: allwinner: h616: Add r_i2c pinctrl nodes
>   arm64: dts: allwinner: h616: Change RG35XX Series from r_rsb to r_i2c
>   arm64: dts: allwinner: h700: Add Anbernic RG35XX-SP
> 
>  .../devicetree/bindings/arm/sunxi.yaml        |  9 +++--
>  arch/arm64/boot/dts/allwinner/Makefile        |  3 +-
>  .../arm64/boot/dts/allwinner/sun50i-h616.dtsi |  2 ++
>  .../sun50i-h700-anbernic-rg35xx-2024.dts      |  6 ++--
>  .../sun50i-h700-anbernic-rg35xx-sp.dts        | 34 +++++++++++++++++++
>  5 files changed, 48 insertions(+), 6 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-sp.dts
> 
> --
> 2.34.1
> 
> 
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


New warnings running 'make CHECK_DTBS=y allwinner/sun50i-h700-anbernic-rg35xx-2024.dtb allwinner/sun50i-h700-anbernic-rg35xx-sp.dtb' for 20240710231718.106894-1-macroalpha82@gmail.com:

arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dtb: pmic@34: regulators: 'boost' does not match any of the regexes: '^(([a-f])?ldo[0-9]|dcdc[0-7a-e]|ldo(_|-)io(0|1)|(dc1)?sw|rtc(_|-)ldo|cpusldo|drivevbus|dc5ldo)$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/mfd/x-powers,axp152.yaml#
arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-sp.dtb: pmic@34: regulators: 'boost' does not match any of the regexes: '^(([a-f])?ldo[0-9]|dcdc[0-7a-e]|ldo(_|-)io(0|1)|(dc1)?sw|rtc(_|-)ldo|cpusldo|drivevbus|dc5ldo)$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/mfd/x-powers,axp152.yaml#






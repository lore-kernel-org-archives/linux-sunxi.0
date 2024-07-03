Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A52417BB0C;
	Wed,  3 Jul 2024 14:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720016829; cv=none; b=spqK+/GqbE1SIpJF8P3jd/Kd7OY2LXd2s3vYj1U0BQRtQcai67Xv1IWEOSh3VT6CL1PmKbmA4iPeJ94dnlW0ag/elKaLIRrEQqnms3IhIhOKnfPMFY6xEQRdhBzAlHoQB128D0BLmV+C2FuL7yiK871o5YyJ+7cN6vaQ/Hk6ZW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720016829; c=relaxed/simple;
	bh=G+D3ISENbDb3En302rOwMRcvpvn3J72RRPfvE1PuvR8=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=ixATKdFbQtpV/JI2bzsR3bAq0ECveDqbYkrvigsQCb0GVOFFVCFEk4jcoMN4FGKkcxmm4ubSB9PjLe94fURWrHXZPiU99kCyA5uMktNlTYQQbSl3myDkg/GvwlnX/BurAlwy1LoMvZ01SFRSiJCXTJ9mlll2P2qX9aShWbIkYa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I23vZes5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I23vZes5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8344C2BD10;
	Wed,  3 Jul 2024 14:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720016829;
	bh=G+D3ISENbDb3En302rOwMRcvpvn3J72RRPfvE1PuvR8=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=I23vZes5xmiadnNkR67m3CHtistaoJtdGYy7Jt+bjSwVtGvXN9PRNX+mYUAKjnRJP
	 eV5INoJf43utzIK4D6YAw9/8ZelsvQeg5BFtFCpJ5n1XS+8saCvvD0xLIVPXpAXv96
	 UNH50i9iIFhYUASSrmMcBA9KIBXjQf+//6gV5DCiuZIThlxdPnrbJulh6YxxWxinvK
	 Dra4iRqpyuSgbGDqlfj4NY9I4tK151cjd78qdXNYXlgrmdnV2EsWfYUdv0NHkAi1ul
	 W5qHQmwz45ZgJ/FQTQaGiCzxyVDbpTMQgITbhfgZP5UtVa6IxSxMxgRHMYPUMTvm1i
	 zNUYDEepNAnYQ==
Date: Wed, 03 Jul 2024 08:27:07 -0600
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
Cc: samuel@sholland.org, conor+dt@kernel.org, krzk+dt@kernel.org, 
 Chris Morgan <macromorgan@hotmail.com>, devicetree@vger.kernel.org, 
 linux-sunxi@lists.linux.dev, jernej.skrabec@gmail.com, mripard@kernel.org, 
 andre.przywara@arm.com, ryan@testtoast.com, wens@csie.org
In-Reply-To: <20240702193414.57461-1-macroalpha82@gmail.com>
References: <20240702193414.57461-1-macroalpha82@gmail.com>
Message-Id: <172001675758.274687.5859740689353342431.robh@kernel.org>
Subject: Re: [PATCH V2 0/4] Add Anbernic RG35XX-SP


On Tue, 02 Jul 2024 14:34:10 -0500, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add support for the Anbernic RG35XX-SP handheld gaming device. The
> Anbernic RG35XX-SP is a clamshell device, but hardware wise is very
> similar to the RG35XX-Plus. The RG35XX-SP has a lid-switch and an
> external RTC that necessitate a distinct device tree.
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


New warnings running 'make CHECK_DTBS=y allwinner/sun50i-h700-anbernic-rg35xx-2024.dtb allwinner/sun50i-h700-anbernic-rg35xx-sp.dtb' for 20240702193414.57461-1-macroalpha82@gmail.com:

arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-sp.dtb: pmic@34: regulators: 'boost' does not match any of the regexes: '^(([a-f])?ldo[0-9]|dcdc[0-7a-e]|ldo(_|-)io(0|1)|(dc1)?sw|rtc(_|-)ldo|cpusldo|drivevbus|dc5ldo)$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/mfd/x-powers,axp152.yaml#
arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dtb: pmic@34: regulators: 'boost' does not match any of the regexes: '^(([a-f])?ldo[0-9]|dcdc[0-7a-e]|ldo(_|-)io(0|1)|(dc1)?sw|rtc(_|-)ldo|cpusldo|drivevbus|dc5ldo)$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/mfd/x-powers,axp152.yaml#






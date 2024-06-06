Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15729198A0E;
	Thu,  6 Jun 2024 15:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717689375; cv=none; b=U8jncslnAhA34u+tSx0b7lwETNjEvlLS8b0Ob7xhOJ/E9+uTWDxXsOv/OThDAK/wxD32PAeyp6zG+t0mLondMBbLyJz22tTpcSAtAcv05Y/cn/4NWjV/8jCegWKp7kbjnG883A+mJM1GFkNf7fkIzYc5p4/cdiNjH+K/nYpCkcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717689375; c=relaxed/simple;
	bh=Cr+np7msQ1bo2WjBaJxEME2GN9hJFWZtpHOfFA6BxVQ=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=pViFxb85vOvf992/KH4pKrNxjhuK3clNLiEKJLVemtZNR3idGlisDaEyMCCdW1uL+HeT583hIRbrPu/9HZT4d19WL0dJfpCHtKPKviBzENHCpq/H/1/Z+hDcJzfZOoc0LBDpKhsxLvAoj7H4OHCvmV7CQDZjDOcl5dlzlFfzLc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TbcLjBLG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TbcLjBLG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8639EC32781;
	Thu,  6 Jun 2024 15:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717689374;
	bh=Cr+np7msQ1bo2WjBaJxEME2GN9hJFWZtpHOfFA6BxVQ=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=TbcLjBLGA+7l8aV+6xKIVsKfirGjVycBW4rFNVm9Vd/K1caQU4SUPNrt1dYY0vlr6
	 c1REJmP1DZV7m3melIWXhEzaFY1xN3aSKTkgHsbMM8jpQWk0Tsr1awLDehaXEmo5h0
	 mE5BrfR2ZxDvP8Lh9XXGSPMQouwRRe29pR1m77D9e4TJ2jD0mQYkLPJsh4lBPee4nW
	 X2qFaRUnB+YJRjCytMu5zuGr1vB3RMQZ9unYKaahYljuLhMr1o5rL3z+7vX41vFLcC
	 ASJ96N4xz/kHkmNA6Z7ZdAHcmh4tEQbXSmcQ5gn8fTQz3FSH07eN9oevV4OtZsQtCh
	 fjgJloE1J1elw==
Date: Thu, 06 Jun 2024 09:56:13 -0600
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
Cc: conor+dt@kernel.org, linux-sunxi@lists.linux.dev, 
 devicetree@vger.kernel.org, ryan@testtoast.com, 
 Chris Morgan <macromorgan@hotmail.com>, wens@csie.org, mripard@kernel.org, 
 jernej.skrabec@gmail.com, samuel@sholland.org, andre.przywara@arm.com, 
 krzk+dt@kernel.org
In-Reply-To: <20240605185339.266833-1-macroalpha82@gmail.com>
References: <20240605185339.266833-1-macroalpha82@gmail.com>
Message-Id: <171768925527.3793166.1240136494594349544.robh@kernel.org>
Subject: Re: [PATCH 0/2] Add Anbernic RG35XX-SP


On Wed, 05 Jun 2024 13:53:37 -0500, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add support for the Anbernic RG35XX-SP handheld gaming device. The
> Anbernic RG35XX-SP is a clamshell device, but hardware wise is very
> similar to the RG35XX-Plus. The RG35XX-SP has a lid-switch and an
> external RTC that necessitate a distinct device tree.
> 
> Chris Morgan (2):
>   dt-bindings: arm: sunxi: Add Anbernic RG35XXSP
>   arm64: dts: allwinner: h700: Add Anbernic RG35XX-SP
> 
>  .../devicetree/bindings/arm/sunxi.yaml        |  24 ++-
>  arch/arm64/boot/dts/allwinner/Makefile        |   3 +-
>  .../sun50i-h700-anbernic-rg35xx-sp.dts        | 145 ++++++++++++++++++
>  3 files changed, 156 insertions(+), 16 deletions(-)
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


New warnings running 'make CHECK_DTBS=y allwinner/sun50i-h700-anbernic-rg35xx-sp.dtb' for 20240605185339.266833-1-macroalpha82@gmail.com:

arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-sp.dtb: pmic@34: regulators: 'boost' does not match any of the regexes: '^(([a-f])?ldo[0-9]|dcdc[0-7a-e]|ldo(_|-)io(0|1)|(dc1)?sw|rtc(_|-)ldo|cpusldo|drivevbus|dc5ldo)$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/mfd/x-powers,axp152.yaml#






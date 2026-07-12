Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C2D0328B71;
	Sun, 12 Jul 2026 08:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783844025; cv=none; b=ZiZlUej1LPumovL6VXkqu8X5P61G/yDqUSptGfbttvLTmR3zTbr300tqI63BIwsyzBH3m0NMypO8v4KOS0BS5FQdyW2V2hDnnx9MtakEePfsGQ1ZiPPHlvYknlWzdKZDSF8lvyNNMpPZIWkFDNXtDiQXnzx0uKphbSJhhSbfjUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783844025; c=relaxed/simple;
	bh=6d9kakeUq1jKVtZ6X2Liw0uSzYmvTdPMqj5h6tftnss=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=q3GcE/hM4YVNt2f6xCwHGxCtw4HzQpYKEPd2mFJBs0NzceaRKaP0kRX2Dw3g4wzQ+m9hSKJdUzEPo5VfuvhvezA6NNp2IZKDwrrDERGuqFfuhgq3jFJsoMv9SSIBSrLH7nQcRaAvzYXyFYe+hryfw4p+ljt+7qF1rjhBE9XyV3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PiJlOPYq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PiJlOPYq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B967A1F00A3D;
	Sun, 12 Jul 2026 08:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783844024;
	bh=S3ym6z4VNGZ7YzkDyUcM1JxNpJiBWJ3gbZjVhywvnbY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PiJlOPYqAONJ2ZkuHgGITLcb/eVrToc+MAK8oTiq1FH4Y3aIsWVhAY5u4T396SjiS
	 UENQE3f6XccUCnfm9bSpSHow6mptnjO+y3yk01tUMccFFsw9oEQ+SfQYaNQxRWmREZ
	 MEVKLMJNMm2/NLo+GX1j6Y/RAf+ZpYi3eFDLvI839e8JQFdYA04M/X17CWNBkolzbH
	 u8hrQzJH0sX6Zxn8bMuGxFj2VxzRNZOYiyvvxcXtI90DzvoSfbS+/6+P534w5+Sxka
	 CGWYyx+JYJej+R5O0iRapQBaM5grA75gmG+wc4cVLAf4YQB6lzyhfZPlS7q4IYvL0A
	 Q47Luya3QUM7Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 7/8] clk: sunxi-ng: a733: Add bus clock gates
Reply-To: sashiko-reviews@lists.linux.dev
To: "Junhui Liu" <junhui.liu@pigmoral.tech>
Cc: robh@kernel.org, conor+dt@kernel.org, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org
In-Reply-To: <20260711-a733-clk-v2-7-974d188cbe0c@pigmoral.tech>
References: <20260711-a733-clk-v2-0-974d188cbe0c@pigmoral.tech>
 <20260711-a733-clk-v2-7-974d188cbe0c@pigmoral.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 12 Jul 2026 08:13:43 +0000
Message-Id: <20260712081343.B967A1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Bus clock gates for multiple peripherals are incorrectly parented =
to the 24MHz external oscillator (hosc) instead of their actual AHB/APB bus=
es.
- [Low] Typographical error in the string names for the IOMMU1 system clock=
s, using an underscore instead of a hyphen.
--

--- Patch [7]: [PATCH v2 7/8] clk: sunxi-ng: a733: Add bus clock gates ---
commit 92eebd6b3ec66a1f50b982f0effa98e2238c2a4d
Author: Junhui Liu <junhui.liu@pigmoral.tech>

clk: sunxi-ng: a733: Add bus clock gates

This commit adds the bus clock gates that control access to the devices'
register interface on the Allwinner A733 SoC, including UARTs, SPI, I2C,
and multimedia engines. It also marks ahb-store and mbus-store as critical
to ensure boot/storage devices remain accessible.

> diff --git a/drivers/clk/sunxi-ng/ccu-sun60i-a733.c b/drivers/clk/sunxi-n=
g/ccu-sun60i-a733.c
> index bf26e310f08a9..48d7c0395ae83 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun60i-a733.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun60i-a733.c
> @@ -448,6 +454,8 @@ static SUNXI_CCU_M_DATA_WITH_MUX_GATE(trace_clk, "tra=
ce", trace_parents, 0x540,
>  				 BIT(31),	/* gate */
>  				 0);
> =20
> +static SUNXI_CCU_GATE_DATA(bus_its_pcie0_aclk_clk, "bus-its-pcie0-aclk",=
 hosc, 0x574, BIT(1), 0);
> +

[Severity: High]
Are these bus clock gates correctly parented to hosc instead of their
respective AHB or APB buses?

If the Common Clock Framework is misinformed about the hardware topology, it
might dynamically disable the actual underlying bus clock if it believes it=
=20
has no active children. Could this cause a synchronous external abort=20
(bus hang) when drivers try to access the registers of these peripherals?

This same parenting to hosc also appears in several other bus gates added=20
later in this patch, such as bus_msi_lite0_clk, bus_npu_clk, bus_ufs_clk,=20
and the bus_i2spcm series of clocks.

[ ... ]

> +static SUNXI_CCU_GATE_HWS(mbus_iommu1_sys_clk, "mbus-iommu1-sys", mbus_h=
ws, 0x5b4, BIT(0), 0);
> +static SUNXI_CCU_GATE_HWS(apb_iommu1_sys_clk, "apb_iommu1-sys", apb0_hws=
, 0x5b4, BIT(1), 0);
> +static SUNXI_CCU_GATE_HWS(ahb_iommu1_sys_clk, "ahb_iommu1-sys", ahb_hws,=
 0x5b4, BIT(2), 0);

[Severity: Low]
This isn't a bug, but there's a typo in the string names for the iommu1
system clocks.

They use an underscore instead of a hyphen ("apb_iommu1-sys" instead of
"apb-iommu1-sys"). Does this break the naming convention established by the
iommu0 clocks just above it?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260711-a733-clk-v=
2-0-974d188cbe0c@pigmoral.tech?part=3D7

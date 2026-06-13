Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F01431E83D;
	Sat, 13 Jun 2026 15:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781365294; cv=none; b=m0p2/NI2f/bdw7ye0P+zbFvHD7jSV4WrlX6Ttfels3MsPrpfjBIqAfzeHn9NuXaoCpKk46PbiKZWi752wW9rXHtWhysXjtcsKo4QeekSglBdFKty0mW6BI26Tiy+FP5w1zCLQJLzYkzToEbSihIvtNjpxowUs1vnIu6KReSiOAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781365294; c=relaxed/simple;
	bh=egg85pk2oWocvuGcdIqI+/uEwLdKtcAb7e/DimYOkYg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HJPl5gxFUiw6vf6hz+7GBkSV/P2dmNr02L1xqxobTgEV2nzVkEiQU3q+5o+CHFBGr9slNo1pym1GnYSQLx1sZJaBxedHiUVf91Zp2MkO7DCpiTgWvDc07biGSLI+pLJeGJA4778XPYOQsvo5J33OqlgqIz+/ZT8y4ddB12r1i5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L77OZ0g+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L77OZ0g+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A62201F000E9;
	Sat, 13 Jun 2026 15:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781365291;
	bh=nbHTrTtQpGa47qL3upIFzytTEoEpqsXR5C+NqVW4fbI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=L77OZ0g+QVX2YZA8L73/VFBc1oQHB83ZBVMy6GQAW47v19LTLtCU06D093ym0ChnF
	 wZBxLTEpkIBQqonmT8KnQfe6DDilUgdrIMj2vt6kYVyytKNlHRCylt2xECIkfGWqjG
	 s7FghLdX/ZTjhylTA+l0mn1aZNtvMxz8og/n2pv53Uix3u/yhfDzXsvXsMii17P3LE
	 KTL8EmEwmEJ+QGypyG16ahSN/DNTkhCZyK+astXy/chLtswjBxg+jaj1PkFjMYsoiV
	 3fYmsV6JrpEFBg6xRMN4S/IY844v5NqQWeO0REX36+88qBBgRwMU7jJTpnqelFk9RL
	 Sk95uqv5uQqlg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 5/6] ARM: dts: sun8i: v3s: Add nodes for MIPI CSI-2
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Paul Kocialkowski" <paulk@sys-base.io>
Cc: robh@kernel.org, linux-sunxi@lists.linux.dev, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260613152655.212490-6-paulk@sys-base.io>
References: <20260613152655.212490-6-paulk@sys-base.io>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 13 Jun 2026 15:41:31 +0000
Message-Id: <20260613154131.A62201F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The `csi0` node introduces the `interconnects` and `interconnect-na=
mes` properties, but these are not defined in the corresponding dt-binding =
schema `allwinner,sun6i-a31-csi.yaml`.
--

commit 6348731e0b0149fecdb9ccb7d05f8577710a1724
Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

ARM: dts: sun8i: v3s: Add nodes for MIPI CSI-2 support

This commit adds MIPI CSI-2 support for the V3s SoC by introducing nodes
for CSI0, the MIPI CSI-2 bridge, and the D-PHY. The CSI0 node includes
interconnect properties to inherit the proper DMA offsets.

> diff --git a/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi b/arch/arm/boot/d=
ts/allwinner/sun8i-v3s.dtsi
> index 02d6c62b3874e..03a1739683b16 100644
> --- a/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
> +++ b/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
[ ... ]
> @@ -671,6 +671,79 @@ gic: interrupt-controller@1c81000 {
>  			interrupts =3D <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HI=
GH)>;
>  		};
> =20
> +		csi0: camera@1cb0000 {
> +			compatible =3D "allwinner,sun8i-v3s-csi";
> +			reg =3D <0x01cb0000 0x1000>;
> +			interrupts =3D <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&ccu CLK_BUS_CSI>,
> +				 <&ccu CLK_CSI_SCLK>,
> +				 <&ccu CLK_DRAM_CSI>;
> +			clock-names =3D "bus", "mod", "ram";
> +			resets =3D <&ccu RST_BUS_CSI>;
> +			interconnects =3D <&mbus 5>;
> +			interconnect-names =3D "dma-mem";

[Severity: Low]
Will adding these properties cause a dtbs_check validation warning?

The interconnects and interconnect-names properties do not appear to be
defined in the corresponding dt-binding schema at
Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml.

Because that schema enforces additionalProperties: false, introducing
undocumented properties here might result in a validation failure. Should
the schema be updated alongside this patch to allow these interconnect
properties?

> +			status =3D "disabled";
> +
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260613152655.2124=
90-1-paulk@sys-base.io?part=3D5

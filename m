Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026232571DA;
	Sun, 12 Jul 2026 03:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783825795; cv=none; b=G+tgNyT+NNX8ZntAY2+nKYOj7WlDXAvPnYBFE5YQwpfpZQSCfmyvF/O21LU+r1ZWND1OeYuBkWtesCy7CGYiTCdq1Nmph+P3DHJPovRABQARJvkPIb3Nqat0lS/4LCftaxygbDNVBHyOhQkj9DIm3/C5xh6jyhfMiCP5UJsHLs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783825795; c=relaxed/simple;
	bh=w0pHOjyd5L3OX7eGXTaD/+XAMuz6Y+lacHJs5+rhqXI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RmdRFfGrTnY0+0iUC6l8iNvxbjJ4jshIVcl2EYeVkyNfl6nzCpprS2jFeQkHVdscmDpg/ZEwc3T5/ZnjM8P+F4URLZcISGwa47lR4rez2RyKokc2cPBwPSvhbaLg80YCYKIrzo8a+Ku/AMchz5XBNGUTJckaizprsh525QViXtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n5Yil1J3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n5Yil1J3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90C091F000E9;
	Sun, 12 Jul 2026 03:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783825793;
	bh=IV22isKo5FsQV41DjoS5ocLXutW7YEnVpHnUQZD6+rk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=n5Yil1J3wECmm4nuj1XkVnEio3Rt7XWX2SxUeLPSmHd3zVWO5vBwF2OnGKvZpw7Sp
	 B+3fzfuWXouAfHckfZJbSeq9QdO029Y2KU9lwVfY0216X0YSDfakaq1y7PjxJFIuZA
	 dwZ5NnM2PajdCYdn9U5W27GPVsgmmOwiZUXauJPDIw/2K9FAbOhGqXIqP+fA8gQNat
	 nhFofCCNO/xRCBtSxVQEOSh9KiK7GOckH9cyatZnA/4RyswGuy+514d90gYOn7GkRS
	 Bcs5hFcwFpFikajbkI2wwxOYqXi+RSgGbKCgiZeAD0IqPAETPItd9L5fdkHtIiiLgt
	 ou+a7sBLMrXzw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 6/7] arm64: dts: allwinner: sun50i-h6: Add missing
 IOMMU for video engine
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chen-Yu Tsai" <wens@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, linux-sunxi@lists.linux.dev, conor+dt@kernel.org
In-Reply-To: <20260712030011.3778169-7-wens@kernel.org>
References: <20260712030011.3778169-1-wens@kernel.org>
 <20260712030011.3778169-7-wens@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 12 Jul 2026 03:09:53 +0000
Message-Id: <20260712030953.90C091F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The second SRAM region (`de2_sram`) added to the `video-codec` n=
ode is never claimed by the video engine driver or the SRAM subsystem, fail=
ing to fulfill the commit message's goal.
--

--- Patch [6]: [PATCH v3 6/7] arm64: dts: allwinner: sun50i-h6: Add missing=
 IOMMU for video engine ---
commit 92e4c0595ba5187a0f4f259f15e3d844654fec5a
Author: Chen-Yu Tsai <wens@kernel.org>

arm64: dts: allwinner: sun50i-h6: Add missing IOMMU for video engine

The video engine on the H6 actually has two IOMMU ports. The one already
listed is simply named "VE" in the user manual. The missing one is named
"VE_R" and is probably either read-only or used for reference frames.

> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/bo=
ot/dts/allwinner/sun50i-h6.dtsi
> index 88c6e3e105c07..48c771223af4d 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> @@ -206,7 +206,7 @@ video-codec@1c0e000 {
>  			resets =3D <&ccu RST_BUS_VE>;
>  			interrupts =3D <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
>  			allwinner,sram =3D <&ve_sram 1>, <&de2_sram 1>;

[Severity: Medium]
Will the second SRAM region (<&de2_sram 1>) be claimed by the video engine
driver or the SRAM subsystem?

Looking at the cedrus driver, it invokes sunxi_sram_claim() exactly once
during probe without handling multiple SRAM alias claims:

drivers/staging/media/sunxi/cedrus/cedrus_hw.c:cedrus_hw_probe() {
    ...
    ret =3D sunxi_sram_claim(dev->dev);
    ...
}

This calls sunxi_sram_of_parse(), which hardcodes the index to 0, completely
ignoring any subsequent SRAM properties:

drivers/soc/sunxi/sunxi_sram.c:sunxi_sram_of_parse() {
    ...
    ret =3D of_parse_phandle_with_fixed_args(node, "allwinner,sram", 1, 0,
                                           &args);
    ...
}

Could this leave the SRAM alias window unclaimed?

> -			iommus =3D <&iommu 3>;
> +			iommus =3D <&iommu 3>, <&iommu 1>;
>  		};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260712030011.3778=
169-1-wens@kernel.org?part=3D6

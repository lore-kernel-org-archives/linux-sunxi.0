Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600132571DA;
	Sun, 12 Jul 2026 03:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783825722; cv=none; b=hxYVtTjFxpk/Kb1uS8DZCwRjjfrZ5kTjVjKG22yAHGvgHPmnlr95R6k4Z31zqzxBkfS8n81B9uBSbHZ6hNZ+n9VdFDe5Xr6nlgQ7Ad7OLIsbbt9YjgGHNqhRZ6V442rEaUhRpDq9MvvNu82SVycv9RCEq0eLcPjKthKbs/B2yCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783825722; c=relaxed/simple;
	bh=Qmrg9ijgOxWnUm5+kCS7KJeEjsjFrzfbOtldnX5q+Qg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=i6ubz1iAK29rpse3dUvZc/XXyqkr02qdXM7Jg3fXtgyAg9bFc27pFeWvLKQ+4arSRcg5y3VwQBy7OOu0nXPwaaUT5Cm1myryt/4rpnE+Px7icqH53PJtKYYn+zFVNm/9eqtdk7oDlg9qkCDk5KUnVbtDSdxAZzik9tzVE5sGiIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l3vrpsm8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l3vrpsm8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0441D1F000E9;
	Sun, 12 Jul 2026 03:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783825721;
	bh=A6x+ftxQTMO3PjvnIRUw2TBUURHFSKGF1CJ3GEsIBzQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=l3vrpsm8/yhIeP+rjd3BpXEUMvPJuY5ji898BOTDpHTJoYF44cTOSoos8tQXis8Lt
	 5WmZzqPDcnR+vhQ/lThlNRqhSR/BrGPl73qzFWlROoGpU+p3xlUs2fgg3u14rCObNt
	 pRh4FhTT8tlB7Sgp5r7RiTiSez7aCB4A9BFJ9XgplHw8XoPiDvIWAxhd0TOtyGwi8i
	 801oXFAQhMYMxSS29GTHc72UbuV4lgEmF+OMZ8dJfmC7X7llfLFUnoLICizn9mVJj1
	 relFzSZ0T6KcVAMCDRXr09vnbQCGkw1sirFHVkzmgMeqJgNnBBntbSYsI+4Y2D6dr1
	 yCSN2TZPQvdMg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 7/7] arm64: dts: allwinner: sun50i-h616: Add video
 engine
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chen-Yu Tsai" <wens@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, linux-sunxi@lists.linux.dev, conor+dt@kernel.org
In-Reply-To: <20260712030011.3778169-8-wens@kernel.org>
References: <20260712030011.3778169-1-wens@kernel.org>
 <20260712030011.3778169-8-wens@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 12 Jul 2026 03:08:40 +0000
Message-Id: <20260712030841.0441D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The newly added `video-codec` node references an undefined `ve_sram=
` phandle, causing a device tree compilation error, and a structurally inco=
rrect `sram_c` phandle.
--

--- Patch [7]: [PATCH v3 7/7] arm64: dts: allwinner: sun50i-h616: Add video=
 engine ---
commit 47b5fe1ab74e2eb5363068c14fed457f3e1ad7e1
Author: Jernej Skrabec <jernej.skrabec@gmail.com>

arm64: dts: allwinner: sun50i-h616: Add video engine

This commit adds the video engine node to the sun50i-h616 dtsi file. It
defines the clocks, resets, interrupts, iommus, and SRAM regions required
by the video engine hardware.

> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/=
boot/dts/allwinner/sun50i-h616.dtsi
> index bf054869e78be..fc912ed80a3e4 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> @@ -175,6 +175,18 @@ crypto: crypto@1904000 {
>  			resets =3D <&ccu RST_BUS_CE>;
>  		};
> =20
> +		video-codec@1c0e000 {
> +			compatible =3D "allwinner,sun50i-h616-video-engine";
> +			reg =3D <0x01c0e000 0x2000>;
> +			clocks =3D <&ccu CLK_BUS_VE>, <&ccu CLK_VE>,
> +				 <&ccu CLK_MBUS_VE>;
> +			clock-names =3D "ahb", "mod", "ram";
> +			resets =3D <&ccu RST_BUS_VE>;
> +			interrupts =3D <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
> +			iommus =3D <&iommu 3>, <&iommu 2>;
> +			allwinner,sram =3D <&ve_sram 1>, <&sram_c 1>;

[Severity: Low]
Will this cause a device tree compilation error? The &ve_sram phandle doesn=
't
appear to be defined, which could prevent the device tree from building.

Also, does the &sram_c phandle reference the parent mmio-sram node instead
of a valid sram-section child node? If it points to the parent,
sunxi_sram_of_parse() might return -EINVAL during driver probe.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260712030011.3778=
169-1-wens@kernel.org?part=3D7

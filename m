Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB9B26ED3E;
	Sat, 11 Jul 2026 14:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783778896; cv=none; b=YlJ8OEmtI9Cx+ICRwhsSGKUVHFwBnNj0vZP9hT7REMNxv3K5h4zG61dk7dQ8uw3je/Cz99c+Lb2xHZoerg9Cz5w+cm2CiyetN9zZyLnEx5KwN17xyktWkptZR2IKkNWtwF5VuShtRzIYE+vLkaewNnmLBATIH9n4zLyb3Wzkmzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783778896; c=relaxed/simple;
	bh=BSTlXYkE0yuXwx0DIrv+NWFqLoXN5RgCBk0ZGL1mu4I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kzJUG2HweZ8m1+gGNWKQxR8cEQnoYFqpqfnlKxanFZzmmpEW1bgnhdJQmD8mcA2FBRHj2Jizf6tNdEW4aagiNrM6wudy/zq9rlxB1cQvQD4bwz1NUZgHssUc4R+aqFl0MBpzbR1jyuCMFuUpwHAedcB1ohsTM1Qaoo/io4qJb1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jpzwKL9z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jpzwKL9z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40CFF1F00A3A;
	Sat, 11 Jul 2026 14:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783778895;
	bh=q9mZDQc3PsTMplgy3FsMSOpBrIu7G5827D3PjKg5o9A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jpzwKL9zOQWhefXHHDKXW5tQi+X9z8tIc0x7pRjXF0YgbXXxp7F2uuerug+RZ54dk
	 jOlHHwQ1wN+YR4Qh0FXRTYgPkHTJwbX9S6zo4hF92xhNsG+4UDumAdB+vRlv4Zb+lW
	 7b9fvhg8sJSn4zH9sBxusOIp347jvPdV+fnWx2jB61cq8NhyBN07PZ3bv1R2O8YaQA
	 M9n+GHDCKHCCSGNk0boBgTmyN93j30lANRudn0YPDVxe/P6+cUqtupnWuzwnzYGiPX
	 ERvhudkvaMPZsRKVa9XbpJLbo935PZd0WLEWwFj7AR8IDftt9r4QHxiQWL76U0JUcu
	 IAPq8wIlUQ9Eg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/7] arm64: dts: allwinner: sun50i-h6: Add missing
 SRAM region for video engine
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chen-Yu Tsai" <wens@kernel.org>
Cc: conor+dt@kernel.org, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260711135959.3616919-6-wens@kernel.org>
References: <20260711135959.3616919-1-wens@kernel.org>
 <20260711135959.3616919-6-wens@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 11 Jul 2026 14:08:14 +0000
Message-Id: <20260711140815.40CFF1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Adding a second phandle to the `allwinner,sram` property has no =
effect at runtime because the sunxi_sram driver infrastructure hardcodes pa=
rsing to only the first index.
--

--- Patch [5]: [PATCH v2 5/7] arm64: dts: allwinner: sun50i-h6: Add missing=
 SRAM region for video engine ---
commit 8b2bcf328faa458d85d11e3cef06ddda86e2e10e
Author: Chen-Yu Tsai <wens@kernel.org>

arm64: dts: allwinner: sun50i-h6: Add missing SRAM region for video engine

This commit adds a reference to the SRAM C region in the video engine node
to prevent access through a partial alias window.

> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/bo=
ot/dts/allwinner/sun50i-h6.dtsi
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> @@ -205,7 +205,7 @@ video-codec@1c0e000 {
>  			clock-names =3D "ahb", "mod", "ram";
>  			resets =3D <&ccu RST_BUS_VE>;
>  			interrupts =3D <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
> -			allwinner,sram =3D <&ve_sram 1>;
> +			allwinner,sram =3D <&ve_sram 1>, <&de2_sram 1>;

[Severity: Medium]
Will the second phandle be silently ignored during runtime?

Looking at the cedrus driver, it calls sunxi_sram_claim() during probe.
However, the underlying infrastructure appears to hardcode index 0 when
parsing this property:

drivers/soc/sunxi/sunxi_sram.c:sunxi_sram_of_parse() {
    ...
    ret =3D of_parse_phandle_with_fixed_args(node, "allwinner,sram", 1, 0,
                                           &args);
    ...
}

Does the driver infrastructure need to be updated to parse multiple indices
before this device tree addition takes effect?

>  			iommus =3D <&iommu 3>;
>  		};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260711135959.3616=
919-1-wens@kernel.org?part=3D5

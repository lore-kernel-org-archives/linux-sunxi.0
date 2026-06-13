Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7F81D5160;
	Sat, 13 Jun 2026 09:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781344259; cv=none; b=fRP9pZ8rinWrPzcNIKuu8Dp86nFgPrn9JWHq+2m+VdIeScm9I5nlEyP41lHN3MScVIxZhKXNdjPbG6mbDTKty0F+LBLWNDqQMZjBQMIr8OoJ/i9TGRaejngv6dnmH4ZfqbcnewrOh6JbizzFe6lxFuNSPN21VtCaT56R0vpLlxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781344259; c=relaxed/simple;
	bh=vwB0alkSIDYT3FLbg5ANhcXK4/IxOjKaKmJ6hY0cFpI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Jbg4V3EhWey88MffeBbtVe30Ul7jHLQFpxdVzrVGW8/zjjr9u0uEa0F7+aSr8LyYe27cAGVzEfwBkofRGDz3OarfFws3sXbft4ejhd2Ela6DaKMoMPrAylO02weu228g+E9OkSshY4mS+uic/CE+2dmHjvaDUwny2s+jWrEmq98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bZWzUcCc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bZWzUcCc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B0FE1F000E9;
	Sat, 13 Jun 2026 09:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781344258;
	bh=GwlHNxN2/24K0LF41glzYRU0V2y/owMcPA/IrzwXr7o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bZWzUcCcQwnrN0joeRFVDJWqCJVd5WPar/qKcali9K4YtT2ApPhVZu149kf7AD2a8
	 9K7mUQe8cTamsn3PM1ztbvYEgY73KzPUhVlOI0/+7v1lqS13EpsLSf4yPHC0PFL+j5
	 eOy2umB4NzIcEDTvafXZA0PY3Qsdq7t62L9GxW4DgF4u8f9Ih88HI38n0eJSlN3OYD
	 Rrz/hl5v3dbcgRjb9LmbOPUSdhVs3ZI5hCGAaRALEg2ruRSs/k8/ph7g2lDAqgbO3r
	 MQwpBqAg0gPh8OFYo88IABkZiHbJ4i3kEr1glC4SZqeskHSVdzpQGZtFKtm6sjxZ/5
	 fy2qXBBpV/l8Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/4] arm64: dts: allwinner: add Radxa Cubie A7S
Reply-To: sashiko-reviews@lists.linux.dev
To: "Enzo Adriano via B4 Relay" <devnull+enzo.adriano.code.gmail.com@kernel.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, linux-sunxi@lists.linux.dev
In-Reply-To: <20260613-a733-dts-v1-public-ready-v1-4-7787c94681db@gmail.com>
References: <20260613-a733-dts-v1-public-ready-v1-4-7787c94681db@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 13 Jun 2026 09:50:57 +0000
Message-Id: <20260613095058.2B0FE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] The `&mmc0` node is missing the `cd-gpios` property (or `broken-=
cd` / `non-removable`), which may be necessary for proper SD card detection.
- [Low] The new DTB entry in the Makefile breaks alphabetical ordering.
- [Low] The fixed regulator node name does not match the required device tr=
ee schema.
--

commit f3152d16f1d4c4fabab01c5ee230d7994c9a7898
Author: Enzo Adriano <enzo.adriano.code@gmail.com>

arm64: dts: allwinner: add Radxa Cubie A7S

Add the Radxa Cubie A7S board description with serial console and SD card
boot support. Ethernet remains disabled until prerequisites are proven.

> diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts=
/allwinner/Makefile
> index d116864b6c2b3..824cc35152db8 100644
> --- a/arch/arm64/boot/dts/allwinner/Makefile
> +++ b/arch/arm64/boot/dts/allwinner/Makefile
> @@ -56,6 +56,7 @@ dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h700-anbernic-rg35=
xx-2024.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h700-anbernic-rg35xx-h.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h700-anbernic-rg35xx-plus.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h700-anbernic-rg35xx-sp.dtb
> +dtb-$(CONFIG_ARCH_SUNXI) +=3D sun60i-a733-cubie-a7s.dtb

[Severity: Low]
This isn't a bug, but should this entry be placed further down?

Strict alphabetical sorting dictates that sun60i should appear after all
the sun55i entries to avoid merge conflicts.

>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun55i-a527-cubie-a5e.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun55i-h728-x96qpro+.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun55i-t527-avaota-a1.dtb

[ ... ]

> diff --git a/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts b/ar=
ch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts
> new file mode 100644
> index 0000000000000..453761a963237
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts
> @@ -0,0 +1,48 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
> +
> +/dts-v1/;
> +
> +#include "sun60i-a733.dtsi"
> +
> +/ {
> +	model =3D "Radxa Cubie A7S";
> +	compatible =3D "radxa,cubie-a7s", "allwinner,sun60i-a733";

[ ... ]

> +	chosen {
> +		stdout-path =3D "serial0:115200n8";
> +	};
> +
> +	reg_vcc3v3: vcc3v3 {
> +		compatible =3D "regulator-fixed";

[Severity: Low]
This isn't a bug, but does this regulator name trigger a dtbs_check warning?

The standard device tree binding expects the node name to match the pattern
^regulator(-[0-9]+v[0-9]+|-[0-9a-z-]+)?$. A standard name like regulator-3v3
or regulator-vcc-3v3 should be used instead.

> +		regulator-name =3D "vcc-3v3";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		regulator-always-on;
> +	};
> +};
> +
> +&mmc0 {
> +	vmmc-supply =3D <&reg_vcc3v3>;
> +	bus-width =3D <4>;
> +	no-mmc;
> +	no-sdio;
> +	status =3D "okay";
> +};

[Severity: Medium]
The commit message states this adds SD card boot support, but is the
cd-gpios property missing from this node?

Without cd-gpios or an explicit broken-cd fallback, the MMC core might fail
to detect card presence. If the kernel assumes the slot is empty, it will
not probe the SD card, causing root filesystem mounting to fail.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260613-a733-dts-v=
1-public-ready-v1-0-7787c94681db@gmail.com?part=3D4

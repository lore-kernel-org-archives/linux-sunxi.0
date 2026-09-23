Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9A6495030;
	Wed, 23 Sep 2026 11:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790162178; cv=none; b=Jh2jRGTiX7QFuljo7l6farTeia5rUMBBPGnGVh36X9OqVJkm/PfA7ySQaTEO1Q4smqf/UseHks8bRu/QuFnrZ27QiFbamPlW4qn7M7H3ac5uoeIFY9uRzuAIpEBNQALhGMBD9Fq0bCoZPGm4/tUp4KtZyR0rWEIbXvysGGhGgR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790162178; c=relaxed/simple;
	bh=xRzSp78Pe199MFIjaoQzk6jIz0JAy3C2sIzhmVSBZoM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kkvC9xN0n7jAuqg5wv0zPO1rUiJkjfghoGOyRvmH86/DEQ6a4GgMqV43sPX6ry97Wveff8oXXRtKq6MPdqY1qdV9zZ4EM9VBIxWJaQARtRRGrOUnlyuXGaFfV39Umum34VOXIYiy8YkOAQ/2rOfKP2lpDNKlnylh/pfISwsTbQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q8WrW089; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q8WrW089"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A259B1F00893;
	Wed, 23 Sep 2026 11:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790162177;
	bh=7tw9hkrhU2HMdDKsOht7sbKBsQVTItMkR5BSW7uzwzw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Q8WrW089n3RNWwZiMgSI/ZsQFXlt4H1fMiE3Z12YNRy8hoTUPlfDL63p6m+YSW3XG
	 orkzE1/0YFN/d4tPBrw0a24Cy3cX5UqHHz7q4r1GZKSw1wXVbYCcB2NO1H3ozw9oFd
	 e1QVDjl+QwGONeMjQ6+6pzGmFPqi9E+EKkZTzPnOIOSsA/aH6qz1DnMjTxrZk/SF6d
	 lG/qy1btL+1dotFlIcW2QamFlFx3bvHhpwpid7fTzFKXMlv7FrdP+wVElcFk24brYm
	 9cd2UsSPoxkIxu+IrlRlWr7V4HI5vTJv3HEPWF2X71Z/ZqwDWYUHzTiKpBtghLA61x
	 SuJFeMLcBQPEQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: allwinner: h616: orangepi-zero2w:
 add SDIO WiFi/BT (AW859A)
Reply-To: sashiko-reviews@lists.linux.dev
To: Vladimir <anykey196@gmail.com>
Cc: robh@kernel.org, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260923110736.10-2-anykey196@gmail.com>
References: <20260923110736.10-1-anykey196@gmail.com>
 <20260923110736.10-2-anykey196@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 11:16:16 +0000
Message-Id: <20260923111616.A259B1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] dt: mmc-pwrseq-simple silent clock failure due to incorrect clock-=
names
- [High] dt: missing pinctrl for RTC 32kHz clock output
- [Low] dt: use of magic number for RTC clock index
--

commit 97053bae21777f073acfc22535e6c83308625172
Author: Vladimir <anykey196@gmail.com>

arm64: dts: allwinner: h616: orangepi-zero2w: add SDIO WiFi/BT (AW859A)

Enable the SDIO bus (mmc1) and power the on-board AW859A (UWE5622)
WiFi/BT combo through an mmc-pwrseq-simple that resets WL_REG_ON (PG18), wi=
th
the 3.3 V and 1.8 V supplies and the RTC 32 kHz clock.

> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dt=
s b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
> index ff9b40352a545..7d473274c06c0 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
> @@ -189,3 +189,43 @@ &usbphy {

[ ... ]

> +	wifi_pwrseq: wifi-pwrseq {
> +		compatible =3D "mmc-pwrseq-simple";

[Severity: High]
Does this node need pinctrl properties to physically route the 32kHz RTC fa=
nout
clock to its output pin (PG10)?

During the probing of the wifi_pwrseq node at boot, without specifying
pinctrl-0 =3D <&x32clk_fanout_pin>; and pinctrl-names =3D "default";, the p=
in
remains in its default state. This physically disconnects the clock signal =
from
the external WiFi/BT chip.

> +		clocks =3D <&rtc 1>;

[Severity: Low]
Is it possible to use the CLK_OSC32K_FANOUT macro defined in
include/dt-bindings/clock/sun6i-rtc.h here instead of the magic number 1?

This would improve readability and consistency with other Allwinner device
trees.

> +		clock-names =3D "osc32k-out";

[Severity: High]
Does the mmc-pwrseq-simple driver expect the clock name to be exactly
"ext_clock"?

When probing the wifi_pwrseq node, because this patch uses "osc32k-out",
devm_clk_get(dev, "ext_clock") returns -ENOENT. The driver treats -ENOENT a=
s an
optional clock being absent and silently continues without enabling the 32k=
Hz
clock. This causes the WiFi/BT module to fail to initialize or operate reli=
ably.

> +		reset-gpios =3D <&pio 6 18 GPIO_ACTIVE_LOW>;	/* PG18 */
> +		post-power-on-delay-ms =3D <200>;
> +	};
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923110736.10-1=
-anykey196@gmail.com?part=3D2

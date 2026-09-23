Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E8B493649;
	Wed, 23 Sep 2026 10:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790161169; cv=none; b=YTGxybMPMlaS2Z+78K592KpRQ9Rpanbx3u8MwcovqiaW0llVEMRw6gbMRpTgm+VT3LfjmCsXQdQz1hCaksCFR3vUfLDx8zaJxR97B2bSrBOJvoTGbyK6WZwfvYXptac7nv8F+j/OgrbNfRl9UYhNEMOyJy9euW2S1mm1JRKpmZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790161169; c=relaxed/simple;
	bh=grdzwYQ8QkHJXxd3sYFOKO/vCBIeL4B21BD1W8y/dh0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IgJgQ089+xcdueDSlrPEgREjtZbo/KaIdmMWipd0Wl2EPjiaWfF1xnZFhALmh/kluUhHTdcv4N0RoxE3skubnGe1pXtbNMm39rywdFjWdwR0f8u1anir0AgwaRcf1dTMStys2ClfgTKdYUQPCJU7AWzd3AP0Hjuk9ylhlMpLUmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Etu7HLE2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Etu7HLE2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAC761F000FF;
	Wed, 23 Sep 2026 10:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790161161;
	bh=SBEX6OZHWQHpa2HIuCbCcItdBsRxtub4QYIe1WssXQo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Etu7HLE2A2cS9AyjCM3EeywN6sNPA63F8xoICKADdnYMRrHX+mTsksEIXXQzuDc/W
	 dwaPn0bys6rKTM9QCWbxiyxRR7YkEdBJDwRSKqvPj4rPjT/Br/HQghn/mQrQax01uQ
	 F4S2E2RhbxyuhtfahqalP6ndKEsqB6IURFm75PXx7veWSq5q2CeEJE6U01MaZ72fFv
	 avQevpgvl8sEfJzk7dlpvi+ypSqn2pC1rfoZrdI1VbzKMggpZCZ4KFx2ZXhzWn4qzK
	 r2971eUIMuc2aTTIk0ewNPK1t6fD3c10IfKYCpPb+xkng09N8AhsGvPywc2k/Sc12a
	 N00HMsCb8D54Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: allwinner: h616: orangepi-zero2w: add
 24-pin expansion buttons and IR
Reply-To: sashiko-reviews@lists.linux.dev
To: Vladimir <anykey196@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev
In-Reply-To: <20260923105208.198-1-anykey196@gmail.com>
References: <20260923105208.198-1-anykey196@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 10:59:20 +0000
Message-Id: <20260923105920.CAC761F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] arm64: dts: unconditionally enabling optional expansion board risk=
s phantom inputs and IRQ storms
--

commit 51b58a06db4b29809dc98ff86ac9cae923d63f7c
Author: Vladnwx <vladnwx@users.noreply.github.com>

arm64: dts: allwinner: h616: orangepi-zero2w: add 24-pin expansion buttons =
and IR

This commit adds device tree nodes for the LRADC buttons and IR receiver on
the OrangePi Zero 2W. It maps the buttons to KEY_1 and KEY_ENTER and enables
both the LRADC and IR controller hardware.

> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dt=
s b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
> index ff9b40352a545..1b690e3cd041e 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
[ ... ]
> @@ -189,3 +190,31 @@ &usbphy {
>  	usb1_vbus-supply =3D <&reg_vcc5v>;
>  	status =3D "okay";
>  };
> +
> +/*
> + * Buttons and IR receiver on the optional 24-pin expansion board.
> + * KEY1 -> KEY_1, KEY2 -> KEY_ENTER (LRADC channel 0).
> + */
> +&lradc {
> +	vref-supply =3D <&reg_vcc3v3>;
> +	status =3D "okay";

[Severity: High]
Could unconditionally enabling the optional LRADC on the base board cause
phantom key presses? If the 24-pin expansion board is not attached, it seems
the floating LRADC pin could drift into the configured 1.0V/1.6V voltage
thresholds and trigger unexpected button presses for users out of the box.
Should this be enabled via a device tree overlay instead?

> +	wakeup-source;
> +
> +	button-1000 {
[ ... ]
> +	button-1600 {
> +		label =3D "KEY_ENTER";
> +		linux,code =3D <KEY_ENTER>;
> +		channel =3D <0>;
> +		voltage =3D <1600000>;
> +	};
> +};
> +
> +&ir {
> +	status =3D "okay";
> +};

[Severity: High]
Does unconditionally enabling the IR receiver risk interrupt storms? If the
optional board is missing, a floating IR RX pin lacking an internal pull-up
might pick up electrical noise and oscillate rapidly. This could severely
degrade system performance. Would it be safer to relegate this to an overlay
rather than the base device tree?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923105208.198-=
1-anykey196@gmail.com?part=3D1

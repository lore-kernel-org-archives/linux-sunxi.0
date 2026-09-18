Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65877517BBF;
	Fri, 18 Sep 2026 17:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789751144; cv=none; b=Q++w2/W7/al7uYC8DKB5K5o9TGZAvtpRF40F5WzotWFXsLeOkMYie7y4t+phAfBI0MJPu9F2RMaL008t+u7U/XGE8oD+f+/RAYWiiXJWO2/g/TNuxq98tq5h5yKXrN/aYdbtKgt7VFLsED8W5k3iT9RRKjOmQMxrsUgMmPeEWSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789751144; c=relaxed/simple;
	bh=9d5HbGfiYB9+oUvLRcuBMYDN8ABxoF3Ov35xfOyHbUw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZWL16H1b2/mUhkgALROpH6JMZhxgu8Wvo23gIuLaQ02DvmmFdrnOiHoi927bKDzlYi6DcOg9ANt+785flrThJRJPP2+78Kr7Aa/Dqsy/v8l301t28TZcjkhosTkDWHWBEK0JujqIAqTxtCGA/9XFB/Lgq45ONK7Ox+7YYWqVqjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XSqh/VFs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XSqh/VFs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8FD51F000FF;
	Fri, 18 Sep 2026 17:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789751142;
	bh=E1EOrbo0sNiQF6UJqltHForl3o2fGBEaiiSBoSiuxaQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XSqh/VFstLS2rnJFwoNqBZ8Ze3qndvNLzO7aEKneqw9kJCNTxuJ/+DhrpN7qV/EG2
	 GQgMJCzN7e5x7QFsKIT7eVfXRdWgXJkt9tkByaCIFkvomeaNKO0oqq5nEctQF6RY0M
	 Bq9XTx00hozL6hDnK1pJS8FOw7G3HM4fA0PxTCwpfhuyy82lW0+6rfCFkR4Z9hJMCe
	 u4g0CbWXP8OYlJeiAQ3BPNfjadc5fuvgvTRxVbsJMx2heuxC2DRAO3ZFIdJqGijJQ0
	 cBmLDOI33/Vhg4DcBaiH3iac+3VZ8V2GAT7heHyAMCb/onhaC02z+TgJgen4nLdkYE
	 uXCsBT1+J5ezQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/4] arm64: dts: allwinner: add Teclast P85T tablet
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kalashnikov" <iuncuim@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org
In-Reply-To: <20260918165414.1129076-5-iuncuim@gmail.com>
References: <20260918165414.1129076-1-iuncuim@gmail.com>
 <20260918165414.1129076-5-iuncuim@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 17:05:42 +0000
Message-Id: <20260918170542.A8FD51F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] dts: dummy 1.8V regulator used for 3.3V IO banks, causing wrong =
bias configuration
- [Low] dts: inbound USB-C power mapped to outbound VBUS regulator in usbphy
--

commit 62a9921e9859ecb056d3f2383913082baa7f4de1
Author: Mikhail Kalashnikov <iuncuim@gmail.com>

arm64: dts: allwinner: add Teclast P85T tablet

The Teclast P85T is an 8-inch tablet that was announced in 2023
based on the Allwinner A523 (sun55i) SoC.

> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523-teclast-p85t.dts b=
/arch/arm64/boot/dts/allwinner/sun55i-a523-teclast-p85t.dts
> new file mode 100644
> index 0000000000000..38a9c98ecbec6
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-a523-teclast-p85t.dts
[ ... ]
> +	reg_pio18: pio-18 {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "pio-18";
> +		regulator-min-microvolt =3D <1800000>;
> +		regulator-max-microvolt =3D <1800000>;
> +		regulator-always-on;
> +	};
[ ... ]
> +&pio {
> +	vcc-pc-supply =3D <&reg_pio18>;
> +	vcc-pe-supply =3D <&reg_pio18>;
> +	vcc-pf-supply =3D <&reg_pio18>;
> +	vcc-pg-supply =3D <&reg_pio18>;
> +};

[Severity: Medium]
Will configuring these IO bank supplies with a dummy 1.8V fixed regulator c=
ause
incorrect IO bias configuration?

For instance, the PF bank is used by mmc0 (SD card), which physically
requires 3.3V to operate (as correctly identified by its
vmmc-supply =3D <&reg_cldo3>;).

The Allwinner pinctrl driver reads the voltage from the assigned supply to
configure the IO pad bias registers. Providing a fake 1.8V regulator for a
bank that is physically powered at 3.3V causes the driver to write incorrect
bias values, which might lead to signal integrity issues or pad damage.

Could the real supplies (e.g., reg_cldo3 for 3.3V and reg_cldo1 for 1.8V
from the axp717 PMIC) be used directly? The pinctrl driver requests regulat=
ors
lazily, so this shouldn't cause a circular dependency.

[ ... ]
> +			reg_cldo1: cldo1 {
> +				/* codec CPVIN, SD/eMMC 1.8V IO */
> +				regulator-min-microvolt =3D <1800000>;
> +				regulator-max-microvolt =3D <1800000>;
> +				regulator-name =3D "vcc-codec-sd";
> +			};
[ ... ]
> +&usbphy {
> +	usb0_vbus-supply =3D <&reg_vcc5v>;

[Severity: Low]
Does this correctly assign the inbound board power supply as the outbound
VBUS supply?

reg_vcc5v represents the inbound 5V supply coming from the USB-C connector.
However, usb0_vbus-supply is the regulator that the PHY enables to provide
power out to external devices when operating in host mode.

Since the board is configured purely as a peripheral (no VBUS drive capabil=
ity),
assigning its main inbound power supply as the PHY's VBUS output seems reve=
rsed.

Should usb0_vbus-supply be omitted here since the driver uses other
properties for sensing inbound VBUS?

> +	status =3D "okay";
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918165414.1129=
076-1-iuncuim@gmail.com?part=3D4

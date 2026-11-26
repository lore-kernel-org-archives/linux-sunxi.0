Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795726416;
	b=uDUq7NJ2SL02/yG8nsymho7JO9MdHvBuXHhqBRjUh3HwOiWDCMTMDmhnLnrQdex/CiJE
	 dRVBI4amGIh1/dyJPpd+k5bB1BX9259NIHGqzj7kWhUss3WUXuQYipVIYfEaJ3CFFB3ok
	 uQQj0eMtbQgvxO1nmZN+DpAksA3xf/S3HnPia0+HyIN0k8KgYMWhhUFaQuWTzrqeF6BgH
	 YrVyx/e9HLsw83giXmitNxZwFczt5E+Q8FL8zpCF6pMBqiNtF5ahB6tFtgRgjfn7ELeXh
	 jpYzVAZU4dQ7h6dInNe99qfXT+iPgpP2qtP99VdRFtnVs3qUc/8GzxCuSgH+l6IwQbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795726416;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=OZrFRZ/62dY6r94SxS9gjOrDra4JliOKEkrqO4quNNE=;
	b=P0OLy2slx0oDoUeRsYuknwIAol/dY7GpvdBlwoY2RyNpTeOQTUhE0yorbNcgLpmyzbxw
	 nQZJcl19KAmPxTtFyuhEe1g64EnAKNacVAhHwp4PKiIyKeGCTujgTdYCYNDVndkN7Fubd
	 DhWfEoavfpqi8L3gN1bjw3u3ys7iL3TDTSigCua9dfnuJopeVx/1DSOOFlWo+Ew8Jy7nM
	 +oikkn/Z1MNC1IuMlXfSXm/m0TkTSaZjcwqah6HF3OnruvhsHukNNyKhzlllNMsVCJi+w
	 uoVA8Jzjn44oNbatAO1xlzi9sUoQ1RGivBiPPz7BwQZcoIZDal2OXGXSK3g9LQZYPDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c4sSRPlG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0F7606A31C;
	Thu, 26 Nov 2026 20:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c4sSRPlG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F3E71F00893;
	Thu, 26 Nov 2026 20:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795726416;
	bh=OZrFRZ/62dY6r94SxS9gjOrDra4JliOKEkrqO4quNNE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=c4sSRPlG7pEX/FL8+eiUWm339qNO96nzrgfFpnUdYihz5Pp4MFQ4TituCdjf2EOuQ
	 avrF6frBFsn4i4izSrjJv03ZwUu2ba3jxSnS1VK+ODkVdoyv4fOUsU+O2XACUeL3q5
	 SDe+ZTsfsyG7vy0QGm8GsT/ovo20/UAIFT1hzDAttAQNf+LeHfHLj7kmv98X2XHnY5
	 iTomkMhIVxAfozliSYX5xJFk6Q+xtmBXcxKlpljWFHVQe5hOqwQVbmfPf9SjrLdpC9
	 GizXZZEr4j2weW2ILQsp771gPGUaccBTFFIdDTpHGTvDnCTo7X+6ZQ4TfxRA1mtLbR
	 wZNuKILCDxFrw==
Message-ID: <sashiko-outbox-236169@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 4/5] arm64: dts: allwinner: add Radxa Cubie A7Z board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Enzo Adriano" <enzo.adriano.code@gmail.com>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261126-a733-cubie-a7s-dt-v6-4@gmail.com>
References: <20261126-a733-cubie-a7s-dt-v6-0@gmail.com>
 <20261126-a733-cubie-a7s-dt-v6-4@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 20:53:36 +0000
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] arm64: dts: allwinner: cubie-a7z vcc-pm-supply and cldo1 name
  mismatch
--

commit dbafc60438a1ea798e4288e52449976e3ef9ca34
Author: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>

arm64: dts: allwinner: add Radxa Cubie A7Z board

This commit adds the device tree for the Radxa Cubie A7Z board, enabling
UART0, the AXP318W PMIC, MMC0, the RTC, the user LED, and the board and
pin bank power supplies.

Link: https://lore.kernel.org/r/20261125131435.33190-1-vinicius.eduardo.ped=
rosa@gmail.com

> diff --git a/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7z.dts b/ar=
ch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7z.dts
> new file mode 100644
> index 0000000000000..049e6b67c23af
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7z.dts

[ ... ]

> +		regulators {
> +			reg_aldo1: aldo1 {
> +				/* Port L powers the PMIC's own I2C bus. */
> +				regulator-name =3D "vcc-pl-usb";
> +				regulator-min-microvolt =3D <3300000>;
> +				regulator-max-microvolt =3D <3300000>;
> +				regulator-always-on;
> +			};

[ ... ]

> +			reg_cldo1: cldo1 {
> +				/* LPDDR4 VDD1. */
> +				regulator-name =3D "vcc-pm-lpddr";
> +				regulator-min-microvolt =3D <1800000>;
> +				regulator-max-microvolt =3D <1800000>;
> +				regulator-always-on;
> +			};

[ ... ]

> +&r_pio {
> +	/*
> +	 * PL powers the PMIC bus itself, so firmware must keep ALDO1 enabled:
> +	 * vcc-pl-supply =3D <&reg_aldo1>;
> +	 */
> +	vcc-pm-supply =3D <&reg_aldo1>;
> +};

[Severity: Low]
Should vcc-pm-supply in &r_pio point to &reg_cldo1 instead of &reg_aldo1,
or does reg_cldo1 have the wrong regulator-name?

reg_cldo1 is a 1.8 V rail named "vcc-pm-lpddr" while reg_aldo1 is a 3.3 V
rail named "vcc-pl-usb".  When led-0 requests GPIO PM2 on boot,
sunxi_pmx_request() calls sunxi_pinctrl_set_io_bias_cfg(), which reads the
voltage of vcc-pm-supply to program Port M's I/O bias voltage threshold.
If CLDO1 supplies Port M at 1.8 V as its regulator-name indicates,
pointing vcc-pm-supply at reg_aldo1 configures Port M's bias threshold for
3.3 V instead of 1.8 V.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126-a733-cubie=
-a7s-dt-v6-0@gmail.com?part=3D4

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795725805;
	b=e67KknBwCaJEtjb39HE5/s085B+UocM1Ein5yM5bltcL5PDDZw4WogD9/dzEY2kvKmsr
	 Z42n4tle0wQbk4Pt6gQIMrtwQkzzbXR6Zvac8U+bTkPBc8RAbi/FxZWtE37QyhgKowvSF
	 bapk4x5IH8SNkdYfR7MfTfOHGOLkarZ/hKqZaxFsEpuk+viKpBYjTpHKvTCP+bEfDhoLx
	 ItfCvWdRpmmIk+s8sa2/JODLHt/FkVQXGhWSZ6BAlXDa3XjJvFJLekHJjUjCe+hiq2UMd
	 ST+rk54AX2debKLfjjA7y8a8iJAmCdh23eqmGnl4lsPKthWIig4x5gWcZqEUSr/2aYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795725805;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=m/itG6FUqzEXDp3/i3HE0GUcki8clicKeBGWMDl4Egg=;
	b=k+iJHVwp4kHbYazv0KYiaHQH5NIuxMLHv6bBw3DjuP4aHUYGW+i6C58EN3GFQM0tc+4A
	 vajYWCOOHivue2EDKqBfoTgfNhdFFvCb4wnGVa5kpa6EytjIQ3wGpAqN4tugIljfC6Ryk
	 D0TeVLPWY2SUCgp7gMd28R3swqPIhnIu/FCSs/WQsE9WDqJ3fBztyJAT602DZhuFCTPAR
	 u9CrWgkTOCNuCmqm2Rol+vrz9I1+B/L+sdXBqiVPlGoZzRsO3bmzvI8DD8MpCb4OmEIeV
	 Scj85LrH/ysBfwORHYwJj57VMHMY8zIGxXjWbDqMbDn+0Uz5ZtV/eaytIbl73E1SSoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cfu7WCaB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D686A606A691;
	Thu, 26 Nov 2026 20:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cfu7WCaB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DFF51F000C1;
	Thu, 26 Nov 2026 20:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795725805;
	bh=m/itG6FUqzEXDp3/i3HE0GUcki8clicKeBGWMDl4Egg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cfu7WCaBt9S4bloK5reX78p+W2guddShVCUE7aa/XWBARTKV3ypzkXqZnyqwAwtu+
	 JLLnVo6Js/0fK5UEwKLNHPXLIPupLy6geS+0hQwUJqMEPbGv1K3z1aXvc9ChiC42+r
	 BIr5aZhJRTsxXfeuMAUifijBm32nuy8remnoaoYWKQZL7u/r3IsYk8mlob2GzGHRzA
	 MVTF4MZcrrYPbxtlO/mM9DRsbse6f3N0Y1bY0Y1pXWY8MQSN6afTRGXSC6lraic7bU
	 LS7l7MTS4AS//mNkc+u9MGVBUYfQI9/u2Tne7PLiwp2Q6MFs/Am2mMwqfCZV6njnU8
	 WwUnR0nZSv6mw==
Message-ID: <sashiko-outbox-236163@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 5/5] arm64: dts: allwinner: add Radxa Cubie A7A board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Enzo Adriano" <enzo.adriano.code@gmail.com>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261126-a733-cubie-a7s-dt-v6-5@gmail.com>
References: <20261126-a733-cubie-a7s-dt-v6-0@gmail.com>
 <20261126-a733-cubie-a7s-dt-v6-5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 20:43:24 +0000
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] arm64: dts: allwinner: cubie-a7a pio vcc-pk-supply wired to
  reg_aldo1
- [Low] arm64: dts: allwinner: cubie-a7a uses deprecated osc32k-clk node
  name
--

commit 9896a0ede91d897f45b1801a9ca22b82ac330613
Author: Andre Przywara <andre.przywara@arm.com>

arm64: dts: allwinner: add Radxa Cubie A7A board

This commit adds the initial Devicetree source for the Allwinner
A733-based Radxa Cubie A7A board, describing its UART, AXP318W PMIC, SD
card, EEPROM, and external RTC.

Link: https://lore.kernel.org/r/20261126172253.1097838-3-andre.przywara@arm=
.com

> diff --git a/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7a.dts b/ar=
ch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7a.dts
> new file mode 100644
> index 0000000000000..9017cadf6c6a9
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7a.dts
> @@ -0,0 +1,385 @@

[ ... ]

> +	osc32k: osc32k-clk {
> +		compatible =3D "fixed-clock";
> +		#clock-cells =3D <0>;
> +		clock-frequency =3D <32768>;
> +	};

[Severity: Low]
Should this node be named clock-osc32k instead of osc32k-clk to match
the ^clock-([0-9]+|[a-z0-9-]+)$ pattern required by
Documentation/devicetree/bindings/clock/fixed-clock.yaml?

[ ... ]

> +&pio {
> +	vcc-pb-supply =3D <&reg_swout2>;	// via VCC-IO
> +	vcc-pc-supply =3D <&reg_cldo5>;
> +	vcc-pd-supply =3D <&reg_swout1>;
> +	vcc-pe-supply =3D <&reg_bldo1>;
> +	vcc-pf-supply =3D <&reg_swout2>;	// via VCC-IO
> +	vcc-pg-supply =3D <&reg_aldo1>;
> +	vcc-ph-supply =3D <&reg_swout2>;	// via VCC-IO
> +	vcc-pj-supply =3D <&reg_swout1>;
> +	vcc-pk-supply =3D <&reg_aldo1>;
> +};

[Severity: Medium]
Should vcc-pk-supply reference &reg_bldo1 instead of &reg_aldo1?

Below, reg_bldo1 is defined as the 1.8 V "vcc-pe-pk-mcsi" rail (without
regulator-always-on), whereas reg_aldo1 is the 3.3 V "vcc-pl-usb" rail.
When a Port K pin is requested, sunxi_pmx_request() enables the bank
supply and calls sunxi_pinctrl_set_io_bias_cfg(), which programs Port K's
PIO_POW_MOD_SEL bit for 3.3 V instead of 1.8 V and leaves reg_bldo1
disabled if no Port E or MCSI consumer is active.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126-a733-cubie=
-a7s-dt-v6-0@gmail.com?part=3D5

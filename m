Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794926289;
	b=EgErD1PW7ueEtQA3wS8vU+o8J5RzYAWpS2Ai0acDilNP2XeSKnfMuzdgfHwo5inEcG3R
	 sGFX9mbXcoXnlB5ppNzGB3+hEn5QOqrZvb8W3yOAOgoj2ZRPuRHQPC7Bdx6U4mpuycBKg
	 iVL7tn74pyShmJ5UARslwff/ghetk2o1G1/AjBnTer6mn7ZnSKRprGsNp5aQ7/zIxJaKu
	 j0imOth+2v0pv560CjgD/TIj+aUNk7iahzvW9gwZYDcQS1o1OBT5/EYqdNkVKyRdA1d4k
	 P7W55V4thLCJ0w1lhcAU5XaAaXqRVwFajOXE8WUicnGLX69ela1ph9IvGgH77jCkw6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794926289;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=VTFCUqWxMs/UMDKH+817AZEmJN866yvTu02EQIoOe/I=;
	b=zVzG9YnfusADrwM+aoiWlA6e4SIephd7ICSPMigle5NFV4VpHEpQ1TZEZWOtGUip/LJO
	 q0SUJeFLnbZ5G34BeBQbZMHeRoMcQF41oinU3VuU2FkeDkS88naWR9iF8cCcYhv74aRUD
	 Z72RvSu9e8EHNesI0TOPXS6P2JF1b9FsNvKPfSZC94VXix4UiPxd9M/78qVmhrfmqZu8Q
	 /JKYROtqLQKyZ8Pz9Zn0RvVVtcyDFebYrNYztQKK8ChgCVerc9KN6cH/bvyrUCp0EE5Ty
	 KQoabioi0an9IqN3WSR6uw7GkAo2RUZTbDO/kKDP/lrBcd2XFUbOudgEwErKuhCrY7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z1nhNWlq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BDF1606A8B6;
	Tue, 17 Nov 2026 14:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z1nhNWlq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E7C11F000C7;
	Tue, 17 Nov 2026 14:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794926289;
	bh=VTFCUqWxMs/UMDKH+817AZEmJN866yvTu02EQIoOe/I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Z1nhNWlqY1OnylVb3wZwJgf6ufN9bST11jc+M+gJ+VpYt3jeQSRLaiKoQJmR6I9xT
	 r283rI1qkjPr/XtUOIM2YrdJ3Sw1vv9gbQMVEW1L/4KsqzkdvwWANheFUBAmvirPhl
	 D4kGaPwwKc/Pe/v+bDz5hZvxlFXGUjCO82tdZaKJgS1otK6MY+cz711Y3oKk0rTkkx
	 tifZtNG8vCrgymisywzOKh5mB04lStNVaLdR44oUCbi08V/li3BLjnuCG1g4LZlJ/l
	 WvUaP7EGRjDqAOiC9HOGtKBsElhcW0raUI/fkcAEZ4Q8rEI5Tr2QCFmoQaFr1HGcKA
	 9nHg6hi6MxEhA==
Message-ID: <sashiko-outbox-218973@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: allwinner: h6: taiqicat-a01: Enable
 Ethernet
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jun Yan" <jerrysteve1101@gmail.com>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261117142122.246986-1-jerrysteve1101@gmail.com>
References: <20261117142122.246986-1-jerrysteve1101@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 14:38:08 +0000
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
- [High] arm64: dts: allwinner: unresolved AC200 labels in
  sun50i-h6-taiqicat-a01.dts
--

commit e13407bcadeb9e661561721128883210b4a0461e
Author: Jun Yan <jerrysteve1101@gmail.com>

arm64: dts: allwinner: h6: taiqicat-a01: Enable Ethernet

This commit enables the EMAC, PWM, I2C3, and AC200 EPHY nodes in the
TaiqiCat A01 device tree to support the onboard 100 Mbit/s Ethernet port.

> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-taiqicat-a01.dts b/a=
rch/arm64/boot/dts/allwinner/sun50i-h6-taiqicat-a01.dts
> index 225f42bd3b9e5..9b192caeecb23 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h6-taiqicat-a01.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-taiqicat-a01.dts

[ ... ]

> @@ -87,6 +88,10 @@ wifi_pwrseq: wifi-pwrseq {
>  	};
>  };
> =20
> +&ac200_clk {
> +	status =3D "okay";
> +};
> +
>  &cpu0 {
>  	cpu-supply =3D <&reg_dcdca>;
>  };
> @@ -107,6 +112,14 @@ &ehci3 {
>  	status =3D "okay";
>  };
> =20
> +&emac {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&rmii_pins>;
> +	phy-mode =3D "rmii";
> +	phy-handle =3D <&ac200_ephy>;
> +	status =3D "okay";
> +};
> +
>  &gpu {
>  	mali-supply =3D <&reg_dcdcc>;
>  	status =3D "okay";
> @@ -123,6 +136,29 @@ hdmi_out_con: endpoint {
>  	};
>  };
> =20
> +&i2c3 {
> +	status =3D "okay";
> +};
> +
> +&mdio {
> +	ethernet-phy-package@1 {
> +		compatible =3D "x-powers,ac200-ephy-package";
> +		reg =3D <1>;
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +		vcc-supply =3D <&reg_aldo2>;
> +		nvmem-cells =3D <&ephy_calibration>;
> +		nvmem-cell-names =3D "configuration";
> +		x-powers,ac200 =3D <&ac200>;
> +		x-powers,xmii-rx-clock-inverted;
> +
> +		ac200_ephy: ethernet-phy@1 {
> +			compatible =3D "ethernet-phy-id0044.1400";
> +			reg =3D <1>;
> +		};
> +	};
> +};

[Severity: High]
Does building sun50i-h6-taiqicat-a01.dtb fail with unresolved phandle and
label references here?

arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi in this tree does not yet
define ac200_clk, rmii_pins, i2c3, ephy_calibration, or ac200, so dtbs
builds with CONFIG_ARCH_SUNXI enabled fail in dtc unless the prerequisite
sun50i-h6.dtsi changes are present.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117142122.2469=
86-1-jerrysteve1101@gmail.com?part=3D1

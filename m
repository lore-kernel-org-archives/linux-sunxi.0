Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED5D43DA35;
	Thu,  4 Jun 2026 12:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780575142; cv=none; b=WukiPjXxvvUyzvQOTSMVR0aDs0TeIVVtkFluLItcVe4NsIdwgNz1ybAYVjcnPq7g1LhZLFw3eItlHfpZHzHAcyCL67crimGgCflZ8BxAK82n5OdfKZOlckPufCA9qCsKexj7S7eRfI124iGKvP9/Tz0PQEZwUxpncqsaI+IdcI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780575142; c=relaxed/simple;
	bh=PUEomZvsCkWoiTzSQa44qt5YvvMgNYQHmdtpSQLinvc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kJUTFD/icrLI2XvZq9Li36ltpemJSg6QSkap27oYHOPqscfe/uW1LD2AiTQ0h3dHsnDhxE1EL/wlNJearsK/EV5u9qYBaj+fRHBVEses15Z/NV/Dwup2VlCh1VfS0zi2dui8UQzzKyMa/Xez6LrT19F8dvgm2lED2217h5TxnEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KCbf2ykz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KCbf2ykz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CBD01F00893;
	Thu,  4 Jun 2026 12:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780575139;
	bh=NhwR/kUVmnXG10zOM9nvX5ddyVHe7PYXm3c07vyDm4k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KCbf2ykzmxPTC+zyaWwEPCYEUdWY/51vCkqHo8jYylzCex6+ECe2aIraG9dHggf+Q
	 YWnMptecTOoxZuB61/ZJF/9lyExsPPP1hmmXXtnFPfSPClIQlXOHxThejL5AMw8nw9
	 EsuJjhwFu4Xjx4C91/r4bns9Zi8rty8NPyHd2FP17U564SIQbxNTBR+tvlZUGWQ05w
	 PZQiF8/gl6gKntIYYDgQ2FzBklOXUVvOvPpC73UTUpI/OmSvbA5G8hA5VSiWTZILRA
	 ou0KdiN80QaP8g0WF628UNghGoeBBSdXxSBuhSLW8RUmRhqcqSSHH+gtwqiV2E+sRs
	 T0g749bNewNOg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 3/3] ARM: dts: sunxi: add support for NetCube Systems
 OpenNMC (dobermann)
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lukas Schmid" <lukas.schmid@netcube.li>
Cc: conor+dt@kernel.org, linux-sunxi@lists.linux.dev, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260604115241.1358528-4-lukas.schmid@netcube.li>
References: <20260604115241.1358528-4-lukas.schmid@netcube.li>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 12:12:18 +0000
Message-Id: <20260604121219.3CBD01F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] The `gpio-line-names` array incorrectly swaps the labels for the I2=
C2 and I2C3 buses.
- [Low] The `gpio-line-names` array duplicates the `uSD_CLK` label and is m=
issing the `uSD_CMD` label.
--

commit 29f0ec8865f8acd19ab87f4cdc6247b24643400b
Author: Lukas Schmid <lukas.schmid@netcube.li>
Subject: ARM: dts: sunxi: add support for NetCube Systems OpenNMC (doberman=
n)

This commit adds a new device tree for the NetCube Systems OpenNMC=20
(dobermann), which is based on the Nagami System-on-Module. It defines=20
hardware configurations for various interfaces including LEDs, USB, I2C,=20
and sets up GPIO line names.

> diff --git a/arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-dobermann.dt=
s b/arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-dobermann.dts
> new file mode 100644
> index 0000000000000..97dd4b950dd8a
> --- /dev/null
> +++ b/arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-dobermann.dts
[ ... ]
> @@ -0,0 +1,149 @@
[ ... ]
> +&pio {
> +	gpio-line-names =3D "", "", "", "", // PA
[ ... ]
> +			  "", "", "", "", // PD
> +			  "", "", "", "",
> +			  "", "USB_SEC_EN", "EXT_SPI_nCS", "EXT_SPI_SCK",
> +			  "EXT_SPI_MOSI", "EXT_SPI_MISO", "EXT_IO5", "EXT_IO4",
> +			  "SMART_SEL", "", "", "",
> +			  "I2C3_SCL", "I2C3_SDA", "TUSB320_nINT", "",
[Severity: Low]
Are the labels for I2C2 and I2C3 swapped here?=20

According to the sunxi-d1s-t113.dtsi pinctrl definitions, PD20 and PD21 are=
=20
typically associated with I2C2. However, the labels defined here indicate=20
I2C3.

> +			  "", "", "", "",
> +			  "", "", "", "",
> +			  "ETH_CRSDV", "ETH_RXD0", "ETH_RXD1", "ETH_TXCK", // PE
[ ... ]
> +			  "", "", "", "",
> +			  "uSD_D1", "uSD_D0", "uSD_CLK", "uSD_CLK", // PF
[Severity: Low]
Is this missing the uSD_CMD label?=20

Both PF2 and PF3 are identically labeled as uSD_CLK, which exposes a=20
conflicting pin name to userspace utilities.

> +			  "uSD_D3", "uSD_D2", "TUSB320_ID", "",
[ ... ]
> +			  "", "", "", "",
> +			  "ESP_CLK", "ESP_CMD", "ESP_D0", "ESP_D1", // PG
> +			  "ESP_D2", "ESP_D3", "ESP_TXD", "ESP_RXD",
> +			  "ESP_nBOOT", "ESP_nRST", "I2C2_SCL", "I2C2_SDA",
[Severity: Low]
Similar to the PD pins above, should PG10 and PG11 be labeled as I2C3=20
instead of I2C2?

> +			  "EXT_IO1", "EXT_IO0", "LED_HEARTBEAT", "SD_DETECT",
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260604115241.1358=
528-1-lukas.schmid@netcube.li?part=3D3

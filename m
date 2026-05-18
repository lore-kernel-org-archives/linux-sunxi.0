Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C5419E819;
	Mon, 18 May 2026 00:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779063993; cv=none; b=sGMGPgFSp/Y8PP9/PEqxyFN3YQSTKlG+Hm+1rwosBYuQXRy1LlGvrnTWIT0vlTAW5/U/2B5/y8ARwkWdKMTq05LyfavjpcUm7zCA2otPRX9bca6oCb8ZwobiSHI+ESVk+1LJIcKkNZk/SjPTGiyulHMby7zjA92t55MtpBSBodA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779063993; c=relaxed/simple;
	bh=OmAfVGzD5amtSd89Zb1/CqqVHLNxxumlMkbl/hXJWyo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ehl3jzB77v89dZg0vbX5r+9qDJlmsApQFJRwHYX6Z+XnNhwakclJK/Y/lBq7Y1slz+d/m4fei0JZ1eiTpdLUT3hmGHhmoaEIiMpSXqsAz3kffit5lALggu8VZpe07c2yeQBqkP3vvmhVlr8Pa/DgPQoNxK55odO4+3KsJBOhD98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MbWQnex4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MbWQnex4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBDE7C2BCB0;
	Mon, 18 May 2026 00:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779063992;
	bh=OmAfVGzD5amtSd89Zb1/CqqVHLNxxumlMkbl/hXJWyo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=MbWQnex4dObZMjcn0Ist/SP1LrnmpVB/B1FCG7jxxgESo/3rg3qaZ3Z/R8Q/9eqt/
	 p81LMhH0fyNqkjythjwBKGqoTc8rsrvpkQ9apHsoDRaFDiR9nvkF73wVIRPYRxA3dC
	 r2PbFGy+x7Fdq9KPQkId8ZEet9ItRVSDZB7ucwcSxkMJwx3nTNbSmm1F9sioNszEsu
	 ri8VZyod6gU/7RhKyISVJhiUdpQSJltP30AlqPjl4fLKxRrjDmSVNhbJjUO9oTDwkw
	 UfBL1SYjsRIhTdEuFIPTy6C1bMuX4Vf8cJbUVPzS4sI9Fq5gcL3CQ3I/K+Dz0XP5S+
	 Kovc/iRZBvhEw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/5] arm64: dts: allwinner: A133: add support for
 Baijie Helper A133 board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexander Sverdlin" <alexander.sverdlin@gmail.com>
Cc: robh@kernel.org, linux-sunxi@lists.linux.dev, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260517234134.2737320-5-alexander.sverdlin@gmail.com>
References: <20260517234134.2737320-5-alexander.sverdlin@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 18 May 2026 00:26:31 +0000
Message-Id: <20260518002631.EBDE7C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] Misplaced `vcc-pl-supply` property and incorrect architectural attr=
ibution in comments.
- [Low] Commit message contradiction regarding USB topology.
--

commit d668428c158ab5f1654141d1c2e6dd96b970af49
Author: Alexander Sverdlin <alexander.sverdlin@gmail.com>

arm64: dts: allwinner: A133: add support for Baijie Helper A133 board

Add initial support for both the Helper and Core boards, including UART,
PMU, eMMC, USB, Ethernet, and LRADC-connected buttons.

> Baijie Helper A133 board is a development board around Baijie A133 Core
> SBC. Features:
>=20
> - 1/2/4GiB LPDDR4 DRAM
> - 8/16/32GiB eMMC
> - AXP707 PMIC
> - USB-C OTG port in peripheral mode (via onboard hub)

This isn't a bug, but is the description of the USB topology accurate?

A USB port operating in peripheral mode cannot be routed through a standard
downstream USB hub to act as a device, as USB hubs are strictly
host-to-device interfaces.

Does the onboard hub instead connect to the ehci1/ohci1 host port to
provide the 2 USB 2.0 ports, while the usb_otg port is directly
connected to the USB-C port?

[ ... ]

> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a133-baijie-core.dtsi b=
/arch/arm64/boot/dts/allwinner/sun50i-a133-baijie-core.dtsi
> new file mode 100644
> index 0000000000000..7a09a5181c03b
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a133-baijie-core.dtsi

[ ... ]

> +&pio {
> +	vcc-pb-supply =3D <&reg_dcdc1>;
> +	vcc-pc-supply =3D <&reg_eldo1>;
> +	vcc-pd-supply =3D <&reg_dcdc1>;
> +	vcc-pe-supply =3D <&reg_dldo2>;
> +	vcc-pf-supply =3D <&reg_dcdc1>;
> +	vcc-pg-supply =3D <&reg_dldo1>;
> +	vcc-ph-supply =3D <&reg_dcdc1>;
> +	/*
> +	 * PL0/PL1 are the I2C connection to PMIC, but it would create a
> +	 * circular dependency:
> +	 * vcc-pl-supply =3D <&reg_aldo3>;
> +	 */
> +};

Does this comment accurately reflect the hardware architecture?

In Allwinner A100/A133 SoCs, the main pio pin controller manages banks
PB through PH, while Port L (PL) pins are managed by a separate r_pio
controller in the PRCM domain.

If vcc-pl-supply were uncommented here, wouldn't it simply be ignored
by the pio node rather than creating a circular dependency? Should this
property and comment instead be associated with the r_pio node?

[ ... ]

> +&reg_aldo3 {
> +	/*
> +	 * Port L, but linking it to &pio node would create a circular
> +	 * dependency because of PL0/PL1 I2C connection to PMIC
> +	 */
> +	regulator-always-on;
> +	regulator-min-microvolt =3D <1800000>;

Similarly here, should this comment refer to the r_pio node instead of
the pio node?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260517234134.2737=
320-1-alexander.sverdlin@gmail.com?part=3D4

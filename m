Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4161F27281D;
	Mon, 18 May 2026 16:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779120694; cv=none; b=mOatYNMeHb3IQgY5jE5P09AbIocjKCR6A0ajg6ChkmhD8n2U/7G1kZrnyzvN1U1tbrhVtrKPRUMpEa0YPGx/Lx1tPsHIy6CYRMFgKJvhuR9itE7E1bbsLgaY/cYvLbxmrnPbES7mPYSNeo9oUwz4iPXcV6mWZMC30COOjYs/VJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779120694; c=relaxed/simple;
	bh=cb8j6DnkkjLHSGPe4ydRwB7IZQAkr3Jwq510+XI2TFU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Z1DjX6EO44lsBZmw6c+EGxS1DyNr1exGzPG801GtVMq/2dMJque17OLhX3GXn6ofA3bjTvh/xcLmXQjFJmWwxmZn9vV5GSJl6aAevhptxRhVYakiMLDQEGMAvMWbc5bs84LYwKWHYBdq6SKO5d2mSlb/chCFeRUqg/VGVqzP01A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b3lxeVtm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b3lxeVtm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0A4CC2BCB7;
	Mon, 18 May 2026 16:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779120691;
	bh=cb8j6DnkkjLHSGPe4ydRwB7IZQAkr3Jwq510+XI2TFU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=b3lxeVtmGQUl2V78Bx8xd36f/K3QghoZw/iM77E1Gbdb3KPbw9cQGvwR4bpXsJZET
	 wKScuuLGEwQRe8oPcGzi/miQwX9bOvLqEejZOagO93GO5jtkMknuRZuTsV2m/KK0LT
	 z52rvKfaPn6qPPvqvRhgNGC/ue4cICGPeLlH7xEuATH6p0fyeWr8EHc+arKOEosChA
	 nDys1gMewmE1TEoV7uiSqq9D6bi8/jEq0lBstSweJt0FG+7GdUMuGxPuJAtA1zwmsx
	 3xOY4e5gWc/7+jqOWX9L6ZUVFRwTJPwBNAF6XAw+1SnjfmEAwFJmTS6vdTMdm/2Wvm
	 kfuuK9UuFIVqg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 5/9] ARM: dts: sun8i: v3s: Add nodes for MIPI CSI-2
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Paul Kocialkowski" <paulk@sys-base.io>
Cc: linux-sunxi@lists.linux.dev, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260518153339.619947-6-paulk@sys-base.io>
References: <20260518153339.619947-6-paulk@sys-base.io>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 18 May 2026 16:11:30 +0000
Message-Id: <20260518161130.F0A4CC2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `dphy` node is missing the required `interrupts` property an=
d a SoC-specific compatible string.
--

commit ceae1b5da24380c4a30d9a8b480a23eaee3c0814
Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

ARM: dts: sun8i: v3s: Add nodes for MIPI CSI-2 support

This commit adds MIPI CSI-2 support to the Allwinner V3s SoC. It introduces
the device tree nodes for the CSI0 controller, the MIPI CSI-2 bridge, and
the D-PHY block.

> diff --git a/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi b/arch/arm/boot/d=
ts/allwinner/sun8i-v3s.dtsi
> --- a/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
> +++ b/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
[ ... ]
> +		dphy: d-phy@1cb2000 {
> +			compatible =3D "allwinner,sun6i-a31-mipi-dphy";

Should a SoC-specific compatible string like "allwinner,sun8i-v3s-mipi-dphy"
be included here alongside the generic a31 fallback?

> +			reg =3D <0x01cb2000 0x1000>;
> +			clocks =3D <&ccu CLK_BUS_CSI>,
> +				 <&ccu CLK_MIPI_CSI>;
> +			clock-names =3D "bus", "mod";
> +			resets =3D <&ccu RST_BUS_CSI>;

Will this node fail dtbs_check schema validation? The existing device tree
binding schema for "allwinner,sun6i-a31-mipi-dphy" requires an interrupts
property, which appears to be missing here.

If the V3s hardware physically lacks a D-PHY interrupt, would it be better
to add the V3s-specific compatible string and update the binding schema
to make the interrupts property conditionally optional for the V3s?

> +			allwinner,direction =3D "rx";
> +			status =3D "disabled";
> +			#phy-cells =3D <0>;
> +		};
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518153339.6199=
47-1-paulk@sys-base.io?part=3D5

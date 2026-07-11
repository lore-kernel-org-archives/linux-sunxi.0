Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADAB823EA84;
	Sat, 11 Jul 2026 14:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783779105; cv=none; b=Jo3zK55vILOSDhnIzxko+MnSs7XbwsUMM9nG8DU6YUs3jjnODqTIm0/OFdWOei1JowE2W9yuOc01OCXIKggwZaVrnNxMkwcYRMz22vsRhtlmHOV7mYgBidZd4Zj5/VIdrdcGYLCMdPzkaybnWvucMNJat2DZw41d2j+1idj1T4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783779105; c=relaxed/simple;
	bh=Li+14bve5wg1IGokJx7pF83bCsrq00gaJSAmErYxzmk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CNFPEPEJchC4LLHBducKHePTx2/ErELFP0NlLOwbRflKWo6/j8zVUyGqNIPdxarZ6Q+R1apN4i66xElqyarjYzXJgWxI2pqkfDnrpYDmi7H0q50S/twD1ICcOIhl59KZFGcTQgcg97lJD4oFPoXpoPLmM7/WZzhIXWlGYL/VZkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VMuEnViw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VMuEnViw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D9E71F000E9;
	Sat, 11 Jul 2026 14:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783779104;
	bh=1mT/RHH4X1n8qDvj8f+yPFz+vL6eMmOxZwLcuXSkcbA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VMuEnViwEpCC5k6JsrL9csyAVvrRKaX7MtV5c8A+z51UoPs5rxdnZEcDC8U7Vj0Ji
	 7Rvnfew7HT4V1zsEjwLjpG4OfqTwc4dNpElw2J5OE9BDn4JkiINbHNLeLj64/7N71+
	 0xGbM/GtSvIxZ1g9HzKw284DYPu6+ixUVeVJqUxfJekrnErKGBIl0TA8eDAwdfkt8F
	 zO8IKLO3SgYQrHjLJVG4/c7vbLlRVIaBTSkz/CRUn9kZznUqorNz3xAao8FHU626xN
	 6//dQcMLywPA5NrxWYHIAp2pyzsUGT/y9kn36SqeGkE/vYistTrBj2k/oGJb1uHkUh
	 nlqV7R7xMKOSw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 7/7] arm64: dts: allwinner: sun50i-h616: Add video
 engine
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chen-Yu Tsai" <wens@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org
In-Reply-To: <20260711135959.3616919-8-wens@kernel.org>
References: <20260711135959.3616919-1-wens@kernel.org>
 <20260711135959.3616919-8-wens@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 11 Jul 2026 14:11:43 +0000
Message-Id: <20260711141144.3D9E71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] The video-codec node references a non-existent label 've_sram', cau=
sing a Device Tree Compiler (DTC) build failure.
- [Low] The `allwinner,sram` property incorrectly references the generic `m=
mio-sram` parent controller node (`&sram_c`) instead of an `sram-section` c=
hild node.
--

--- Patch [7]: [PATCH v2 7/7] arm64: dts: allwinner: sun50i-h616: Add video=
 engine ---
commit f351af2797d5cc85ad73122a961f9b9e63f82153
Author: Jernej Skrabec <jernej.skrabec@gmail.com>

arm64: dts: allwinner: sun50i-h616: Add video engine

This commit adds the video engine node to the sun50i-h616 device tree file.
It defines the required memory regions, clocks, resets, interrupts, and
SRAM nodes needed by the engine.

> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/=
boot/dts/allwinner/sun50i-h616.dtsi
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
[ ... ]
> @@ -175,6 +175,18 @@ crypto: crypto@1904000 {
>  			resets =3D <&ccu RST_BUS_CE>;
>  		};
> =20
> +		video-codec@1c0e000 {
> +			compatible =3D "allwinner,sun50i-h616-video-engine";
> +			reg =3D <0x01c0e000 0x2000>;
> +			clocks =3D <&ccu CLK_BUS_VE>, <&ccu CLK_VE>,
> +				 <&ccu CLK_MBUS_VE>;
> +			clock-names =3D "ahb", "mod", "ram";
> +			resets =3D <&ccu RST_BUS_VE>;
> +			interrupts =3D <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
> +			iommus =3D <&iommu 3>, <&iommu 2>;
> +			allwinner,sram =3D <&ve_sram 1>, <&sram_c 1>;

[Severity: Low]
Is the ve_sram label defined elsewhere? The Device Tree Compiler (DTC) will
fail to build because of this unresolved reference. It appears the sram_c1
node and its ve_sram child section might be missing.

[Severity: Low]
Does the second phandle correctly reference an sram-section child node?
Referencing &sram_c here points to the generic mmio-sram parent controller
node, which lacks #sram-cells. This violates the bindings and triggers a
dt-validate schema failure.

> +		};
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260711135959.3616=
919-1-wens@kernel.org?part=3D7

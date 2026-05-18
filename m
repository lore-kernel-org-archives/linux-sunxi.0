Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C4AC17BCA;
	Mon, 18 May 2026 00:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779062542; cv=none; b=rOe4ke52PeE7BEKQy03WE3rSxirDFgUjig2UATsyIEVY/RxZeFcCQtJEHJZlbR+2fv6ZKYd3n5Co3OIOoQIUfLHmwxUeDXJnGac00eRvQLT+2SXQ+pKmnvVlhi2IR8fcyXlRZvD/nrnSrcxhKUL/nzsNUNRNNJquzmb+C3Y3kXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779062542; c=relaxed/simple;
	bh=+vdMM0FcJkTIg4Fn+vISqNFY+xMh4Wn90y1BWpGzstM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DSG3sNWrNXEnncvvN/F57StlegmxPeMC+5T97osgJ5hUAtfRziXLsFUCcv2u7xAjZqUj3q2/s5pzqjj1G7Vd5gGUWQWB2pPN+7Lmh8brW0TZ5cFW2m3HXnsCjdQqZyzvkRhDx4185Lnd2dhFdGQUki6Ho1/ocgkjyeRirbiB5Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X9WPQnoW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X9WPQnoW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 985CBC2BCB0;
	Mon, 18 May 2026 00:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779062541;
	bh=+vdMM0FcJkTIg4Fn+vISqNFY+xMh4Wn90y1BWpGzstM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=X9WPQnoW440xO9OAbav4UQcCJWrApg8MrfGn4bD1u9fvyj8M7w2zpbsV1EoFOoseh
	 N7JR+LjXnZxIVhix4pNMc/bmkOUv4lnwZmiekZRaJJO6X3CrwsPlJbBzGpX5gAjY6U
	 QYjDIQ1NLMEjjuCY8hKGYlQBiU2RkKsJewV9yFpCa7Z7hf1tmjbP3eHt8s3C5bXIfh
	 PBk4KMg2jGOYqRhaqFzgEGWbtfNNrY9cSgMNU+bcDRZBEYc6qQYIpFW647/Rv31mcf
	 2/01iWu4PMu29wYcscu0S4pWpEKnaoPiZuGsViWryTo22l2D1WAPMpuPm8chCtYi02
	 T2alrbmNeSkjQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/5] arm64: dts: allwinner: a100: Add LRADC node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexander Sverdlin" <alexander.sverdlin@gmail.com>
Cc: conor+dt@kernel.org, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260517234134.2737320-4-alexander.sverdlin@gmail.com>
References: <20260517234134.2737320-4-alexander.sverdlin@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 18 May 2026 00:02:21 +0000
Message-Id: <20260518000221.985CBC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Missing SoC-specific compatible string for the LRADC device tree=
 node.
- [Low] Non-standard device tree node name 'lradc'.
--

commit 2888476527aa17fae679cf9ed23a85ccc8db7463
Author: Alexander Sverdlin <alexander.sverdlin@gmail.com>

arm64: dts: allwinner: a100: Add LRADC node

This commit adds the Low Rate ADC (LRADC) device tree node for the Allwinner
A100/A133 SoCs. The IP block is primarily used for key applications and
supports various operating modes.

> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi b/arch/arm64/=
boot/dts/allwinner/sun50i-a100.dtsi
> index b3fb1e0ee796b..2bba13c5d25cd 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
> @@ -466,6 +466,15 @@ ths: thermal-sensor@5070400 {
>  			#thermal-sensor-cells =3D <1>;
>  		};
> =20
> +		lradc: lradc@5070800 {

Could this node use a more generic name like adc@5070800 or keys@5070800?

Other device nodes in this file adhere to the generic naming convention
recommended by the Devicetree Specification.

> +			compatible =3D "allwinner,sun50i-r329-lradc";

Is the A100-specific compatible string missing from this node?

Other recent Allwinner SoCs utilizing this IP define their own specific
compatible alongside the fallback.

Would including an A100-specific string like "allwinner,sun50i-a100-lradc"
allow handling potential quirks without breaking backward compatibility?

> +			reg =3D <0x05070800 0x400>;
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260517234134.2737=
320-1-alexander.sverdlin@gmail.com?part=3D3

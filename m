Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5DFD1ACEC2
	for <linux-sunxi@lists.linux.dev>; Mon,  9 Dec 2024 17:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733767012; cv=none; b=fZdcyLFyDv9MpTgpjci4tWaqhq5clFX8W5A4PKZOmg7zU13X8/b7ajj8RaEB2qP75xnhBBwwGmnw84zMOWUhXBZ+Uol5GIKDETPcoZOShTW1ricE4NH++hko493xLobpUxJyGnQa61+SWMshX/qkvXu6wy/d2Ok0pOt2VFauV3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733767012; c=relaxed/simple;
	bh=W9FPQOutx8gVYOk7R1nb+m7MpLo7h3sgEOsxlikF1NA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fgoY9Yki1PI+CIzFeSjHyOXb6J1bRLEiQdf5sYIXrOeR3zrYozDJnS9H+LStNurTZ5F87fn/FBlZwt2FkfPyPKAlQJAOE75n7VSa9jSP8gwN0MHLnei2rz1ZuHMOrOwsTdzKj8Ad3uA5xhUOouG3QJ0pJUsBEGonKZNz7CJmrBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DF9531650;
	Mon,  9 Dec 2024 09:57:17 -0800 (PST)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 899D53F720;
	Mon,  9 Dec 2024 09:56:47 -0800 (PST)
Date: Mon, 9 Dec 2024 17:56:37 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: "=?UTF-8?B?Q3PDs2vDoXMs?= Bence" <csokas.bence@prolan.hu>
Cc: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-sunxi@lists.linux.dev>, <linux-kernel@vger.kernel.org>, Mesih Kilinc
 <mesihkilinc@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>
Subject: Re: [PATCH 1/3] ARM: dts: suniv: f1c100s: Add support for DMA
Message-ID: <20241209175637.283312fa@donnerap.manchester.arm.com>
In-Reply-To: <20241205000137.187450-2-csokas.bence@prolan.hu>
References: <20241205000137.187450-1-csokas.bence@prolan.hu>
	<20241205000137.187450-2-csokas.bence@prolan.hu>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 5 Dec 2024 01:01:36 +0100
"Cs=C3=B3k=C3=A1s, Bence" <csokas.bence@prolan.hu> wrote:

> From: Mesih Kilinc <mesihkilinc@gmail.com>
>=20
> Allwinner suniv F1C100s now has DMA support. Enable it under device
> tree.
>=20
> Signed-off-by: Mesih Kilinc <mesihkilinc@gmail.com>
> [ csokas.bence: Rebased on current master ]
> Signed-off-by: Cs=C3=B3k=C3=A1s, Bence <csokas.bence@prolan.hu>

Compared against the manual:

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>  arch/arm/boot/dts/allwinner/suniv-f1c100s.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/allwinner/suniv-f1c100s.dtsi b/arch/arm/bo=
ot/dts/allwinner/suniv-f1c100s.dtsi
> index 3c61d59ab5f8..290efe026ceb 100644
> --- a/arch/arm/boot/dts/allwinner/suniv-f1c100s.dtsi
> +++ b/arch/arm/boot/dts/allwinner/suniv-f1c100s.dtsi
> @@ -6,6 +6,7 @@
> =20
>  #include <dt-bindings/clock/suniv-ccu-f1c100s.h>
>  #include <dt-bindings/reset/suniv-ccu-f1c100s.h>
> +#include <dt-bindings/dma/sun4i-a10.h>
> =20
>  / {
>  	#address-cells =3D <1>;
> @@ -159,6 +160,15 @@ usbphy: phy@1c13400 {
>  			status =3D "disabled";
>  		};
> =20
> +		dma: dma-controller@1c02000 {
> +			compatible =3D "allwinner,suniv-f1c100s-dma";
> +			reg =3D <0x01c02000 0x1000>;
> +			interrupts =3D <18>;
> +			clocks =3D <&ccu CLK_BUS_DMA>;
> +			resets =3D <&ccu RST_BUS_DMA>;
> +			#dma-cells =3D <2>;
> +		};
> +
>  		ccu: clock@1c20000 {
>  			compatible =3D "allwinner,suniv-f1c100s-ccu";
>  			reg =3D <0x01c20000 0x400>;


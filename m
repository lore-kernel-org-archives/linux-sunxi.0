Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF25B1D9663
	for <linux-sunxi@lists.linux.dev>; Mon, 21 Apr 2025 03:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745207028; cv=pass; b=Htzx/7btepOtG3jJA2viMcEnX0scP5r8HY8n0zUOgrMIIk1AcDo8YqLvsAeZ18XTPQ6B5jhoWNug5aKGSX3j8KfDmGLMdhjc3G+wI1G+SkkHM6NATbXOwJ6J7vdYfqstC+cfnPAxflZBZTF9VVYp7mexgn0alf58bOh9KLKrQC4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745207028; c=relaxed/simple;
	bh=2iXvIt0PZVb4xa0VWA2Fs/VCdHxp9uSiFZs7ozi9RsY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=C7DPjGmg+unHifx8+bKKEPKn8ouzcB8aC/lIdwEEveOE+UJsFR9URNLIQJcxt7/hKRu3ICIdsqJ5om2NBwSg2QfGYYFw7F6Xg3hkhmyU7rAU6DItFL7+BzBgOXGRR+ooF+njdEhfMQLZPX5d0LpRAWlp1mq2LaHaPdzTMWEbwvY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me; spf=pass smtp.mailfrom=icenowy.me; dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b=TlIMsNPa; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icenowy.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b="TlIMsNPa"
ARC-Seal: i=1; a=rsa-sha256; t=1745207015; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=LWn/J8Kn8/FXQ5g61xOUlIKReeSHlN20ryLlwElQ6d5tK0hQO27T8RCsOr0cLX30iuDb65wjAA+PbaElNEVse0F9cfFztATp32fJQ5T3dEwBWEA85E492hXK74/+Gvl0NtUKS6pOaDC0UgRFHsP7Bb8+Jh9ekcaG8P3bkEkWNTM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745207015; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=2iXvIt0PZVb4xa0VWA2Fs/VCdHxp9uSiFZs7ozi9RsY=; 
	b=gyj3gj6vXvqLBIcN+W/lAlNYsIjMMEjGOR9MeY0FgOOpdy7scDUNDJBvjAw7FLr9AZrnChMP2jmeEHJSSqjeag0y/w693JaHDLeUQv2knmOuFAdIwCBk7Gif/HHSd2aKNnrp2HbBWkRr8N0PIVMGQGjJ5gTn6u+hWf9cxTbeRdk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745207015;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=2iXvIt0PZVb4xa0VWA2Fs/VCdHxp9uSiFZs7ozi9RsY=;
	b=TlIMsNPaORWeO2slWf/9EEigjPHsSH3IkJ61TylvBpI2vfw8EH2Vx4k0VbtaCvAE
	t2hI7B/+CtyaECM0wcsRdWarP0D8VAXbh1PtRguITgaU45lH4VPqmcFqehIBV0qUeDh
	SQ/nO/uz5ZJu8iZ+JoylGrfm2oXkoAxZnGEK3zmKNljPWYI72mPFeuVJK7xHaYeGi/W
	pQpCks2pOj4+frJklXt9rcOqymgFsYmg7rPqcigTIpR8AHE1GwJyDK9n8gSbznrpTO2
	Di1EtKKnOs0ZFqGTG/wCjWF49QOgfJPOI+ymZwd9Zda06tooMjQur6eomNfInmceMNd
	oOHUyy/poA==
Received: by mx.zohomail.com with SMTPS id 17452070129989.976056380052796;
	Sun, 20 Apr 2025 20:43:32 -0700 (PDT)
Message-ID: <16b34d85a710b4900e6d842c001a38b3d538bc2a.camel@icenowy.me>
Subject: Re: [RFC] arm64: dts: allwinner: a64: Add overlay for Realtek
From: Icenowy Zheng <uwu@icenowy.me>
To: Dragan Simic <dsimic@manjaro.org>, Peter Robinson <pbrobinson@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>,  Samuel Holland <samuel@sholland.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev
Date: Mon, 21 Apr 2025 11:43:27 +0800
In-Reply-To: <f063ced3436e239eaad8ab0589ba2cb1@manjaro.org>
References: <20250419160751.678827-1-pbrobinson@gmail.com>
	 <f063ced3436e239eaad8ab0589ba2cb1@manjaro.org>
Organization: Anthon Open-Source Community
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ZohoMailClient: External

=E5=9C=A8 2025-04-19=E6=98=9F=E6=9C=9F=E5=85=AD=E7=9A=84 20:08 +0200=EF=BC=
=8CDragan Simic=E5=86=99=E9=81=93=EF=BC=9A
> Hello Peter,
>=20
> On 2025-04-19 18:07, Peter Robinson wrote:
> > Add overlay for the Pine64 Realtek rtl8723bs WiFi
> > module that works on the Pine64/64+/SoPine devices.
> >=20
> > Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> >=20
> > I've looked at overlays for other vendors, such as available
> > for some of the Rockchip devices, and I believe I have this
> > mostly correct but would like some feedback both on if I have
> > everything needed for Allwinner devices, but also what's needed
> > to be able to use a single overlay across more than one device.
> >=20
> > This is dependent on the following [1] patch series.
> >=20
> > Peter
> >=20
> > [1]=20
> > https://lore.kernel.org/linux-devicetree/20250419160051.677485-3-pbrobi=
nson@gmail.com/t/#u
> >=20
> > ---
> > =C2=A0arch/arm64/boot/dts/allwinner/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 6 ++++
> > =C2=A0.../allwinner/sun50i-a64-pine64-realtek.dtso=C2=A0 | 30
> > +++++++++++++++++++
> > =C2=A02 files changed, 36 insertions(+)
> > =C2=A0create mode 100644=20
> > arch/arm64/boot/dts/allwinner/sun50i-a64-pine64-realtek.dtso
> >=20
> > diff --git a/arch/arm64/boot/dts/allwinner/Makefile
> > b/arch/arm64/boot/dts/allwinner/Makefile
> > index 00bed412ee31..be991f8d8110 100644
> > --- a/arch/arm64/boot/dts/allwinner/Makefile
> > +++ b/arch/arm64/boot/dts/allwinner/Makefile
> > @@ -8,6 +8,7 @@ dtb-$(CONFIG_ARCH_SUNXI) +=3D=20
> > sun50i-a64-olinuxino-emmc.dtb
> > =C2=A0dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-a64-orangepi-win.dtb
> > =C2=A0dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-a64-pine64-lts.dtb
> > =C2=A0dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-a64-pine64-plus.dtb=20
> > sun50i-a64-pine64.dtb
> > +dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-a64-pine64-realtek.dtb
> > =C2=A0dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-a64-pinebook.dtb
> > =C2=A0dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-a64-pinephone-1.0.dtb
> > =C2=A0dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-a64-pinephone-1.1.dtb
> > @@ -52,3 +53,8 @@ dtb-$(CONFIG_ARCH_SUNXI) +=3D
> > sun50i-h700-anbernic-rg35xx-2024.dtb
> > =C2=A0dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h700-anbernic-rg35xx-h.dtb
> > =C2=A0dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h700-anbernic-rg35xx-plus.dt=
b
> > =C2=A0dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h700-anbernic-rg35xx-sp.dtb
> > +
> > +# Overlays
> > +sun50i-a64-pine64-realtek-dtbs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :=3D sun5=
0i-a64-pine64.dtb
> > sun50i-a64-pine64-realtek.dtbo
> > +sun50i-a64-pine64-lts-realtek-dtbs=C2=A0 :=3D sun50i-a64-pine64-lts.dt=
b
> > sun50i-a64-pine64-realtek.dtbo
> > +sun50i-a64-pine64-plus-realtek-dtbs :=3D sun50i-a64-pine64-plus.dtb
> > sun50i-a64-pine64-realtek.dtbo
>=20
> Thanks for the patch, having this DT overlay makes perfectly
> sense to me.=C2=A0 The only possible issues may arise from the
> resulting size increase of the compiled .dtb files, caused by
> the implicit inclusion of symbols.
>=20
> However, please see an earlier linux-rockchip thread [2] that
> shows the desired layout of the additions to the Makefile, which
> was determined through a few rounds of discussion.
>=20
> Finally, I think we should choose a slightly better name for the
> DT overlay, instead of "sun50i-a64-pine64-realtek.dtso", in which
> "-realtek" seems a bit to vague.=C2=A0 Perhaps "-wifi-bt-addon" as the
> filename suffix would fit better, and it's virtually guaranteed
> that there will be no new version of that add-on board, so there
> should be no potential for name clashing.

Yes. In fact I think Pine64 messed up with pinouts of Wi-Fi modules and
only the RTL8723BS module works with Pine A64. (The Broadcom/Ampak ones
only work with Rockchip boards, as what I assumed.)

>=20
> As a minor suggestion, the patch subject should also be tweaked
> a bit, because "Realtek" is also a bit too vague there.
>=20
> [2]=20
> https://lore.kernel.org/linux-rockchip/20250226140942.3825223-4-heiko@snt=
ech.de/
>=20
> > diff --git
> > a/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64-realtek.dtso
> > b/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64-realtek.dtso
> > new file mode 100644
> > index 000000000000..51b57a46e23f
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64-realtek.dtso
> > @@ -0,0 +1,30 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +// Copyright (c) 2025 Peter Robinson
> > +
> > +/dts-v1/;
> > +/plugin/;
> > +
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/interrupt-controller/arm-gic.h>
> > +
> > +&mmc1 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0status =3D "okay";
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0rtl8723bs: wifi@1 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0reg =3D <1>;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0interrupt-parent =3D <&r_pio>;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0interrupts =3D <0 3 IRQ_TYPE_LEVEL_LOW>; /* PL3 */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0interrupt-names =3D "host-wake";
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0};
> > +};
> > +
> > +&uart1 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0status =3D "okay";
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bluetooth {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0compatible =3D "realtek,rtl8723bs-bt";
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0device-wake-gpios =3D <&r_pio 0 6 GPIO_ACTIVE_HIGH>;
> > /* PL6 */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0enable-gpios =3D <&r_pio 0 4 GPIO_ACTIVE_HIGH>; /*
> > PL4 */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0host-wake-gpios =3D <&r_pio 0 5 GPIO_ACTIVE_HIGH>; /*
> > PL5 */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0};
> > +};
>=20


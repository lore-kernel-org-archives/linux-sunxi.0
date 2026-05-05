Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912B846AF17
	for <linux-sunxi@lists.linux.dev>; Tue,  5 May 2026 14:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777992014; cv=none; b=Zqz7q83/+qaIUmdOxwXUFCTZEazFX8wGBQ0Iu8qJHrBNFl3uABQhqleOV8r1yu8c6JIRnhhIB5Ksga5ZXYLmrQb/HXI7q0b8cOLQrVPjnU+cdHiKBrleDAQqddoGF601EMj8myuZFfOQ6443Q7DS16pHfE25npR2aiC4ipgdM68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777992014; c=relaxed/simple;
	bh=oMMYfcqr5QWyyTjFtgne0KbL76H6vB+g+XD/Ejp7WPs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NCDTtVP743kThs5Bn7/PYuAfIGaU/6V9saDl3hyaknfbcI0+vvRD+DiZafw+03E9v/t11vfSI9JH8MCBQWW9tQMxsjJ944Z/LY6uRrhToAeUbxZHFT8hyJRc1OsX0nsfqrWFLHsyCik2Q4GWRJGufHNxVILUGE3lwB3SJnq8N5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lieVFvq/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lieVFvq/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 558DAC2BCFF
	for <linux-sunxi@lists.linux.dev>; Tue,  5 May 2026 14:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777992014;
	bh=oMMYfcqr5QWyyTjFtgne0KbL76H6vB+g+XD/Ejp7WPs=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=lieVFvq/RMV0PQA00/M/Kw9VNeYljZNknzOo5rq30W8jUJgvhSM6NKkzThGIxa2Nx
	 sYtQYXYu2hD0BTnPWmSSk6cgUJEZOgyNvsbfBuSPK0DbABDlAY2tYVjHOs55zFeddm
	 UGc9S3WSLB+8cgwT1mdwdp68E4PVVwAGiLvIQj539ILcQyGLePswEoCgvzij+cXiU+
	 T3h8qzRSXWX9GVCk67G1tGmlOWjXZD5f7i3qumIqT6kWaMfvSzEfhdxqIKlw89vjLD
	 SCmAXWR0a2G8JyMSnzjPuqf8t7QR+MPNnNDXTAAlmfyG4APE8ZcuJV2gyGHSJSu4PK
	 y4iIJcXldQ6+A==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-39380e79936so33047321fa.2
        for <linux-sunxi@lists.linux.dev>; Tue, 05 May 2026 07:40:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+1OhLRy9haMb4zsRDi851w5Ko/8QQ0TG6xGu3gEMDjvqdxZ6UOqHOP6OnF03osZSIorHiAzAUViSqgQg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwiWalPWIOAfq04h2G/S9kT/tVeqeQdKrZ9UqL8ps4ArXPVs0cT
	45Nr3ECLofkP1qtlNVm/y543+ZsX1tsQz/oLvbDHLV8JEi5mw3UUuyLjbCW8GB1xxCxmu0mTX0L
	eGT8diFBm8DeIcJfhrmR2jNCumGr7qiw=
X-Received: by 2002:a05:651c:1550:b0:38e:cab9:362f with SMTP id
 38308e7fff4ca-393b4aee55fmr16699711fa.5.1777992012684; Tue, 05 May 2026
 07:40:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260428-h616-t113s-hstimer-v3-0-7e02178a93ee@mmpsystems.pl> <20260428-h616-t113s-hstimer-v3-3-7e02178a93ee@mmpsystems.pl>
In-Reply-To: <20260428-h616-t113s-hstimer-v3-3-7e02178a93ee@mmpsystems.pl>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 5 May 2026 22:39:59 +0800
X-Gmail-Original-Message-ID: <CAGb2v67em9sO-R25hfH2_2WhD+cGfxEFQ6DeY9gobZoHdpRYdg@mail.gmail.com>
X-Gm-Features: AVHnY4JJpxD2X70zsLR6EJJtacKJo_DgD2S2p0UG0bbAjRuSSF1pdG6HAo4DjV4
Message-ID: <CAGb2v67em9sO-R25hfH2_2WhD+cGfxEFQ6DeY9gobZoHdpRYdg@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] arm: dts: allwinner: t113s: add hstimer node
To: Michal Piekos <michal.piekos@mmpsystems.pl>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, Andre Przywara <andre.przywara@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 29, 2026 at 12:29=E2=80=AFAM Michal Piekos
<michal.piekos@mmpsystems.pl> wrote:
>
> Describe high speed timer block on Allwinner T113-S3.
>
> Tested on LCPI-PC-T113/F113:
> - hstimer is registered as clocksource
> - switching clocksource at runtime works
> - after rating increase hstimer operates as a broadcast clockevent device
>
> Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
> ---
>  arch/arm/boot/dts/allwinner/sun8i-t113s.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/arch/arm/boot/dts/allwinner/sun8i-t113s.dtsi b/arch/arm/boot=
/dts/allwinner/sun8i-t113s.dtsi
> index 424f4a2487e2..40e76cfc8a1d 100644
> --- a/arch/arm/boot/dts/allwinner/sun8i-t113s.dtsi
> +++ b/arch/arm/boot/dts/allwinner/sun8i-t113s.dtsi
> @@ -34,6 +34,17 @@ cpu1: cpu@1 {
>                 };
>         };
>
> +       soc {
> +               hstimer@3008000 {
> +                       compatible =3D "allwinner,sun20i-d1-hstimer";
> +                       reg =3D <0x03008000 0x1000>;
> +                       interrupts =3D <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks =3D <&ccu CLK_BUS_HSTIMER>;
> +                       resets =3D <&ccu RST_BUS_HSTIMER>;
> +               };
> +       };
> +

Actually this could probably be added to the common risc-v dtsi file instea=
d:

    arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi

That way both the D1 and T113 / T113s benefit.

ChenYu

>         gic: interrupt-controller@1c81000 {
>                 compatible =3D "arm,gic-400";
>                 reg =3D <0x03021000 0x1000>,
>
> --
> 2.43.0
>
>

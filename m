Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41477486B95
	for <linux-sunxi@lists.linux.dev>; Thu, 23 Jul 2026 17:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784828501; cv=none; b=gup5oalsy487P8H4Pb81FMXaHXMEssWQv8W6UYZxhQeo6xfH3DCRUhEB0diW8NePeSnvx2BZv673VSrc2KZ9ZSQAFPTBeESZ9FL/teMWu9bXh4K92Iw0WBF8zDo43ctKDQcybmpUiiiKq52CfSXHVsl9VNyGWoUEqNG/IMBJ5oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784828501; c=relaxed/simple;
	bh=HYXrlvqtrQdNNzQelGdgyUv5AdeibpkKDdW6V9qsEIU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gznNoOVGhvdXAGMuIPl8DodRusLlkfa54fGcWo04FAWK0Cv/o3aStYy6R1DhLeRgUhdgNng5ABV6Wyg757ZaJGuSyS7JE+nvsxqT9+/pU9GgAFQOjRI/paCNLUk9ml2mQf7zt3w3zdOkqPim9/AqOvPeDPvFO397VHrmsYzRG4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i0IaBdzH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i0IaBdzH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A7F01F000E9
	for <linux-sunxi@lists.linux.dev>; Thu, 23 Jul 2026 17:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784828495;
	bh=N+Q2l/9DglftLlxBwkGcRKOjRutm09rEufhy/DObvx0=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=i0IaBdzHEk1ApEg1jt0cBKXMMRedQbf9xAH+EupwoWo3NZEucuZKTvJaWRXclKFEm
	 ZvHUp2SO1+dKs5Gyl9A4IgChJ6lCTaQe269zCU+MHLGx94KY3sYHTzmpBuUeWMKzps
	 /hDVXCKktmUCc4OK/2RpvTuzmzwzKaiKJ7QO44YQpcNl1g/XPbJXrH5Et4qtqldHk6
	 9GZ9tFNJqu6jRQC/ssJECnzMwX7eJo4W9XCzbr/qPcoeDN+8WZ7bzcVf+CeIdyG2jU
	 cW8Y7JlK9VX4rnQRTuAJxORCnrEOYwz1YQZg3uFPxIoHdPndBLX0tTjgWCxlmX26Tn
	 Cawj5meVal6Qg==
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7ec49608332so408606a34.3
        for <linux-sunxi@lists.linux.dev>; Thu, 23 Jul 2026 10:41:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqqFxSS2TQJ1ehzHzho/DamSh1+abkAKpRcGki76AUmdDlb1lGtUlcLaFSTi6MYyKYNvwrcLhfQznAajw==@lists.linux.dev
X-Gm-Message-State: AOJu0YywHvtBXCIiZeaH3J+R7AdUi5bh94n/TjCaL35kuC/drhCBTHB3
	RGxliAqsX6k4z70VCLtBNmyTPC22C2sz24VHk30Jc2B4GFaJ4kqRflJUmQR1zoJs5omTI/jK9m+
	0yz9yZKj70bg6j1CEoTSLGXqIYtEbt0I=
X-Received: by 2002:a05:6808:180b:b0:496:daf:8709 with SMTP id
 5614622812f47-4ab352fcfd5mr1725016b6e.17.1784828490837; Thu, 23 Jul 2026
 10:41:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260722233604.3001063-1-utilityemal77@gmail.com> <20260722233604.3001063-3-utilityemal77@gmail.com>
In-Reply-To: <20260722233604.3001063-3-utilityemal77@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Fri, 24 Jul 2026 01:41:13 +0800
X-Gmail-Original-Message-ID: <CAGb2v666_Kf8+zMukQ1CFydK61P-v-=gPg4Bqmr-QaL45i6Fyg@mail.gmail.com>
X-Gm-Features: AUfX_mxiGIwd1DR_-imghumxMZEIIVSDAtRpqxp4hP74t3UviUvfCAjTiBCIbkk
Message-ID: <CAGb2v666_Kf8+zMukQ1CFydK61P-v-=gPg4Bqmr-QaL45i6Fyg@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] arm64: dts: allwinner: a523: add IR receiver nodes
To: Justin Suess <utilityemal77@gmail.com>
Cc: Sean Young <sean@mess.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, Sashiko <sashiko-bot@kernel.org>, 
	Andre Przywara <andre.przywara@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 23, 2026 at 7:36=E2=80=AFAM Justin Suess <utilityemal77@gmail.c=
om> wrote:
>
> The A523 has two CIR receivers, both compatible with the A31 CIR: one
> in the CPUX domain, clocked from the main CCU, and one in the RTC
> power domain, clocked from the R-CCU.
>
> Add nodes for both instances, disabled by default. Since the RX signal
> of each instance can be routed to more than one pin, boards with an IR
> receiver are expected to add the pinctrl properties next to where they
> enable the node. Keep the PL11 pin description in the dtsi, as boards
> commonly use that pin for the RTC domain instance.
>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> Signed-off-by: Justin Suess <utilityemal77@gmail.com>
> ---
>  .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/=
boot/dts/allwinner/sun55i-a523.dtsi
> index ca6a16807049..c2de662140ce 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> @@ -327,6 +327,17 @@ ccu: clock-controller@2001000 {
>                         #reset-cells =3D <1>;
>                 };
>
> +               ir: ir@2005000 {
> +                       compatible =3D "allwinner,sun55i-a523-ir",
> +                                    "allwinner,sun6i-a31-ir";
> +                       reg =3D <0x02005000 0x400>;
> +                       interrupts =3D <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks =3D <&ccu CLK_BUS_IR_RX>, <&ccu CLK_IR_RX>=
;
> +                       clock-names =3D "apb", "ir";
> +                       resets =3D <&ccu RST_BUS_IR_RX>;
> +                       status =3D "disabled";
> +               };
> +
>                 ledc: led-controller@2008000 {
>                         compatible =3D "allwinner,sun55i-a523-ledc",
>                                      "allwinner,sun50i-a100-ledc";
> @@ -927,6 +938,23 @@ r_i2c_pins: r-i2c-pins {
>                                 allwinner,pinmux =3D <2>;
>                                 function =3D "r_i2c0";
>                         };
> +

Please add /omit-if-no-ref/.

> +                       r_ir_rx_pin: r-ir-rx-pin {

There are two pin mux possibilities for r-ir-rx. Please name it accordingly=
,
like "r-ir-rx-pl-pin".

> +                               pins =3D "PL11";
> +                               allwinner,pinmux =3D <2>;
> +                               function =3D "s_cir_rx";
> +                       };
> +               };
> +
> +               r_ir: ir@7040000 {
> +                       compatible =3D "allwinner,sun55i-a523-ir",
> +                                    "allwinner,sun6i-a31-ir";
> +                       reg =3D <0x07040000 0x400>;
> +                       interrupts =3D <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks =3D <&r_ccu CLK_BUS_R_IR_RX>, <&r_ccu CLK_=
R_IR_RX>;
> +                       clock-names =3D "apb", "ir";
> +                       resets =3D <&r_ccu RST_BUS_R_IR_RX>;
> +                       status =3D "disabled";
>                 };
>
>                 pck600: power-controller@7060000 {
> --
> 2.54.0
>

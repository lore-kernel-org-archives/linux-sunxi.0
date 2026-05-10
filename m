Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F4A526B75B
	for <linux-sunxi@lists.linux.dev>; Sun, 10 May 2026 18:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778438074; cv=none; b=jIpXayT5S8bymASI8SIfjlsQgJeYkh5ulTT9MPC+Cmvpc3uAxwC2nyTwRYq5/tTKOOFNcd2BVA86xbHuZAaJerj1pdF5f7Yz2xkBvCMvChZvSM8udZhFNJ8BETkIhl1QIRjH4KGTOcc2rxM+GxothZyhr7haItQwVa7ZhRegcuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778438074; c=relaxed/simple;
	bh=rCvvuIRJS+zFWu0wK8pstHfaQ1AMphYIDSQl2Y+byqE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ajUWEU2d1yyIYcRk7vhx75ctUVAlf6Ad63GAyGOSsARhMAWE5Uj6Wo3OJy6deRAcJzdcAAA/d5H7QhcAwMT5mo8DMtpG4ZxLWyuQuBSNy06mHfDJBiFJAT+hq0KJKJY5D+vr1k4ewtzt9RKsH3qsxgGSYLYRgX6YBB8GBqxG2i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s4lpHipV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s4lpHipV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5422EC2BCB8
	for <linux-sunxi@lists.linux.dev>; Sun, 10 May 2026 18:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778438074;
	bh=rCvvuIRJS+zFWu0wK8pstHfaQ1AMphYIDSQl2Y+byqE=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=s4lpHipVlmcEzZSCYYGHdus6oKBjZlz13HekGY9aVDqJ7LAMeEDcfAuwwPHdAWGFq
	 jNFHg/OwBZNrITo8ruAaz7f4Kwd33A19ifMDJytC11YRCZGzgueM31RwWoW01VRMJ7
	 LnxHPM0A+InaVfuPTmhUe19cjZYxszuxMXbNbyq3CppwEmrePzL789ll2kSZ1jcR/d
	 67rxMQxKTOS1QVfE/jcYzQtRyhp3Aqgvzoa/CaiAGJXkN0chM3yWJMX0p9CmnMEESd
	 ybqA3zFYUSQc524Us2prndplbV/4FqMI0QH19DSBwlToKtEqAtrkCHN9kftuJ4LGWh
	 dqM73k2p9nn5Q==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3939d2bd739so32119091fa.0
        for <linux-sunxi@lists.linux.dev>; Sun, 10 May 2026 11:34:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/1I+TLViUvKIDRPzziAy9F2BkFxPLlc/ks2/46VqlKZO185aoMgu8XM3qjicrBKInSVusycPGgA5nU0w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxj9SE4rnIBpligzzRETg2i2NIr2+x24L512cSMX8iWqVSSoCUB
	xo5Ju/sbdfLqGuWsAJYDNoJ5sMm12NbLpZtCor2GABs0JF+Y5GuPvv4q6H28P54HQlxJwKpKa8F
	pJG+3tjCIJcLtOjUkJiGa0Es8Q5aeIMg=
X-Received: by 2002:a2e:a273:0:b0:38c:de21:3e14 with SMTP id
 38308e7fff4ca-393c41c97demr52554991fa.19.1778438072557; Sun, 10 May 2026
 11:34:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260510-sunxi-a523-gpadc-v1-0-4f6b0f4000fb@mmpsystems.pl> <20260510-sunxi-a523-gpadc-v1-3-4f6b0f4000fb@mmpsystems.pl>
In-Reply-To: <20260510-sunxi-a523-gpadc-v1-3-4f6b0f4000fb@mmpsystems.pl>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Mon, 11 May 2026 02:34:19 +0800
X-Gmail-Original-Message-ID: <CAGb2v64k2SvoGjNGsB=mQdc5U75mPJUJMZASqiF=DDN5QCNt8A@mail.gmail.com>
X-Gm-Features: AVHnY4KOBMpyIY8koIw1JHFB7GLvF9QtogbHPVXZ-IY03YwC_1iRGcw45u_wThM
Message-ID: <CAGb2v64k2SvoGjNGsB=mQdc5U75mPJUJMZASqiF=DDN5QCNt8A@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: allwinner: a523: add gpadc node
To: Michal Piekos <michal.piekos@mmpsystems.pl>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maksim Kiselev <bigunclemax@gmail.com>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 10, 2026 at 9:02=E2=80=AFPM Michal Piekos
<michal.piekos@mmpsystems.pl> wrote:
>
> Describe high speed timer block on Allwinner D1S-T113.
>
> Tested on Radxa Cubie A5E:
> - 2 connected channels are showing voltages in agreement with
>   schematics.
>         BOOT-SEL-ADC ~500mV
>         BOM-ADC ~1800mV
> - 3rd channel exposed on 40pin header is showing correct voltages when
>   connected to known voltage source.
>
> Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
> ---
>  arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/=
boot/dts/allwinner/sun55i-a523.dtsi
> index 5afa8d92acbf..f6c5cae5b23a 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> @@ -340,6 +340,18 @@ ledc: led-controller@2008000 {
>                         status =3D "disabled";
>                 };
>
> +               gpadc: adc@2009000 {
> +                       compatible =3D "allwinner,sun55i-a523-gpadc",
> +                                    "allwinner,sun20i-d1-gpadc";
> +                       reg =3D <0x2009000 0x400>;
> +                       clocks =3D <&ccu CLK_BUS_GPADC0>, <&ccu CLK_GPADC=
0>;
> +                       clock-names =3D "bus", "mod";
> +                       resets =3D <&ccu RST_BUS_GPADC0>;
> +                       interrupts =3D <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
> +                       status =3D "disabled";
> +                       #io-channel-cells =3D <1>;

status should always be the last property.

> +               };
> +
>                 wdt: watchdog@2050000 {
>                         compatible =3D "allwinner,sun55i-a523-wdt";
>                         reg =3D <0x2050000 0x20>;
>
> --
> 2.43.0
>
>

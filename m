Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2BDC8C7
	for <linux-sunxi@lists.linux.dev>; Sun, 22 Dec 2024 17:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734888013; cv=none; b=u05pj6/0OwCUU6AzCJFJU4m9AoOmTlD+dJbCVe6gdNx6BxhRCxnBZKsNFKUPyqQfq1E0wUjPkvi0ayGYB+I5uNpisXO3eoRmVbwD+4NGD0/9pAkhBs80KD2MDKP+u0hHJTSIIaT4wP2DxIL4h9V29HadSRuc97NvSZCGhZWHLxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734888013; c=relaxed/simple;
	bh=R08a595WG14Nf08Yy+YZ2kWZj1o355YbNgR6KJeIdWU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rPLIoj1zBDEI2jrK33RZwxJvyw1Q2kznv2hcBJoUwpK0BeqoDNg6sjHs6DlgUmx2ur+f3cCQeYFtB5xxJi4itwYcGHjBNORQqk8tnjxB769iJki7zarv0kYbD7+V1sDduWdB1/jDVXQPf5NR+ZKZYaWyehvdnlyHr3tLBfB4knU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3a9caa3726fso12010575ab.1
        for <linux-sunxi@lists.linux.dev>; Sun, 22 Dec 2024 09:20:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734888007; x=1735492807;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qFhKn5TumItblZr+eQzLDEEKMdJqIvr95GEz6QTXuVk=;
        b=GiItBwi1UHkMG6XohTjZqiu893+b7RuhGlP3siu4j6knq0G0a6T4TdNPcRzbk4ZGIT
         Qjn90B4FOQL7+FSnQ2QZT1STfF59GVqCddjSu/xOsmQbZtG0cZPsQEFnw/cwOElKzGgx
         ugg+hRZXV8ciEQX+n0aj42Pwa8McZVzOLZSfqv3KPojs4bQHj5n2aEpuGfsdOFUFt7No
         5MFEXTufQ6z54KXn1hJldoEImLKmyuH3leRmKoc/sRkxGb/nZXrDFF4wmKFlUluavPu/
         IbNgScnBYoQuy0y5bkOOikWEiQfCWdt0oOLe3s3dklTrCJJCQ+sO1eA6sgzmi+UlZpuF
         D8RA==
X-Forwarded-Encrypted: i=1; AJvYcCWhwiyMAliqTdxxRoqaOtlnKX2Cngcf+9TifATp0JL/Gt2c8fDtWhXtRn/w11afqvyiFcH9cy/PesTb5A==@lists.linux.dev
X-Gm-Message-State: AOJu0YzNX3iLM7qzP0fhSWtmxsEZi2uhELwAqedDshuXF3+ZqjDMs2S/
	xA1uopNr2d5ofEMg9IqEC2ns8igPz7IdVP6AzPtNK1CZ8fO3bl5Fgxjx0yHaz2g=
X-Gm-Gg: ASbGncvoFzwV17rg/Q/s+LnRIzYMPU8JcN0WSecDVUnqQZgy1bBlUuDMi/4s2rQdqVY
	+i/83+3yWdkFLzKlCXKpUqDJCVgJVSxWCLLP1GQRGh7ra5vs3LDaCQd029+QEZf8jU1C2liKoz9
	D6+c+rASBBVae6R/S6EDW54swWXvlMaedIUFydEo1gYH57UVY0Cs3kL6qBNUjv20pucuePpbNH0
	kCrfeD9EvmArS9fMVk8/ceCPHBPR4t7MDkQ81u4LQU7Fr/n4XmubWeErW2nEeaJ46YAJYCD7oWT
	g9zhNjBrTw==
X-Google-Smtp-Source: AGHT+IGf+PwbGtUUR7fLY1bXXVec6QTWr5W6PvVnKlFDQlv8GDHzXzdihSgFy3H0gnjc3ERSSCuB5w==
X-Received: by 2002:a05:6e02:3f8f:b0:3a7:c81e:825f with SMTP id e9e14a558f8ab-3c3018ab111mr87995195ab.9.1734888007252;
        Sun, 22 Dec 2024 09:20:07 -0800 (PST)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com. [209.85.166.48])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3c0e47d719bsm19895095ab.79.2024.12.22.09.20.05
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Dec 2024 09:20:05 -0800 (PST)
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-844e7bc6d84so131920339f.0
        for <linux-sunxi@lists.linux.dev>; Sun, 22 Dec 2024 09:20:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUgwaVpB1BC9JlKLBoRpxkMl8QzhlKd/jitupH+f038156WDFCn2Ba3tseTBeRrhiQVVTQIwiEtVYuxcw==@lists.linux.dev
X-Received: by 2002:a6b:7f0b:0:b0:841:9225:1f56 with SMTP id
 ca18e2360f4ac-849887107d6mr1158827839f.3.1734888005725; Sun, 22 Dec 2024
 09:20:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241220120038.3137248-1-pbrobinson@gmail.com> <20241220120038.3137248-3-pbrobinson@gmail.com>
In-Reply-To: <20241220120038.3137248-3-pbrobinson@gmail.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 23 Dec 2024 01:19:50 +0800
X-Gmail-Original-Message-ID: <CAGb2v67re8kjHzmPQ1z6Jrvz4x5TBK+hD=DOxtGNTOFOJKAhvg@mail.gmail.com>
Message-ID: <CAGb2v67re8kjHzmPQ1z6Jrvz4x5TBK+hD=DOxtGNTOFOJKAhvg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: allwinner: a64: Add WiFi/BT header on SoPine
To: Peter Robinson <pbrobinson@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 20, 2024 at 8:00=E2=80=AFPM Peter Robinson <pbrobinson@gmail.co=
m> wrote:
>
> This adds all the pin mappings on the WiFi/BT header on
> the SoPine baseboard/A64-LTS. They're disabled by default
> as the modules don't ship by default. This includes, where
> they haven't been already, UART1 for BT and mmc1 for WiFi.
>
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> ---
>  .../allwinner/sun50i-a64-sopine-baseboard.dts | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dt=
s b/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts
> index be2347c8f267..752d2aae8465 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts
> @@ -42,6 +42,11 @@ reg_vcc1v8: vcc1v8 {
>                 regulator-min-microvolt =3D <1800000>;
>                 regulator-max-microvolt =3D <1800000>;
>         };
> +
> +       wifi_pwrseq: pwrseq {
> +               compatible =3D "mmc-pwrseq-simple";
> +               reset-gpios =3D <&r_pio 0 2 GPIO_ACTIVE_LOW>; /* PL2 */
> +       };
>  };
>
>  &ac_power_supply {
> @@ -103,6 +108,17 @@ ext_rgmii_phy: ethernet-phy@1 {
>         };
>  };
>
> +/* On Wifi/BT connector */
> +&mmc1 {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&mmc1_pins>;
> +       vmmc-supply =3D <&reg_dldo4>;
> +       vqmmc-supply =3D <&reg_eldo1>;
> +       mmc-pwrseq =3D <&wifi_pwrseq>;
> +       bus-width =3D <4>;
> +       non-removable;

Same here, please explicitly set 'status =3D "disabled"' like what
you are doing with uart1 below.

ChenYu

> +};
> +
>  &mmc2 {
>         pinctrl-names =3D "default";
>         pinctrl-0 =3D <&mmc2_pins>;
> @@ -175,6 +191,14 @@ &uart0 {
>         status =3D "okay";
>  };
>
> +/* On Wifi/BT connector, with RTS/CTS */
> +&uart1 {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&uart1_pins>, <&uart1_rts_cts_pins>;
> +       uart-has-rtscts;
> +       status =3D "disabled";
> +};
> +
>  /* On Pi-2 connector */
>  &uart2 {
>         pinctrl-names =3D "default";
> --
> 2.47.1
>
>

Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE15A7DA8C
	for <linux-sunxi@lists.linux.dev>; Sun, 22 Dec 2024 17:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734887970; cv=none; b=RrwwIZSHbFDyYXx2GX8Js5LVoFk2gfGSqikO355p2Sbk2/YEbDu59nVT3lcfiG6g5I/4BaEyQZrrOUkUOKoPxzhYYaOFqBWYlcB9la6AqZcB2zDobMkM3C8VKCVad4L34mmpvU0U5AuvcABn1cfN2Nf647/KkeWVX2PJ9E1BDDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734887970; c=relaxed/simple;
	bh=3PhJiSu5/A8Ap0S++9+7kwOBqZp2RZr+0i4T2inRKwI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rcpX95bRO77A6D7x7vC4Or6n80CfceoRkS9ipCYyAQjScGH9i2+m0nOLZ1CQfkMkt0ZibCEPc8SSln3oj8tBuK7QuzDbNrJlcU8h9vermAaylWwRUxtov/nTqfKrTyEJTZGRc+YxJu7q8smTWKfrOz0Vkmc0L2+rPl5n+gKvXv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3a8c7b02d68so28970315ab.3
        for <linux-sunxi@lists.linux.dev>; Sun, 22 Dec 2024 09:19:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734887964; x=1735492764;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jn4oJG4kk9AZGnKXQKwGIPd246ZQVSmkzpo6s8kUSt8=;
        b=ClNw3qoXQmM1nGe9QY/z0aJErYFA0PoDCwQ1MfRGdXGSiQfGSZxO3IgKVUXVEHQP2v
         l6Dip1yWrYiFtzAAInSngf72/GpO4/lbvjU/VtKWTcufvDdITbQvqadW1jqp64igkH5T
         T9cx/ldu9uHnSOm47Xb2GjqddkYEjyAUzgec6o8mxparth95sOU/VP6oauDPtCPl7vlT
         nLCag/DNpds/YYqmY0teyUafFtinUljKGDKNdDQA1c/FW+/GMnU6foNTwD1X+ibil4Sf
         QKa6SEjpuBxqmRnDaDkE0dSmcwxSewUI1mWIyQ45vV4b04B9cQdWEDS3MhrGN3UmuC/k
         Hw/g==
X-Forwarded-Encrypted: i=1; AJvYcCXcISsoSJWOrf6qrIdIZzyNAueqIg50tVhvE7FimJv/Yw3OAbjlhHWnxanMoQTE3/dG9BWzTT9aKwyPqA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzbXV1ao48v+ZF90lTgMhI6c99jYBI2GXEcC9usqzjMTOnPsfp1
	SYZHXGDNLCHl8wZ6IKm88UMG8XFG1JvNGe8e6OzFs5OvAkYUKT0aX6D+gO3ELEI=
X-Gm-Gg: ASbGnctTZEzmEQBI0fiFtg8grZsSFPSHLV5QvouMU5FbGskWCZpq8M8obGe3OOVpQQf
	geLQlYjHGrms9Xoshz0zXrLtOo2azCtttMoobuHhf65aQozYXYMtEDciXIFRz16GBQRN50oRfbJ
	YocyrLbP0wgWSk67kSlMVuNUIekdHVjjp8VgjlqSAvasIlqdOjTuUCf8luPZ5oyyLENqJrQU9Yf
	v3HMqzD031GqzdJfg6s2YA911uYyFDnkJ6yggBPD7gC75KwG4IdG/S5N/kfQQ5Lr3/Uva1DkJjA
	9oKKeq/TDg==
X-Google-Smtp-Source: AGHT+IHuYjAwXsp4ihXmzgmL+kqSs7GiPtLvmw/Az0DOeD0h5WRIFsS00Nqf0KN/8XOFbBtRTIEcRQ==
X-Received: by 2002:a05:6e02:1b0e:b0:3a7:c60b:ad90 with SMTP id e9e14a558f8ab-3c2d1e7df4cmr116547505ab.3.1734887963742;
        Sun, 22 Dec 2024 09:19:23 -0800 (PST)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com. [209.85.166.51])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3c0deccf34fsm19978015ab.30.2024.12.22.09.19.22
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Dec 2024 09:19:22 -0800 (PST)
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-844e9b7e50dso328768639f.3
        for <linux-sunxi@lists.linux.dev>; Sun, 22 Dec 2024 09:19:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU68T7LKj/F55NxgOphVFEd513JYTBrJpySnXCuJrGl0t6MjeTmjhopDE64SkaNel2kvbHHCv0TWQanfQ==@lists.linux.dev
X-Received: by 2002:a05:6602:2dc6:b0:844:dfcd:8de3 with SMTP id
 ca18e2360f4ac-8499e4f2fd1mr899114039f.1.1734887962153; Sun, 22 Dec 2024
 09:19:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241220120038.3137248-1-pbrobinson@gmail.com> <20241220120038.3137248-2-pbrobinson@gmail.com>
In-Reply-To: <20241220120038.3137248-2-pbrobinson@gmail.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 23 Dec 2024 01:19:08 +0800
X-Gmail-Original-Message-ID: <CAGb2v66enf0ybbyW3tW_YRdJB0=aOsXidm_bNHh=wdmm+HPBuw@mail.gmail.com>
Message-ID: <CAGb2v66enf0ybbyW3tW_YRdJB0=aOsXidm_bNHh=wdmm+HPBuw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: allwinner: a64: Add WiFi/BT header on Pine64
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
> the original Pine64. They're disabled by default as the
> modules don't ship by default. This includes, where they
> haven't been already, UART1 for BT and mmc1 for WiFi.
>
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> ---
>  .../boot/dts/allwinner/sun50i-a64-pine64.dts    | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts b/arch/a=
rm64/boot/dts/allwinner/sun50i-a64-pine64.dts
> index 09e71fd60785..f04f0f1badc4 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
> @@ -35,6 +35,11 @@ hdmi_con_in: endpoint {
>                         };
>                 };
>         };
> +
> +       wifi_pwrseq: pwrseq {
> +               compatible =3D "mmc-pwrseq-simple";
> +               reset-gpios =3D <&r_pio 0 2 GPIO_ACTIVE_LOW>; /* PL2 */
> +       };
>  };
>
>  &codec {
> @@ -124,6 +129,17 @@ &mmc0 {
>         status =3D "okay";
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

Please also add an explicit 'status =3D "disabled"', like what is done
for the uart below.

ChenYu

> +};
> +
>  &ohci0 {
>         status =3D "okay";
>  };
> @@ -286,6 +302,7 @@ &uart0 {
>  &uart1 {
>         pinctrl-names =3D "default";
>         pinctrl-0 =3D <&uart1_pins>, <&uart1_rts_cts_pins>;
> +       uart-has-rtscts;
>         status =3D "disabled";
>  };
>
> --
> 2.47.1
>
>

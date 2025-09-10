Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2BDF31C56B
	for <linux-sunxi@lists.linux.dev>; Wed, 10 Sep 2025 12:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757509148; cv=none; b=Y9PMHHr7rXnEX22zm/jar6CtXXY+4Ruv/BINEgjsmPJFULrTBE7NYNQMWDoYelYunSeaww0zPLVrZtoyPAcpZ/8eIRmAqW/zldKv+Yll04v6c20VJWibyLIE01XjO/J1MKkjwyYRZnijD0t4cLUCp3bU3GLdYfE3W4b/0xxFT4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757509148; c=relaxed/simple;
	bh=JTnYhVVnoMWTtsBpjBekP0EKAVoSvOkjrReUjPD0jt0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mgNnNemzRRNwEj9tXzE0XKEAQTKU28TpMCrne3FSDuU6VLlQsPq6NUYtMeO7XFdqLksLkA5njwxa7xRdhEjCzYwm3THOpq/OIPfiwCAxyCPwd76dZp4s58nhGya+mpEB1/FdIEfz/6uVbC2qbYELalYiI+9IrTfokmZ/KrB8Mnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-336a85b8fc5so50315741fa.3
        for <linux-sunxi@lists.linux.dev>; Wed, 10 Sep 2025 05:59:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757509143; x=1758113943;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0IkDIc30A5I5+5gGYCirVC3ygVlzp+pkEs2HFu2fts4=;
        b=swpAlYlasVlchV0aFfHcJ+DYh3DJrhg2LoYNBSx9UulYlXmY0uUO8QBWTshAuXXBlT
         IBfWTUVlc9SBj1Tez6WvDe01oUDR5MPpL07kNGtUGJKyV35BNwKB9ZB5dI2MSC5m4A3J
         iJm5xWAAG15QvRpqQcjGihuf2cz/BFZGKsKWpsDkVPqDv8WOY5cjrb5lmraft5unfxHA
         IlcM11IHuQDqCQBB9qtuWfRUUfuP1m/aFIb3kG7UKHuHOFwVY7WKoXKylzykrY2nD4QZ
         Huc8OT2yJdJjzEG1Ejpwrapx8tDKuMqPTvaGRuzucT1SPlOXOcarcdicnsjTqhgMt8c6
         DtFw==
X-Forwarded-Encrypted: i=1; AJvYcCWTwtvTX6GueXUpCmSK+Ayy3KjKu9JBkMC3MTLJj77v6HHlJB8z54UsjeRKAE0uGPSff+VwIrmr84QTFw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwEVXpAxhx8i7Arn07cAd8SHJ3Onkc8oQbKNu2sN6FDQyRwVX7l
	aMt9X2of2eXJofTx9SAW9aHKoEd0SIUuD2oAKsF5bXRRR0PtYkzDkI6Qfe4mq7yN
X-Gm-Gg: ASbGncu08YW9sN5vCOM2S/ZiGsMgE+nRgnZqLBT5Ws5HUcpY27wNDKVkps8qMFDL2NK
	ney7Tfc+Pq3wSKG4bU+5dnnNRXn8VH/XwNC29jZojzma+fo0Lv4Szl6BU9/WHfyrkMCLVqBJYBh
	uYslQsEhzqtjfqm0Pzm7G5dcOub8oXOm/JQzpYDTI9pxzPajC077wHQRRL5AZQTKBYmlXERRKaU
	3XAx5x9xIFuRVSHOmhR/y6GRJoPiIDlFzqcl+nOpR5nVwNjLf4Dbkeq6lSm6jUDll9OvprvSFGP
	z9uM+RybDuMm5i9LFQzwIPIUCiUJgwszXsTljm+L4+jKqhshRHc9VS/ZGr4EF0u9go37WFO7jZN
	wlZcXlu/1q1xO7vuU2yo0YdhuqbXponsjlFcC3Ewe/W7IC1j/DRs=
X-Google-Smtp-Source: AGHT+IGK0unBztrCUSKnMqFkkz4HFWksC6gwRnSzmChhjXA1hSH7gW7wSEQcRB6A4OwkgUA/OBPdhw==
X-Received: by 2002:a2e:b8d5:0:b0:335:16a4:cfb6 with SMTP id 38308e7fff4ca-33b4d3fbc98mr38737101fa.14.1757509143172;
        Wed, 10 Sep 2025 05:59:03 -0700 (PDT)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com. [209.85.167.47])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3381cff2f63sm28419861fa.48.2025.09.10.05.59.02
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 05:59:03 -0700 (PDT)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-55f6f7edf45so6331508e87.2
        for <linux-sunxi@lists.linux.dev>; Wed, 10 Sep 2025 05:59:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV2DHC1e8nMYSoa/jkFPLb3mxgQiRTfm1R+F5fNBSgR9a+dnGsD1ehbTidvacpKydiM7Z2SFgeaYRouow==@lists.linux.dev
X-Received: by 2002:a05:6512:258a:b0:55f:71d2:e5b6 with SMTP id
 2adb3069b0e04-56262667e84mr4272953e87.30.1757509142550; Wed, 10 Sep 2025
 05:59:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250809-opz-audio-v2-0-f4fd15552a82@posteo.net> <20250809-opz-audio-v2-2-f4fd15552a82@posteo.net>
In-Reply-To: <20250809-opz-audio-v2-2-f4fd15552a82@posteo.net>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 10 Sep 2025 20:58:49 +0800
X-Gmail-Original-Message-ID: <CAGb2v671xTaWkRD0xVPsgGWvykAwPESXuBLgDz-oo4ywOJ=5Xg@mail.gmail.com>
X-Gm-Features: Ac12FXzcg0HuLYsq4drjLq836L_aVuo4Ro9TH7Nv-ZbI1uV7AhXI1LYHqmezi8M
Message-ID: <CAGb2v671xTaWkRD0xVPsgGWvykAwPESXuBLgDz-oo4ywOJ=5Xg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] ARM: dts: allwinner: orangepi-zero2: Add default
 audio routing
To: j.ne@posteo.net
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 10, 2025 at 12:18=E2=80=AFAM J. Neusch=C3=A4fer via B4 Relay
<devnull+j.ne.posteo.net@kernel.org> wrote:
>
> From: "J. Neusch=C3=A4fer" <j.ne@posteo.net>


The subject is misleading. The Orange Pi Zero2 is a different board with
the H616 SoC.

ChenYu

> The Orange Pi Zero Plus 2 has the same pinout[1] as the Orange Pi
> Zero[2] (with the possible exception of line-out left/right being
> swapped), and the Orange Pi Zero Interface Board is sold[3] as
> compatible with both of them. We can thus use the same audio routing.
>
> [1]: http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/de=
tails/Orange-Pi-Zero-Plus-2.html
> [2]: https://linux-sunxi.org/Xunlong_Orange_Pi_Zero#Expansion_Port
> [3]: https://orangepi.com/index.php?route=3Dproduct/product&product_id=3D=
871
>
> Signed-off-by: J. Neusch=C3=A4fer <j.ne@posteo.net>
> ---
>
> v2:
> - new patch
> ---
>  .../boot/dts/allwinner/sun8i-h3-orangepi-zero-plus2.dts    | 14 ++++++++=
++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/arch/arm/boot/dts/allwinner/sun8i-h3-orangepi-zero-plus2.dts=
 b/arch/arm/boot/dts/allwinner/sun8i-h3-orangepi-zero-plus2.dts
> index 7a6444a10e2534458b7380882ea4fd42bd54fea8..97a3565ac7a819be6b18d324f=
a6f65d0d1d2b2ad 100644
> --- a/arch/arm/boot/dts/allwinner/sun8i-h3-orangepi-zero-plus2.dts
> +++ b/arch/arm/boot/dts/allwinner/sun8i-h3-orangepi-zero-plus2.dts
> @@ -99,6 +99,20 @@ wifi_pwrseq: pwrseq {
>         };
>  };
>
> +/*
> + * Audio input/output is exposed on the 13-pin header and can't be used =
for
> + * anything else. However, adapter boards may use different audio routin=
g.
> + * - http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/d=
etails/Orange-Pi-Zero-Plus-2.html
> + * - Allwinner H3 Datasheet, section 3.1. Pin Characteristics
> + */
> +&codec {
> +       allwinner,audio-routing =3D
> +               "Line Out", "LINEOUT",
> +               "MIC1", "Mic",
> +               "Mic",  "MBIAS";
> +       status =3D "disabled";
> +};
> +
>  &de {
>         status =3D "okay";
>  };
>
> --
> 2.48.0.rc1.219.gb6b6757d772
>
>
>

Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03DBF171651
	for <linux-sunxi@lists.linux.dev>; Tue, 28 May 2024 14:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716906606; cv=none; b=GL3lrDIKpH074/VmFLCoB8XdJ5ADN+fIlQvrN/429T8DJ7oPJ0nbiBVliW7J7AtaXH8hnw5nsWVCYp93rd5jquSocBcBWvXVdathAvxbQvxid2cY+/3VeE9BFQahvx5GU2bwy1EJz2tmz9rapDXE0V6pFa8YL4OO87ZoohFPtz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716906606; c=relaxed/simple;
	bh=ZcXigMLGteqUlwYAgiaFCIQuj78vdKhQxQ8JQxQnEgU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KElryz7OlBFB1jdTAborzYs1acYgb9XDRj4F8mJFy75BQO7RQ7LZFRcfb7L5guoeeybTpuC+RrHkd/BSso/kCcrdXY3n+4zMikWbS8b+clyNGTDzwg/PGgHKwu0zuUVl2WYBoZW8maFpPUx249eKdEKjKk5j1eRXjunNefrd7YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-523b20e2615so1050476e87.1
        for <linux-sunxi@lists.linux.dev>; Tue, 28 May 2024 07:30:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716906601; x=1717511401;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XO/EBR7u7D1rXQA6hPAoXV3Vx8lB0mrJvpff18AScB4=;
        b=jxNU/QffJxUU61i7TnOOlRVDTW+U3XydBCBInjemJLtyUwp5PeFBp01zpt0CXDiqcs
         5zXQm5KN42bsmVOz+1sIgJcahnPWf33Y6kB9wuOgXgGvW3HCNW9lTwrq1pnI80eR2o5b
         hotWMQRnhd9jQJ/9tsL/BmKGbPd6/bMYulq1uyz4WIlOOxmp9Fssubnt8eSETcUwN+TU
         Rlkwx24xLEtnT5EzYdtDGkruKS/JoI47IvjTAyhQKpwp9QI3BYw3Lo09raL7lHqiDIhI
         FRon2OzwX54lbBbPuDvbqChM087PACtzidb/0e0SkkakHmPIl5PoN8yLMDtn4nAh4L4e
         ZU5g==
X-Forwarded-Encrypted: i=1; AJvYcCXjEfk/+ocqgcRGySnmm+DDixCotziLxmGgFn1VnsUalNlNFvXWLu5UbFEYa03y394mcnL5L/kf9qx8rDFz5+KRIoQCjbXJ7QEelCs=
X-Gm-Message-State: AOJu0YwbRqjxN6lq3NyhiMh73o49BFlD80/DHWnEJyCWYBcpdwH2wmLy
	1ewdQg06qZtSeqnvLSgCsUKheK93E13T0ZWzgE/vN5gaFeBoeIcGNMaxhDhE
X-Google-Smtp-Source: AGHT+IFc9pHApgPqMqaO7/83RxjvhWZbu7dsZ9yQwRAIHXM0qpNlS1qapSD3pM7/vg/cZoVF7myyGQ==
X-Received: by 2002:a05:6512:1388:b0:51a:c8bb:fcf7 with SMTP id 2adb3069b0e04-5296410a55dmr9520423e87.3.1716906601076;
        Tue, 28 May 2024 07:30:01 -0700 (PDT)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com. [209.85.208.174])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-529711fa3fasm982714e87.243.2024.05.28.07.30.00
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 May 2024 07:30:00 -0700 (PDT)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2e95a75a90eso8884181fa.2
        for <linux-sunxi@lists.linux.dev>; Tue, 28 May 2024 07:30:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWuDM8JqfMvcfdtm3kBSiQs+ALxrgjqlKxq5QLvabvxH7F1tNX8VVtXyA5ucY3OMARqdVgX75DHw1ugiC47J4PQFfvsJVKxkznQDco=
X-Received: by 2002:a2e:2a45:0:b0:2e9:820b:c38d with SMTP id
 38308e7fff4ca-2e9820bc6ffmr23998981fa.36.1716906600500; Tue, 28 May 2024
 07:30:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240515234852.26929-1-andre.przywara@arm.com>
In-Reply-To: <20240515234852.26929-1-andre.przywara@arm.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 28 May 2024 22:29:48 +0800
X-Gmail-Original-Message-ID: <CAGb2v67cbMwK-FCTBHsHNw1ng1SFiNtG-+Sbjpwi=Bin9iJp4g@mail.gmail.com>
Message-ID: <CAGb2v67cbMwK-FCTBHsHNw1ng1SFiNtG-+Sbjpwi=Bin9iJp4g@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: allwinner: Fix PMIC interrupt number
To: Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 16, 2024 at 7:50=E2=80=AFAM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> The "r_intc" interrupt controller on the A64 uses a mapping scheme, so
> the first (and only) NMI interrupt #0 appears as interrupt number 32
> (cf. the top comment in drivers/irqchip/irq-sun6i-r.c).
>
> Fix that number in the interrupts property to properly forward PMIC
> interrupts to the CPU.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Fixes: 4d39a8eb07eb ("arm64: dts: allwinner: Add Jide Remix Mini PC suppo=
rt")

Reviewed-by: Chen-Yu Tsai <wens@csie.org>

> ---
> Hi,
>
> I didn't notice this before because I changed the interrupts property in
> the U-Boot copy of the DT, to comply with the old binding, where it is
> actually IRQ 0, and then used that DTB.
>
> Cheers,
> Andre
>
>  arch/arm64/boot/dts/allwinner/sun50i-h64-remix-mini-pc.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h64-remix-mini-pc.dts b=
/arch/arm64/boot/dts/allwinner/sun50i-h64-remix-mini-pc.dts
> index b6e3c169797f0..0dba413963776 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h64-remix-mini-pc.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h64-remix-mini-pc.dts
> @@ -191,7 +191,7 @@ axp803: pmic@3a3 {
>                 compatible =3D "x-powers,axp803";
>                 reg =3D <0x3a3>;
>                 interrupt-parent =3D <&r_intc>;
> -               interrupts =3D <GIC_SPI 0 IRQ_TYPE_LEVEL_LOW>;
> +               interrupts =3D <GIC_SPI 32 IRQ_TYPE_LEVEL_LOW>;
>                 x-powers,drive-vbus-en;
>
>                 vin1-supply =3D <&reg_vcc5v>;
> --
> 2.35.8
>
>

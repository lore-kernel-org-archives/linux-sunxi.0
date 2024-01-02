Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE7712E5A
	for <linux-sunxi@lists.linux.dev>; Tue,  2 Jan 2024 15:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1d3eb299e2eso43502815ad.2
        for <linux-sunxi@lists.linux.dev>; Tue, 02 Jan 2024 07:00:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704207612; x=1704812412;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qITYVoXybW9kflLeOHzjPWVcZKsOtFNbi43GeVISOKA=;
        b=vVh163UpIrCdMSzVaGc6Jys1yWdIjLbCj+kReBMp0JytLOhFLynjhZ8MNOWOwh6KMs
         6LrIDAjXFniXOr9OcjPfW/T1Vpq1Hudo3ChCsxZgbC0W+Xic/4fnfMzyHeQRhmQy1ur1
         uNoiZ8cI6gaxSlzNj4355hNeF4xkmXyQMoHnjRbMO4KAXoCqIetxP7qlptCMLnEb0RtC
         CM26xKmIq+ywbJWT5gKnRexsrAv2wShmx8swm40YBc4rR2cksYjj7DdfxLa0dfg8QCjn
         TxVZYE3yupCM0O/rYgbAo/fwQsfki1vXF6yYndtqHFwdwveqsNyGF1HSe9het7Cq8qcm
         fCMw==
X-Gm-Message-State: AOJu0Ywl+og/UduiVMoYLkaB9/3KsxEH6eHh0sUIBlsQdbuX+nDTOtiF
	oacR8W5gGrzFpyRDewM2i5uZTifeSO/iEw==
X-Google-Smtp-Source: AGHT+IFpcJIk6GaIzn7qHe4umMerMBxqWRS4E01Dt2XXi/51u63s1gFoZs4pXibzyjy4a+fFDzlUmA==
X-Received: by 2002:a17:902:e74a:b0:1d0:b503:2edd with SMTP id p10-20020a170902e74a00b001d0b5032eddmr9337190plf.8.1704207612256;
        Tue, 02 Jan 2024 07:00:12 -0800 (PST)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com. [209.85.216.50])
        by smtp.gmail.com with ESMTPSA id a4-20020a170902ecc400b001d1d1ef8be5sm22164795plh.173.2024.01.02.07.00.12
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jan 2024 07:00:12 -0800 (PST)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-28b9e9e83b0so4004838a91.2
        for <linux-sunxi@lists.linux.dev>; Tue, 02 Jan 2024 07:00:12 -0800 (PST)
X-Received: by 2002:a17:90a:4546:b0:28c:ad4f:2b4f with SMTP id
 r6-20020a17090a454600b0028cad4f2b4fmr1823827pjm.96.1704207611979; Tue, 02 Jan
 2024 07:00:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231228193903.9078-1-wahrenst@gmx.net> <20231228193903.9078-2-wahrenst@gmx.net>
In-Reply-To: <20231228193903.9078-2-wahrenst@gmx.net>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 2 Jan 2024 22:59:59 +0800
X-Gmail-Original-Message-ID: <CAGb2v66dvTZdRZF+yrdiAsjHVLAQkusyAx=Z5f=UxMNYBAY80A@mail.gmail.com>
Message-ID: <CAGb2v66dvTZdRZF+yrdiAsjHVLAQkusyAx=Z5f=UxMNYBAY80A@mail.gmail.com>
Subject: Re: [PATCH V2 2/2] ARM: sun9i: smp: fix return code check of of_property_match_string
To: Stefan Wahren <wahrenst@gmx.net>, Arnd Bergmann <arnd@arndb.de>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Ripard <mripard@kernel.org>, =?UTF-8?Q?Myl=C3=A8ne_Josserand?= <mylene.josserand@bootlin.com>, 
	linux-sunxi@lists.linux.dev, soc@kernel.org, 
	Florian Fainelli <f.fainelli@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 29, 2023 at 3:39=E2=80=AFAM Stefan Wahren <wahrenst@gmx.net> wr=
ote:
>
> of_property_match_string returns an int; either an index from 0 or
> greater if successful or negative on failure. Even it's very
> unlikely that the DT CPU node contains multiple enable-methods
> these checks should be fixed.
>
> This patch was inspired by the work of Nick Desaulniers.
>
> Link: https://lore.kernel.org/lkml/20230516-sunxi-v1-1-ac4b9651a8c1@googl=
e.com/T/
> Cc: Nick Desaulniers <ndesaulniers@google.com>
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>

Arnd, would it be possible to apply the two fixes directly to the soc tree?

Thanks.

> ---
>  arch/arm/mach-sunxi/mc_smp.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/mach-sunxi/mc_smp.c b/arch/arm/mach-sunxi/mc_smp.c
> index 6ec3445f3c72..277f6aa8e6c2 100644
> --- a/arch/arm/mach-sunxi/mc_smp.c
> +++ b/arch/arm/mach-sunxi/mc_smp.c
> @@ -803,12 +803,12 @@ static int __init sunxi_mc_smp_init(void)
>         for (i =3D 0; i < ARRAY_SIZE(sunxi_mc_smp_data); i++) {
>                 ret =3D of_property_match_string(node, "enable-method",
>                                                sunxi_mc_smp_data[i].enabl=
e_method);
> -               if (!ret)
> +               if (ret >=3D 0)
>                         break;
>         }
>
>         of_node_put(node);
> -       if (ret)
> +       if (ret < 0)
>                 return -ENODEV;
>
>         is_a83t =3D sunxi_mc_smp_data[i].is_a83t;
> --
> 2.34.1
>

Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0590431CA6A
	for <linux-sunxi@lists.linux.dev>; Wed, 20 Aug 2025 13:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755695877; cv=none; b=nYIw43CcfS9dIPoM4k9LWIDB5Fed47Ll1wKP0t6yNJPUd67t0LzfR5kG62WrQjZborvnuttZgjGIGXK8FVXb4Bl5xyi+bDoetCvHhbfSYx3N+SUTFFaQt3pG/ZjTJeJ1tIxiDG4nxErS8Sqf1x2gXSNAGhGai9uKoFUCY6FNqts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755695877; c=relaxed/simple;
	bh=amp618qAhEw+37IrUCKwJ0eJSOkm4YK6dbemdWIFD08=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PwuPKK+bgRQqcJl+FLUiQG6U06mvXB+gchaZQ0NIU7yjH4E1hSbR37FyhCXdL963SGvfv2sY2Wnqv3d084CK2Ga8fd6vjLhed0kw5A6Yd8MFc82Pq5Fj4im7V1w09Zzw2RdP6oHOM05mZ7l5lAhrKW9WE4qbWSVGJJiJJWXxCtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-333f9160c21so47354471fa.2
        for <linux-sunxi@lists.linux.dev>; Wed, 20 Aug 2025 06:17:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755695871; x=1756300671;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pPixgx/r2pzG9SYlVyxWbRJbcFdefcug1MJMB9A4a4U=;
        b=urSM+iMh+RyTE4c6ZoEL8Ia5RHMkeXjacAkhmUWYrxUf3lRUWX6ZiKvygmY9s50Wko
         XlVM+XVDmcZgeBM+JOwsBUEdF3dfaUYK6vp7M/sAmg5eAv0/yLIZcJDALDj4cyEl75ux
         /xgPWbjYbTvYjLbEfP/Ra1ZYTai/9UsAp4ECHYNpzFjYb562dHB5nytYK9Imrs2fbO6o
         Y1Zd7zlMO/VFLTls1NMf9fDO8r4OFMbDtLFBdfn35XCqZ+r++5Q75/50+ryM20jenv5N
         FoxS9s9DDd6HOTH8afw/Hi73c7M1IcPdEzpWQkzOdSeySUJZolCs+iUJ4IwrzUQQ88Tq
         KGDA==
X-Forwarded-Encrypted: i=1; AJvYcCXBOIUAzEXDJWnW+W9yoa5ueSJD8nGqkaBtDE/Pj+o/UUNv5ClZiUdbdFeFohPlY88JEvZPmIC2ozZUFw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwB3tm7YPWCJk6vzZgsgg1UZbcxvoYzB3jsAMNd4vWCQ2LNzUnO
	hzRBIxSM58iWg3eaDgV0OF1h7Wa+ZO1lW/ku6ze+TCmox5paGJLDCZGbVvX4ILaQ
X-Gm-Gg: ASbGnctI/37qCZaz9j03zoU0W6jiJeAJW2hYA15DJ31pIyI0j+oWXAOkKVtkojldrm5
	tckp16P6m4Z0ST0SBcNaMfBLA0Xc3kpNXI7ONgRWnXRQZ261ppV5SRbkbFc17jM/G1CoLURvAqN
	1xYRVKMG+1FI4lyqXYMdgzTN49Odc3Yqr1Yt4OPTEfVkJCZu/eRj0AL+7utLeczkxbcNfh4cx6j
	hC9ANvRNBGMlnn7fb7DykmJ7w1u1tR91ibU30gsH09sQvNQq0rACWeg2dBFcEZ/uonaSU/E818n
	XRpuQYsW8bjUB8uKnkyUjX+hr4+G1ogaH2OKY4vLWfjiQXKbRamjVe52ZL0KJMQeHLrCWIJYRkh
	bYs1iz3hEwjESlMfqnqytavXu4kiEIhgrv6tX+RNnl/WZPsF2SzTewjA=
X-Google-Smtp-Source: AGHT+IF9IvriTtNKa130mWUik+MzDRK1YO3Lbi/DrABB+EiJk7p2H4XiTHwTsj/bZf1cnJ3SZw2nRQ==
X-Received: by 2002:a05:651c:1118:10b0:32a:7f4f:ebf2 with SMTP id 38308e7fff4ca-3353bcd5686mr5140911fa.5.1755695870816;
        Wed, 20 Aug 2025 06:17:50 -0700 (PDT)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com. [209.85.208.177])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef35f128sm2622220e87.47.2025.08.20.06.17.47
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Aug 2025 06:17:47 -0700 (PDT)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-333f8f2d6c2so53586501fa.1
        for <linux-sunxi@lists.linux.dev>; Wed, 20 Aug 2025 06:17:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW8vDKKGIu7C1oApq2P/1+1UK6KQj5VFXjIzusJCpBcV25UAn3wZaxqO1sg61fCO3/gMqwoRvaEMTo1ig==@lists.linux.dev
X-Received: by 2002:a05:651c:4102:b0:333:b656:a69d with SMTP id
 38308e7fff4ca-3353bcd77efmr4582191fa.7.1755695867435; Wed, 20 Aug 2025
 06:17:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250819143935.372084-1-rongqianfeng@vivo.com> <20250819143935.372084-5-rongqianfeng@vivo.com>
In-Reply-To: <20250819143935.372084-5-rongqianfeng@vivo.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 20 Aug 2025 21:17:33 +0800
X-Gmail-Original-Message-ID: <CAGb2v67aScycSHQr+cToshGz=u6vOCcdamZmqBaDbpgD3zg0_Q@mail.gmail.com>
X-Gm-Features: Ac12FXxY1RMn12OMP_6ZvaC7ig2Ko0gOCjNM_-u3K-s-PXBOydhAFgSyE2Itvsw
Message-ID: <CAGb2v67aScycSHQr+cToshGz=u6vOCcdamZmqBaDbpgD3zg0_Q@mail.gmail.com>
Subject: Re: [PATCH 4/4] pinctrl: sunxi: use kcalloc() instead of kzalloc()
To: Qianfeng Rong <rongqianfeng@vivo.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, 
	"open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	"moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 19, 2025 at 10:40=E2=80=AFPM Qianfeng Rong <rongqianfeng@vivo.c=
om> wrote:
>
> Use devm_kcalloc() in init_pins_table() and prepare_function_table() to
> gain built-in overflow protection, making memory allocation safer when
> calculating allocation size compared to explicit multiplication.
>
> Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>

Acked-by: Chen-Yu Tsai <wens@csie.org>

> ---
>  drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c b/drivers/pinctrl/s=
unxi/pinctrl-sunxi-dt.c
> index 4e34b0cd3b73..5f13315ebff3 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
> @@ -103,7 +103,7 @@ static struct sunxi_desc_pin *init_pins_table(struct =
device *dev,
>                 return ERR_PTR(-EINVAL);
>         }
>
> -       pins =3D devm_kzalloc(dev, desc->npins * sizeof(*pins), GFP_KERNE=
L);
> +       pins =3D devm_kcalloc(dev, desc->npins, sizeof(*pins), GFP_KERNEL=
);
>         if (!pins)
>                 return ERR_PTR(-ENOMEM);
>
> @@ -199,7 +199,7 @@ static int prepare_function_table(struct device *dev,=
 struct device_node *pnode,
>          * Allocate the memory needed for the functions in one table.
>          * We later use pointers into this table to mark each pin.
>          */
> -       func =3D devm_kzalloc(dev, num_funcs * sizeof(*func), GFP_KERNEL)=
;
> +       func =3D devm_kcalloc(dev, num_funcs, sizeof(*func), GFP_KERNEL);
>         if (!func)
>                 return -ENOMEM;
>
> --
> 2.34.1
>

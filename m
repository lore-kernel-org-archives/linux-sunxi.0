Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A7717FE0
	for <linux-sunxi@lists.linux.dev>; Tue, 11 Jul 2023 18:25:59 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-314313f127fso6239431f8f.1
        for <linux-sunxi@lists.linux.dev>; Tue, 11 Jul 2023 11:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689099957; x=1691691957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pcA9zAZcv8H6F59O2yL/w1UsRzgAVue6pYP3PRyEN9Q=;
        b=bg7auqVXWeD/637tUroyB0q8jyytfqMQ02OIG990Kv8DY8eYOAMmSmJ9D6y4X4zOxY
         OE8Yr1SxH+CYjv4PafmryaU9ziO+P6fh700g025fnN+RLwjBz8D1nL4c7o2zRly3ici4
         mCNk8WYYnP3MJVOrAuuDYWWZ2VlYR2pzPzSzScnVSq43s0OoybytqwnQCnRD2Fdp4TIi
         Hu8qkGOJiqenfyN9yprrTf9IStWGG7opj5+trPJItJ61AkEf0rV96XwKfJqJZNUtGtlo
         f/+ebbcMZmdsvWNxzJWtyCpwH0sbPM5E3gKaoXvI1DPuw1mGHtFeGdvdz6XzdDUyz+Hh
         qNRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689099957; x=1691691957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pcA9zAZcv8H6F59O2yL/w1UsRzgAVue6pYP3PRyEN9Q=;
        b=WXOQoNbKhNCBERBN+BBKN1/imvEgV6lK2IgZex1DA+2iPEnyllgTcYuBYe5Te3SkVD
         CzlHJo0dotB5ufWpZz+CEUdY9O0ZaNl4TFdZWIDNvndrSAxYYEZGHIEpxwj1NToz581p
         7FL3mU+7jMkgWdH6H85rX3F8M3pASOmkPol6i/y3wNYitM3pGQl7bs5xNCnlYxVi5Krf
         9vuQMAUga9rFUTpgwog0BDU3Zh40Qfgs7sv0mCnd6dlCQgZO9ZChQPsVkgkhXSRlGKxM
         Fc9cwjOY7jnmrJW0ckri6JieOXhnT2RGWq08S0CXrdxzcwibv9cAqys2vgBKtzDIlrhF
         LvDw==
X-Gm-Message-State: ABy/qLZnonp0uouZ0ULfrCYg6Xk2ALqOGCyXXUGPP/FmbCjiIwfvtJK7
	EBqioRarUvpNiRbpQGjiAMc=
X-Google-Smtp-Source: APBJJlFVSzM/6yF41kx+JCmUQnPCxQ1HuMA/ja/T8CsCKHgbXdd4Sga+3LTsDZ649EZut433azkWJw==
X-Received: by 2002:a5d:568f:0:b0:314:5376:f0d6 with SMTP id f15-20020a5d568f000000b003145376f0d6mr14001158wrv.52.1689099957068;
        Tue, 11 Jul 2023 11:25:57 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id k3-20020a5d66c3000000b00314398e4dd4sm2888343wrw.54.2023.07.11.11.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 11:25:56 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Yangtao Li <frank.li@vivo.com>
Cc: Yangtao Li <frank.li@vivo.com>, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 1/7] bus: sunxi-rsb: Convert to devm_platform_ioremap_resource()
Date: Tue, 11 Jul 2023 20:25:55 +0200
Message-ID: <21938707.EfDdHjke4D@jernej-laptop>
In-Reply-To: <20230706072042.31296-1-frank.li@vivo.com>
References: <20230706072042.31296-1-frank.li@vivo.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne =C4=8Detrtek, 06. julij 2023 ob 09:20:36 CEST je Yangtao Li napisal(a):
> Use devm_platform_ioremap_resource() to simplify code.
>=20
> Signed-off-by: Yangtao Li <frank.li@vivo.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/bus/sunxi-rsb.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/drivers/bus/sunxi-rsb.c b/drivers/bus/sunxi-rsb.c
> index 696c0aefb0ca..2aefd5dde3c9 100644
> --- a/drivers/bus/sunxi-rsb.c
> +++ b/drivers/bus/sunxi-rsb.c
> @@ -746,7 +746,6 @@ static int sunxi_rsb_probe(struct platform_device *pd=
ev)
> {
>  	struct device *dev =3D &pdev->dev;
>  	struct device_node *np =3D dev->of_node;
> -	struct resource *r;
>  	struct sunxi_rsb *rsb;
>  	u32 clk_freq =3D 3000000;
>  	int irq, ret;
> @@ -766,8 +765,7 @@ static int sunxi_rsb_probe(struct platform_device *pd=
ev)
> rsb->dev =3D dev;
>  	rsb->clk_freq =3D clk_freq;
>  	platform_set_drvdata(pdev, rsb);
> -	r =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	rsb->regs =3D devm_ioremap_resource(dev, r);
> +	rsb->regs =3D devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(rsb->regs))
>  		return PTR_ERR(rsb->regs);





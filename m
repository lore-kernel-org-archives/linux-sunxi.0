Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A41517FE0
	for <linux-sunxi@lists.linux.dev>; Tue, 11 Jul 2023 18:26:20 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-3fbc63c2e84so66472005e9.3
        for <linux-sunxi@lists.linux.dev>; Tue, 11 Jul 2023 11:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689099979; x=1691691979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wlSVz2JK2QfkUY0e2bO341IdHytAGDY8Oy/1arX04Ks=;
        b=Du4yrT1OOMvuNNcTOYTMkOYQldDuwK7MDHA5+YhI60s8yycZT83WcHqIY+gnPmrUuX
         u3WG+SMRBLq7Mu2ASaiKqhgJtNtaUGXsKTSkGgAQ4BT69a2uAi2zRh2ECNm2MGiXqE9i
         qN8UdMgXuZdLymoKCZu2wUZYsYhGOUX66kAYKYmkfcwdIDYWoVctkeB+vK5uoTQB40dO
         YstqAzy+YnFj+E3Y1sELlIuOnggqRzQbKGxESNW9IQokRA0aKFgvUeZCCH+u0tUf5RXC
         CKTT06i5EWIDhJPryjee3z0MJF3syi4u2Jxls9Z7W6/gw9eyfF22koy7JtFpt3a8jRzy
         laZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689099979; x=1691691979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wlSVz2JK2QfkUY0e2bO341IdHytAGDY8Oy/1arX04Ks=;
        b=k2Qfd8ZbzNArbA7CJ/Q+tmdgOBNbrsnTMGsOIY1n5l06f9S8J9rFKtS3zWnc9sRbhY
         htNtmI3OqyCkJisMnD1VcovLwXimN/bw0LglXlkmvIRq5slpwhDJ6HU3T5BvUeaIOFFy
         HYzO8bGEQyKeta+Dw+yQzp4DEWYxris04wtDZ2Tyi21ZbWoqlWZ6wpkLKjLSudYmZxVc
         BL1iU7Kcn0yuRPx8YrPtRFhrRhU+asJHexs2psTCpa5Xy6+ZjxY4aQFWxqwpFKFat1Zg
         I5Lg9DE3arw4IOyuXkFpZN/SyWG5QJErBE6zcEcFG9kEjXsZDr4fvXwHSMaMqXooi7gE
         iAtQ==
X-Gm-Message-State: ABy/qLZJHkLRyp4e2i3JnGGSXhU0u3eFr3obGfdyijLOz4KWL4hHZFRx
	RJ9Bp8Cbfg0fGClZ4/iTncw=
X-Google-Smtp-Source: APBJJlHGY9WABdLgL+mZBFQl3gX7vI50KHydxcPqI8YnC8fb8cuWDIjPwjgg79jMhCdErxfFuuiV4g==
X-Received: by 2002:a05:600c:b45:b0:3f7:b1df:26d with SMTP id k5-20020a05600c0b4500b003f7b1df026dmr17826544wmr.38.1689099979101;
        Tue, 11 Jul 2023 11:26:19 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id q21-20020a7bce95000000b003fc06169abdsm3214211wmj.2.2023.07.11.11.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 11:26:18 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Yangtao Li <frank.li@vivo.com>
Cc: Yangtao Li <frank.li@vivo.com>, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 1/8] nvmem: sunxi_sid: Convert to devm_platform_ioremap_resource()
Date: Tue, 11 Jul 2023 20:26:17 +0200
Message-ID: <3747576.kQq0lBPeGt@jernej-laptop>
In-Reply-To: <20230706040504.34057-1-frank.li@vivo.com>
References: <20230706040504.34057-1-frank.li@vivo.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne =C4=8Detrtek, 06. julij 2023 ob 06:04:57 CEST je Yangtao Li napisal(a):
> Use devm_platform_ioremap_resource() to simplify code.
>=20
> Signed-off-by: Yangtao Li <frank.li@vivo.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/nvmem/sunxi_sid.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/drivers/nvmem/sunxi_sid.c b/drivers/nvmem/sunxi_sid.c
> index a970f1741cc6..6bfe02ab169a 100644
> --- a/drivers/nvmem/sunxi_sid.c
> +++ b/drivers/nvmem/sunxi_sid.c
> @@ -125,7 +125,6 @@ static int sun8i_sid_read_by_reg(void *context, unsig=
ned
> int offset, static int sunxi_sid_probe(struct platform_device *pdev)
>  {
>  	struct device *dev =3D &pdev->dev;
> -	struct resource *res;
>  	struct nvmem_config *nvmem_cfg;
>  	struct nvmem_device *nvmem;
>  	struct sunxi_sid *sid;
> @@ -142,8 +141,7 @@ static int sunxi_sid_probe(struct platform_device *pd=
ev)
> return -EINVAL;
>  	sid->value_offset =3D cfg->value_offset;
>=20
> -	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	sid->base =3D devm_ioremap_resource(dev, res);
> +	sid->base =3D devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(sid->base))
>  		return PTR_ERR(sid->base);





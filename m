Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9D9321E
	for <linux-sunxi@lists.linux.dev>; Wed, 12 Oct 2022 21:24:08 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id w18so14203648ejq.11
        for <linux-sunxi@lists.linux.dev>; Wed, 12 Oct 2022 14:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AeJANbhYyBwy4ZbmnuIiUtzQb03C3ow/09NmLLrUl6A=;
        b=JPL4aQt1cmlonH9wzqkdGwGX4yiWzBYuoNUgmryEg9d/JOfQlDrmkcICVOC/33yqcl
         s0mTrzMYEWAgpf0uUa7YeZFD7CZ68ey2ehAGfeag4Z2kxjakghVUyBtUToFJmxKe+1wG
         yJTCP2EuO/e6a8snlf+yd6pfpqoYRtMGSRyL3dmp7H0rzxos9JYoRmle2O3h9lHUA/DC
         +K7hxS8Pn4f3tUSLLAPFIUxmVCpr/sSqr25uP6x3TlKVAwyzLB+POxUi2ZY8CECqmyKi
         2HKXnaZIbOLLDoX2ntROXy4GRbnHUyek0QBvzOilU9uZ2dpSccEDOhCzPMmlsvSxPiLM
         9ysg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AeJANbhYyBwy4ZbmnuIiUtzQb03C3ow/09NmLLrUl6A=;
        b=zQfMV4uvoPXNU21Xd1LpotPhKSbyp3DXMqvjho4n1EyQb6q+mp3QM8DMEUDqRHm7XC
         //uHUZkb03lYPbeaZi9bTETXOz8nh8mqwDGcg1pXGYJ09MccOZlxnXvU70wmcQQPcISE
         shK4hLs4CuJ2gH4r/mf9QDXR0hMtLHwy/1EqyDQ2cxbOlFS3vFfUDGJBGsCZB9G1FhQR
         lMpwO0xjeebEe+XlKCLT3DHTxwH9691JNlluZXxVCEWduicRy+7XgL75echpl0eo1k/D
         B+a1znlc4pNwwY3LT1oF2mtzbnJs70q4BAaezPITdyxL+noruP6dtmXLinFPWdhqkR7E
         S0eQ==
X-Gm-Message-State: ACrzQf3CYqpsmyLwoQ9GdX5Bj97I6YylujrtNaER1OWVYb2OThJG0QlB
	apdrM3tP1T+xKy1oKAIQg0k=
X-Google-Smtp-Source: AMsMyM7BxsquvcB3WVD34NXGQwFZsJW43aw77Eq7EcPTf+1OXMK4gIIlb5g5xCn3wdhAQzLGAw7V7w==
X-Received: by 2002:a17:907:8688:b0:78b:eaa5:8a9d with SMTP id qa8-20020a170907868800b0078beaa58a9dmr24591147ejc.509.1665609846821;
        Wed, 12 Oct 2022 14:24:06 -0700 (PDT)
Received: from kista.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id kw24-20020a170907771800b0073d87068042sm1807772ejc.110.2022.10.12.14.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 14:24:06 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andre Przywara <andre.przywara@arm.com>, Icenowy Zheng <uwu@icenowy.me>
Cc: soc@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-phy@lists.infradead.org, linux-usb@vger.kernel.org, Icenowy Zheng <uwu@icenowy.me>
Subject: Re: [PATCH v2 05/10] musb: sunxi: add support for the F1C100s MUSB controller
Date: Wed, 12 Oct 2022 23:24:04 +0200
Message-ID: <3515217.R56niFO833@kista>
In-Reply-To: <20221012055602.1544944-6-uwu@icenowy.me>
References: <20221012055602.1544944-1-uwu@icenowy.me> <20221012055602.1544944-6-uwu@icenowy.me>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Icenowy,

Dne sreda, 12. oktober 2022 ob 07:55:57 CEST je Icenowy Zheng napisal(a):
> The suniv SoC has a MUSB controller like the one in A33, but with a SRAM
> region to be claimed.
> 
> Add support for it.
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> ---
> No changes since v1.
> 
>  drivers/usb/musb/sunxi.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/musb/sunxi.c b/drivers/usb/musb/sunxi.c
> index 7f9a999cd5ff..4b368d16a73a 100644
> --- a/drivers/usb/musb/sunxi.c
> +++ b/drivers/usb/musb/sunxi.c
> @@ -722,14 +722,17 @@ static int sunxi_musb_probe(struct platform_device
> *pdev) INIT_WORK(&glue->work, sunxi_musb_work);
>  	glue->host_nb.notifier_call = sunxi_musb_host_notifier;
> 
> -	if (of_device_is_compatible(np, "allwinner,sun4i-a10-musb"))
> +	if (of_device_is_compatible(np, "allwinner,sun4i-a10-musb") ||
> +	    of_device_is_compatible(np, "allwinner,suniv-f1c100s-musb")) {
>  		set_bit(SUNXI_MUSB_FL_HAS_SRAM, &glue->flags);
> +	}
> 
>  	if (of_device_is_compatible(np, "allwinner,sun6i-a31-musb"))
>  		set_bit(SUNXI_MUSB_FL_HAS_RESET, &glue->flags);
> 
>  	if (of_device_is_compatible(np, "allwinner,sun8i-a33-musb") ||
> -	    of_device_is_compatible(np, "allwinner,sun8i-h3-musb")) {
> +	    of_device_is_compatible(np, "allwinner,sun8i-h3-musb") ||
> +	    of_device_is_compatible(np, "allwinner,suniv-f1c100s-musb")) {

All that should be eventually converted to quirks. But for now:
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>  		set_bit(SUNXI_MUSB_FL_HAS_RESET, &glue->flags);
>  		set_bit(SUNXI_MUSB_FL_NO_CONFIGDATA, &glue->flags);
>  	}
> @@ -815,6 +818,7 @@ static const struct of_device_id sunxi_musb_match[] = {
>  	{ .compatible = "allwinner,sun6i-a31-musb", },
>  	{ .compatible = "allwinner,sun8i-a33-musb", },
>  	{ .compatible = "allwinner,sun8i-h3-musb", },
> +	{ .compatible = "allwinner,suniv-f1c100s-musb", },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, sunxi_musb_match);
> --
> 2.37.1



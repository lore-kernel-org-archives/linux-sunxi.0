Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326F872
	for <linux-sunxi@lists.linux.dev>; Wed, 10 Nov 2021 20:27:31 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id i8-20020a7bc948000000b0030db7b70b6bso5616680wml.1
        for <linux-sunxi@lists.linux.dev>; Wed, 10 Nov 2021 12:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VCO5uvUOcT27e+DRykZRIen3xP0SFPGTd6Mp1JZTAsY=;
        b=HThajDrDc6kB1OnizIXhqzZNZZvMfdEHMWtMO4M30i37Pl73wkt59s0uAsKI/RdkPF
         1wk6JxgmAhSrbRsPWAIvz6B3dIzTqP1/gcXhrAg3Kw18a7B2hIY3mE0EgiG057B8KZUy
         2r4dyL/l4YIrur+Kn5hq7L8zexNdXLUoevOaZRRL88bHNDHY//iJvBd2HxSsP/+sevHM
         tY78m10uixmloXgSMDKdn29FiasKIn3plMw6EOexg0Mz5o2pMLWAK4GZFdnnyT0Wr1xo
         31pw1Ol0dCl/18DjBGfMtfvKMD+VkFS36tRt/sMqI0UGRF8tV70VpN2eqyLFtlwLzfWL
         U+nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VCO5uvUOcT27e+DRykZRIen3xP0SFPGTd6Mp1JZTAsY=;
        b=7Wbxk7E4QjhkD9sDPuOoYmpUlBXqj+1GCl7QMSj/Hg1kFCaTctMLKztq95rUmS9xr9
         evYJ+v1xIyegRblStPKBTluaCtJ6XzfNecge3v2Ccoh9H1Sj9wH8JUqBFW6WaYdey2a0
         2RiLqcQ6qmjUjt+n+NQB58KvCGXIOdQYoV1sANJkpI++vsiIbcreXOr+clBXAEnRA9oy
         4GTSARgZTyjK5nMcoJFKp797eOPm4e0eiay5kN0bSD7pHdKMmdcoU7rxZWz/ramT7Ffb
         s/mmsewP8g7BqqRXP676L0m6QDcgSWbO5/TbeNVICaT5tas5hE4HzV4PAjXkdbl6Le0K
         qW3w==
X-Gm-Message-State: AOAM530VXL7Vo/xDBjFizF+jXkj6paagtG4tO9J3pnYNOWQ3z+5Yv0wy
	XFNxFQF3fI3DFeTe8ONWPPGKSaMf0gnK1A==
X-Google-Smtp-Source: ABdhPJw4KjDz2RofXLwp2G67jkwH49HdpJCT6V9QEt9aux7cGkvEY9V4DGLIjaCPxROLcjclfo3KDw==
X-Received: by 2002:a1c:4d13:: with SMTP id o19mr2192192wmh.164.1636576049474;
        Wed, 10 Nov 2021 12:27:29 -0800 (PST)
Received: from kista.localnet (cpe-86-58-29-253.static.triera.net. [86.58.29.253])
        by smtp.gmail.com with ESMTPSA id q123sm6506007wma.30.2021.11.10.12.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 12:27:29 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-sunxi@lists.linux.dev, Roman Stratiienko <r.stratiienko@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, wens@csie.org, mripard@kernel.org, b-liu@ti.com, megous@megous.com, Roman Stratiienko <r.stratiienko@gmail.com>
Subject: Re: [PATCH] usb: musb: sunxi: Don't print error on MUSB_ULPI_BUSCONTROL access
Date: Wed, 10 Nov 2021 21:27:23 +0100
Message-ID: <7984413.T7Z3S40VBb@kista>
In-Reply-To: <20211019131244.1568560-1-r.stratiienko@gmail.com>
References: <20211019131244.1568560-1-r.stratiienko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Roman,

sorry for late reply.

Dne torek, 19. oktober 2021 ob 15:12:44 CET je Roman Stratiienko napisal(a):
> Error message appears during suspend, where musb driver is storing
> the register state in musb_save_context():
> ```
> musb-sunxi 1c19000.usb: Error unknown readb offset 112
> ```
> 
> Print warning instead to avoid confusion.
> 
> Signed-off-by: Roman Stratiienko <r.stratiienko@gmail.com>
> ---
>  drivers/usb/musb/sunxi.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/usb/musb/sunxi.c b/drivers/usb/musb/sunxi.c
> index f3f76f2ac63f9b..961c858fb349e1 100644
> --- a/drivers/usb/musb/sunxi.c
> +++ b/drivers/usb/musb/sunxi.c
> @@ -440,6 +440,10 @@ static u8 sunxi_musb_readb(void __iomem *addr, u32 
offset)
>  				return 0xde;
>  
>  			return readb(addr + SUNXI_MUSB_CONFIGDATA);
> +		case MUSB_ULPI_BUSCONTROL:
> +			dev_warn(sunxi_musb->controller->parent,
> +				"sunxi-musb does not have ULPI bus 
control register\n");

Since this register doesn't exist, wouldn't be better to print only debug 
message? Warning would imply something that's out of the ordinary, but in this 
case it's benign.

> +			return 0;
>  		/* Offset for these is fixed by sunxi_musb_busctl_offset() 
*/
>  		case SUNXI_MUSB_TXFUNCADDR:
>  		case SUNXI_MUSB_TXHUBADDR:
> @@ -494,6 +498,10 @@ static void sunxi_musb_writeb(void __iomem *addr, 
unsigned offset, u8 data)
>  			return writeb(data, addr + 
SUNXI_MUSB_TXFIFOSZ);
>  		case MUSB_RXFIFOSZ:
>  			return writeb(data, addr + 
SUNXI_MUSB_RXFIFOSZ);
> +		case MUSB_ULPI_BUSCONTROL:
> +			dev_warn(sunxi_musb->controller->parent,
> +				"sunxi-musb does not have ULPI bus 
control register\n");
> +			return;
>  		/* Offset for these is fixed by sunxi_musb_busctl_offset() 
*/

Same here.

Best regards,
Jernej

>  		case SUNXI_MUSB_TXFUNCADDR:
>  		case SUNXI_MUSB_TXHUBADDR:
> -- 
> 2.30.2
> 
> 



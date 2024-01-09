Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47413D574
	for <linux-sunxi@lists.linux.dev>; Tue,  9 Jan 2024 20:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YKCReYeD"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-40e4d64a3fbso14792235e9.2
        for <linux-sunxi@lists.linux.dev>; Tue, 09 Jan 2024 12:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704831592; x=1705436392; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DlYxPCHAYd6STqeLclpo+vdtfpOUSl4elB7ysJ3G/b8=;
        b=YKCReYeD5W/pOQmMs4v4NE6wlwA3Mj+sx8uodsnKtV+zMX34nLni4htZoMmR/k/j0D
         7lBfU+2poVEgqcxhgwuieaSQ1pJCMSs670FJ8T4OYdqVVrWcEsjUec6bXS7RE57xesA/
         k5XS2H3KhxOuiPGm/lbhK+I2vuRdlxkyPR9k0Iv1IKZo4HbgrZWNOsHz4f5kbq+cw9z9
         SR1M7fC6GN81OWCKN84Om7h3S2Z42+our45fgVpB4Ob08pZkbM44xQZsynRhBLSf9Obn
         82EG6XsFlKGN0JxU6jLLqx6OOcvL+vGVIdkgKRWdovRt/CpUCXPPLPkQ00lQDdOFj/G8
         wp9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704831592; x=1705436392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DlYxPCHAYd6STqeLclpo+vdtfpOUSl4elB7ysJ3G/b8=;
        b=LK9ZF/tzgEcXUC0xD5X6EH8wBN83OJSa+i4rvf/2gATrDdwqlplkju7svLrNt6/m77
         0izR1y4vZ2jYzhRvFaf3fDArKM0EU13nqwBB4hMQTlxUQsVVNpYbf8GdejARMYCdGcJD
         ffBee2bx6Ck9Tw8qNqpF/cB3/glYDBWjhn0BVZ4OQH0quh8+0C+5N0JWTJfzhy0rJLY1
         Gmq6+rk39ZAyHsqyD4I8xSSrrdbDou2mx/umyB125WFPTeTjAbHb1WhivFSHjDLmhkiF
         9lfbUcnwRZUi0j+IXbLKIU9KFsNzNEIRSD2cW5OggtlSck+KKCZjmUwR4g2HHwGbZgZt
         R5KA==
X-Gm-Message-State: AOJu0Yz4dfdMhez/c0Poff6PCfeUjHWBeKCLCCt++Uhc7sOs8HeBmpvI
	5X1Ip/Qwvjv2yjX8cp680sU=
X-Google-Smtp-Source: AGHT+IG1OMh03D58GI/XQbXMBGYnExJPieRU875c4MCxuqXF5c3yyX/E2Wz0vuSvYaovhTFRA8ZM/Q==
X-Received: by 2002:a05:600c:205a:b0:40e:46e1:e3e9 with SMTP id p26-20020a05600c205a00b0040e46e1e3e9mr1923451wmg.122.1704831591554;
        Tue, 09 Jan 2024 12:19:51 -0800 (PST)
Received: from jernej-laptop.localnet (213-161-3-116.dynamic.telemach.net. [213.161.3.116])
        by smtp.gmail.com with ESMTPSA id n33-20020a05600c3ba100b0040e398f8cafsm4740297wms.31.2024.01.09.12.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 12:19:51 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Lee Jones <lee@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andre Przywara <andre.przywara@arm.com>,
 Jianzhang Mai <maijianzhang@allwinnertech.com>
Subject: Re: [PATCH] mfd: sun4i-gpadc: adaptation interrupt number
Date: Tue, 09 Jan 2024 21:19:48 +0100
Message-ID: <3201556.5fSG56mABF@jernej-laptop>
In-Reply-To: <ZYuFbUUus9apiCpq@debian.cyg>
References: <ZYuFbUUus9apiCpq@debian.cyg>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sreda, 27. december 2023 ob 03:01:17 CET je Fuyao Kashizuku napisal(a):
> The identifiers are used as IRQ resource numbers, where 0 is treated
> specially.
> 
> This fixes sun4i-gpadc-iio probe failed when request irq.
> 
> The backstack:
> 	WARNING: CPU: 3 PID: 1 at drivers/base/platform.c:451
> 	__platform_get_irq_byname+0xb8/0xc4
> 	0 is an invalid IRQ number
> 	Modules linked in:
> 	CPU: 3 PID: 1 Comm: swapper/0 Not tainted 6.7.0-rc6 #9
> 	Hardware name: Allwinner sun8i Family
> 	 unwind_backtrace
> 	 show_stack
> 	 dump_stack_lvl
> 	 __warn
> 	 warn_slowpath_fmt
> 	 __platform_get_irq_byname
> 	 platform_get_irq_byname
> 	 sun4i_irq_init
> 	 sun4i_gpadc_probe
> 	 platform_probe
> 	 really_probe
> 	 __driver_probe_device
> 	 driver_probe_device
> 	 __driver_attach
> 	 bus_for_each_dev
> 	 bus_add_driver
> 	 driver_register
> 	 do_one_initcall
> 	 do_initcall_level
> 	 do_initcalls
> 	 kernel_init_freeable
> 	 kernel_init
> 
> Log reports:
> sun4i-gpadc-iio sun6i-a31-gpadc-iio.0: error -EINVAL: IRQ FIFO_DATA_PENDING
> not found
> sun4i-gpadc-iio: probe of sun6i-a31-gpadc-iio.0 failed with error -22
> 
> Signed-off-by: Fuyao Kashizuku <fuyao@sjterm.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
> Changes in v2:
>  - Fix the commit message.
>  - Add the backstack.
>  - Add the log reports.
>  - Use the correct full name and email address.
>  - Correct the subsystem to mfd.
>  - Link to v1: https://lore.kernel.org/lkml/YwdhTlk+9h+9Mrwm@scg/
> 
>  include/linux/mfd/sun4i-gpadc.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/mfd/sun4i-gpadc.h b/include/linux/mfd/sun4i-gpadc.h
> index ea0ccf33a459..021f820f9d52 100644
> --- a/include/linux/mfd/sun4i-gpadc.h
> +++ b/include/linux/mfd/sun4i-gpadc.h
> @@ -81,8 +81,8 @@
>  #define SUN4I_GPADC_TEMP_DATA				0x20
>  #define SUN4I_GPADC_DATA				0x24
>  
> -#define SUN4I_GPADC_IRQ_FIFO_DATA			0
> -#define SUN4I_GPADC_IRQ_TEMP_DATA			1
> +#define SUN4I_GPADC_IRQ_FIFO_DATA			1
> +#define SUN4I_GPADC_IRQ_TEMP_DATA			2
>  
>  /* 10s delay before suspending the IP */
>  #define SUN4I_GPADC_AUTOSUSPEND_DELAY			10000
> 





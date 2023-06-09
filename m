Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99772099E
	for <linux-sunxi@lists.linux.dev>; Fri,  9 Jun 2023 20:24:21 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-3f7fcdc7f7fso14865935e9.0
        for <linux-sunxi@lists.linux.dev>; Fri, 09 Jun 2023 13:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686342259; x=1688934259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xMTes3OxnfA3t+27kxDYxz3y9N4WXv85X5IeEuv81Lo=;
        b=juEG/9xkGOZznHg5VN6YU8YNgUAbU5HN+C1JNiOpFShgY2+5AQ0lpdWpmhDWIUkn7S
         Pv6I3jzgC/iLh8uDAqaLIcBBesX26eAX8Vo8j/9Bt7bMwAp3218S62WZ9OM+cPnhKbKt
         Qke6WKP1aESqBV3Ii1J2GeAAitQCvLjcooU2t1Of6blrc6nbp7RnmplgUqK0ITjn2/Qq
         WX24Z56uwGq5mLAKGqnjYSa4UUXsqjM1Aw86PrcywcdSg17i2H4QFz77feG2a85q8VyK
         tPCYAuGt//58dWVQOwdoOrtJMh1omryZ6xbuiHRE9NV4dCmoO0xb57Ie2+6qCsZrQNUG
         DNeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686342259; x=1688934259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xMTes3OxnfA3t+27kxDYxz3y9N4WXv85X5IeEuv81Lo=;
        b=IU7lYncUYfYRriSUHp4miFTQZCC03Xw26EvpQWbBGeAe3w0evbo+QOvgQO39Uh8uw9
         P4AmfdVghFMVDnMW5aMYy4Db/o1SrCbOCljSW+OtrYjz/JQu2PwymOw3c6C704FTiDHj
         BUnlMsGK+p6UUSM//0WMoE1hI+Bw4MGGtJJSunfVzpptsBiRmVJc0qtVi/R22vEF9xKj
         L6Yntt0IJjPG+icRuuVzWWNUUOkpeunoiscfEQfSleLI8HdFDEaJTZed1bkV70SuUSCr
         YoZxSJ3E9nidwvw27ojuvMoFSsAa6WDWbZWdacSDRHsyPFTED/vekHKARRywfqx1ES//
         Q1Mw==
X-Gm-Message-State: AC+VfDyt8hcN9D38CxLg+PmeJTHwPqfGEz9LsnqNeBtbqgxyCUG/SqSY
	hCaBy0NgeWDL0FEwnZpH3Jc=
X-Google-Smtp-Source: ACHHUZ4gRf5v66n+PObXVESQBfokis9kRfi+90ru8Gb4hvTcNLXbCkp8hkf7C6QYtJaqVmpIMGawMw==
X-Received: by 2002:a05:600c:4c17:b0:3f7:3284:4e51 with SMTP id d23-20020a05600c4c1700b003f732844e51mr4681845wmp.4.1686342259331;
        Fri, 09 Jun 2023 13:24:19 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id z10-20020a05600c220a00b003f735d6fa74sm3643498wml.9.2023.06.09.13.24.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 13:24:18 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Jagan Teki <jagan@amarulasolutions.com>,
 Mikhail Kalashnikov <iuncuim@gmail.com>,
 Andre Przywara <andre.przywara@arm.com>
Cc: Samuel Holland <samuel@sholland.org>, Icenowy Zheng <uwu@icenowy.me>,
 Piotr Oniszczuk <piotr.oniszczuk@gmail.com>, u-boot@lists.denx.de,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 1/5] sunxi: dram: make MBUS configuration functions static
Date: Fri, 09 Jun 2023 22:24:18 +0200
Message-ID: <5943646.lOV4Wx5bFT@jernej-laptop>
In-Reply-To: <20230607000745.10245-2-andre.przywara@arm.com>
References:
 <20230607000745.10245-1-andre.przywara@arm.com>
 <20230607000745.10245-2-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sreda, 07. junij 2023 ob 02:07:41 CEST je Andre Przywara napisal(a):
> The usage of the C keyword "inline" seems to be a common
> misunderstanding: it's a *hint* only, and modern compilers will inline
> (or not) functions based on their own judgement and provided compiler
> options.
> So while marking functions as "inline" does not do much, missing the
> "static" keyword will force to compiler to spell out a version of the
> function for potential external callers, which actually increases the
> code size (though hopefully the linker will drop the function).
> 
> Change the "inline" attribute for the mbus_configure_port() functions in
> some Allwinner DRAM drivers to "static", so that the explicit version
> can actually be dropped from the object file, reducing the code size.
> 
> "static inline" has a use case in header files, where it avoids a warning
> if a .c file including this header does not use the particular function.
> In a .c file itself "static inline" is not useful otherwise, so just use
> static here as well.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Nice catch! Could it be put into common functions? These functions look the
same. Anyway:

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  arch/arm/mach-sunxi/dram_sun50i_h6.c   |  3 ++-
>  arch/arm/mach-sunxi/dram_sun50i_h616.c |  2 +-
>  arch/arm/mach-sunxi/dram_sunxi_dw.c    | 18 +++++++++---------
>  3 files changed, 12 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/arm/mach-sunxi/dram_sun50i_h6.c b/arch/arm/mach-sunxi/dram_sun50i_h6.c
> index b332f3a3e4a..bff2e42513c 100644
> --- a/arch/arm/mach-sunxi/dram_sun50i_h6.c
> +++ b/arch/arm/mach-sunxi/dram_sun50i_h6.c
> @@ -93,7 +93,8 @@ enum {
>  	MBUS_QOS_HIGH,
>  	MBUS_QOS_HIGHEST
>  };
> -inline void mbus_configure_port(u8 port,
> +
> +static void mbus_configure_port(u8 port,
>  				bool bwlimit,
>  				bool priority,
>  				u8 qos,
> diff --git a/arch/arm/mach-sunxi/dram_sun50i_h616.c b/arch/arm/mach-sunxi/dram_sun50i_h616.c
> index 1f9416d6eaf..02f6b2a06d4 100644
> --- a/arch/arm/mach-sunxi/dram_sun50i_h616.c
> +++ b/arch/arm/mach-sunxi/dram_sun50i_h616.c
> @@ -31,7 +31,7 @@ enum {
>  	MBUS_QOS_HIGHEST
>  };
>  
> -inline void mbus_configure_port(u8 port,
> +static void mbus_configure_port(u8 port,
>  				bool bwlimit,
>  				bool priority,
>  				u8 qos,
> diff --git a/arch/arm/mach-sunxi/dram_sunxi_dw.c b/arch/arm/mach-sunxi/dram_sunxi_dw.c
> index 4af5922f334..9382d3d0be8 100644
> --- a/arch/arm/mach-sunxi/dram_sunxi_dw.c
> +++ b/arch/arm/mach-sunxi/dram_sunxi_dw.c
> @@ -81,15 +81,15 @@ enum {
>  	MBUS_QOS_HIGHEST
>  };
>  
> -static inline void mbus_configure_port(u8 port,
> -				       bool bwlimit,
> -				       bool priority,
> -				       u8 qos,         /* MBUS_QOS_LOWEST .. MBUS_QOS_HIGEST */
> -				       u8 waittime,    /* 0 .. 0xf */
> -				       u8 acs,         /* 0 .. 0xff */
> -				       u16 bwl0,       /* 0 .. 0xffff, bandwidth limit in MB/s */
> -				       u16 bwl1,
> -				       u16 bwl2)
> +static void mbus_configure_port(u8 port,
> +				bool bwlimit,
> +				bool priority,
> +				u8 qos,         /* MBUS_QOS_LOWEST .. MBUS_QOS_HIGEST */
> +				u8 waittime,    /* 0 .. 0xf */
> +				u8 acs,         /* 0 .. 0xff */
> +				u16 bwl0,       /* 0 .. 0xffff, bandwidth limit in MB/s */
> +				u16 bwl1,
> +				u16 bwl2)
>  {
>  	struct sunxi_mctl_com_reg * const mctl_com =
>  			(struct sunxi_mctl_com_reg *)SUNXI_DRAM_COM_BASE;
> 





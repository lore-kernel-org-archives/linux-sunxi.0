Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139FF321E
	for <linux-sunxi@lists.linux.dev>; Wed, 12 Oct 2022 21:42:31 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id sc25so34591087ejc.12
        for <linux-sunxi@lists.linux.dev>; Wed, 12 Oct 2022 14:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5UpIUo2FglmobSs8B+Zec7xefckNfIo9rTAmKEbaLGk=;
        b=QGyKy4Loihqni2gwVYoITmOXqRAP7RzP5dNnr5Ukse0qZJn+lNY4oehDSaV4XCVmCr
         Pq6tf4mEY5oXlm12kEZqEYQVabViKY9H3SqZO6kkpHDSOp7kLFWglceumk8fCzXqlp+3
         9BQW1Ie9UEv4itCF05gJ+HUOTaTADh96A16ykSuPzD2BBWklQMrMGfC/gXvm3Xpo/tfu
         n4/1la23I6yePC/w4UBFKgAKz84NAUiF9paUjQTzav8opfb1LofBzx81LCWWgrD0USLu
         ghg8D8KGs5/BaV3tL1bhZ0BwOFTHHGOIDcnstAtGvstcuCBhyLKHyyxdQuk9NDfGjayr
         fcOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5UpIUo2FglmobSs8B+Zec7xefckNfIo9rTAmKEbaLGk=;
        b=bfT/3YAW7BjwKO6xJ7Nxd6TyCqgjRMIIXjiYkBYf0tn0iDSAtHlOwB2YbGxYbJXMmU
         lp2UqaG0tYAC+F+WZUpxHyFb2hd3PB6wdSWC+mQPY2ULarBCk9t9oSs1cwVmeTmxzcA6
         mX8QdZNqU9vkFAynRquQrE76lZPsV49rBklCc9x5QxfDwStlUsch+8B6FCOeN/l5w0N0
         7eDGSpgmnlBqxm8yNWbmQ2jeOIrZG1yo5Xy3LJG7M28iJEn+lsbcdduI809noIFBi4x1
         u3h/uaJyfZT9llv/Bk0hxIJRsQN9dOf8WHAc8u1gC/6OKqFphByaTRDeceRiTlOFK232
         80dQ==
X-Gm-Message-State: ACrzQf3yM9XDEg24LJpAul6kH88n6VmKgukR23jz2AUPEkCPQ0C8qdhH
	sH92Lkb56bmcTu951h8BqPw=
X-Google-Smtp-Source: AMsMyM41GWk8EMJRS++Hk2W1gD5DY5ShiLtrfO3bbuv/YByLGo6RKERT4wISdohxwzsBu+ELjscDMA==
X-Received: by 2002:a17:906:fe46:b0:730:ca2b:cb7b with SMTP id wz6-20020a170906fe4600b00730ca2bcb7bmr25107061ejb.703.1665610950272;
        Wed, 12 Oct 2022 14:42:30 -0700 (PDT)
Received: from kista.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id pg8-20020a170907204800b0078c1e174e11sm1822512ejb.136.2022.10.12.14.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 14:42:29 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Jagan Teki <jagan@amarulasolutions.com>, Andre Przywara <andre.przywara@arm.com>
Cc: Icenowy Zheng <uwu@icenowy.me>, Jesse Taube <mr.bossman075@gmail.com>, Yifan Gu <me@yifangu.com>, Giulio Benetti <giulio.benetti@benettiengineering.com>, George Hilliard <thirtythreeforty@gmail.com>, Samuel Holland <samuel@sholland.org>, u-boot@lists.denx.de, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 4/6] sunxi: f1c100: add UART1 support
Date: Wed, 12 Oct 2022 23:42:28 +0200
Message-ID: <1917971.yKVeVyVuyW@kista>
In-Reply-To: <20221012163458.1968900-5-andre.przywara@arm.com>
References: <20221012163458.1968900-1-andre.przywara@arm.com> <20221012163458.1968900-5-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Andre,

Dne sreda, 12. oktober 2022 ob 18:34:56 CEST je Andre Przywara napisal(a):
> Some boards use UART1 for its debug UART, so define the pins for the SPL
> and the pinmux name and mux value for U-Boot proper.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  arch/arm/mach-sunxi/board.c           | 4 ++++
>  drivers/pinctrl/sunxi/pinctrl-sunxi.c | 1 +
>  2 files changed, 5 insertions(+)
> 
> diff --git a/arch/arm/mach-sunxi/board.c b/arch/arm/mach-sunxi/board.c
> index 62bb40b8c89..77216157908 100644
> --- a/arch/arm/mach-sunxi/board.c
> +++ b/arch/arm/mach-sunxi/board.c
> @@ -147,6 +147,10 @@ static int gpio_init(void)
>  	sunxi_gpio_set_cfgpin(SUNXI_GPH(12), SUN9I_GPH_UART0);
>  	sunxi_gpio_set_cfgpin(SUNXI_GPH(13), SUN9I_GPH_UART0);
>  	sunxi_gpio_set_pull(SUNXI_GPH(13), SUNXI_GPIO_PULL_UP);
> +#elif CONFIG_CONS_INDEX == 2 && defined(CONFIG_MACH_SUNIV)
> +	sunxi_gpio_set_cfgpin(SUNXI_GPA(2), SUNIV_GPE_UART0);
> +	sunxi_gpio_set_cfgpin(SUNXI_GPA(3), SUNIV_GPE_UART0);
> +	sunxi_gpio_set_pull(SUNXI_GPA(3), SUNXI_GPIO_PULL_UP);
>  #elif CONFIG_CONS_INDEX == 2 && defined(CONFIG_MACH_SUN5I)
>  	sunxi_gpio_set_cfgpin(SUNXI_GPG(3), SUN5I_GPG_UART1);
>  	sunxi_gpio_set_cfgpin(SUNXI_GPG(4), SUN5I_GPG_UART1);
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> b/drivers/pinctrl/sunxi/pinctrl-sunxi.c index 9ce2bc1b3af..061104be056
> 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> @@ -245,6 +245,7 @@ static const struct sunxi_pinctrl_function
> suniv_f1c100s_pinctrl_functions[] = { #else
>  	{ "uart0",	5 },	/* PE0-PE1 */
>  #endif
> +	{ "uart1",	5 },	/* PA0-PA3 */

Comment should be PA2-PA3. With that fixed:
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>  };
> 
>  static const struct sunxi_pinctrl_desc __maybe_unused
> suniv_f1c100s_pinctrl_desc = { --
> 2.25.1



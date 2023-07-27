Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D2A19C
	for <linux-sunxi@lists.linux.dev>; Thu, 27 Jul 2023 00:08:03 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-7835c92c373so38880639f.0
        for <linux-sunxi@lists.linux.dev>; Wed, 26 Jul 2023 17:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690416483; x=1691021283;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oScQvtaKsyoZwT/BQPIZR9f3XKI5G6b5dktfUmZvCdE=;
        b=UOu+rrv9xzFQyicYCZl5U2hJpP5ojKdJqEZPvuPCdhkHVimb07cVJquvUTQFfYnd5t
         krnPvMYDCscTMEDx7o/BETGuYI0r1l1vwm9Yz24YKL2/7tIgW4UQ4c9/+NxvL8mUFQmK
         wezShN7DzVQDhNQEMUfTUyBBiMxl92ILnahDYjiQP0Pmj4zMjtuK0o6edve2GaBS1vX6
         vr3sYgpvGzql+aiUEIpkS5sE0wMK86CP5zuaJqdiEChzdG1gOpOWKA9VzGsyFQr2gOUM
         G1/PtFDrmR0Abv32rZW43H3i8Ob25FQXXwEzSA0SfxZXhbsg+oPEMvXQn3/JWW/U5C4P
         zWDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690416483; x=1691021283;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oScQvtaKsyoZwT/BQPIZR9f3XKI5G6b5dktfUmZvCdE=;
        b=ZPLecn2ebQb7irQci5yueptenjwuhSKdO0KSqrUV8S/vT26SxSpZtgr504Dc0Jt2Cb
         gyylvvHbHT/rzEhKh/ZiOLgIsnVKZRAikikg5pNDxNGPpPzpsTSCkNUffjh0PapyYrAh
         HmJJgXfyBryaZO16ED1WWtOdCm0FIi5G0FOCqNOrn3JRLvvts2punCPuYxYI71p3O+ZA
         3IPCrJAAzQRL2D/Hx5m0NRilzhoFkK+bb6ZnezaLG+ZeF6JLQwIilgtaQ9bDNQx4Qi+c
         uzqyjWXC6Be79HtPjuO1MT1RuoED9xIzKba2Gdh459iH05OeHU2mub/TzNUGKfpovVjI
         sdSw==
X-Gm-Message-State: ABy/qLZe2MmjSbN4QAc8N/q2MYc5897h7lJozmBylL7nJfmIiBqXZ5Wz
	QbilCtWKwOp2plMpDX7Wd1U=
X-Google-Smtp-Source: APBJJlHdN+DQxnnwoC4EitDcXtcEUvaQRC9DxejN55r6RyIn8tX9s6c/rgVi8WWPm7m5E+5dARvzSQ==
X-Received: by 2002:a6b:d804:0:b0:787:8cf:fe82 with SMTP id y4-20020a6bd804000000b0078708cffe82mr1477732iob.8.1690416482741;
        Wed, 26 Jul 2023 17:08:02 -0700 (PDT)
Received: from ?IPV6:2001:470:42c4:101:3c3f:9c0a:44ce:a07d? ([2001:470:42c4:101:3c3f:9c0a:44ce:a07d])
        by smtp.gmail.com with ESMTPSA id t25-20020a6bdb19000000b00785cfdd968bsm80023ioc.5.2023.07.26.17.08.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jul 2023 17:08:01 -0700 (PDT)
Message-ID: <2523c2b3-c8e9-d66c-5835-f5da94a5ac60@gmail.com>
Date: Wed, 26 Jul 2023 18:08:00 -0600
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] sunxi: remove CONFIG_SATAPWR
Content-Language: en-US
To: Andre Przywara <andre.przywara@arm.com>,
 Jagan Teki <jagan@amarulasolutions.com>, u-boot@lists.denx.de
Cc: Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Icenowy Zheng <uwu@icenowy.me>,
 Maxim Kiselev <bigunclemax@gmail.com>, linux-sunxi@lists.linux.dev
References: <20230721134606.4505-1-andre.przywara@arm.com>
 <20230726234739.14038-1-andre.przywara@arm.com>
From: Sam Edwards <cfsworks@gmail.com>
In-Reply-To: <20230726234739.14038-1-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/26/23 17:47, Andre Przywara wrote:
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index b3115b054c8..422cc01e529 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -1158,6 +1158,8 @@ config ARCH_SUNXI
>   	imply CMD_GPT
>   	imply CMD_UBI if MTD_RAW_NAND
>   	imply DISTRO_DEFAULTS
> +	imply DM_REGULATOR
> +	imply DM_REGULATOR_FIXED
>   	imply FAT_WRITE
>   	imply FIT
>   	imply OF_LIBFDT_OVERLAY
> diff --git a/arch/arm/mach-sunxi/Kconfig b/arch/arm/mach-sunxi/Kconfig
> index e20c3a3ee92..a7c5ae80a1e 100644
> --- a/arch/arm/mach-sunxi/Kconfig
> +++ b/arch/arm/mach-sunxi/Kconfig
> @@ -1008,14 +1008,6 @@ config VIDEO_LCD_TL059WV5C0
>   
>   endchoice
>   
> -config SATAPWR
> -	string "SATA power pin"
> -	default ""
> -	help
> -	  Set the pins used to power the SATA. This takes a string in the
> -	  format understood by sunxi_name_to_gpio, e.g. PH1 for pin 1 of
> -	  port H.
> -
>   config GMAC_TX_DELAY
>   	int "GMAC Transmit Clock Delay Chain"
>   	default 0
> diff --git a/board/sunxi/board.c b/board/sunxi/board.c
> index f321cd58a6e..7ac50c4ae8c 100644
> --- a/board/sunxi/board.c
> +++ b/board/sunxi/board.c
> @@ -187,7 +187,7 @@ enum env_location env_get_location(enum env_operation op, int prio)
>   /* add board specific code here */
>   int board_init(void)
>   {
> -	__maybe_unused int id_pfr1, ret, satapwr_pin, macpwr_pin;
> +	__maybe_unused int id_pfr1, ret, macpwr_pin;
>   
>   	gd->bd->bi_boot_params = (PHYS_SDRAM_0 + 0x100);
>   
> @@ -225,20 +225,6 @@ int board_init(void)
>   		return ret;
>   
>   	/* strcmp() would look better, but doesn't get optimised away. */
> -	if (CONFIG_SATAPWR[0]) {
> -		satapwr_pin = sunxi_name_to_gpio(CONFIG_SATAPWR);
> -		if (satapwr_pin >= 0) {
> -			gpio_request(satapwr_pin, "satapwr");
> -			gpio_direction_output(satapwr_pin, 1);
> -
> -			/*
> -			 * Give the attached SATA device time to power-up
> -			 * to avoid link timeouts
> -			 */
> -			mdelay(500);
> -		}
> -	}
> -
>   	if (CONFIG_MACPWR[0]) {
>   		macpwr_pin = sunxi_name_to_gpio(CONFIG_MACPWR);
>   		if (macpwr_pin >= 0) {
> ...
> diff --git a/drivers/ata/ahci_sunxi.c b/drivers/ata/ahci_sunxi.c
> index 94a3379c532..9064774e661 100644
> --- a/drivers/ata/ahci_sunxi.c
> +++ b/drivers/ata/ahci_sunxi.c
> @@ -7,6 +7,7 @@
>   #include <asm/io.h>
>   #include <asm/gpio.h>
>   #include <linux/delay.h>
> +#include <power/regulator.h>
>   
>   #define AHCI_PHYCS0R 0x00c0
>   #define AHCI_PHYCS1R 0x00c4
> @@ -74,6 +75,7 @@ static int sunxi_ahci_phy_init(u8 *reg_base)
>   
>   static int sunxi_sata_probe(struct udevice *dev)
>   {
> +	struct udevice *reg_dev;
>   	ulong base;
>   	u8 *reg;
>   	int ret;
> @@ -89,6 +91,13 @@ static int sunxi_sata_probe(struct udevice *dev)
>   		debug("%s: Failed to init phy (err=%d)\n", __func__, ret);
>   		return ret;
>   	}
> +
> +	ret = device_get_supply_regulator(dev, "target-supply", &reg_dev);
> +	if (ret == 0) {
> +		regulator_set_enable(reg_dev, true);
> +		mdelay(500);
> +	}
> +
>   	ret = ahci_probe_scsi(dev, base);
>   	if (ret) {
>   		debug("%s: Failed to probe (err=%d)\n", __func__, ret);

Love these sorts of clean-ups. I don't have a sunxi with SATA so I can't 
test it, but I've been running my target on this patch in some form or 
another for several weeks, and the code looks good, so:
Reviewed-by: Sam Edwards <CFSworks@gmail.com>

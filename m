Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E5714F9F9
	for <linux-sunxi@lists.linux.dev>; Wed, 10 Jul 2024 23:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720653606; cv=none; b=igMirI1qPxIj8ZiYN8WUdGsmIZ8uUxwLMCcIFT9/52fzKnShgSsHUMeR+Z1PZS6vQYDdh+gNl9E40Ac8+QrQ/f7dllhgMXYovW2IXc1W33O9De2qq6LswiIcte2b3cPPINrTOMLAEK3DQM8KPVdFfXCNnAeb2o5VwUl2IJk1LUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720653606; c=relaxed/simple;
	bh=njpMNHPXM5PRGf19XwiCT4tWSlYguMhkpFwfg2Xq8hg=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u7yYL0awXXweGtd1ocI1cagWCl/X6bEK2UHh17u5BcWj31iTTTs/4XgAOxGTabPqYji9cJOFa0J3theyT/v8hPnKwWTiTnsZBOi6Qq0/8+QLX4agEtZcoLvEpZRu0DrWw+pF28P+Rjcj45l73JfHinZKxVL7hgRHSm7gusv9sjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YkolcEcT; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YkolcEcT"
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-5c6661bca43so161764eaf.0
        for <linux-sunxi@lists.linux.dev>; Wed, 10 Jul 2024 16:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720653604; x=1721258404; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2ijvrZzT8cXYcsNPx5TsQl01OrZPhHfu5BtRdUxd3g4=;
        b=YkolcEcTNrVTwxZNb5p6854knqhE+ISDr0PcelV6PMikAANreSK+HtothEXLYliGP6
         6XqEkyyzpx0DdhgwNTbXnsE/DPuCWcSciFAItqR5rJZCeFvnugkwaGRcpSgbaFAiKkEH
         CypyJRoi/TtFZreyUrWtdx3/D9LcPzRL2Fo2aiHkFGBowypxL9joev5N7sei3StuhD0s
         mpzjveeeh4+ogqtDDjyBNCngtzEEbpxH/6E56rpQdvPl5a/k2dw/+FadNPfXOqIZm+2P
         L04mVKVQPEgITATb7tgl8mKBgGXDo8CWBmFOpSlaTJVw+ZE2l/ZFsmXfmap3/H4eSnSe
         JL5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720653604; x=1721258404;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ijvrZzT8cXYcsNPx5TsQl01OrZPhHfu5BtRdUxd3g4=;
        b=t6ZcqAXqoTTzg4+s8x4eS7FRyCfVrCxDFfsl9p+hTJwSWzHy81UtkZOsz7vgqyOS7v
         4vwPrO4Y22tum+XNalDybTvcVh4LYf3tznAe6u22FWPB+LOGxGc9+ZS57znibDaCmO/w
         T06z66v4Ek6dVfp8vqIQfKwaodlrL/43sWvLckH7frXDON21Xlkmq9Awps+Q2fYp4fMB
         UDAhxAUbh0PYqVVWLEAXe5T5Mgqm8rsxqNFsJciYXkJZo704BdYL1rSLlC6JwgdXRhpt
         1IIxRTJaWKIQFXmEowV3NPJ4dikGoRfBWItbTZJ81JCyZy3baNNY1QHTN0a8EgEqDkCc
         I1OA==
X-Forwarded-Encrypted: i=1; AJvYcCUK/NWEXqyVOqbKANfGkvbfoBgnp3D56nmDqwrBS4UXidtwfMuyFnpaq4MIGMP3gLQ7qtQymWecvMo6F4BZtqMsODVo5FHDojpGEMw=
X-Gm-Message-State: AOJu0Yzvq6FVjtHeJNgNTPDBQOuYdORCEG3dJjWYNKJEhrxTsz/Lf3x3
	AYvHNhQBb63/fQ1SyzZJeMJzngbmOeMbdTevNysE80lc5JWPuRKy
X-Google-Smtp-Source: AGHT+IEsXH3XgrHGbwJkkM6k3DOOaXXD1NsFsNspC9Ye1PRP/hleEj0cnB7VqQAQ2J1glmqhxv305w==
X-Received: by 2002:a4a:4e04:0:b0:5c4:396e:438c with SMTP id 006d021491bc7-5c68dfaf8b9mr6269073eaf.0.1720653602935;
        Wed, 10 Jul 2024 16:20:02 -0700 (PDT)
Received: from neuromancer. ([2600:1700:fb0:1bcf:4def:7e53:67cc:4ec0])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5c7ad96b6ebsm477658eaf.4.2024.07.10.16.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 16:20:02 -0700 (PDT)
Message-ID: <668f1722.4a0a0220.666c8.2819@mx.google.com>
X-Google-Original-Message-ID: <Zo8XIXIeC/MmI+pN@neuromancer.>
Date: Wed, 10 Jul 2024 18:20:01 -0500
From: Chris Morgan <macroalpha82@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Tom Rini <trini@konsulko.com>, Jaehoon Chung <jh80.chung@samsung.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Chris Morgan <macromorgan@hotmail.com>,
	Ryan Walklin <ryan@testtoast.com>, u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 3/6] power: pmic: sunxi: replace AXP717 SPL driver
References: <20240515234839.26898-1-andre.przywara@arm.com>
 <20240515234839.26898-4-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240515234839.26898-4-andre.przywara@arm.com>

On Thu, May 16, 2024 at 12:48:36AM +0100, Andre Przywara wrote:
> We now have a generic AXP SPL driver implementation, that already covers
> the DC/DC converters of the AXP717 PMIC.
> 
> Remove the old, dedicated driver and switch to the new generic driver.
> This should not introduce any change in behaviour.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  drivers/power/Makefile |  2 +-
>  drivers/power/axp717.c | 92 ------------------------------------------
>  2 files changed, 1 insertion(+), 93 deletions(-)
>  delete mode 100644 drivers/power/axp717.c
> 
> diff --git a/drivers/power/Makefile b/drivers/power/Makefile
> index 9d1f4c65262..6df23a81c29 100644
> --- a/drivers/power/Makefile
> +++ b/drivers/power/Makefile
> @@ -14,7 +14,7 @@ obj-$(CONFIG_AXP209_POWER)	+= axp209.o
>  obj-$(CONFIG_AXP221_POWER)	+= axp221.o
>  obj-$(CONFIG_AXP305_POWER)	+= axp305.o
>  obj-$(CONFIG_AXP313_POWER)	+= axp313.o
> -obj-$(CONFIG_AXP717_POWER)	+= axp717.o
> +obj-$(CONFIG_AXP717_POWER)	+= axp_spl.o
>  obj-$(CONFIG_AXP809_POWER)	+= axp809.o
>  obj-$(CONFIG_AXP818_POWER)	+= axp818.o
>  endif
> diff --git a/drivers/power/axp717.c b/drivers/power/axp717.c
> deleted file mode 100644
> index 7c77c09ea8f..00000000000
> --- a/drivers/power/axp717.c
> +++ /dev/null
> @@ -1,92 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0+
> -/*
> - * AXP717 SPL driver
> - * (C) Copyright 2024 Arm Ltd.
> - */
> -
> -#include <common.h>
> -#include <command.h>
> -#include <errno.h>
> -#include <asm/arch/pmic_bus.h>
> -#include <axp_pmic.h>
> -
> -enum axp717_reg {
> -	AXP717_CHIP_VERSION = 0x3,
> -	AXP717_SHUTDOWN = 0x27,
> -	AXP717_OUTPUT_CTRL1 = 0x80,
> -	AXP717_DCDC1_VOLTAGE = 0x83,
> -};
> -
> -#define AXP717_CHIP_VERSION_MASK	0xc8
> -#define AXP717_DCDC_1220MV_OFFSET	71
> -#define AXP717_POWEROFF			(1U << 0)
> -#define DCDC_DVM_ENABLE			(1U << 7)
> -
> -static u8 axp_mvolt_to_cfg(int mvolt, int min, int max, int div)
> -{
> -	if (mvolt < min)
> -		mvolt = min;
> -	else if (mvolt > max)
> -		mvolt = max;
> -
> -	return (mvolt - min) / div;
> -}
> -
> -static int axp_set_dcdc(int dcdc_num, unsigned int mvolt)
> -{
> -	int ret;
> -	u8 cfg = DCDC_DVM_ENABLE;
> -
> -	if (dcdc_num < 1 || dcdc_num > 3)
> -		return -EINVAL;
> -
> -	if (mvolt >= 1220)
> -		cfg |= AXP717_DCDC_1220MV_OFFSET +
> -			axp_mvolt_to_cfg(mvolt, 1220,
> -					 dcdc_num == 3 ? 1840 : 1540, 20);
> -	else
> -		cfg |= axp_mvolt_to_cfg(mvolt, 500, 1200, 10);
> -
> -	if (mvolt == 0)
> -		return pmic_bus_clrbits(AXP717_OUTPUT_CTRL1,
> -					1U << (dcdc_num -1));
> -
> -	ret = pmic_bus_write(AXP717_DCDC1_VOLTAGE + dcdc_num - 1, cfg);
> -	if (ret)
> -		return ret;
> -
> -	return pmic_bus_setbits(AXP717_OUTPUT_CTRL1, 1U << (dcdc_num - 1));
> -}
> -
> -int axp_set_dcdc1(unsigned int mvolt)
> -{
> -	return axp_set_dcdc(1, mvolt);
> -}
> -
> -int axp_set_dcdc2(unsigned int mvolt)
> -{
> -	return axp_set_dcdc(2, mvolt);
> -}
> -
> -int axp_set_dcdc3(unsigned int mvolt)
> -{
> -	return axp_set_dcdc(3, mvolt);
> -}
> -
> -int axp_init(void)
> -{
> -	return pmic_bus_init();
> -}
> -
> -#if !CONFIG_IS_ENABLED(ARM_PSCI_FW) && !IS_ENABLED(CONFIG_SYSRESET_CMD_POWEROFF)
> -int do_poweroff(struct cmd_tbl *cmdtp, int flag, int argc, char *const argv[])
> -{
> -	pmic_bus_setbits(AXP717_SHUTDOWN, AXP717_POWEROFF);
> -
> -	/* infinite loop during shutdown */
> -	while (1) {}
> -
> -	/* not reached */
> -	return 0;
> -}
> -#endif
> -- 
> 2.35.8
> 

I've been using this for the past week or so on my RG35XX-H for which
I've been testing some code and it has worked well for me.

Tested-by: Chris Morgan <macromorgan@hotmail.com>

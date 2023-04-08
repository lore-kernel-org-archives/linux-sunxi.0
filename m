Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4331C2D9
	for <linux-sunxi@lists.linux.dev>; Sat,  8 Apr 2023 06:11:08 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-94a35b0ec77so13464766b.3
        for <linux-sunxi@lists.linux.dev>; Fri, 07 Apr 2023 23:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680934267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gYLSYG5TaGkMiuBOq5kIwvSWYcfLRwMS7QEKrLGHPpg=;
        b=Dd3hGjJkT9Bvm4nt/4m5SDyNJiXRV4rBC9rEjwOeRDKHSYnKTVY27aFEGDr01feliS
         jEandnpqi4gNBE+Y1YjLOe+FmkvcZKiEVExulZUeRul39JSCAEP8pFqzXPSR2D9MQTpi
         g2K5kClCh8l3ayflbinZgwPZ17SxF4UYIMLIG+h/C7g5YWcR7hGP/Y9pQrzR7x62fnKK
         mR61EnhU+7l859LgYXTqfFLWQfqqOjvmgpGNGU+NmzEYPi8aIY0WghlgHrWp9DXQ3cgg
         8i8Bfpwc7y0n9iWtdUrhG5e/eaDTam0mysMkZQsJtBImVvbLnk2blYskslDvxiZW4vDj
         bg9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680934267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gYLSYG5TaGkMiuBOq5kIwvSWYcfLRwMS7QEKrLGHPpg=;
        b=OzfO+7V9k6kkILEk435bbfbct3WDHPsZbcc4Wg2q71UWnlue9YS+pk0dUnBzrMOXZx
         8WmuSUHIs7hNGBRoZBgFWn+mi24R+qA4JVduuPvVBE5qSj2GZzpK1FA1dNvLkv9psavl
         xqOtOkPl5seWMDqIISAX905EnL0tQUhNdqG7RAPQk9Mrkp83eVx6RrtLMGx41d1B1Qmo
         1ktddprNGadFHvSILn7maosjFe+a2eLfS9Py1lFAPzWCl5KHm3KP6RbaK0PwHVIOWhl4
         bAYIDURuT7RQBapq5rBH8Ufjcm4BWuiUExA+FES1izuD56fL0x2MPjUaf/av01kreL/Z
         qx5Q==
X-Gm-Message-State: AAQBX9dWSEaFah+Q9lxBntjgA2h6zyZQQzFaiq65Wk1ZuELTBmyKHSRj
	TnQAVNigeEsbchQpK6D5kGaZ/Gkx8P8=
X-Google-Smtp-Source: AKy350ZmBDy+vXIZGZQKCDzI8JSl8vZQm7sMbDshQbLhyv66uumkgl9oKz8c16505QPieRK2H4zLjg==
X-Received: by 2002:a50:ff13:0:b0:504:80f8:f6b2 with SMTP id a19-20020a50ff13000000b0050480f8f6b2mr2261573edu.25.1680934266750;
        Fri, 07 Apr 2023 23:11:06 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id h10-20020aa7de0a000000b005023ddb37eesm2531481edv.8.2023.04.07.23.11.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 23:11:06 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Samuel Holland <samuel@sholland.org>, Anatolij Gustschin <agust@denx.de>,
 Andre Przywara <andre.przywara@arm.com>
Cc: Lukasz Majewski <lukma@denx.de>, Jagan Teki <jagan@amarulasolutions.com>,
 Sean Anderson <seanga2@gmail.com>, u-boot@lists.denx.de,
 linux-sunxi@lists.linux.dev
Subject:
 Re: [PATCH v2 1/2] video: sunxi: dw-hdmi: Use DM for clock gates and resets
Date: Sat, 08 Apr 2023 08:11:05 +0200
Message-ID: <2674091.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20230408002639.26241-2-andre.przywara@arm.com>
References:
 <20230408002639.26241-1-andre.przywara@arm.com>
 <20230408002639.26241-2-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sobota, 08. april 2023 ob 02:26:38 CEST je Andre Przywara napisal(a):
> From: Samuel Holland <samuel@sholland.org>
> 
> This abstracts away the CCU register layout, which is necessary for
> supporting new SoCs like H6 with a reorganized CCU. One of the resets is
> referenced from the PHY node instead of the controller node, so it will
> have to wait until the PHY code is factored out to a separate driver.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/video/sunxi/sunxi_dw_hdmi.c | 27 +++++++++++++++++++++------
>  1 file changed, 21 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/video/sunxi/sunxi_dw_hdmi.c
> b/drivers/video/sunxi/sunxi_dw_hdmi.c index 4f5d0989286..ef18d1f281f 100644
> --- a/drivers/video/sunxi/sunxi_dw_hdmi.c
> +++ b/drivers/video/sunxi/sunxi_dw_hdmi.c
> @@ -5,12 +5,14 @@
>   * (C) Copyright 2017 Jernej Skrabec <jernej.skrabec@siol.net>
>   */
> 
> +#include <clk.h>
>  #include <common.h>
>  #include <display.h>
>  #include <dm.h>
>  #include <dw_hdmi.h>
>  #include <edid.h>
>  #include <log.h>
> +#include <reset.h>
>  #include <time.h>
>  #include <asm/io.h>
>  #include <asm/arch/clock.h>
> @@ -20,6 +22,8 @@
> 
>  struct sunxi_dw_hdmi_priv {
>  	struct dw_hdmi hdmi;
> +	struct reset_ctl_bulk resets;
> +	struct clk_bulk clocks;
>  };
> 
>  struct sunxi_hdmi_phy {
> @@ -336,14 +340,16 @@ static int sunxi_dw_hdmi_probe(struct udevice *dev)
>  	clrsetbits_le32(&ccm->hdmi_clk_cfg, CCM_HDMI_CTRL_PLL_MASK,
>  			CCM_HDMI_CTRL_PLL3);
> 
> -	/* Set ahb gating to pass */
> -	setbits_le32(&ccm->ahb_reset1_cfg, 1 << AHB_RESET_OFFSET_HDMI);
> +	/* This reset is referenced from the PHY devicetree node. */
>  	setbits_le32(&ccm->ahb_reset1_cfg, 1 << AHB_RESET_OFFSET_HDMI2);
> -	setbits_le32(&ccm->ahb_gate1, 1 << AHB_GATE_OFFSET_HDMI);
> -	setbits_le32(&ccm->hdmi_slow_clk_cfg, 
CCM_HDMI_SLOW_CTRL_DDC_GATE);
> 
> -	/* Clock on */
> -	setbits_le32(&ccm->hdmi_clk_cfg, CCM_HDMI_CTRL_GATE);
> +	ret = reset_deassert_bulk(&priv->resets);
> +	if (ret)
> +		return ret;
> +
> +	ret = clk_enable_bulk(&priv->clocks);
> +	if (ret)
> +		return ret;
> 
>  	sunxi_dw_hdmi_phy_init(&priv->hdmi);
> 
> @@ -362,6 +368,7 @@ static int sunxi_dw_hdmi_of_to_plat(struct udevice *dev)
> {
>  	struct sunxi_dw_hdmi_priv *priv = dev_get_priv(dev);
>  	struct dw_hdmi *hdmi = &priv->hdmi;
> +	int ret;
> 
>  	hdmi->ioaddr = (ulong)dev_read_addr(dev);
>  	hdmi->i2c_clk_high = 0xd8;
> @@ -369,6 +376,14 @@ static int sunxi_dw_hdmi_of_to_plat(struct udevice
> *dev) hdmi->reg_io_width = 1;
>  	hdmi->phy_set = sunxi_dw_hdmi_phy_cfg;
> 
> +	ret = reset_get_bulk(dev, &priv->resets);
> +	if (ret)
> +		return ret;
> +
> +	ret = clk_get_bulk(dev, &priv->clocks);
> +	if (ret)
> +		return ret;
> +
>  	return 0;
>  }





Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25C21841
	for <linux-sunxi@lists.linux.dev>; Sat,  8 Apr 2023 06:11:34 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-944bd1d58easo208235566b.0
        for <linux-sunxi@lists.linux.dev>; Fri, 07 Apr 2023 23:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680934293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T6rkJAJjvyybCLQc29B0AV64lXN3v1kLw0xR7ic7RBw=;
        b=iMVNWm+AKHNcCznObeAoNud819vvDMz934HNCoNNdIDEujv/96mwk2rOkv2hItfBJk
         uJzHaIpuVC9DS64O1Lb80wn8sR2O4CESahvg8qIyQ7ZYZuNWlVRbZA3Iq8KGFSncruZL
         Ku1dsFtdb0QC+NId9SefwrQzCk+ry6ofxDBSDMQ/O0wpjaS9f0rELoigDUE1OPhwIB2f
         GKXhkXQINglLGAqGjL3KxkgooVrEatQ0oJ6Q8lq3jYLZhE1o4sktEh1lu6ZW9bjjfEPI
         hQT2vmBkdg9FyAw+AaQn+RWtVc0T6uqNddsGrhVWofwA+NUbgrq9+3TnOuahKWPg85Q1
         04Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680934293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T6rkJAJjvyybCLQc29B0AV64lXN3v1kLw0xR7ic7RBw=;
        b=Q1hVWcf91xAL+qXsTDc0nEn23aH7rhTZjm10XyfUvPPsf3YiR3LZo236MCqdNIhaKf
         ahRYYc55QkdhxZ5buXA01hxWAc8Og2r75uAuMjg7qEtFkLa5lNQRI0v/aLnlvOuT7IST
         qNzqJxkEMeKBrY81YYVqB/syISEyai1nTZW+gPJUx5ZD84DF0xEeGBzJK/+ggbFjlat/
         BzhHWADrN4J9e8oxm6XEEGL4XWDQfCEiPU74Jz9QSCWcyHkXjOYwEO6o77j6ohzWmgtR
         xL5TcblbFjuRcqKpQz9wOmubfMMpAp4+F0HPnHoYPowUMWOhGaJ8pXFQmfhKySHcyuDA
         3l/A==
X-Gm-Message-State: AAQBX9dj7EkJllHfYECsr5Y5eQXkhCKagI6N06gMu1XCOaRfGfoh0fO8
	CF4Iri0EZUBxH38FKaS++tc=
X-Google-Smtp-Source: AKy350badOO3wftbdT8/kCnLHmlz1vRI1TbjytIyMTTkYX7Mg2UTqVeiSXP+0bwx7/Fq2l9VbCO2GQ==
X-Received: by 2002:a50:ed17:0:b0:504:8173:ec8c with SMTP id j23-20020a50ed17000000b005048173ec8cmr2767061eds.13.1680934293143;
        Fri, 07 Apr 2023 23:11:33 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id v6-20020a50c406000000b0050432d2b443sm2595818edf.48.2023.04.07.23.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 23:11:32 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Samuel Holland <samuel@sholland.org>, Anatolij Gustschin <agust@denx.de>,
 Andre Przywara <andre.przywara@arm.com>
Cc: Lukasz Majewski <lukma@denx.de>, Jagan Teki <jagan@amarulasolutions.com>,
 Sean Anderson <seanga2@gmail.com>, u-boot@lists.denx.de,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 2/2] video: sunxi: dw-hdmi: Use DM for HVCC regulator
Date: Sat, 08 Apr 2023 08:11:31 +0200
Message-ID: <5661411.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <20230408002639.26241-3-andre.przywara@arm.com>
References:
 <20230408002639.26241-1-andre.przywara@arm.com>
 <20230408002639.26241-3-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sobota, 08. april 2023 ob 02:26:39 CEST je Andre Przywara napisal(a):
> From: Samuel Holland <samuel@sholland.org>
> 
> The HDMI PHY depends on the HVCC supply being enabled. So far we have
> relied on it being enabled by an earlier firmware stage (SPL or TF-A).
> Attempt to enable the regulator here, so we can remove that dependency.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/video/sunxi/sunxi_dw_hdmi.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/video/sunxi/sunxi_dw_hdmi.c
> b/drivers/video/sunxi/sunxi_dw_hdmi.c index ef18d1f281f..0324a050d03 100644
> --- a/drivers/video/sunxi/sunxi_dw_hdmi.c
> +++ b/drivers/video/sunxi/sunxi_dw_hdmi.c
> @@ -19,11 +19,13 @@
>  #include <asm/arch/lcdc.h>
>  #include <linux/bitops.h>
>  #include <linux/delay.h>
> +#include <power/regulator.h>
> 
>  struct sunxi_dw_hdmi_priv {
>  	struct dw_hdmi hdmi;
>  	struct reset_ctl_bulk resets;
>  	struct clk_bulk clocks;
> +	struct udevice *hvcc;
>  };
> 
>  struct sunxi_hdmi_phy {
> @@ -333,6 +335,9 @@ static int sunxi_dw_hdmi_probe(struct udevice *dev)
>  		(struct sunxi_ccm_reg *)SUNXI_CCM_BASE;
>  	int ret;
> 
> +	if (priv->hvcc)
> +		regulator_set_enable(priv->hvcc, true);
> +
>  	/* Set pll3 to 297 MHz */
>  	clock_set_pll3(297000000);
> 
> @@ -384,6 +389,10 @@ static int sunxi_dw_hdmi_of_to_plat(struct udevice
> *dev) if (ret)
>  		return ret;
> 
> +	ret = device_get_supply_regulator(dev, "hvcc-supply", &priv->hvcc);
> +	if (ret)
> +		priv->hvcc = NULL;
> +
>  	return 0;
>  }





Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F424168
	for <linux-sunxi@lists.linux.dev>; Mon, 12 Jul 2021 16:50:25 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id b40so25262879ljf.12
        for <linux-sunxi@lists.linux.dev>; Mon, 12 Jul 2021 09:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wirenboard-com.20150623.gappssmtp.com; s=20150623;
        h=to:cc:references:subject:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=o8W1dNWyc77g/GhN9T2NWTwNOeLb+k1LmC+rbhxkZPc=;
        b=MLL2y6mGJpe2v3dc+r2DITIyOSOUsd0A923QC4WmFqRpZJDdsZKUMuo0+xRo5BQCgg
         Skpt2ZwNTKiCfEqYAFRARwHuin4Wp4kjXCUDc/UgWe90g+GnmT/+asoMQVk9Mazdi82n
         J4VnCL3umFyyDSdAs9763NTJjn0VPVU/u+vE9rhoN2DJI1Y6ty3cKHtK2TW7PeMEvqEa
         2Ooz2+tKUpQoBnoMZzOIJEzHJMZvbgQ9k5V2Yth/mmADEmOnDVQK1E2ryeasONwlZc5l
         SvT9sw5FLV7l66C82YWQKpfMKQGr02hASm4GbfRCzYyAS+CnBM/VWvlwvhl7JsF3EpuJ
         PkyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:subject:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=o8W1dNWyc77g/GhN9T2NWTwNOeLb+k1LmC+rbhxkZPc=;
        b=Kn1o0qnSJtRULzA+RVdi/Iz0D27T6VwKtE48sdeZU2uebxlKoB17gtqg1id9Dx0JTU
         sefjC9FXVsFtN4OoRTHOTH5dVjgoewyiPzB+8K9lTwkiKSLRtWy49NeOFfMo1r8QqcDn
         kGruqVJxPGCZ+qfS4rm26AD9mTRADFgaKeSdd9cyd7dKOZZmx2YsA5VIyDwnaaS3/iyr
         uZuvR0BRI/TQCQzosAjIUNjpllav7PLZKH7wtWVXIPPtEZ4FHV1zneR5YnlHaDTmHO9g
         YyvJmw5zCiukds1/nsxbzTndm23Spa4T2EkSY7vQnXEpBbZ9/awOatdsjYbrz9k8ruaK
         kvWA==
X-Gm-Message-State: AOAM530Za0BAVxSw1hnMEIIImbtDf4ET3MJ+ROGZhJ0WqRAQaELH3940
	vVToP9tI3d2m2Es8O4PLvfAiL0eZk80Xu+8W
X-Google-Smtp-Source: ABdhPJzRmjg4ige4Q76R9GfUzKH6Q22fEzHtFe8dsyFLremmfKDTEGCbOYwPjkmdRfug1Ybfd1mC+A==
X-Received: by 2002:a2e:9059:: with SMTP id n25mr130746ljg.314.1626108623325;
        Mon, 12 Jul 2021 09:50:23 -0700 (PDT)
Received: from [192.168.1.213] (81.5.110.226.dhcp.mipt-telecom.ru. [81.5.110.226])
        by smtp.googlemail.com with ESMTPSA id f14sm1627141ljk.42.2021.07.12.09.50.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jul 2021 09:50:22 -0700 (PDT)
To: andre.przywara@arm.com
Cc: icenowy@aosc.io, jernej.skrabec@gmail.com, kishon@ti.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-sunxi@googlegroups.com,
 linux-sunxi@lists.linux.dev, linux-usb@vger.kernel.org, megous@megous.com,
 mripard@kernel.org, robh@kernel.org, samuel@sholland.org, vkoul@kernel.org,
 wens@csie.org
References: <20210615110636.23403-16-andre.przywara@arm.com>
Subject: Re: [PATCH v7 15/19] phy: sun4i-usb: Add support for the H616 USB PHY
From: Evgeny Boger <boger@wirenboard.com>
Message-ID: <880c62ea-4844-04f7-7b40-a9e8a14de202@wirenboard.com>
Date: Mon, 12 Jul 2021 19:50:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210615110636.23403-16-andre.przywara@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB

Hi Andre!

> The USB PHY used in the Allwinner H616 SoC inherits some traits from its
> various predecessors: it has four full PHYs like the H3, needs some
> extra bits to be set like the H6, and puts SIDDQ on a different bit like
> the A100. Plus it needs this weird PHY2 quirk.
>
> Name all those properties in a new config struct and assign a new
> compatible name to it.
>
> Signed-off-by: Andre Przywara<andre.przywara@arm.com>
> ---
>   drivers/phy/allwinner/phy-sun4i-usb.c  <https://lore.kernel.org/linux-sunxi/20210615110636.23403-16-andre.przywara@arm.com/#Z30drivers:phy:allwinner:phy-sun4i-usb.c>  | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
>
> diff 
> <https://lore.kernel.org/linux-sunxi/20210615110636.23403-16-andre.przywara@arm.com/#iZ30drivers:phy:allwinner:phy-sun4i-usb.c> 
> --git a/drivers/phy/allwinner/phy-sun4i-usb.c 
> b/drivers/phy/allwinner/phy-sun4i-usb.c index 
> 316ef5fca831..85a9771280b7 100644 --- 
> a/drivers/phy/allwinner/phy-sun4i-usb.c +++ 
> b/drivers/phy/allwinner/phy-sun4i-usb.c @@ -1024,6 +1024,17 @@ static 
> const struct sun4i_usb_phy_cfg sun50i_h6_cfg = {   	.missing_phys = BIT(1) | BIT(2),
>   };
>   
> +static const struct sun4i_usb_phy_cfg sun50i_h616_cfg = { + .num_phys 
> = 4, + .type = sun50i_h6_phy,

Since this usb phy is considerable different from the one in H6, 
wouldn't it better to define a new phy type here? The way the driver is 
designed, I would expect the type to be shared by more or less identical 
parts.

Honestly, I think it would be better to get rid of .type in the 
sun4i_usb_phy_cfg completely replacing it by a couple more traits in 
.cfg. It's impossible to know for sure which Allwinner parts really 
share the identical revision of this hardware.

> + .disc_thresh = 3, + .phyctl_offset = REG_PHYCTL_A33, + 
> .dedicated_clocks = true, + .phy0_dual_route = true, + 
> .hci_phy_ctl_clear = PHY_CTL_SIDDQ, + .needs_phy2_siddq = true, +}; +   static const struct of_device_id sun4i_usb_phy_of_match[] = {
>   	{ .compatible = "allwinner,sun4i-a10-usb-phy", .data = &sun4i_a10_cfg },
>   	{ .compatible = "allwinner,sun5i-a13-usb-phy", .data = &sun5i_a13_cfg },
> @@ -1038,6 +1049,7 @@ static const struct of_device_id 
> sun4i_usb_phy_of_match[] = {   	{ .compatible = "allwinner,sun50i-a64-usb-phy",
>   	  .data = &sun50i_a64_cfg},
>   	{ .compatible = "allwinner,sun50i-h6-usb-phy", .data = &sun50i_h6_cfg },
> + { .compatible = "allwinner,sun50i-h616-usb-phy", .data = 
> &sun50i_h616_cfg },   	{ },
>   };
>   MODULE_DEVICE_TABLE(of, sun4i_usb_phy_of_match);
> -- 
> 2.17.5
>


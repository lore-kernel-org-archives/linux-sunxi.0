Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EBF468
	for <linux-sunxi@lists.linux.dev>; Sun, 12 Dec 2021 13:14:53 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id e24so531706lfc.0
        for <linux-sunxi@lists.linux.dev>; Sun, 12 Dec 2021 05:14:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wirenboard-com.20210112.gappssmtp.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=/PPLY5MQj0v1fN7Yk4GtGQYrLdec1WTdN/LqLpbcnKE=;
        b=Hqk/7fX/oIIQxF+xLiOX62+FbMiT+u+Pig8xpKw0IuWReLHH4FayV9z/VwdtXge/qB
         WmqferKkxT4d83BXQavZ70zFx32U41vJ7u43cREEXVy1t9LMeyX6Y9qaG7hyRCGyumqq
         qPuyxk6NoiYLP3Hs7k2uhm5HXT1GBKR7kBKHiprlrjXAKkJ3thpiiWBDT2EtI6X7rva/
         so63xnAvfK63qQMTXkf/TlZZYrEmjKnpJv2HQh78FEGB+9idw0i5yWePD9q/BIYUziPB
         Po0x6neggO2R6WOWTMt/YDQFpMOSJT6vCS8IV7QxUB2+hT+ThKkMTPMlDf1GFd6lfWW/
         glDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=/PPLY5MQj0v1fN7Yk4GtGQYrLdec1WTdN/LqLpbcnKE=;
        b=Oc6aZep9RRxkoRtEV6fq2ohr403vjrSLJEulEoB3CbSbDEClkCThQmYSnHx/ddOzc0
         mywum64JL9/Hki2O13aEy7IHjXDV9TCDxCwUll8icpDVxvKO1tF+c0BASWK3WzMEp/87
         s5cYPUdsCYeBPkslFRqKbCrcO+39f6Dy0U7vXR/nS0DEFBfNahxa4s6JXvWliztUd75S
         bHA/YU2jyw+ym5aR02CneAdS33GV7C3NywR3xbB+zIt6ZZnrQRzSxTiInA4kedaeozg7
         AMyzGAAA/cM/bF363EXGN2UC4yz5vDGqEHR2QibmT1EDTxBwxrx4VzoOysiiXhgFAryH
         Uwtg==
X-Gm-Message-State: AOAM533YRi71oxEE7mLc3f1hqB4oNrvk6XYWk16PDX/glKkYlIJ+3c7k
	8xFqnXmzeeveNWn5v5hds831e32BY54Mfg==
X-Google-Smtp-Source: ABdhPJwlkve82f/zkbf3Qf6Q8jDHu9rmxfplPdUFXykPtl7tC/yfrIKAtxOGzFLmxtari9TYF2g1Sw==
X-Received: by 2002:a05:6512:ace:: with SMTP id n14mr23385946lfu.53.1639314890745;
        Sun, 12 Dec 2021 05:14:50 -0800 (PST)
Received: from [192.168.1.213] (81.5.99.121.dhcp.mipt-telecom.ru. [81.5.99.121])
        by smtp.googlemail.com with ESMTPSA id m14sm1044010ljg.2.2021.12.12.05.14.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Dec 2021 05:14:49 -0800 (PST)
Subject: Re: [PATCH RESEND] phy: sun4i-usb: fix phy write on H3 and newer
To: Maxime Ripard <mripard@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Yangtao Li <frank@allwinnertech.com>, Icenowy Zheng <icenowy@aosc.io>,
 andre.przywara@arm.com, linux-sunxi@lists.linux.dev
References: <20211116093509.346002-1-boger@wirenboard.com>
From: Evgeny Boger <boger@wirenboard.com>
Message-ID: <a52cdfbb-c90f-5707-d00f-17e0e12daa62@wirenboard.com>
Date: Sun, 12 Dec 2021 16:14:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20211116093509.346002-1-boger@wirenboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB

Hi Maxime!

I'm sorry to bother you, but is there anything else I can do to make 
this patch merged?
It's been sitting there for 5 months already.


16.11.2021 12:35, Evgeny Boger пишет:
> On older SoCs (prior to H3) PHY register are accessed by manipulating
> the common register for all PHYs. PHY index is specified by pulsing
> usbc bit.
>
> Newer SoCs leave the access procedure mostly unchanged, the
> difference being that the latch registers are separate for each PHY.
>
> Additionally, accessing USB PHY registers is only possible if phy0 is
> routed to musb IP instead of HCI.
>
> Introduce phy_reg_access_v2 cfg flag for H3 (H2+, H5),
> R40 (V40, A40i, T3), V3s (V3, S3) and A64 SoCs.
>
> On A83t, H6, H616, T507 and probably on more recent hardware,
> these PHY registers are not used in vendor BSP.
> So don't set v2 flag for these even newer SoCs as a precaution.
>
> Signed-off-by: Evgeny Boger <boger@wirenboard.com>
> ---
>   drivers/phy/allwinner/phy-sun4i-usb.c | 44 ++++++++++++++++++++++++---
>   1 file changed, 39 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c b/drivers/phy/allwinner/phy-sun4i-usb.c
> index 788dd5cdbb7d..cf10e385f199 100644
> --- a/drivers/phy/allwinner/phy-sun4i-usb.c
> +++ b/drivers/phy/allwinner/phy-sun4i-usb.c
> @@ -119,6 +119,7 @@ struct sun4i_usb_phy_cfg {
>   	bool dedicated_clocks;
>   	bool enable_pmu_unk1;
>   	bool phy0_dual_route;
> +	bool phy_reg_access_v2;
>   	int missing_phys;
>   };
>   
> @@ -192,13 +193,38 @@ static void sun4i_usb_phy_write(struct sun4i_usb_phy *phy, u32 addr, u32 data,
>   				int len)
>   {
>   	struct sun4i_usb_phy_data *phy_data = to_sun4i_usb_phy_data(phy);
> -	u32 temp, usbc_bit = BIT(phy->index * 2);
> +	u32 otgctl_val, temp, usbc_bit;
>   	void __iomem *phyctl = phy_data->base + phy_data->cfg->phyctl_offset;
> +	void __iomem *phyctl_latch;
>   	unsigned long flags;
>   	int i;
>   
>   	spin_lock_irqsave(&phy_data->reg_lock, flags);
>   
> +	/* On older SoCs (prior to H3) PHY register are accessed by manipulating the
> +	 * common register for all PHYs. PHY index is specified by pulsing usbc bit.
> +	 * Newer SoCs leave the access procedure mostly unchanged, the difference
> +	 * being that the latch registers are separate for each PHY.
> +	 */
> +	if (phy_data->cfg->phy_reg_access_v2) {
> +		if (phy->index == 0)
> +			phyctl_latch = phy_data->base + phy_data->cfg->phyctl_offset;
> +		else
> +			phyctl_latch = phy->pmu + phy_data->cfg->phyctl_offset;
> +		usbc_bit = 1;
> +
> +		/* Accessing USB PHY registers is only possible if phy0 is routed to musb.
> +		 * As it's not clear whether is this related to actual PHY
> +		 * routing or rather the hardware is just reusing the same bit,
> +		 * don't check phy0_dual_route here.
> +		 */
> +		otgctl_val = readl(phy_data->base + REG_PHY_OTGCTL);
> +		writel(otgctl_val | OTGCTL_ROUTE_MUSB, phy_data->base + REG_PHY_OTGCTL);
> +	} else {
> +		phyctl_latch = phyctl;
> +		usbc_bit = BIT(phy->index * 2);
> +	}
> +
>   	if (phy_data->cfg->phyctl_offset == REG_PHYCTL_A33) {
>   		/* SoCs newer than A33 need us to set phyctl to 0 explicitly */
>   		writel(0, phyctl);
> @@ -224,17 +250,21 @@ static void sun4i_usb_phy_write(struct sun4i_usb_phy *phy, u32 addr, u32 data,
>   		writeb(temp, phyctl);
>   
>   		/* pulse usbc_bit */
> -		temp = readb(phyctl);
> +		temp = readb(phyctl_latch);
>   		temp |= usbc_bit;
> -		writeb(temp, phyctl);
> +		writeb(temp, phyctl_latch);
>   
> -		temp = readb(phyctl);
> +		temp = readb(phyctl_latch);
>   		temp &= ~usbc_bit;
> -		writeb(temp, phyctl);
> +		writeb(temp, phyctl_latch);
>   
>   		data >>= 1;
>   	}
>   
> +	/* Restore PHY routing and the rest of OTGCTL */
> +	if (phy_data->cfg->phy_reg_access_v2)
> +		writel(otgctl_val, phy_data->base + REG_PHY_OTGCTL);
> +
>   	spin_unlock_irqrestore(&phy_data->reg_lock, flags);
>   }
>   
> @@ -927,6 +957,7 @@ static const struct sun4i_usb_phy_cfg sun8i_h3_cfg = {
>   	.dedicated_clocks = true,
>   	.enable_pmu_unk1 = true,
>   	.phy0_dual_route = true,
> +	.phy_reg_access_v2 = true,
>   };
>   
>   static const struct sun4i_usb_phy_cfg sun8i_r40_cfg = {
> @@ -937,6 +968,7 @@ static const struct sun4i_usb_phy_cfg sun8i_r40_cfg = {
>   	.dedicated_clocks = true,
>   	.enable_pmu_unk1 = true,
>   	.phy0_dual_route = true,
> +	.phy_reg_access_v2 = true,
>   };
>   
>   static const struct sun4i_usb_phy_cfg sun8i_v3s_cfg = {
> @@ -947,6 +979,7 @@ static const struct sun4i_usb_phy_cfg sun8i_v3s_cfg = {
>   	.dedicated_clocks = true,
>   	.enable_pmu_unk1 = true,
>   	.phy0_dual_route = true,
> +	.phy_reg_access_v2 = true,
>   };
>   
>   static const struct sun4i_usb_phy_cfg sun50i_a64_cfg = {
> @@ -957,6 +990,7 @@ static const struct sun4i_usb_phy_cfg sun50i_a64_cfg = {
>   	.dedicated_clocks = true,
>   	.enable_pmu_unk1 = true,
>   	.phy0_dual_route = true,
> +	.phy_reg_access_v2 = true,
>   };
>   
>   static const struct sun4i_usb_phy_cfg sun50i_h6_cfg = {


-- 
С уважением,
     Евгений Богер / Evgeny Boger
     CTO, Wiren Board Team
     https://wirenboard.com/ru
     +7 495 150 66 19 (# 33)


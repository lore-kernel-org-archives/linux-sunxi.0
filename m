Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF623321E
	for <linux-sunxi@lists.linux.dev>; Wed, 12 Oct 2022 21:21:54 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id r14so60640edc.7
        for <linux-sunxi@lists.linux.dev>; Wed, 12 Oct 2022 14:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QQfpRIt3DFuqO+zX1CeFTtSVeijb+PJxpHgqxCSADR0=;
        b=al3lXHrUDVuQJuNML3yc9OTVp8mBm1fceF0wyeRVT7rVZewHTS45N+wEDJE03RPt86
         whlP9ZfSGJADr+jLrP9hcsriMOhuem5pNu2pOAlJGKbIkvgU4vsvgsKImKxmYnPqvZ04
         Gy0dYOkAtFViIUJWCib2vOru/oXpiU2R5sCA5tIc9DrsT7nZUBEfhbCav1Ts2VeHxZg1
         3UPQI7BMu+saxhG/f9BQK7IpFypRaaRBR+D1hcpKxTgFSXFoUMQDXQQyxHYxn8zeyDbc
         JihcfTeXH5CI+eDdEWIsUu1fJgdoFDJYMUGCYlO33DjjtXQR6WbTQO4WMHCbg/3j38Sx
         57KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QQfpRIt3DFuqO+zX1CeFTtSVeijb+PJxpHgqxCSADR0=;
        b=Br+pkX0ymJuWOzase6ADkRopjgmsmbW9dVF2eQvOOpGhvuw1hlNXM6uYHseVxa4G+X
         83N4M56OfmoPYARtP8n+zFFyRlLBW6/XOimc0cwHLATdNolzkLNsFFGu3PWAzIj00How
         ftdjO6+VoITc0SDf/4afBSKd4Frba5k4z8+zHHRPCFvSbO7Wd4R9r9KXbCdxFxlsGS0x
         hLSaVHCv8m+NKDIWRKXhbVlGF74dIcCfa1f4T4id1kxypD6WWqWhQXR2TUKj8w/WBLWl
         /7a+KK+5IqbKQtUfD1cJeBfdONyzDuoF/dqunh2Ejqc0yGlqMP4raCmWLoCAOpLh5wKO
         i5ag==
X-Gm-Message-State: ACrzQf1LOuFqxMLRuMZ0zlUpZCQndDMT2rdVoQ0Ymzg+Xsl6Or+7/AxF
	hztVP7Y6btPjmgy9nUClesQ=
X-Google-Smtp-Source: AMsMyM7ztgB9rREL8AMYuGYCWQ376iRMzD7aUi2+lPvEwK2yjjBdeM84G3oYxHblooq1M66KBII06A==
X-Received: by 2002:a50:fd16:0:b0:458:bf43:8dc7 with SMTP id i22-20020a50fd16000000b00458bf438dc7mr28513321eds.400.1665609712898;
        Wed, 12 Oct 2022 14:21:52 -0700 (PDT)
Received: from kista.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id a20-20020aa7cf14000000b00458dc7e8ecasm12009298edy.72.2022.10.12.14.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 14:21:52 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andre Przywara <andre.przywara@arm.com>, Icenowy Zheng <uwu@icenowy.me>
Cc: soc@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-phy@lists.infradead.org, linux-usb@vger.kernel.org, Icenowy Zheng <uwu@icenowy.me>
Subject: Re: [PATCH v2 04/10] phy: sun4i-usb: add support for the USB PHY on F1C100s SoC
Date: Wed, 12 Oct 2022 23:21:50 +0200
Message-ID: <4218006.ejJDZkT8p0@kista>
In-Reply-To: <20221012055602.1544944-5-uwu@icenowy.me>
References: <20221012055602.1544944-1-uwu@icenowy.me> <20221012055602.1544944-5-uwu@icenowy.me>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Icenowy,

Dne sreda, 12. oktober 2022 ob 07:55:56 CEST je Icenowy Zheng napisal(a):
> The F1C100s SoC has one USB OTG port connected to a MUSB controller.
> 
> Add support for its USB PHY.
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> ---
> No changes since v1.
> 
>  drivers/phy/allwinner/phy-sun4i-usb.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c
> b/drivers/phy/allwinner/phy-sun4i-usb.c index 3a3831f6059a..2f94cb77637b
> 100644
> --- a/drivers/phy/allwinner/phy-sun4i-usb.c
> +++ b/drivers/phy/allwinner/phy-sun4i-usb.c
> @@ -109,6 +109,7 @@ enum sun4i_usb_phy_type {
>  	sun8i_v3s_phy,
>  	sun50i_a64_phy,
>  	sun50i_h6_phy,
> +	suniv_f1c100s_phy,
>  };
> 
>  struct sun4i_usb_phy_cfg {
> @@ -859,6 +860,14 @@ static int sun4i_usb_phy_probe(struct platform_device
> *pdev) return 0;
>  }
> 
> +static const struct sun4i_usb_phy_cfg suniv_f1c100s_cfg = {
> +	.num_phys = 1,
> +	.type = suniv_f1c100s_phy,

I think you should just use sun4i_a10_phy. It has no special handling. I don't 
see a point adding new phy types if there is no special cases for it.

Best regards,
Jernej

> +	.disc_thresh = 3,
> +	.phyctl_offset = REG_PHYCTL_A10,
> +	.dedicated_clocks = true,
> +};
> +
>  static const struct sun4i_usb_phy_cfg sun4i_a10_cfg = {
>  	.num_phys = 3,
>  	.type = sun4i_a10_phy,
> @@ -988,6 +997,8 @@ static const struct of_device_id
> sun4i_usb_phy_of_match[] = { { .compatible =
> "allwinner,sun50i-a64-usb-phy",
>  	  .data = &sun50i_a64_cfg},
>  	{ .compatible = "allwinner,sun50i-h6-usb-phy", .data = 
&sun50i_h6_cfg },
> +	{ .compatible = "allwinner,suniv-f1c100s-usb-phy",
> +	  .data = &suniv_f1c100s_cfg },
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(of, sun4i_usb_phy_of_match);
> --
> 2.37.1



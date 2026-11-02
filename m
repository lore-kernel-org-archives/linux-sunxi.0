Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793662116;
	b=rC5XgHsKTlM1ow8ixXetHvkbKJfoV3YvCueUaDbIKvhPMhJ/AXQH7c6jznt2YuffJ4JI
	 9Ng59yQKUEH+Sg5FLPvKUWPoNyr0BeG5SsvAlmymUnwh6LhQqcfyWhJdMbrhYwXlJqrLp
	 Q1dpHCRaGFB4oTddGswPKbuXo9wAUh1xoWLFaqYytCXi0rO2TJdQRoztW3GIO0/l36kkC
	 kStK459Mv3GGPa0pMMpp5dtvKxMRbsGWuy6K5vbveTYXRyim0j33RV9yYCNoXiiIXEVjf
	 4uVC6pf5wG6v5cjv0kSBFvVWrzS/B/LXfbSCe7tUi8/83CUYqUgZvjth2kn/nRM85mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793662116;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ZMaDJSQbb9QLkhHVRE64prZxAiTnxlvuwEcwQapvub8=;
	b=GK1tF5imx3dV3e9hdT1FY2A0i0Fm9S5fNXvYMU58I17Ha+kSu9IpsYGi+sls6lZQCnpT
	 fxgiDrYAWy+/rFhrZMAQApAu0LjI3euT4n2vv1Url0ejPUGHU7yW0bQiH/xDyKkUSxHw1
	 yb+KEoBhHVKGj/3CyRFMVRvxzZvGefhbAj7k43veQaf4juzOXwRLqKWzR7M8NsKyLmyVT
	 t/WcyBQ7TaUcgAf3iTWNUoYdsB9vn+OO0pGG1MXEa4MKH+rqP+zYTrj5h4+s/FoiJOEO4
	 Cit+ka/FdcDkdd2CG9sWH2CXXq2KNGeacbZPRAvD9SoMUfP9lkHzeeWRB+Go0Kzv1yQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=HorEtG0y;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45210606A335
	for <linux-sunxi@lists.linux.dev>; Mon,  2 Nov 2026 23:28:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45210606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=HorEtG0y
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e98798cbddso17201635ad.0
        for <linux-sunxi@lists.linux.dev>; Mon, 02 Nov 2026 15:28:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1793662114; x=1794266914; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZMaDJSQbb9QLkhHVRE64prZxAiTnxlvuwEcwQapvub8=;
        b=HorEtG0y8EdbAl97e9ZfENLBdAw2s0H+ippC/hCv5Usf0teegHMrdbF7QtGJmUcove
         7z+nqktL6P6bSxAMeEth4dzoJGX7SaZ0mlelCUecn8r03EpjWRfSo92HZ5PKJE8xeWQ5
         ZBGm/MpTBgUNF0h4O8V5tjehtiFHwCtPPJxK12VTqkdeuCF3k4920Rp5lopfw/UBh7g5
         2+rV5cuN+fVgZcRA3rhLUAkaRhVKLtO5debk4C4pLxZCf/+mCtDHujUTPZNZhjMO8tzR
         Wlwf7xO5ALXhI1YD9eZRXHV/HS1q9U/lqoCanj76NPVazHzhUopDYAO226NOjUTISQds
         Vhfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793662114; x=1794266914;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZMaDJSQbb9QLkhHVRE64prZxAiTnxlvuwEcwQapvub8=;
        b=BJeme3slPl25gs3My/t39Vyyo1pPgPK8ksiKH+P9xE9gS134Gto1PqV/6gX7sjgPsg
         lB1EoIaJNv+GtukwImBKIUD7vy0Uu1cT2vEp6e3yNehzWZXebr+QBsvnAtiCWnF1r/9s
         h2/XNsv1bAt3dp1xBqMaIPT2PH7eB4sUPJqZnz3Z90de2WMoHynG3jmU1Q2uCCcP+nhK
         EWJsbWkYd44qXYFhBpBS5bOM4VwC5aGOK3sWddVwJtvCqUxQMmQSFhTmJLzKKC90vxqQ
         G5FVAIozOWWAAmXRIJEQomBL8RT2MhGBnZQ/ul/SaAMu7ktIzIzm7ppYd1GoppKO6Xx+
         WbBg==
X-Forwarded-Encrypted: i=1; AKwUvBw4/cSAPBXETSPSutqN9eNg+BzlPXaHpGRW6SC4TjZHcw+T79RrY9JthIiFMc0c0sr7zfItknWwIFGg8w==@lists.linux.dev
X-Gm-Message-State: APuU4Z+VWb3x8HwWwweSpAs0p2aajsxEGrw2cBSskw6Coge9dXugnA7h
	bbhJJxMCuq9nOmvlgizyXKQj1ry/tBx+JG+vCLolijKvJyuHVCswoyNGyjHuBnwLf+s=
X-Gm-Gg: AYBFou1OzrKfXAubQSRlkHTs/q5fc7uFG38TWOtIKkG2Imf4rQQkmEf/CY5PvRKROOS
	96bZUzYdeOZHiizYaxj2Xvoag3f4kdA1pv3zPeFoeNZR+YGQCRNLglC+Zo751HQVnJg3Vm3AN4O
	D0/Dxkyt71pDQCz6tdKlqZl1pXLBTj3y1mjGboaycyM3iziDwcvo2mr0tAUI9OFfx5EsFsa6Wki
	oBKxgZAAY1Jf3sp8Dk5iTQStoSWITw5MIkILSLFNPH31BzB2rQlbEGYpqqlAxDQTl0dgxqCKmZp
	zjtE4w24egG8b8U1Jrs24KtVZP7gsZc2s8fjVAO6mz+LSY2clqk6Y1qmMFnYdTeuX4SD88kXHch
	WZ1zDf+AO2rudqO9asnzZ/mehC06ylhIEP0HJHj57DZ0uMDi2TCqxVKhst6VvQQnRz3Vhgg+wDD
	UhR3be+4+hXQboM+xTevwSSJ7rcCNOctssY4SC4nyy2bU1zyNcJyJInCqoebAOsUS17RoviSQ85
	u29TNRNvygduj33yM077QmmjB48PRrsNyBVtWwAqGefDyyiNaYrjqVkzd1maC1qhG+3ii1hmUHl
	yC5/+UV0b63mEfJhcfDzt2b3SaXh7NpLU+hCtL//hgRqdWmwleXq1iJUJDpERW4=
X-Received: by 2002:a17:90b:580d:b0:3ad:25f6:1dd0 with SMTP id 98e67ed59e1d1-3ae8970e5e9mr8946634a91.11.1793662114604;
        Mon, 02 Nov 2026 15:28:34 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:8::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c6271ccsm1233086a91.7.2026.11.02.15.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 15:28:34 -0800 (PST)
Date: Mon, 2 Nov 2026 15:28:33 -0800
From: Joe Damato <joe@dama.to>
To: Frank.Li@oss.nxp.com
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Stephan Gerhold <stephan@gerhold.net>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Sergey Ryazanov <ryazanov.s.a@gmail.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Frank Li <Frank.Li@nxp.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Li Youhong <liyouhong@kylinos.cn>, Arnd Bergmann <arnd@arndb.de>,
	bui duc phuc <phucduc.bui@gmail.com>,
	Yicong Hui <yiconghui@gmail.com>, Simon Horman <horms@kernel.org>,
	"open list:NETWORKING DRIVERS" <netdev@vger.kernel.org>,
	"moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>,
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>,
	imx@lists.linux.dev, vkoul@kernel.org
Subject: Re: [PATCH] net: dma: use dmaengine_desc_set_callback()
Message-ID: <aukcoWLVvSorX5a9@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>, Frank.Li@oss.nxp.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Stephan Gerhold <stephan@gerhold.net>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Sergey Ryazanov <ryazanov.s.a@gmail.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Frank Li <Frank.Li@nxp.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Li Youhong <liyouhong@kylinos.cn>, Arnd Bergmann <arnd@arndb.de>,
	bui duc phuc <phucduc.bui@gmail.com>,
	Yicong Hui <yiconghui@gmail.com>, Simon Horman <horms@kernel.org>,
	"open list:NETWORKING DRIVERS" <netdev@vger.kernel.org>,
	"moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>,
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>,
	imx@lists.linux.dev, vkoul@kernel.org
References: <20261102191922.4044912-1-Frank.Li@oss.nxp.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102191922.4044912-1-Frank.Li@oss.nxp.com>

On Mon, Nov 02, 2026 at 02:19:16PM -0500, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Replace open-coded assignments to callback and callback_param fields
> of struct dma_async_tx_descriptor with calls to the
> dmaengine_desc_set_callback() helper across net drivers.
> 
> No functional change intended. Prepare to make struct
> dma_async_tx_descriptor private to the DMA engine.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/net/ethernet/allwinner/sun4i-emac.c       |  3 +--
>  drivers/net/ethernet/micrel/ks8842.c              |  6 ++----
>  drivers/net/ethernet/xilinx/xilinx_axienet_main.c |  6 ++----
>  drivers/net/wwan/qcom_bam_dmux.c                  | 10 ++++------
>  4 files changed, 9 insertions(+), 16 deletions(-)

[...]

> diff --git a/drivers/net/wwan/qcom_bam_dmux.c b/drivers/net/wwan/qcom_bam_dmux.c
> index cc6ace8d64371..1479f8362e04e 100644
> --- a/drivers/net/wwan/qcom_bam_dmux.c
> +++ b/drivers/net/wwan/qcom_bam_dmux.c
> @@ -195,9 +195,8 @@ static bool bam_dmux_skb_dma_submit_tx(struct bam_dmux_skb_dma *skb_dma)
>  		return false;
>  	}
>  
> -	desc->callback = bam_dmux_tx_callback;
> -	desc->callback_param = skb_dma;
> -	desc->cookie = dmaengine_submit(desc);
> +	dmaengine_desc_set_callback(desc, bam_dmux_tx_callback, NULL, skb_dma);
> +	dmaengine_submit(desc);
>  	return true;
>  }
>  
> @@ -477,9 +476,8 @@ static bool bam_dmux_skb_dma_submit_rx(struct bam_dmux_skb_dma *skb_dma)
>  		return false;
>  	}
>  
> -	desc->callback = bam_dmux_rx_callback;
> -	desc->callback_param = skb_dma;
> -	desc->cookie = dmaengine_submit(desc);
> +	dmaengine_desc_set_callback(desc, bam_dmux_rx_callback, NULL, skb_dma);
> +	dmaengine_submit(desc);

I noticed in the above that the return value of dmaengine_submit is discarded
instead of stored.

Is that intentional? I suppose it might be because AFAICT cookie is never
used and the commit message says "no functional change intended".

Reviewed-by: Joe Damato <joe@dama.to>

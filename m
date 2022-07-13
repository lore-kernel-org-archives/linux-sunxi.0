Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8872C7A
	for <linux-sunxi@lists.linux.dev>; Wed, 13 Jul 2022 08:06:19 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id r10so8188407wrv.4
        for <linux-sunxi@lists.linux.dev>; Wed, 13 Jul 2022 01:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=TIuaU3v50n7bUWKXly5YPZTHcqli65zdWTasiUb17Ro=;
        b=hNrPkbBaIwtvTfB5o8iVawtfDe4PZtFl8q4aucxnFP2YA/d4Jhlz2kWeEehvpOJA8U
         gtRpOVmxBMZ69rhnKcO8qJdSOi5QIA6NdwhBhFuzYDgBMtV6KlB0Iwj990wb4I0hStE/
         AYiPL8Nyew16SEze9sHV34IsbSpvuw/G3DpfMUA+tawm4lgNIWWFA0WAPcTkRoJuWLZO
         9qYcrZwgzQBtydkW5mWwpzDfrUkdyenNF5tSIAhS/Ko7G6Vz4uujQvQK6FblzG8AlzlI
         umJCV/WtRmJEHWxFKY8kbHEPRgYOa5htHqJIpPtI6TdwpOpVbKMkS10I2++64YDjPgh8
         KuAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=TIuaU3v50n7bUWKXly5YPZTHcqli65zdWTasiUb17Ro=;
        b=TIkV150DGp6rok+/t0vMHabjp11RGu62KjUnn5PVPeQKFMONZigqaXJIQqnx/nvB8v
         ALjjtBZB/4PvE1x2mnqv4KYXquPXFxK+um1JpJ6nymCgLXuxxFAH0t5idd+jOhKMArAj
         0ecHIc7fy9CC5kkm27SODASA7P825buSHu/lx5pyf3dej29ElgPdqIv9kA4I8ZORvSjQ
         w2R/7JbuUtHEosLVLysDNNRLUYZwXRE9KYUD/JVUIh3yNQdoRi9isg4lyjxmMhyxcVLV
         xGg/kWpxgOOY58w8wl61+/xPnRHmsErd4Q/xn9GFtyyC1QfYRLRxcDIj3LEjHBzqS0hA
         Zdvw==
X-Gm-Message-State: AJIora9eRtYEswYM9rnzHVl06pdgYyBesdEH4nFIYtIUGSYHyfMq8gN+
	wLQeSVezY2Hb4SxOodLp2XJ2sA==
X-Google-Smtp-Source: AGRyM1uYd8s8Q17nqho/hNGXHSmtG7AshwsRk3tvmpwY/HVGw9Tpxj5Qk00Si2JmE0HOAt5dAYpZ8Q==
X-Received: by 2002:a5d:6e8d:0:b0:21d:7adc:7102 with SMTP id k13-20020a5d6e8d000000b0021d7adc7102mr1859002wrz.9.1657699577792;
        Wed, 13 Jul 2022 01:06:17 -0700 (PDT)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id c15-20020a05600c0a4f00b003a02cbf862esm1376496wmq.13.2022.07.13.01.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 01:06:17 -0700 (PDT)
Date: Wed, 13 Jul 2022 09:06:15 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Samuel Holland <samuel@sholland.org>
Cc: Chen-Yu Tsai <wens@csie.org>, linux-sunxi@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mfd: sun6i-prcm: Update Kconfig description
Message-ID: <Ys589/sLwmKYiKkV@google.com>
References: <20220702184044.51144-1-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220702184044.51144-1-samuel@sholland.org>

On Sat, 02 Jul 2022, Samuel Holland wrote:

> This driver is used by a specific range of SoCs between when the PRCM
> hardware was introduced (A31) and when the PRCM CCU driver was added
> (A83T). It is unlikely to be extended to additional hardware. Update
> the description to include the full list of applicable SoCs.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> 
>  drivers/mfd/Kconfig | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog

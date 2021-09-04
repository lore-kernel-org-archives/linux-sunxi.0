Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 069A83FC9
	for <linux-sunxi@lists.linux.dev>; Sat,  4 Sep 2021 10:38:22 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id v123so1524101pfb.11
        for <linux-sunxi@lists.linux.dev>; Sat, 04 Sep 2021 03:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=R1xW5dhI5MdMWEzd4wBz2g9T6oS/nscW3i7iz8B4JF4=;
        b=HpqLoJEgYUbhqc2bFgHHAv1ULMAbKdNHpo6SpdPmUUBATbKEnlMs+yaSVQLt5DT2/5
         EKu12Uyy3/y0qrd0KJQe5fC/7LKo8J53JUWXbas8GyI0Gq0vD71CkG8yeXd3r/3GJg9G
         OLzVdSZpzBi0AmeDbvyGaYQzza5Xu+2Sh49Kal9UsyC2hPl/nkIY+lufeNkijKROKe6k
         1Hv2HjfkVX3Iu5uk9cglsBlUNfcjsMtBHvvByrF0+uW3jylO7g9taH/CTug9d+uViNqh
         k7DfAbNYwH6IVH0Z3TcFhWreAhcNYHeJB8XOoc+jxDy48rHI3l90aoYGdffDWVEeYXRJ
         ez/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=R1xW5dhI5MdMWEzd4wBz2g9T6oS/nscW3i7iz8B4JF4=;
        b=A6EJlXTpzJuxmaWCGXByD5nXVcuXzlzLVI4THXv2aBbUJjQQzMgFca2MgaCDGry+tk
         IEGQIwC5cS5D4AhRzL4t90quYF/qBsLOOUJzg4m41Ej134tj3y5titstZ8P/0+liM5DZ
         PBkBA2Rj7b4jR12YHbKd6wKoXsySprMLlQYXoyEaer0EEBOW37Yso+Gba+0+UuyAqX6o
         Quo2e8aR7wSk37QNN0laDEpfn6nZJ+AFkfcRx4OCJ2+210tYXmNXYaC5P3z+eAPygfy/
         oCXMBVvPXwxDYdkOFKIsclHCIj0FOt5kYQ1UiihCw077qCQQR+t80dPk7yeb1Fj8pBKS
         Rp/w==
X-Gm-Message-State: AOAM5331jvvONojRCCXHq8TfFlPwVTF767nbMAX0YTBaUFzVk0jA3mqj
	EpURZz5CjpZmmqjS7PII5ojU24Zm0al3Zw==
X-Google-Smtp-Source: ABdhPJw4py10hDMDA93ust0NUPG+eBLUsaxvPqJbHkdz6EfAp7jHVCWxkNnhkfvO5kQK5Yd60zVsjA==
X-Received: by 2002:a63:111f:: with SMTP id g31mr3147053pgl.80.1630751901812;
        Sat, 04 Sep 2021 03:38:21 -0700 (PDT)
Received: from [172.16.100.12] ([1.235.44.150])
        by smtp.gmail.com with ESMTPSA id 66sm2027792pfx.29.2021.09.04.03.38.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Sep 2021 03:38:20 -0700 (PDT)
Subject: Re: [PATCH] sunxi: mmc: A20: Fix MMC optimisation
To: Andre Przywara <andre.przywara@arm.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Tom Rini <trini@konsulko.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, u-boot@lists.denx.de,
 linux-sunxi@lists.linux.dev
References: <20210903154916.5264-1-andre.przywara@arm.com>
From: Jaehoon Chung <jh80.chung@gmail.com>
Message-ID: <9459f678-17ca-19dc-e5e5-b1e2e1b61a31@gmail.com>
Date: Sat, 4 Sep 2021 19:38:17 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210903154916.5264-1-andre.przywara@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



Andre Przywara wrote on 9/4/21 12:49 AM:
> Some SoCs (as seen on A20) seem to misreport the MMC FIFO level if the
> FIFO is completely full: the level size reads as zero, but the FIFO_FULL
> bit is set. We won't do a single iteration of the read loop in this
> case, so will be stuck forever.
>
> Check for this situation and use a safe minimal FIFO size instead when
> we hit this case.
>
> This fixes MMC boot on A20 devices after the MMC FIFO optimisation
> (9faae5457f52).
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jaehoon Chung <jh80.chung@samsung.com>

Best Regards,
Jaehoon Chung

> ---
>  drivers/mmc/sunxi_mmc.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/mmc/sunxi_mmc.c b/drivers/mmc/sunxi_mmc.c
> index 178b8cf106..aaab0cf866 100644
> --- a/drivers/mmc/sunxi_mmc.c
> +++ b/drivers/mmc/sunxi_mmc.c
> @@ -349,10 +349,14 @@ static int mmc_trans_data_by_cpu(struct sunxi_mmc_priv *priv, struct mmc *mmc,
>  		 * register without checking the status register after every
>  		 * read. That saves half of the costly MMIO reads, effectively
>  		 * doubling the read performance.
> +		 * Some SoCs (A20) report a level of 0 if the FIFO is
> +		 * completely full (value masked out?). Use a safe minimal
> +		 * FIFO size in this case.
>  		 */
> -		for (in_fifo = SUNXI_MMC_STATUS_FIFO_LEVEL(status);
> -		     in_fifo > 0;
> -		     in_fifo--)
> +		in_fifo = SUNXI_MMC_STATUS_FIFO_LEVEL(status);
> +		if (in_fifo == 0 && (status & SUNXI_MMC_STATUS_FIFO_FULL))
> +			in_fifo = 32;
> +		for (; in_fifo > 0; in_fifo--)
>  			buff[i++] = readl_relaxed(&priv->reg->fifo);
>  		dmb();
>  	}


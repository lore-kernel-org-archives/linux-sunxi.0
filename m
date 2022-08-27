Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81CE915A3
	for <linux-sunxi@lists.linux.dev>; Sat, 27 Aug 2022 11:07:29 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id fy31so6907406ejc.6
        for <linux-sunxi@lists.linux.dev>; Sat, 27 Aug 2022 04:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=YTgnpIcAQhmjoJuO42KDhHQ8kYtmp+eevQhLrui+w8Q=;
        b=kt3XpQBdk1XAcVUk34LwN7ngG9w4tNv1eBUgC+CnrocH+fLz8rubN2MZQjE5+VRDba
         SbZ+LzycyTE4GfUmo8xgLRKZ1NhxIPC3+AASH1znADe2cM4iUp1CP/9+o2/TD/RV+hBU
         XwpyS3sf7w0qUOo7VbMkiUlLUKkPTN/KGdRWfFJbRMNMkCJTCti4BOV9JsdychxKI6XQ
         T/DHFUW+LzjJr4fI+jy3JZ22nnRu45BWtco54nUL1Zk9aNlv0p5daSz7MRBMT6IaLdlK
         /tCjJTEAm916Dhqvwh9i4/cjJUtCax9UEb7Teoyd9nQ/C3tPRq1VAtsWouPpeACCBt2P
         K16A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=YTgnpIcAQhmjoJuO42KDhHQ8kYtmp+eevQhLrui+w8Q=;
        b=KIoqJYSawvIUU7mMRu9mAL1ZoFtCKou/5/sGvULBRDRV1zmEZkCklR21a3qzg9F4w+
         FX51lpfe3Vuem9VntxjrFOtHmf3ONb6YBF7WmPq97YHt7vr8xhmBzlhpNJBHKBiqoNF1
         IZyAxdVs8JZxWVUcXw8le+Y+AKAM7xwkpEib5Vkftle6zGX255Exm2k72fD/oKaLRpcH
         7Wk8DhOhc6xPtli+7qC8u1ErjvmXKO+YlS1tOSXtZxFbO5N8oZtkYJmDDeWtX1q/YD9l
         6TU88Rf6/kS+c3cirNIv2rK4FW/kmBHo3rV57J6er4M+gpcR9Pa1d6jqsWJAbiAB2wXg
         4Ytw==
X-Gm-Message-State: ACgBeo0h5MtiFxqBIBULTr+yB/pUEu+plcSHt7LeOH9LwQJ0z7PKalFO
	SQ6bNkf80CRPdb2Lu3m7yug=
X-Google-Smtp-Source: AA6agR5P8TV0zWZJbZcKt9Vo9CX2rY644iX6DJK+nF8WzC0wK6vMjLAy6F3i8u48GlLurFO/vD8k9g==
X-Received: by 2002:a17:907:7625:b0:73d:6593:6562 with SMTP id jy5-20020a170907762500b0073d65936562mr7835903ejc.505.1661598449106;
        Sat, 27 Aug 2022 04:07:29 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id es5-20020a056402380500b0043bc4b28464sm2521426edb.34.2022.08.27.04.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Aug 2022 04:07:28 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, wens@csie.org
Subject: Re: [PATCH -next 2/3] clk: sunxi-ng: ccu-sun9i-a80-de: Use dev_err_probe() helper
Date: Sat, 27 Aug 2022 13:07:27 +0200
Message-ID: <4427774.LvFx2qVVIh@jernej-laptop>
In-Reply-To: <20220827094151.3323450-2-yangyingliang@huawei.com>
References: <20220827094151.3323450-1-yangyingliang@huawei.com> <20220827094151.3323450-2-yangyingliang@huawei.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sobota, 27. avgust 2022 ob 11:41:50 CEST je Yang Yingliang napisal(a):
> dev_err() can be replace with dev_err_probe() which will check if error
> code is -EPROBE_DEFER.
> 
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/clk/sunxi-ng/ccu-sun9i-a80-de.c | 19 ++++++-------------
>  1 file changed, 6 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/clk/sunxi-ng/ccu-sun9i-a80-de.c
> b/drivers/clk/sunxi-ng/ccu-sun9i-a80-de.c index f2fe0e1cc3c0..1d8b1ae1619d
> 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun9i-a80-de.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun9i-a80-de.c
> @@ -213,21 +213,14 @@ static int sun9i_a80_de_clk_probe(struct
> platform_device *pdev) return PTR_ERR(reg);
> 
>  	bus_clk = devm_clk_get(&pdev->dev, "bus");
> -	if (IS_ERR(bus_clk)) {
> -		ret = PTR_ERR(bus_clk);
> -		if (ret != -EPROBE_DEFER)
> -			dev_err(&pdev->dev, "Couldn't get bus clk: 
%d\n", ret);
> -		return ret;
> -	}
> +	if (IS_ERR(bus_clk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(bus_clk),
> +				     "Couldn't get bus clk\n");
> 
>  	rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
> -	if (IS_ERR(rstc)) {
> -		ret = PTR_ERR(rstc);
> -		if (ret != -EPROBE_DEFER)
> -			dev_err(&pdev->dev,
> -				"Couldn't get reset control: 
%d\n", ret);
> -		return ret;
> -	}
> +	if (IS_ERR(rstc))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(rstc),
> +				     "Couldn't get reset 
control\n");
> 
>  	/* The bus clock needs to be enabled for us to access the 
registers */
>  	ret = clk_prepare_enable(bus_clk);





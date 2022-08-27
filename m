Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108AC15A3
	for <linux-sunxi@lists.linux.dev>; Sat, 27 Aug 2022 11:07:40 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id b44so4842607edf.9
        for <linux-sunxi@lists.linux.dev>; Sat, 27 Aug 2022 04:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=KkLBgHjqLVMK1fwCBUUK4kuHMU4tLcffN+IAMJpgXe8=;
        b=iZpl5NHEwzGcgFJBKmhpTHZLBNZEpO8w0BHof64cEERIZrF6+Bd+Vxx8nYg++2wVaV
         j8IoizILxnTbZt1KfTHo3mX2j42E70ofeASh58y3f16tcyPprgEI6gtRtqkRF4rq3Woj
         lJks/rDU+GKqtjkdhZ6favIWbiBado7MbQyunsRHc6vvnIAbk123KY9MxiDkS2OoaTnQ
         5yewCscX4Bhy1hXUkWmd335icJFNuX4pJ5aBqFrfaCdgKGRq2gd+hO/BX2qY2byewzu0
         qiRSDPIfzv5b2lM4bxd9NTpwBV866P8HQqprxDsrYNp2WNxg7JZ3rlj1ppoAvcE530yW
         hp+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=KkLBgHjqLVMK1fwCBUUK4kuHMU4tLcffN+IAMJpgXe8=;
        b=HKBga3q6/PMs/4SOme+2MPvRWBF7pQtIRM6RCMZxzRkMcu40g2lDIn8GV5c0DMRg2k
         yDUYVxzTW9eCAAvMbZrrT/PCp7kstm+7G4J9kLIgq+stfB7giJhfXoE3WF/4DStQZyWl
         0LlOWb29HH6byCBO+Q37Q/46P5BIV+HAreqIoz3djKVbXXW+EsB4ThulI/iK3SN06OO9
         NZjkZbdHQAt8zmxHmFoAHZ90j8fEPLcw9G2oGJx4Ca9ASNob8D6WCliPKMOvB/wTl9kw
         S405C/pe7594sV88Q9IcqNvDriJrJnOxSlknSkusmSSOmcNIW6t8+SECkyRtBqrY1ksS
         TCQQ==
X-Gm-Message-State: ACgBeo2xMBrGZDHd0zYYT98ijdJGcUv9NSYyTnPZBUcQVpj9DQA0l17/
	k+HFRICGdLnLn8teq2XVUkA=
X-Google-Smtp-Source: AA6agR79JkqEXhoYIuRUBbhwrFqT1EXnC+yp4Avh6kLZcgbJbvYbPwfxQgOUH7aOk4HPN/63R0no5w==
X-Received: by 2002:aa7:d5da:0:b0:448:ec:7b31 with SMTP id d26-20020aa7d5da000000b0044800ec7b31mr4228814eds.193.1661598459413;
        Sat, 27 Aug 2022 04:07:39 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id uo39-20020a170907cc2700b0073da32b7db0sm1918147ejc.199.2022.08.27.04.07.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Aug 2022 04:07:39 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, wens@csie.org
Subject: Re: [PATCH -next 3/3] clk: sunxi-ng: ccu-sun9i-a80-usb: Use dev_err_probe() helper
Date: Sat, 27 Aug 2022 13:07:38 +0200
Message-ID: <4742528.GXAFRqVoOG@jernej-laptop>
In-Reply-To: <20220827094151.3323450-3-yangyingliang@huawei.com>
References: <20220827094151.3323450-1-yangyingliang@huawei.com> <20220827094151.3323450-3-yangyingliang@huawei.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sobota, 27. avgust 2022 ob 11:41:51 CEST je Yang Yingliang napisal(a):
> dev_err() can be replace with dev_err_probe() which will check if error
> code is -EPROBE_DEFER.
> 
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/clk/sunxi-ng/ccu-sun9i-a80-usb.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/clk/sunxi-ng/ccu-sun9i-a80-usb.c
> b/drivers/clk/sunxi-ng/ccu-sun9i-a80-usb.c index 575ae4ccc65f..a0fb0da8f356
> 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun9i-a80-usb.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun9i-a80-usb.c
> @@ -101,12 +101,9 @@ static int sun9i_a80_usb_clk_probe(struct
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
>  	/* The bus clock needs to be enabled for us to access the 
registers */
>  	ret = clk_prepare_enable(bus_clk);





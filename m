Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354E07F
	for <linux-sunxi@lists.linux.dev>; Sun,  6 Nov 2022 07:59:44 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id n12so22869730eja.11
        for <linux-sunxi@lists.linux.dev>; Sun, 06 Nov 2022 00:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vEl0YoVvN1GJsGvoYdE/zZMGJkQaLgmsjIXP9qXuCAI=;
        b=LJzK8R9MUBPh/lnWgwkcDa8XwTsRsmarGIFD4QbFRjb7bL6Oec4dgApvBOiv9zBe8K
         xt6NRbv0M48x0P5ckgtoYUPuQFfO7/k9Aa9IVjoy8aZMudQuCrzW3Erz/cLbqjrBlS4p
         7tumT/IdYLBktwlzgbfk2O9mq6zsEfjeBt8VNRnqtqhJXdzCd3nmh05n1/3YZNLEAJGe
         TjNSfEU8qpuWEKtEL3838hnhxYIYQ8i7mPSNEpow+E5jVLLGp8Kc+9WZsJR8HOY/3iB6
         cSIaGGTgESMdLUga3mQZ+FNBvEzX2UQr2banbAi1poNGRDyTrlLwGNl0yS3uPC9MK4N/
         FhbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vEl0YoVvN1GJsGvoYdE/zZMGJkQaLgmsjIXP9qXuCAI=;
        b=vEvscY1ACSr2mLUhwkFzbTYw2Ns1bd70M+8EBYOMjPzFDgds0igb3CxNwk2til2ksj
         NmaLy17RaAhwHpd+HlX2MeMtQQb4D5IhMNFbzg9Errfg4nSzf1W0SA8sQ9lXNU/R0ZMQ
         zlrQ5iGY1zOWOewk018cOE8ja8estuObj14JkgVP0oxQDKCTFQsyC3EqNGC79xkVyCmA
         D4eXBLIbLpq0/L7tBd8ahJFZ5keibQ9n6TxUfDc9dJ1sBlM6qXqNfjCHHVYmYW8WluHk
         VtpAs6sgJM1cXXbaeQhJENwx7BkqytAjxQskT5VWZ+EERSbinw3LP+gC40YCEzdOeaEB
         o6/g==
X-Gm-Message-State: ACrzQf1aaKX1jn3aV5DzdrLazvTdQxXWNabFDaF1kH2m+/u+BhuxoGx3
	ggAbVUV/u8ft3XxWwMe3LBstpqsr5Ts=
X-Google-Smtp-Source: AMsMyM6O8l3UwemZ6wmmPkcNymeefDRnN36hQtQGDJEp6CVOsyOnHCh4Mv6ioFI0PF5X1nuZ2loqBg==
X-Received: by 2002:a17:907:708:b0:77e:ff47:34b1 with SMTP id xb8-20020a170907070800b0077eff4734b1mr39640765ejb.493.1667721582364;
        Sun, 06 Nov 2022 00:59:42 -0700 (PDT)
Received: from [192.168.1.10] ([46.249.74.23])
        by smtp.googlemail.com with ESMTPSA id en6-20020a056402528600b0044e937ddcabsm2280859edb.77.2022.11.06.00.59.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 06 Nov 2022 00:59:41 -0700 (PDT)
Subject: Re: [PATCH 1/2] bus: sunxi-rsb: Remove shutdown callback
To: =?UTF-8?Q?Jernej_=c5=a0krabec?= <jernej.skrabec@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
References: <20221105191954.14360-1-samuel@sholland.org>
 <20221105191954.14360-2-samuel@sholland.org>
 <2652299.mvXUDI8C0e@jernej-laptop>
From: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Message-ID: <7a1bd36c-87c1-16ab-65a6-8d104489d84b@gmail.com>
Date: Sun, 6 Nov 2022 09:59:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Firefox/60.0 Thunderbird/60.6.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <2652299.mvXUDI8C0e@jernej-laptop>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

On 5.11.22 г. 21:29 ч., Jernej Škrabec wrote:
> Dne sobota, 05. november 2022 ob 20:19:52 CET je Samuel Holland napisal(a):
>> Shutting down the RSB controller prevents communicating with a PMIC
>> inside pm_power_off(), so it breaks system poweroff on some boards.
>>
>> Reported-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
>> Fixes: 843107498f91 ("bus: sunxi-rsb: Implement suspend/resume/shutdown
>> callbacks") Signed-off-by: Samuel Holland <samuel@sholland.org>
> 
> Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> 

Tested-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>

Thanks,
Ivo

> Best regards,
> Jernej
> 
>> ---
>>
>>   drivers/bus/sunxi-rsb.c | 9 ---------
>>   1 file changed, 9 deletions(-)
>>
>> diff --git a/drivers/bus/sunxi-rsb.c b/drivers/bus/sunxi-rsb.c
>> index 4cd2e127946e..17343cd75338 100644
>> --- a/drivers/bus/sunxi-rsb.c
>> +++ b/drivers/bus/sunxi-rsb.c
>> @@ -812,14 +812,6 @@ static int sunxi_rsb_remove(struct platform_device
>> *pdev) return 0;
>>   }
>>
>> -static void sunxi_rsb_shutdown(struct platform_device *pdev)
>> -{
>> -	struct sunxi_rsb *rsb = platform_get_drvdata(pdev);
>> -
>> -	pm_runtime_disable(&pdev->dev);
>> -	sunxi_rsb_hw_exit(rsb);
>> -}
>> -
>>   static const struct dev_pm_ops sunxi_rsb_dev_pm_ops = {
>>   	SET_RUNTIME_PM_OPS(sunxi_rsb_runtime_suspend,
>>   			   sunxi_rsb_runtime_resume, NULL)
>> @@ -835,7 +827,6 @@ MODULE_DEVICE_TABLE(of, sunxi_rsb_of_match_table);
>>   static struct platform_driver sunxi_rsb_driver = {
>>   	.probe = sunxi_rsb_probe,
>>   	.remove	= sunxi_rsb_remove,
>> -	.shutdown = sunxi_rsb_shutdown,
>>   	.driver	= {
>>   		.name = RSB_CTRL_NAME,
>>   		.of_match_table = sunxi_rsb_of_match_table,
> 
> 
> 
> 

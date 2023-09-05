Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649988C14
	for <linux-sunxi@lists.linux.dev>; Tue,  5 Sep 2023 20:31:55 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2bceca8a41aso45594071fa.0
        for <linux-sunxi@lists.linux.dev>; Tue, 05 Sep 2023 13:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693945913; x=1694550713; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iSIRkZLP2r98+S/KTJaR3X5dSfpjOPd3LH6308TZ6AQ=;
        b=pIFm9ARrprN6iGlH62Ih2ILkuB8D4Ed/lcF+fHtL+oIHahwVh70Z2F1gtNVyCM5Fpl
         fLNvmAO7Vhu/i2WB6Y5NIPQOJKOOpgesMw9JExonCrm6twCaXAb5JF7sz40bO3e7GQLV
         Z0oSf5v0wZLp0rkcM9fsqX81gtSEhIg/Efz3QF8zOOtNET8c4LFHP9xpNKZazCJm0kL9
         xi6R2M3O8h4VtXjU1Pc/LH6nurhjvj1pqNu+XSMUOSo6KEwsNo2kNO7Lgj+toUVr5qkd
         EVMkxzi4dkg4pDcmA7eH5lDr+mZOjakOFwmMbyi4dVIsVgljfYj/AYvbLOzKFhn2Qmwa
         UTKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693945913; x=1694550713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iSIRkZLP2r98+S/KTJaR3X5dSfpjOPd3LH6308TZ6AQ=;
        b=HEjv29taFfAHec5OBGx0/yMwsRyaH+VK6obLc9/xaAP0gOvZUL9YgPTj1FNSP51lg2
         MsWfn42YdPwtkVzAPFHODvFipfFPU4NES3seAR2TCzdn+cCEkQd2SEh0PEhiK07sPQ9Z
         Z6nVjAF4/+H2fbn0H/X0W7XT7b4kvqKDW6HNN82Twhcv3JhFI9eV+GXTDJVnDkCuZH5K
         eGD5HAOvOY86Hj5WuDBOmJlGUwY590u4U4Ifr6Qot6P8GUpQNoHl69Wa0uBzjF+j2vB8
         pJqDggitEnXrfKsCWoz2MLRTDbTewayII1uP6a7F2YESIXpYH79zAyqf5SyZhuJdUPgh
         0MUw==
X-Gm-Message-State: AOJu0YxpI8WAN4pQp8Svqe+qDdoG6OVmhtWoE9cv/fFIX36BuhLBqGMz
	HdZiINH2IwgCkq6SM2iuj2Q=
X-Google-Smtp-Source: AGHT+IGRiQnxA2kagic6BlwlDSOCf2zj++J7KnMXYuANN/hYDBSGhjckCc0Du4SATrbOA8P0pMRf0Q==
X-Received: by 2002:a2e:900b:0:b0:2bc:b0be:e76 with SMTP id h11-20020a2e900b000000b002bcb0be0e76mr639909ljg.37.1693945912994;
        Tue, 05 Sep 2023 13:31:52 -0700 (PDT)
Received: from archlinux.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id yy10-20020a170906dc0a00b0099364d9f0e2sm8084213ejb.98.2023.09.05.13.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 13:31:52 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] rtc: sun6i: remove unnecessary message
Date: Tue, 05 Sep 2023 22:31:51 +0200
Message-ID: <9160645.CDJkKcVGEf@archlinux>
In-Reply-To: <20230827221643.544259-1-alexandre.belloni@bootlin.com>
References: <20230827221643.544259-1-alexandre.belloni@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday, August 28, 2023 12:16:40 AM CEST alexandre.belloni@bootlin.com 
wrote:
> From: Alexandre Belloni <alexandre.belloni@bootlin.com>
> 
> The core already print a message once the rtc is successfully registered,
> it is not necessary to print an other one.
> 
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/rtc/rtc-sun6i.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
> index 753a2d9c8a17..8e0c66906103 100644
> --- a/drivers/rtc/rtc-sun6i.c
> +++ b/drivers/rtc/rtc-sun6i.c
> @@ -846,8 +846,6 @@ static int sun6i_rtc_probe(struct platform_device *pdev)
> if (ret)
>  		return ret;
> 
> -	dev_info(&pdev->dev, "RTC enabled\n");
> -
>  	return 0;
>  }





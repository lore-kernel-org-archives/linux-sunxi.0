Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6347517FE0
	for <linux-sunxi@lists.linux.dev>; Tue, 11 Jul 2023 19:17:30 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-31441dfbf97so6882909f8f.1
        for <linux-sunxi@lists.linux.dev>; Tue, 11 Jul 2023 12:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689103048; x=1691695048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oSUy+2QLSZkyXGWTlb70qZpMsyDgtjtC0vWQLCNM99s=;
        b=JLqNrRCLg22oTon1ELMrG+YAPgAmFPmjfnWPjFMVIeJ3NDgkUOZv69eSQBCuq6ehby
         gfvj+DATBXAFeCluw1FzSu+8OJ9tdVW96/HDAQwk2oxeOXroVr2ZQyppBKXvkDYHOS54
         RmMZmZgVjI6TSqxy1xq+GMh2D2bHOFHo77vdF6FAi3cQHO+irkzfhFE1qOtQ6RJkI0NU
         JG6KccpLZe3oZIogXkW0gS5v5sWpeyYHmmJfBCX6/29d/gJetjo8A7ajWpjergc3bbng
         zmGWEjB3NphzAL2JR2VRV2kJA3jGOB4NKIPYEVAk9qgclY1LB/7DIUOsJR/BnA1PmIwv
         bANg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689103048; x=1691695048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oSUy+2QLSZkyXGWTlb70qZpMsyDgtjtC0vWQLCNM99s=;
        b=diUsDGUFaAMjG9Y+vkVh9m9PtcUgzLgA2yv7cSWz3WsaceA/Ei2GYJFnc5vzOV0+AO
         /UtXSrP16C9VOrgvER/MGW12AULaWK0WH2JNqnqCd+1QcsAcavDd1aoXRMzf18CIrWV8
         KTDGQP84isotX3kzLARBKast0Z9Kop6f1FfD5XWWVQuY/iH3437J4pwa7q4p3MzZVk9b
         UnstP3lQx+b9s99Hi5OJGRaI8mBJzBO2dZliwXQQ/aUx4a5eVKsIqnMEmHG8rRMcsIZ/
         T1g0N+9PrKHN4MKvap5Dv+SQ+6aEiVZVkozKR1n03OJUeG2pE2b9XvE5Cao3aMR5iHfU
         VBbA==
X-Gm-Message-State: ABy/qLYYBXUhK6XbWysePXsRs/x51o4GZ3Z+IilZr9XSQ//AsGlcyJmf
	BjSnGDxClzgSj4l751u8mKw=
X-Google-Smtp-Source: APBJJlFQ98K9vJ2fSMFaRy4heIAr/uAgzrBzN0S/+2G2XajhEljHNs+9+wAlK3JcuYzXdnAaeJI1Sw==
X-Received: by 2002:adf:fb01:0:b0:315:96ca:dcab with SMTP id c1-20020adffb01000000b0031596cadcabmr8506330wrr.35.1689103048303;
        Tue, 11 Jul 2023 12:17:28 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id o6-20020a5d4a86000000b0030e5bd253aasm2974302wrq.39.2023.07.11.12.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 12:17:28 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Vasily Khoruzhick <anarsoul@gmail.com>,
 Yangtao Li <tiny.windzz@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria <amitk@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Yangtao Li <frank.li@vivo.com>
Cc: Yangtao Li <frank.li@vivo.com>, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] thermal/drivers/sun8i: remove unneeded comments
Date: Tue, 11 Jul 2023 21:17:26 +0200
Message-ID: <4278554.ejJDZkT8p0@jernej-laptop>
In-Reply-To: <20230626125515.18830-1-frank.li@vivo.com>
References: <20230626125515.18830-1-frank.li@vivo.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne ponedeljek, 26. junij 2023 ob 14:55:15 CEST je Yangtao Li napisal(a):
> It's redundant, let's remove it.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/thermal/sun8i_thermal.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/thermal/sun8i_thermal.c
> b/drivers/thermal/sun8i_thermal.c index 195f3c5d0b38..2c82bc744a24 100644
> --- a/drivers/thermal/sun8i_thermal.c
> +++ b/drivers/thermal/sun8i_thermal.c
> @@ -56,8 +56,6 @@
>  #define SUN50I_H6_THS_PC_TEMP_PERIOD(x)		((GENMASK(19, 0) & 
(x)) << 12)
>  #define SUN50I_H6_THS_DATA_IRQ_STS(x)		BIT(x)
> 
> -/* millidegree celsius */
> -
>  struct tsensor {
>  	struct ths_device		*tmdev;
>  	struct thermal_zone_device	*tzd;





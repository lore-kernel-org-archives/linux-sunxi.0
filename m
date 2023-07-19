Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71273275BD
	for <linux-sunxi@lists.linux.dev>; Wed, 19 Jul 2023 20:24:59 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3143ccb0f75so55947f8f.0
        for <linux-sunxi@lists.linux.dev>; Wed, 19 Jul 2023 13:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689798297; x=1692390297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=II4pOhAnZLbg1QPz0IT2mUqTloT5mz679IpkRa1kSJQ=;
        b=AFxPFR/oO/HhsNhrO5884JQFc3TCMBQUJ2FEJLkpfpr9YBmx8N7DF4GspbC6J/eJf4
         oScwuHHkPwHEipOiXu7WSIqbJchztvgw1njxABZmbjLvnqi/GxFPYV09L7HbjevwBGPq
         8nsc73tXAfnIA9JbSk7M0sv57N78lVexdTEcI7ZdLCYQWNpp9K8lrpbVFVlvgTgotqAs
         4TKpH8u1UX2i2Qk2TvzwwMjhgsg0rQE0Z8rvUUTXG9f4PV6jOkOUrpbXIAybDvqEXM+5
         7vM6jQ9/2TUSd5KbSWySp77Nx7CUYv8sOUHIg5gCsCS/GEDS7ClO/Qub/aMUYiyI3B4A
         mUBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689798297; x=1692390297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=II4pOhAnZLbg1QPz0IT2mUqTloT5mz679IpkRa1kSJQ=;
        b=SNePr5dp+2smXCLOoNplO3rLOOPbpaWlhaMolg+INNQ89TE77mpp1eQMyV6VJHCjuS
         X5fwkxYv2VITUUuqhr2wX29dXmtn7b8Z7LEF0/TjXNlt+YdwmZJ/UlI/L20WR1RiKfMG
         RhoFqglfpRA2jQ+5HpJy46EeySiy+Qcj1vWEYfKETgmDbZElG2x6i6ON9Oek4aefJMOz
         CtlLdLW788uxa88bdEsvAkToGO9dttRdRlhBmsH/RCj0QvJWuo1RjXLJb1IqFF/dfQDw
         OzP8oPj2MKVl5gVIwzAQv9UGrqJ3Qo8bSMWYr3UzzLrWR00tP2YHmqLhbZdyX/BNmumR
         Juig==
X-Gm-Message-State: ABy/qLaLxlY6kLW9J4WMB0IEetsmf9HNgAYuWpBf9XsEd4nruQCnmGtl
	qh0Ie5z3uYHDkA3AyXLq+XE=
X-Google-Smtp-Source: APBJJlFczgG4DcFeW4Cbe7JzqBZx5Q8PFpv6TkXeA8vuVWSPw0TIwWH7PPJAodcjhRj6fRZR3p9orA==
X-Received: by 2002:a5d:51d1:0:b0:313:f957:bf29 with SMTP id n17-20020a5d51d1000000b00313f957bf29mr726554wrv.65.1689798297287;
        Wed, 19 Jul 2023 13:24:57 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id x6-20020adff0c6000000b0030fb828511csm6075388wro.100.2023.07.19.13.24.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 13:24:56 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Vasily Khoruzhick <anarsoul@gmail.com>,
 Yangtao Li <tiny.windzz@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria <amitk@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Mark Brown <broonie@kernel.org>
Cc: Hugh Dickins <hughd@google.com>, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
Subject:
 Re: [PATCH] thermal/drivers/sun8i: Don't fail probe due to zone registration
 failure
Date: Wed, 19 Jul 2023 22:24:55 +0200
Message-ID: <3240466.aeNJFYEL58@jernej-laptop>
In-Reply-To:
 <20230718-thermal-sun8i-registration-v1-1-c95b1b070340@kernel.org>
References: <20230718-thermal-sun8i-registration-v1-1-c95b1b070340@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne torek, 18. julij 2023 ob 17:04:22 CEST je Mark Brown napisal(a):
> Currently the sun8i thermal driver will fail to probe if any of the
> thermal zones it is registering fails to register with the thermal core.
> Since we currently do not define any trip points for the GPU thermal
> zones on at least A64 or H5 this means that we have no thermal support
> on these platforms:
> 
> [    1.698703] thermal_sys: Failed to find 'trips' node
> [    1.698707] thermal_sys: Failed to find trip points for thermal-sensor
> id=1
> 
> even though the main CPU thermal zone on both SoCs is fully configured.
> This does not seem ideal, while we may not be able to use all the zones
> it seems better to have those zones which are usable be operational.
> Instead just carry on registering zones if we get any non-deferral
> error, allowing use of those zones which are usable.
> 
> This means that we also need to update the interrupt handler to not
> attempt to notify the core for events on zones which we have not
> registered, I didn't see an ability to mask individual interrupts and
> I would expect that interrupts would still be indicated in the ISR even
> if they were masked.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
> I noticed this while trying to debug an issue with memory corruption on
> boot which since the merge window has prevented Pine64 Plus (an A64)
> from booting at all:
> 
>   
> https://storage.kernelci.org/mainline/master/v6.5-rc2/arm64/defconfig/gcc-1
> 0/lab-baylibre/baseline-sun50i-a64-pine64-plus.txt
> 
> (which I bisected to a random memory management change that clearly
> wasn't at fault) and has been causing less consistent but still very
> severe boot issues on Libretech Tritium (a H3).  The corruption appears
> to happen when unbinding a the one thermal zone that does register, I've
> not figured out exactly where.
> 
> The memory corruption issue obviously needs to be dealt with properly
> (I'm still digging into it) but this does allow both platforms to boot
> reliably and seems like a sensible thing to do independently, ideally we
> could get this in as a fix.
> ---
>  drivers/thermal/sun8i_thermal.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/thermal/sun8i_thermal.c
> b/drivers/thermal/sun8i_thermal.c index 195f3c5d0b38..b69134538867 100644
> --- a/drivers/thermal/sun8i_thermal.c
> +++ b/drivers/thermal/sun8i_thermal.c
> @@ -190,6 +190,9 @@ static irqreturn_t sun8i_irq_thread(int irq, void *data)
> int i;
> 
>  	for_each_set_bit(i, &irq_bitmap, tmdev->chip->sensor_num) {
> +		/* We allow some zones to not register. */
> +		if (IS_ERR(tmdev->sensor[i].tzd))
> +			continue;
>  		thermal_zone_device_update(tmdev->sensor[i].tzd,
>  					   
THERMAL_EVENT_UNSPECIFIED);
>  	}
> @@ -465,8 +468,17 @@ static int sun8i_ths_register(struct ths_device *tmdev)
> i,
>  						      
&tmdev->sensor[i],
>  						      
&ths_ops);
> -		if (IS_ERR(tmdev->sensor[i].tzd))
> -			return PTR_ERR(tmdev->sensor[i].tzd);
> +
> +		/*
> +		 * If an individual zone fails to register for reasons
> +		 * other than probe deferral (eg, a bad DT) then carry
> +		 * on, other zones might register successfully.
> +		 */
> +		if (IS_ERR(tmdev->sensor[i].tzd)) {
> +			if (PTR_ERR(tmdev->sensor[i].tzd) == -
EPROBE_DEFER)
> +				return PTR_ERR(tmdev-
>sensor[i].tzd);
> +			continue;
> +		}
> 
>  		devm_thermal_add_hwmon_sysfs(tmdev->dev, tmdev-
>sensor[i].tzd);
>  	}
> 
> ---
> base-commit: fdf0eaf11452d72945af31804e2a1048ee1b574c
> change-id: 20230718-thermal-sun8i-registration-df3a136ccafa
> 
> Best regards,





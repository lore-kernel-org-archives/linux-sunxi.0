Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5787146904
	for <linux-sunxi@lists.linux.dev>; Fri, 23 Feb 2024 19:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708717878; cv=none; b=iD6qZlVI+9qeOBaYcz7xavD4Xa8WQImpE3KH6r0i75gLpwNVyWQZjlC7rLvtVk++nnqi5Y0edU39reFj7KTziI4dN25xnP5djN5FqUYjqwo9wxENA07N4Zt4uMHKNwcMsujWAxfza7cMpze4li5TACKVwwcnICcFtsQe30Rrmpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708717878; c=relaxed/simple;
	bh=DCcRHQS8179CeEbpS6ho3btFvHb0UMPTbTzkvbeC7DQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Uy3pTbYqYwBuSGolCxuRlhwHeqIX3k+1TaZ/IIMMYXhmOoTmKrJOOPRHmD9bIzcawsjJP4dtCfBr5fM5W6TLYoRN9WfUiMRMicv6WR2ARqBXWrd+4z8SztLgJJxl3jnf2W0I3AXXxoMfJAB/UiaE0h+W7h33xbVvuYLisSN+1Gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UklWarrW; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UklWarrW"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a28a6cef709so186580166b.1
        for <linux-sunxi@lists.linux.dev>; Fri, 23 Feb 2024 11:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708717875; x=1709322675; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Xr6A5ZVcZDLJ7oaBlotk2t+V105HpiLWnU7g8aHJ7w=;
        b=UklWarrWLnfoiryt1BavzEf+MiXHvyQUvIo2EuOqqiVlERCYY79j8mj6KxFHG6H7k6
         DuoH7aB+9G01O9unHZjF0qHajSx2vs56ccQ+Q74fov74b1MEP4X9VELf4Pc2o1vOW9nd
         TY+PPHPlGqMcH59VDzNAME23nsz0VV4CvWvhl1Sjucfm6+W11v+k1R2bmaoSlaoXVX8Q
         Z9fhWTELa7ZHAmDV1/kLJjzb51SVV3JKGYb0uXaEm8hMjjUiUVb7hPFxmVOAX/pDXDOC
         JwT8zOV5bF4kS2+r6wxgtv1YXiVU9leP54/7rZA8PlMGoKrSaY1TItKj4XzPpJOc5Oml
         f23Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708717875; x=1709322675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Xr6A5ZVcZDLJ7oaBlotk2t+V105HpiLWnU7g8aHJ7w=;
        b=XjJzPBy5FilKp295tXXZBsYMhDmJufrNbBikY3L7MPp5gVzgk1QCgTFesOXqEK5IkZ
         KbALTCoE6aavqsuv9CIMFpZWksYmgLMFNYYuIKbgAqYBeKnIGvR1BgR4j258W79CrxlE
         vHbGHj8BbHCAK9mg7tVTWxelUTjxIjfPMWFa2aLz+krmtnBgsOjM27fGKxMoRuZ+NpsA
         CPzOTJE3wIkmoRSrmXww9FePChHAyGVCkVTCk/x4uw8j/cgM5eElKE1RL5ahzfNaLcyp
         cpIHYgzPgufxmatAy787yP4ZH6hn2LuHQAdTm1CqzywhWA8AoRmv9kb0Mz+YLF/hFnjq
         yJ8g==
X-Forwarded-Encrypted: i=1; AJvYcCWaxFWAtna+XvyW2lD4BtabVyEAze4SNgpNkn3LKvbG+2bU/ErkI0whVdJXDH/EeGyBlX8BDpaNvc306VNOmX6xyhQrXsmlXN+F8/M=
X-Gm-Message-State: AOJu0YxDhJ5faapkppC/Ulw7uFrIPneGMKVtuHjhYXJQ9Cof2gA2Kr3s
	VO6LiRN//qo6N4einKP1D/xq507d2udmtUbPwv74CsqKfswzhihRArXOqYhyBzI=
X-Google-Smtp-Source: AGHT+IE19ctpcHeC8OGPK03xM0qf45C77WZ9HAydSzM8Dyn0bvmzXPAySicx9S20pEbJNSX2ZydiUw==
X-Received: by 2002:a17:906:cd0f:b0:a41:3950:d11c with SMTP id oz15-20020a170906cd0f00b00a413950d11cmr547643ejb.28.1708717874903;
        Fri, 23 Feb 2024 11:51:14 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id tj9-20020a170907c24900b00a3ca56e9bcfsm7183967ejc.187.2024.02.23.11.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 11:51:13 -0800 (PST)
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
 Re: [PATCH v3] thermal/drivers/sun8i: Don't fail probe due to zone
 registration failure
Date: Fri, 23 Feb 2024 20:51:12 +0100
Message-ID: <12383045.O9o76ZdvQC@jernej-laptop>
In-Reply-To:
 <20240123-thermal-sun8i-registration-v3-1-3e5771b1bbdd@kernel.org>
References: <20240123-thermal-sun8i-registration-v3-1-3e5771b1bbdd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Daniel, Rafael,

is there any issue with this patch? Can you apply it?

Best regards,
Jernej

Dne sreda, 24. januar 2024 ob 00:33:07 CET je Mark Brown napisal(a):
> Currently the sun8i thermal driver will fail to probe if any of the
> thermal zones it is registering fails to register with the thermal core.
> Since we currently do not define any trip points for the GPU thermal
> zones on at least A64 or H5 this means that we have no thermal support
> on these platforms:
> 
> [    1.698703] thermal_sys: Failed to find 'trips' node
> [    1.698707] thermal_sys: Failed to find trip points for thermal-sensor id=1
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
> Reviewed-by: Vasily Khoruzhick <anarsoul@gmail.com>
> Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
> Changes in v3:
> - Rebase onto v6.8-rc1.
> - Link to v2: https://lore.kernel.org/r/20230912-thermal-sun8i-registration-v2-1-077230107768@kernel.org
> 
> Changes in v2:
> - Rebase onto v6.6-rc1.
> - Link to v1: https://lore.kernel.org/r/20230718-thermal-sun8i-registration-v1-1-c95b1b070340@kernel.org
> ---
>  drivers/thermal/sun8i_thermal.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/thermal/sun8i_thermal.c b/drivers/thermal/sun8i_thermal.c
> index 6a8e386dbc8d..c2a8ae7f8f2f 100644
> --- a/drivers/thermal/sun8i_thermal.c
> +++ b/drivers/thermal/sun8i_thermal.c
> @@ -188,6 +188,9 @@ static irqreturn_t sun8i_irq_thread(int irq, void *data)
>  	int i;
>  
>  	for_each_set_bit(i, &irq_bitmap, tmdev->chip->sensor_num) {
> +		/* We allow some zones to not register. */
> +		if (IS_ERR(tmdev->sensor[i].tzd))
> +			continue;
>  		thermal_zone_device_update(tmdev->sensor[i].tzd,
>  					   THERMAL_EVENT_UNSPECIFIED);
>  	}
> @@ -465,8 +468,17 @@ static int sun8i_ths_register(struct ths_device *tmdev)
>  						      i,
>  						      &tmdev->sensor[i],
>  						      &ths_ops);
> -		if (IS_ERR(tmdev->sensor[i].tzd))
> -			return PTR_ERR(tmdev->sensor[i].tzd);
> +
> +		/*
> +		 * If an individual zone fails to register for reasons
> +		 * other than probe deferral (eg, a bad DT) then carry
> +		 * on, other zones might register successfully.
> +		 */
> +		if (IS_ERR(tmdev->sensor[i].tzd)) {
> +			if (PTR_ERR(tmdev->sensor[i].tzd) == -EPROBE_DEFER)
> +				return PTR_ERR(tmdev->sensor[i].tzd);
> +			continue;
> +		}
>  
>  		devm_thermal_add_hwmon_sysfs(tmdev->dev, tmdev->sensor[i].tzd);
>  	}
> 
> ---
> base-commit: 6613476e225e090cc9aad49be7fa504e290dd33d
> change-id: 20230718-thermal-sun8i-registration-df3a136ccafa
> 
> Best regards,
> 





Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4442013475D
	for <linux-sunxi@lists.linux.dev>; Thu, 15 Feb 2024 21:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708032303; cv=none; b=bxywr61zDqkr1493M4HGAVNUattVMalQiRopy7UxJ5qOED1l5mQEZGeY30TgZKkbqIUXtKNx+5bHcZcis0v6+7KziuXhKdLsU1SP7zCLGeMzZEL7gAVvl7PXrvHeO+xgnh0oJQHH4709I62GZLWWKFMWd4ppMIpB05okv2i/nbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708032303; c=relaxed/simple;
	bh=/1wPIWxWvHc2vt6f0Uv0tWUbTdMqHjz9HxxeuyJHnhc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JK9puf5mPwDGXbfinWIhfizRdkkn4OjB0tQF1xX8+4fNokcI48tUtlpeIoJAOzD6Y8qEQneKx+h8aT3yAGDe++IYCWQa9XSeSwHQAZasrGb7ZmCjRfSJurGij82+15z45kUq+AUrKUjF4tFSG0Q01vfJ8ZARBVW8CXG7aNKsMyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pvijw444; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pvijw444"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-411d3c75026so10709075e9.0
        for <linux-sunxi@lists.linux.dev>; Thu, 15 Feb 2024 13:25:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708032299; x=1708637099; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FvMVfjIDJ/BKciHnF5qg5N2Qgvv6oBbQkuHi7gs9joc=;
        b=Pvijw444q17qn68V0bZSZe88pPCn0fFi/dWWEPuSkLaK4wLRVxG9wtXldW1uipzlms
         e6ZsJzsjEQZZWivOYIS+TfWRJDIXH1qogo+99Nc8SVCNbqyFrBeFSwKNFvG0yehz/Cdb
         UkWIHMbRC9nFNZ/DGMQ3pjhfuUJNPiApA3jnIkYwiPsb3x3Gi2pXIz+IWHx08C0MPF8v
         j2pqbYYdELyJy9D0ZhiwyW+Xjgxu9/x0PvyuRwiyF6feLoj5PhOO1PPyq7bOPfPwaAFg
         NfY9djiplFFf48uwq5y/DSuyid4H5ONTCU5T3BaBBBvOe9liErM88fLybnEGMdbVAYuv
         CXng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708032299; x=1708637099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FvMVfjIDJ/BKciHnF5qg5N2Qgvv6oBbQkuHi7gs9joc=;
        b=kx7+O1wUnnVA5Gs7G4D5uMfWb9YhQbOtg5Vl7UlEozKbXSldqJVlwZWlSrjmvsNoP/
         pH2oDqpj8TQBRNsxStex8oiXnOXUlnKI1txJqW0lMCMdEJUryupe5Govr88Tno7DdLoh
         1Z0SBscOyda0swOy5shRrVZRP22uWrPCdalU1nu2ORWi0CxKa6LaYPQyylJ1S5/VNXPK
         Ou4USOCSPK60TbJorJalDQD+VUfWPMD4N1k8Ojyt9533g9JxxPWccsI0mjnaIVBsyO23
         OO3y32NmurYWOmlq5Sguy+VRdxb7K2OE3V3E6RnCdhnO8vMNhJPQE6lV+G+1MZbp7bZ/
         D9Jw==
X-Forwarded-Encrypted: i=1; AJvYcCXtAKQtOuw+60OpU/Jy+o3aElqSBDX3olgOg66QnIUMV61uur+LyB0Di5xa4U/1EkMpRvqjNmykhuelRUEwunu6GpqwGfhAy9BzmE4=
X-Gm-Message-State: AOJu0YyFnLMe5zij7rhfYvrCewzjmbES2+U5jxv1ZsYxdyvP3hJtjlE1
	335FR3f5zRHLlP3X3oqvSp4AXnH5hAcbgLZwQZpVrMhe4aKSdacCeVW7+H9M
X-Google-Smtp-Source: AGHT+IEqilO1RVYYgsSObj+hh0eVVdOevsjm66BEoLNbz1nZrrTQmxm341SJB7BSHEKpCwvMF+9d8g==
X-Received: by 2002:a05:600c:1f87:b0:411:fc3f:c620 with SMTP id je7-20020a05600c1f8700b00411fc3fc620mr2306045wmb.20.1708032295816;
        Thu, 15 Feb 2024 13:24:55 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id i5-20020a05600c290500b00410ebcf8180sm280325wmd.43.2024.02.15.13.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 13:24:55 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Vasily Khoruzhick <anarsoul@gmail.com>,
 Yangtao Li <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Martin Botka <martin.botka@somainline.org>,
 Maksim Kiselev <bigunclemax@gmail.com>,
 Bob McChesney <bob@electricworry.net>, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v4 5/7] thermal: sun8i: add SRAM register access code
Date: Thu, 15 Feb 2024 22:24:54 +0100
Message-ID: <4543691.LvFx2qVVIh@jernej-laptop>
In-Reply-To: <20240209144221.3602382-6-andre.przywara@arm.com>
References:
 <20240209144221.3602382-1-andre.przywara@arm.com>
 <20240209144221.3602382-6-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 09. februar 2024 ob 15:42:19 CET je Andre Przywara napisal(a):
> The Allwinner H616 SoC needs to clear a bit in one register in the SRAM
> controller, to report reasonable temperature values. On reset, bit 16 in
> register 0x3000000 is set, which leads to the driver reporting
> temperatures around 200C. Clearing this bit brings the values down to the
> expected range. The BSP code does a one-time write in U-Boot, with a
> comment just mentioning the effect on the THS, but offering no further
> explanation.
> 
> To not rely on firmware to set things up for us, add code that queries
> the SRAM controller device via a DT phandle link, then clear just this
> single bit.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  drivers/thermal/sun8i_thermal.c | 50 +++++++++++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
> 
> diff --git a/drivers/thermal/sun8i_thermal.c b/drivers/thermal/sun8i_thermal.c
> index c919b0fd5e169..8a9d2bdc71ece 100644
> --- a/drivers/thermal/sun8i_thermal.c
> +++ b/drivers/thermal/sun8i_thermal.c
> @@ -15,6 +15,7 @@
>  #include <linux/module.h>
>  #include <linux/nvmem-consumer.h>
>  #include <linux/of.h>
> +#include <linux/of_platform.h>
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
>  #include <linux/reset.h>
> @@ -66,6 +67,7 @@ struct tsensor {
>  struct ths_thermal_chip {
>  	bool            has_mod_clk;
>  	bool            has_bus_clk_reset;
> +	bool		needs_sram;
>  	int		sensor_num;
>  	int		offset;
>  	int		scale;
> @@ -83,6 +85,7 @@ struct ths_device {
>  	const struct ths_thermal_chip		*chip;
>  	struct device				*dev;
>  	struct regmap				*regmap;
> +	struct regmap_field			*sram_regmap_field;
>  	struct reset_control			*reset;
>  	struct clk				*bus_clk;
>  	struct clk                              *mod_clk;
> @@ -337,6 +340,34 @@ static void sun8i_ths_reset_control_assert(void *data)
>  	reset_control_assert(data);
>  }
>  
> +static struct regmap *sun8i_ths_get_sram_regmap(struct device_node *node)
> +{
> +	struct device_node *sram_node;
> +	struct platform_device *sram_pdev;
> +	struct regmap *regmap = NULL;
> +
> +	sram_node = of_parse_phandle(node, "allwinner,sram", 0);
> +	if (!sram_node)
> +		return ERR_PTR(-ENODEV);
> +
> +	sram_pdev = of_find_device_by_node(sram_node);
> +	if (!sram_pdev) {
> +		/* platform device might not be probed yet */
> +		regmap = ERR_PTR(-EPROBE_DEFER);
> +		goto out_put_node;
> +	}
> +
> +	/* If no regmap is found then the other device driver is at fault */
> +	regmap = dev_get_regmap(&sram_pdev->dev, NULL);
> +	if (!regmap)
> +		regmap = ERR_PTR(-EINVAL);
> +
> +	platform_device_put(sram_pdev);
> +out_put_node:
> +	of_node_put(sram_node);
> +	return regmap;
> +}
> +
>  static int sun8i_ths_resource_init(struct ths_device *tmdev)
>  {
>  	struct device *dev = tmdev->dev;
> @@ -381,6 +412,21 @@ static int sun8i_ths_resource_init(struct ths_device *tmdev)
>  	if (ret)
>  		return ret;
>  
> +	if (tmdev->chip->needs_sram) {
> +		const struct reg_field sun8i_sram_reg_field =
> +			REG_FIELD(0x0, 16, 16);

What about global static constant for a field? Many drivers do so and code 
would be simpler.

Best regards,
Jernej

> +		struct regmap *regmap;
> +
> +		regmap = sun8i_ths_get_sram_regmap(dev->of_node);
> +		if (IS_ERR(regmap))
> +			return PTR_ERR(regmap);
> +		tmdev->sram_regmap_field = devm_regmap_field_alloc(dev,
> +						      regmap,
> +						      sun8i_sram_reg_field);
> +		if (IS_ERR(tmdev->sram_regmap_field))
> +			return PTR_ERR(tmdev->sram_regmap_field);
> +	}
> +
>  	ret = sun8i_ths_calibrate(tmdev);
>  	if (ret)
>  		return ret;
> @@ -427,6 +473,10 @@ static int sun50i_h6_thermal_init(struct ths_device *tmdev)
>  {
>  	int val;
>  
> +	/* The H616 needs to have a bit in the SRAM control register cleared. */
> +	if (tmdev->sram_regmap_field)
> +		regmap_field_write(tmdev->sram_regmap_field, 0);
> +
>  	/*
>  	 * The manual recommends an overall sample frequency of 50 KHz (20us,
>  	 * 480 cycles at 24 MHz), which provides plenty of time for both the
> 





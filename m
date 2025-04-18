Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C90D26B2D8
	for <linux-sunxi@lists.linux.dev>; Fri, 18 Apr 2025 08:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744965464; cv=none; b=Yr18+QeHjnVZiHZ71CrtfWZII8XzueZZK4yD/nDy5AVl1LqzZ8iCMzzCz1bQ4H39BuvIMc3ogSv0WYuRp3HsuLzsIDBE3bKD2cleF3rgokoMQv5fHFRWwtzk3sFE9vtcsUX44R6/63z6UO9ucbgHzCHBfgZut02ex7fa117PyRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744965464; c=relaxed/simple;
	bh=9wFd+LWaeWbb8ByS2WTwvKaa9Aazj1pXPEB3WNZjVzk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZKQLkCH0lFEoDd89i1t41RLEPyryeSgG2hKuYJ/25X+ZSRjgNQpCI2wCGJIegZYu4psgZlgIZauSAMTODSugeE42aOBIWhc8EMWI1C+GTlGB0Gysrdnq0xZc6e9cNJNKXlpSful+Cbbab6L5FZun+9MJkgJF98na1VA2orn2RsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Koi7fYP7; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Koi7fYP7"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso11899875e9.0
        for <linux-sunxi@lists.linux.dev>; Fri, 18 Apr 2025 01:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744965461; x=1745570261; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=H338YpIXIN0Gvnxx0CNTxMSFWd6J6lOzxWOZLc2fN3E=;
        b=Koi7fYP7DFDncczQIFW40GC9u/gpjMK4nzhzgrElbFhwV89VSV8WB4FZcctaoZrpfS
         rk7q1aCTDNSNwDhZwHhrSMglb8vf9VEgDBu9aHPb7iIRLFZI/y3FDuZKmFlPxXEcO1G2
         XEs1SWjQfzNw9AJVIGMYttnug4zExqQdvc4Yz5de1HF8kj0QvfItJVL7VPnUFIC5dIPE
         G3vVy/T24CBj9OSJrf8d1WYQheJNbcP0/nD9r8wtpsycjr/ZZ88TBgV+Ki4Xe3tOy4xl
         KlGWSURjpZY4PnLSn1nXKtoZt4TiqNIOH/7O4qFsYjZdkNVTT/DHg3moi/a0ISo15yy7
         rSDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744965461; x=1745570261;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H338YpIXIN0Gvnxx0CNTxMSFWd6J6lOzxWOZLc2fN3E=;
        b=R5+Qy4MB721rV0YZ7Gp6jYV9IKWiI9W0LEh8yeYS2VVLz+gpPbjaKS1gtcgULZQjxI
         an2ukxYwqrLSDQFWuueH2kqufUls/QaZ1Zcksm4Ltf6pWOI9IbkLZSXKYexAs4ULhH05
         NgoNIhVCqylkQ5aAsJHvisVR4eWR2oJDm7US/dY7ouWJxQOgbVC5zkZ0mwuLAr64h+EQ
         fPpAXlHR+FEyPXqqkC+zar0s/XzBeI2bHsFNi5ljhobEmzyBzd3nwCBzmuxcqWIow0HF
         20u10k+kzm9yPI/7NTX0oMUB5tgldRgy4m9zP1Zbdo/2PyuC7vK+8s25/2EZ4P3qt0s9
         HI/A==
X-Forwarded-Encrypted: i=1; AJvYcCXswn/xZF87RgpU64UUbZSm85nvOmNByT1ubol3+cX6KITwZlCzl2FSHLsv8A55ZpAM9LLxLUk/jxr59g==@lists.linux.dev
X-Gm-Message-State: AOJu0YyW2Wt/cFRXi2up0TSn89HSrx9xfqstfZ+4SmrJEq08hfRFiR1M
	jDTQmIlf/V0bziZ34cqwcprOeN7eNAMriwvCm0E5C7qMq2VecUj/WxfCJ7+IG3M=
X-Gm-Gg: ASbGncu66/diZxlyR+otiRpeVpefa+pJAYfWPNcZOO78TW9WN8OyST+p9pAaEnM8O3q
	e/BSsh8+IQhCHljSG5cFNemj3k2l3AK5FqqEYgbTUcqOw+A8RDQ4sk43pPryTiTYUzEyNzPsn2S
	VuDwbsllxnjQ/GFtzl0czzkaXU9bs5GUTDmfUOD0dInFLYFgnrFyGv881PR77Mr7iCpJQ+wIqY1
	k9+qUi3PlGTrNo/ydIWC2Gtlk+jxH7naJrCV81+lThZxxOj7ItRqWbkhsNLCrypGe03GVH6cZYw
	v5jX/xvfjmNgU6PYnpXd64L05wOyOnZNz0iX9GsR7AYGU0BKWy8wV8Bu9OX4poXe2rk5hSWmjY4
	MHTI=
X-Google-Smtp-Source: AGHT+IHiLpagTJs2SbpQ7T/yPM+PTl/lUYMdfib3CeXF6j4CoViiiMG4uhTpPH8XNuL/o5PBHm8qrg==
X-Received: by 2002:a05:600c:54c7:b0:43d:683:8caa with SMTP id 5b1f17b1804b1-4407076031dmr2922635e9.15.1744965460792;
        Fri, 18 Apr 2025 01:37:40 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d5acec8sm13487175e9.16.2025.04.18.01.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 01:37:40 -0700 (PDT)
Date: Fri, 18 Apr 2025 10:37:37 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: iuncuim <iuncuim@gmail.com>
Cc: Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Subject: Re: [PATCH 1/6] thermal/drivers/sun8i: add gpadc clock
Message-ID: <aAIPUcS_cNRHoxwq@mai.linaro.org>
References: <20250411003827.782544-1-iuncuim@gmail.com>
 <20250411003827.782544-2-iuncuim@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250411003827.782544-2-iuncuim@gmail.com>

On Fri, Apr 11, 2025 at 08:38:21AM +0800, Mikhail Kalashnikov wrote:
> From: Mikhail Kalashnikov <iuncuim@gmail.com>
> 
> Some processors (e.g. Allwinner A523) require GPADC clocking activation for
> temperature sensors to work. So let's add support for enabling it.
> 
> Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
> ---
>  drivers/thermal/sun8i_thermal.c | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/thermal/sun8i_thermal.c b/drivers/thermal/sun8i_thermal.c
> index 226747906..1f3908a60 100644
> --- a/drivers/thermal/sun8i_thermal.c
> +++ b/drivers/thermal/sun8i_thermal.c
> @@ -66,8 +66,9 @@ struct tsensor {
>  };
>  
>  struct ths_thermal_chip {
> -	bool            has_mod_clk;
> -	bool            has_bus_clk_reset;
> +	bool		has_gpadc_clk;
> +	bool		has_mod_clk;
> +	bool		has_bus_clk_reset;
>  	bool		needs_sram;
>  	int		sensor_num;
>  	int		offset;
> @@ -89,7 +90,8 @@ struct ths_device {
>  	struct regmap_field			*sram_regmap_field;
>  	struct reset_control			*reset;
>  	struct clk				*bus_clk;
> -	struct clk                              *mod_clk;
> +	struct clk				*mod_clk;
> +	struct clk				*gpadc_clk;
>  	struct tsensor				sensor[MAX_SENSOR_NUM];
>  };
>  
> @@ -417,6 +419,16 @@ static int sun8i_ths_resource_init(struct ths_device *tmdev)
>  	if (ret)
>  		return ret;
>  
> +	if (tmdev->chip->has_gpadc_clk) {
> +		tmdev->gpadc_clk = devm_clk_get_enabled(&pdev->dev, "gpadc");
> +		if (IS_ERR(tmdev->gpadc_clk))
> +			return PTR_ERR(tmdev->gpadc_clk);

			return dev_err_probe();

> +	}
> +
> +	ret = clk_prepare_enable(tmdev->gpadc_clk);
> +	if (ret)
> +		return ret;
> +

Why calling clk_prepare_enable() ? devm_clk_get_enabled() did the job no ?

>  	if (tmdev->chip->needs_sram) {
>  		struct regmap *regmap;
>  
> -- 
> 2.49.0
> 

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

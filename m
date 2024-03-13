Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7570A4E1CB
	for <linux-sunxi@lists.linux.dev>; Wed, 13 Mar 2024 18:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710353869; cv=none; b=Aaj4timzZ/F/Jz6doDSzbKkFy37Fjcr8zGblXV0YUGUZv12xUlG1OyP9YHxCQUUboMhXxsla16BbsgJL/WK3C2seiS17anqb47BMlvWTHk7SOq4gclp3dzkS1OivjNON05W23VQjwf0w/WSuMoaqyUbWh3r2u0qJ6oXsnR+qlEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710353869; c=relaxed/simple;
	bh=SyVMnZvS/ZnHg0qyb832r9jYPgwDvt2Fg5Z/R12KPYM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=POhERabFimGMZylOxxjDrgZ4pvs80SjueB5/CoHNqnaIMUhFF449Ii1iitjvkXH89hPc+WRVnhMsJdzooPErOYdWiPQr5Jw/NcGJrPMkF6WbWyDz/qez/gJWL50P5rJLw2F5lA7wBEeDRj6doupkeLNjr5N5DMNmm2o69cvUqN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LiKoNsSK; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LiKoNsSK"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-413ef6a4f4bso950575e9.0
        for <linux-sunxi@lists.linux.dev>; Wed, 13 Mar 2024 11:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710353866; x=1710958666; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dxB79hpmOYEV/Wa5xEjs3BbB8JPGXY5M54cM2DcOGjk=;
        b=LiKoNsSKXeKdTH5mnL1VSQYFknb9NakUm5cSFvAt+RNT5co3tEVfFmxzZ4HlfIdIkW
         Saxg0ZJmQg1P/r9VTl8Mf0R+pyc9XEbisFDHkmsd+kwoddp2OFbfpuEvAwr/Aucz2V3f
         qk0sRDb/ZAVXtZrs0u8LiwewCvlAnVlH2dUGP6jC6RqcSKcBsTE50sh/I9MQyR/ihUlI
         coxhmEhk2JDznix2QZeg3TVUqL5RfFBbbggjwIaVweE2IRKKDtH4lpZM/qwS7scaTRlZ
         351k/ljgUEKQTwd+e9IkXkZGS7G/3XARRpAcRtQPZyZu1kIaPy1MwfNKA1V5NDON3tx2
         VBlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710353866; x=1710958666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dxB79hpmOYEV/Wa5xEjs3BbB8JPGXY5M54cM2DcOGjk=;
        b=VjTP4tBS3sa/xNeGDDPfj6UeQ67F0KHWXVxXVyhSFge5D3sIDC53eVaMb65lODbiZn
         MdyeDDCPXFR5MZeUq2hEUNIPpHPzZgAJhqncsvaBi2Wc5CG3ThmjGM7nBpf0wTRVo8uU
         bo4EO0IV0yIIYWX98MY+I+DSQzvNNtu3ZClyI1EhmPIEspW7LGn1HUzih+gKwsrPuj/K
         54mv04slSESxoD5Y8rMupoWT5PT7NZ89ntQjxpj2BIPlWmSHVzlm7bIKbOnPaH0nGRzk
         MdFV3jCNybxJKF0Kq7dNNsuZEQe5+PJNacK1f00Qf9AXII38oZRlN9VwG5RSNjoy+Goa
         G96A==
X-Forwarded-Encrypted: i=1; AJvYcCVs+mYECFgC7MOa90tN/sX94aJ2gCYxeX+SnHyafAHGIK7OLsjRrephAGHpGOKUgdM9/Uwv7TJ8XHRU+EDHTh8QtcgSzMTQgntppac=
X-Gm-Message-State: AOJu0Yz0apDe3lzT9Wsl/Firlx05nP64p6wVgP4DJQ9WkTU+jZB/+eZP
	RpyNcI3yz9MQRl4C3Bo6WX3dy2+7n/IRvoTkkRuV35veBSXwYzAJ
X-Google-Smtp-Source: AGHT+IGKbeIwigUlBRsdMhJK7OomlBsIup1DbJY8unvtALG2eksaRqlMkijulA70G2ebsv8fF6clmw==
X-Received: by 2002:a5d:644d:0:b0:33e:7896:a9d7 with SMTP id d13-20020a5d644d000000b0033e7896a9d7mr2108713wrw.67.1710353865784;
        Wed, 13 Mar 2024 11:17:45 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id ch9-20020a5d5d09000000b0033eab3520a9sm4381264wrb.43.2024.03.13.11.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 11:17:45 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Guido =?ISO-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
 Purism Kernel Team <kernel@puri.sm>, Ondrej Jirman <megi@xff.cz>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Oltmanns <frank@oltmanns.dev>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Frank Oltmanns <frank@oltmanns.dev>, stable@vger.kernel.org
Subject:
 Re: [PATCH v4 1/5] clk: sunxi-ng: common: Support minimum and maximum rate
Date: Wed, 13 Mar 2024 19:17:43 +0100
Message-ID: <3210009.5fSG56mABF@jernej-laptop>
In-Reply-To: <20240310-pinephone-pll-fixes-v4-1-46fc80c83637@oltmanns.dev>
References:
 <20240310-pinephone-pll-fixes-v4-0-46fc80c83637@oltmanns.dev>
 <20240310-pinephone-pll-fixes-v4-1-46fc80c83637@oltmanns.dev>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Dne nedelja, 10. marec 2024 ob 14:21:11 CET je Frank Oltmanns napisal(a):
> The Allwinner SoC's typically have an upper and lower limit for their
> clocks' rates. Up until now, support for that has been implemented
> separately for each clock type.
> 
> Implement that functionality in the sunxi-ng's common part making use of
> the CCF rate liming capabilities, so that it is available for all clock
> types.
> 
> Suggested-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>
> Cc: stable@vger.kernel.org

This looks pretty nice now.

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/clk/sunxi-ng/ccu_common.c | 19 +++++++++++++++++++
>  drivers/clk/sunxi-ng/ccu_common.h |  3 +++
>  2 files changed, 22 insertions(+)
> 
> diff --git a/drivers/clk/sunxi-ng/ccu_common.c b/drivers/clk/sunxi-ng/ccu_common.c
> index 8babce55302f..ac0091b4ce24 100644
> --- a/drivers/clk/sunxi-ng/ccu_common.c
> +++ b/drivers/clk/sunxi-ng/ccu_common.c
> @@ -44,6 +44,16 @@ bool ccu_is_better_rate(struct ccu_common *common,
>  			unsigned long current_rate,
>  			unsigned long best_rate)
>  {
> +	unsigned long min_rate, max_rate;
> +
> +	clk_hw_get_rate_range(&common->hw, &min_rate, &max_rate);
> +
> +	if (current_rate > max_rate)
> +		return false;
> +
> +	if (current_rate < min_rate)
> +		return false;
> +
>  	if (common->features & CCU_FEATURE_CLOSEST_RATE)
>  		return abs(current_rate - target_rate) < abs(best_rate - target_rate);
>  
> @@ -122,6 +132,7 @@ static int sunxi_ccu_probe(struct sunxi_ccu *ccu, struct device *dev,
>  
>  	for (i = 0; i < desc->hw_clks->num ; i++) {
>  		struct clk_hw *hw = desc->hw_clks->hws[i];
> +		struct ccu_common *common = hw_to_ccu_common(hw);
>  		const char *name;
>  
>  		if (!hw)
> @@ -136,6 +147,14 @@ static int sunxi_ccu_probe(struct sunxi_ccu *ccu, struct device *dev,
>  			pr_err("Couldn't register clock %d - %s\n", i, name);
>  			goto err_clk_unreg;
>  		}
> +
> +		if (common->max_rate)
> +			clk_hw_set_rate_range(hw, common->min_rate,
> +					      common->max_rate);
> +		else
> +			WARN(common->min_rate,
> +			     "No max_rate, ignoring min_rate of clock %d - %s\n",
> +			     i, name);
>  	}
>  
>  	ret = of_clk_add_hw_provider(node, of_clk_hw_onecell_get,
> diff --git a/drivers/clk/sunxi-ng/ccu_common.h b/drivers/clk/sunxi-ng/ccu_common.h
> index 942a72c09437..329734f8cf42 100644
> --- a/drivers/clk/sunxi-ng/ccu_common.h
> +++ b/drivers/clk/sunxi-ng/ccu_common.h
> @@ -31,6 +31,9 @@ struct ccu_common {
>  	u16		lock_reg;
>  	u32		prediv;
>  
> +	unsigned long	min_rate;
> +	unsigned long	max_rate;
> +
>  	unsigned long	features;
>  	spinlock_t	*lock;
>  	struct clk_hw	hw;
> 
> 





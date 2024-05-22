Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0BA23CB
	for <linux-sunxi@lists.linux.dev>; Wed, 22 May 2024 18:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716404067; cv=none; b=ptin7ZN5sMl8hDvoFe84dFJTrrYMB+4PnQwgzkRDKW+TOIRkD2NiL7o1ndglQwT9E2iRo79leMB2kE3gJjqHY4U7ft3Sme7ZTKze06DVmzlvjIl2RMfBWwD7fp/7tzAZcaOjnz6gQJ7IfEYaFWGA0AYBBnyR7+ov4WgarXPutRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716404067; c=relaxed/simple;
	bh=zG6DmFSvOlwxNqFRYCCoNVfO0/oFcnar3wPos47WTUg=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LNWw73OFeXQXwVN6zIGk4IibDcuzuj9Dqe6CXdfY+VE/gYW+K/83bP8/sTAgftV6qEM+yUNeYuh2uVOgwmw8283iTrBfjlLBSAph3Uh8ehcUTjXayb/z/oC93X4uAt5LdbWQJ64PRXvoMOR46w+EChrMrJOYyApm2vZDU+LjeEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jltuwW06; arc=none smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jltuwW06"
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-24544cfbc69so2484245fac.3
        for <linux-sunxi@lists.linux.dev>; Wed, 22 May 2024 11:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716404065; x=1717008865; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tA1Sbti/zXxCiItQT/p43hpVbiyvW9x3fEN/x9VummA=;
        b=jltuwW06vP8Ay7Put7AvMPm+FImtj0LVRjIshBOIOWhw0UjSYAFRoCrKiaA3nl44Ji
         gCt5iTV89hV3nC1tS5SU1Gmg+I4aRrH44L3TPMt+1rTbedhCL6moWSYWraExgMtawy+e
         CJKcrX85JO3Mrfu6eqJTCH1ZrwGw664HFz+24akEI4dWROdQJ5SeLMdtGOZeETGL0TES
         kFH3n1x/xj7Vs5s1verxT5LtE0TU+UQdx8LurROFH3bD5uP71xehLdDEnlq+6ysoyqAF
         rp6MGKztWCvpBkKw+Akb60oecLqNtvI5BBP7hw0RZhw8akIynIFDv4T4B0EccI+2Nuqw
         3TVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716404065; x=1717008865;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tA1Sbti/zXxCiItQT/p43hpVbiyvW9x3fEN/x9VummA=;
        b=uVcs/Btwv0eQ4WINO7NlBgQKv2PcDlfF/5aBbhIVGrsySJ49jZAal5eyyMZ82XvO36
         2Ys7nbyaD1TeQwvFTsMFrP1IXdj9PifMJPb77UV2lxZKBB4qjAlTlTAkb/UdKXP6AT2M
         C0JZi+DR9/KpKssdETZM115zQ1uAulrzuCd5NVeWsUXOFPTHQAmf83Qx5RN6Oh7JDWoT
         LJM4Cxw5m+llUa6yuK4ecBz3MUtkzJcNQbxDUlrfQQyUfLmJoxJAn4HKhp+k4fnN51BE
         LaV4fCYIA++egGGZMUJs0i2rsmGTOVX6zv8ELq29pFX5oDtGj2mEEXonX6jbFb23MJEx
         JhAA==
X-Forwarded-Encrypted: i=1; AJvYcCXezcVdDp+7o11VR5GsUoM3rGuC1snKGcCUmtxtVMO2dH7CjW3gPV9TLi90LGSud7NvniejgshOw9ZC24EOQasPXNPh51pVe42JYsA=
X-Gm-Message-State: AOJu0Yy0P5Ry+mCLdYABLL8fdDqRyxloMGapJkd3f8E8n8akWmdMQ5Qx
	JeM74VI1zv5yUPyF4bkmAFDjz00X5MGL5PYPtFuq1IDtcDN9xZ0J
X-Google-Smtp-Source: AGHT+IH7JgZdAZmLwabI70Yi9CqaHBGi7W8WOVJdXpnbIcGSDoJHNF9GVVWCI9iFTCJBiWCAtrSgiQ==
X-Received: by 2002:a05:6871:581e:b0:23c:2cf7:9ff9 with SMTP id 586e51a60fabf-24c68aeeeb5mr3242325fac.7.1716404063187;
        Wed, 22 May 2024 11:54:23 -0700 (PDT)
Received: from neuromancer. ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-24c8227e303sm44531fac.30.2024.05.22.11.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 11:54:22 -0700 (PDT)
Message-ID: <664e3f5e.050a0220.ae493.07d7@mx.google.com>
X-Google-Original-Message-ID: <Zk4/Xcjv/KKYwuHu@neuromancer.>
Date: Wed, 22 May 2024 13:54:21 -0500
From: Chris Morgan <macroalpha82@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Lee Jones <lee@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Ryan Walklin <ryan@testtoast.com>
Subject: Re: [PATCH v2 4/5] mfd: axp20x: AXP717: Add support for boost
 regulator
References: <20240418000736.24338-1-andre.przywara@arm.com>
 <20240418000736.24338-5-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240418000736.24338-5-andre.przywara@arm.com>

On Thu, Apr 18, 2024 at 01:07:35AM +0100, Andre Przywara wrote:
> The AXP717 also contains a boost regulator, to provide the 5V USB VBUS
> rail when running on battery.
> 
> Add the registers to the MFD description to be able to use them from the
> regulator driver.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Reviewed-by: John Watts <contact@jookia.org>
> ---
>  drivers/mfd/axp20x.c       | 2 ++
>  include/linux/mfd/axp20x.h | 2 ++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
> index d8ad4e120d379..02513b1eff2e8 100644
> --- a/drivers/mfd/axp20x.c
> +++ b/drivers/mfd/axp20x.c
> @@ -209,6 +209,8 @@ static const struct regmap_access_table axp313a_volatile_table = {
>  };
>  
>  static const struct regmap_range axp717_writeable_ranges[] = {
> +	regmap_reg_range(AXP717_MODULE_EN_CONTROL, AXP717_MODULE_EN_CONTROL),
> +	regmap_reg_range(AXP717_BOOST_CONTROL, AXP717_BOOST_CONTROL),
>  	regmap_reg_range(AXP717_IRQ0_EN, AXP717_IRQ4_EN),
>  	regmap_reg_range(AXP717_IRQ0_STATE, AXP717_IRQ4_STATE),
>  	regmap_reg_range(AXP717_DCDC_OUTPUT_CONTROL, AXP717_CPUSLDO_CONTROL),
> diff --git a/include/linux/mfd/axp20x.h b/include/linux/mfd/axp20x.h
> index 8c0a33a2e9ce2..4dad54fdf67ee 100644
> --- a/include/linux/mfd/axp20x.h
> +++ b/include/linux/mfd/axp20x.h
> @@ -115,6 +115,8 @@ enum axp20x_variants {
>  #define AXP313A_IRQ_STATE		0x21
>  
>  #define AXP717_ON_INDICATE		0x00
> +#define AXP717_MODULE_EN_CONTROL	0x19

Could we name this register something like "AXP717_MODULE_EN_CONTROL_2"?
We're going to need register 0x0b later for usb and battery, and that's
also marked as a control register (control_1 per the datasheet).

Thank you,
Chris

> +#define AXP717_BOOST_CONTROL		0x1e
>  #define AXP717_IRQ0_EN			0x40
>  #define AXP717_IRQ1_EN			0x41
>  #define AXP717_IRQ2_EN			0x42
> -- 
> 2.35.8
> 

Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1441D433C8
	for <linux-sunxi@lists.linux.dev>; Mon, 27 May 2024 09:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716801059; cv=none; b=NgE4ljJYHGypLvtKRBu5rsD+lqfvKK0Uj1GXtKjnPE06teDhGY6CsfG5WL5flwoCmZHrAmtJrU2aMQm43i1MPUvRyR7VFz0bxvxLAramJkvVlQ0EvOZVIACx2ps+NQtvL8oxmDa2zZJxns0W/geeQ+xDovU8tBDPF8sSFDfUeGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716801059; c=relaxed/simple;
	bh=TxO63w8D2p8noAFp5GouE3gvIZzsMALJAEUvuR2DPU8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AKSt/yWdh81oOBbjssYycnXv8lMR+GDkLfpemYMyw0VPKXm559mQUq9yJbyqs+Ef39Uvt1IFe4ZJivAyaYGPhy44NJLlQcSB4TAczwPDp0hN573MGfVJIv6mWA2otsbxiDhgoFCbgNxkHwt8uoTct8SQOcCCx9qYfQARWegigR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=bZDRywtz; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="bZDRywtz"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2e3efa18e6aso49469581fa.0
        for <linux-sunxi@lists.linux.dev>; Mon, 27 May 2024 02:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716801055; x=1717405855; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LQAdgIOQukEfXwjNGbipvur9+Z8l8KEKtuZqCxNPM88=;
        b=bZDRywtzoxACllxMKF/BdrJPrtcP8g/G2nRp1cPl3hEGR3I9zg2uhgNYttX9NgLPcb
         UbyYbYHpd3VJoPjKzT3ZusuLdwDz+PTsF85d3D/H4kQIW3ja9CVxT3f+2upiXWJxMolR
         hUW0xSCJPtHXTZfNhnqZOx0+6csIFnPzu9tLFUAki9gJmr8WLLnUgeO4wPhQyjlTFUuv
         IKlJhzIUq9koWRGhgmqtjLfn8/qK+v+iPg6e1BPitEGo0icRJODjm7J9rqXl8rJSltsq
         tLYMSLB+AGPHbP844UTdaeQDeiS8R9EnQs+I4jD1KdDHH5J7ZT8WIDAMuXFi0xFcl/PB
         OYig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716801055; x=1717405855;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LQAdgIOQukEfXwjNGbipvur9+Z8l8KEKtuZqCxNPM88=;
        b=WcHKNI4jA1l1KMj1/8hJ3WCpRHvTIHrTZXaBfIyxopakNVNtrERlwshkJiILaRBIae
         7rQV3ZuFcgU/byIyPUG9kCk1UnRV5WWTiYaCp7If+B02Tl/gV67pOAi/6jU24ssJCBSP
         i2+eRkWlLf3AnOEJPASBYgUZiNOQ5U1GrOh+HzbSqefYVoVA1Gxtt0ISVJziG5eToUcZ
         iFs7pf6lIYIRswQLzcmOHFfc6+OOVifiJo6y4rWoTBIAwtkcn2QZIdvjm/io60eTVAWb
         ivWoaxBgRlq+albrYYJAypuRt4zg+M6ny7hKeF8wIqQw9vqY0SCxF+Mm/2Mz1ConNmDE
         u+Tg==
X-Forwarded-Encrypted: i=1; AJvYcCWLwNegoU4wfbj+A6U3cHIpktbOUsjtwcwMOvCA4myOChK5D9TPYmVYh/f4UiWQp6x+5qKkHyYAVUmebQfM7zbtH0FlfTTH4hLE2+8=
X-Gm-Message-State: AOJu0Ywxvt+u/ocrJsntaeMSbE5XKyE9Slr67ykiysWqBajSnkYqkCGw
	O+UcvN/NFAFF5IekP6pO99+yGoJRSLr5k+BgQozp6GMPs4Otve+z41WFQUI9FlU8zC/PuuE9dnZ
	OHcY=
X-Google-Smtp-Source: AGHT+IE/XwhKrN+XuZVHuMIdiI6Yz8L2JavsRfmxvWtsUhZZt2NJ/SSG65g2ImH0JWmyID54LGpqBA==
X-Received: by 2002:a50:c314:0:b0:579:d23a:1990 with SMTP id 4fb4d7f45d1cf-579d23a1b41mr2344508a12.11.1716801035026;
        Mon, 27 May 2024 02:10:35 -0700 (PDT)
Received: from ?IPV6:2001:a61:139b:bf01:e8eb:4d8f:8770:df82? ([2001:a61:139b:bf01:e8eb:4d8f:8770:df82])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-579d0b02625sm1538415a12.9.2024.05.27.02.10.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 May 2024 02:10:34 -0700 (PDT)
Message-ID: <a2b06a40-4689-4fa9-90bb-9d34311d4221@suse.com>
Date: Mon, 27 May 2024 11:10:32 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] power: supply: axp20x_usb_power: Add support for
 AXP717
To: Chris Morgan <macroalpha82@gmail.com>, linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org, broonie@kernel.org,
 lgirdwood@gmail.com, lee@kernel.org, samuel@sholland.org,
 jernej.skrabec@gmail.com, wens@csie.org, conor+dt@kernel.org,
 krzk+dt@kernel.org, robh@kernel.org, sre@kernel.org,
 Chris Morgan <macromorgan@hotmail.com>
References: <20240522230132.364915-1-macroalpha82@gmail.com>
 <20240522230132.364915-4-macroalpha82@gmail.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20240522230132.364915-4-macroalpha82@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 23.05.24 01:01, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add support for the AXP717. It does USB BC 1.2 detection similar to the
> AXP813, however it is otherwise very different from previous AXP
> devices.
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---

> +static int axp717_usb_init(struct axp20x_usb_power *power)
> +{
> +	int ret;
> +
> +	ret = regmap_update_bits(power->regmap, AXP717_ADC_CH_EN_CONTROL,
> +				 AXP717_ADC_EN_VSYS_VOLT |
> +				 AXP717_ADC_EN_VBUS_VOLT,
> +				 AXP717_ADC_EN_VSYS_VOLT |
> +				 AXP717_ADC_EN_VBUS_VOLT);
> +	if (ret)
> +		return ret;
> +
> +	return 0;

This is a bit silly.

> +}
> +
>   static int axp20x_usb_power_set_voltage_min(struct axp20x_usb_power *power,
>   					    int intval)
>   {
> @@ -307,6 +417,20 @@ static int axp20x_usb_power_set_voltage_min(struct axp20x_usb_power *power,
>   	return -EINVAL;
>   }
>   
> +static int axp717_usb_power_set_voltage_min(struct axp20x_usb_power *power,
> +					    int intval)
> +{
> +	int val;
> +
> +	if (intval < 3880000 || intval > 5080000)

Do you really want raw numbers here?

[..]
> +static int axp717_usb_power_set_property(struct power_supply *psy,
> +					 enum power_supply_property psp,
> +					 const union power_supply_propval *val)
> +{
> +	struct axp20x_usb_power *power = power_supply_get_drvdata(psy);
> +
> +	switch (psp) {
> +	case POWER_SUPPLY_PROP_INPUT_CURRENT_LIMIT:
> +		return axp717_usb_power_set_input_current_limit(power, val->intval);
> +
> +	case POWER_SUPPLY_PROP_VOLTAGE_MIN:
> +		return axp717_usb_power_set_voltage_min(power, val->intval);
> +
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return -EINVAL;

This is also a bit silly.

	Regards
		Oliver


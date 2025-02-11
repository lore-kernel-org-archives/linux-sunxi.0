Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9242641E8
	for <linux-sunxi@lists.linux.dev>; Tue, 11 Feb 2025 21:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739307739; cv=none; b=NbqMtPlN88GKxJiykdwy5SPEe9GB8i0KEZF5WPpauBAjdeZqlthPfSTyI+YPUz/eYdtixMFBWMDhYpG6GrI6W2YptAXYtvf2p5Zr0/1QjByd3iKsSS/sCrMXVqFfcO5anUMqNiOtVBnuK+vn/H7bJKk6GrLim1eNl9I8sF6FyG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739307739; c=relaxed/simple;
	bh=ft9S8SqsolK3whhc7XXUN7Q8EDYX3DgvWorDRfJ1fMM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W8bY90dISKvyQt2zUmnrzCUf7l9eLDYoGtfS/VkZIyUFEkW/v4e7/CmIc+x/9e1MPmJsivk8MImkE7BL7D8/iF9vssN0h3bIWsxYRO8Up5RwJFw6hLMb6l4oKDo09K3PSfORtyW+K9wceXjbeWTITvsWvidn+NtYkNPgUGMv6Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CRFI5iLk; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CRFI5iLk"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ab7ee6f54faso77672366b.2
        for <linux-sunxi@lists.linux.dev>; Tue, 11 Feb 2025 13:02:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739307735; x=1739912535; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xZyUrG6+M9kIYP0+SgijnDH3fs7yuMG/QqkNcnw9Coc=;
        b=CRFI5iLkELaDjSS+YJ2rhrKFBkH2EsNU1ehwWs0QgmiWIua0MSHtWQsMAxaxobVn44
         rYJvXTTjmm8hEFw+DMF56zuLdA5BLTXKcDU92kuRlfjavXdjyI/3n4kzpU88exTFDs2j
         TKUFz+twChmBq/PCKpG1QUk/aXVnjwCQnQ2gYgPlGqJOqyFAxY2E+Iz5f4U7oP7wDErw
         bWX/3Fs6nRVhUoUXED1ERFNTQLBfNDEKf91FcwxKnZfNMkHu/eO0P5Mr9SyGMn8ZuWX6
         epvUDlvrlfxGSR4rixux25/Mt0feMJ8czMqYVvB3aNafDOW+/ABm4kUfe1aLPBw1Rq10
         c0og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739307735; x=1739912535;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xZyUrG6+M9kIYP0+SgijnDH3fs7yuMG/QqkNcnw9Coc=;
        b=Jyizjwk3PIQ2VfXvuhLgVvavIds+hy7w5ieYeo8bTg58RdC/CknveA6/01p/pUjsBF
         luewflisacvkLcXw/sblsDy7De9IwDnPO4BEYTMWrmJ9ECMDkFm5i4C4bJUJ/8SMLmPw
         XftEmHKCUESKbxF7UR7NFehRO+I+97TFKdWwNgO4fv5Eok0xVkEVOvkhsigav89LsIaP
         acaO210qKZzKvMmHrwcfEpqv+qwtnuzj6hjaPdu2ajQ80alOoZ4ZeoH45Oe6dTGOx5x8
         9qYm7whFeQOec5rZIIJKmF600kZJNc7E9FvHR4sp29Fz1viD30eid7WnOI3jAg0FG2a5
         Nc4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVt4280rI0jSSxA2Aqam7774L4MR/4DlB9z+A0X06fcMCxMtZknQ93qPKojU+XyvKuTCWWm2uAtBkByzA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yztudt8CMQBgoX1kDezU00lErcaV/5pYxlAxg6ZVwtfZoup/ifW
	ONrHiWSBeWGA+XcnBVX1BMd2H9dZgx+3OuZsmoFtPq+tuQV4Vxcp
X-Gm-Gg: ASbGnctHBthCW8fc92XT6bCuoMvO4OOMjGhjEIjGH51lgRXJm8xDVa/usbloSnpOgMZ
	wqSizvRhYEdxNFn2ChBunIl6RKhCYeV/7A4qrTLrHQ0U4GzSE3Cm5kbWGecbD3RTecwh+MmpyVq
	fwiHoXQVRb1YZG1Bt7yq9AS0eEzJlIhfgCd0N782+EHnJczDWsdqPaQsNCIosaBjmu4Jm+Q/WMD
	L0HdWptLEvThlw7HLu+Tzy95HyIMK3zehdQ5+AGuzIUPcS/+L4B15wNc/CHwK3HTU0gTextZw5M
	tiTckgTuAZ6ZY55UJhn8N43jRVGgUk+2oRoYnbIjxnTurqZlgtUWARnko9/egCjpMwhQ
X-Google-Smtp-Source: AGHT+IHqLEivGCVvNMQ6NNhVQpp4h9odmjTAzgocmscHHvn9K6CfBFVwrXAxIVu+9+avU/K/FUwa6Q==
X-Received: by 2002:a05:6402:5290:b0:5dc:cfc5:9324 with SMTP id 4fb4d7f45d1cf-5deaddebf28mr1573710a12.30.1739307734700;
        Tue, 11 Feb 2025 13:02:14 -0800 (PST)
Received: from [192.168.1.23] (146.10-240-81.adsl-dyn.isp.belgacom.be. [81.240.10.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7732e70bfsm1132746466b.104.2025.02.11.13.02.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 13:02:14 -0800 (PST)
Message-ID: <fc9e1b15-ed1a-4d7f-aee7-7687e4deaa91@gmail.com>
Date: Tue, 11 Feb 2025 22:02:12 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 3/4] power: supply: axp20x_battery: Update temp sensor
 for AXP717 from device tree
To: Chris Morgan <macroalpha82@gmail.com>, linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org, lee@kernel.org,
 samuel@sholland.org, jernej.skrabec@gmail.com, wens@csie.org,
 conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org, sre@kernel.org,
 Chris Morgan <macromorgan@hotmail.com>
References: <20250204155835.161973-1-macroalpha82@gmail.com>
 <20250204155835.161973-4-macroalpha82@gmail.com>
Content-Language: en-US
From: Philippe Simons <simons.philippe@gmail.com>
In-Reply-To: <20250204155835.161973-4-macroalpha82@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Tested on Allwinner H700 devices.

Tested-by: Philippe Simons <simons.philippe@gmail.com>

On 04/02/2025 16:58, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
>
> Allow a boolean property of "x-powers,no-thermistor" to specify devices
> where the ts pin is not connected to anything. This works around an
> issue found with some devices where the efuse is not programmed
> correctly from the factory or when the register gets set erroneously.
>
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
>   drivers/power/supply/axp20x_battery.c | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
>
> diff --git a/drivers/power/supply/axp20x_battery.c b/drivers/power/supply/axp20x_battery.c
> index 3c3158f31a48..f4cf129a0b68 100644
> --- a/drivers/power/supply/axp20x_battery.c
> +++ b/drivers/power/supply/axp20x_battery.c
> @@ -89,6 +89,8 @@
>   #define AXP717_BAT_CC_MIN_UA		0
>   #define AXP717_BAT_CC_MAX_UA		3008000
>   
> +#define AXP717_TS_PIN_DISABLE		BIT(4)
> +
>   struct axp20x_batt_ps;
>   
>   struct axp_data {
> @@ -117,6 +119,7 @@ struct axp20x_batt_ps {
>   	/* Maximum constant charge current */
>   	unsigned int max_ccc;
>   	const struct axp_data	*data;
> +	bool ts_disable;
>   };
>   
>   static int axp20x_battery_get_max_voltage(struct axp20x_batt_ps *axp20x_batt,
> @@ -984,6 +987,24 @@ static void axp717_set_battery_info(struct platform_device *pdev,
>   	int ccc = info->constant_charge_current_max_ua;
>   	int val;
>   
> +	axp_batt->ts_disable = (device_property_read_bool(axp_batt->dev,
> +							  "x-powers,no-thermistor"));
> +
> +	/*
> +	 * Under rare conditions an incorrectly programmed efuse for
> +	 * the temp sensor on the PMIC may trigger a fault condition.
> +	 * Allow users to hard-code if the ts pin is not used to work
> +	 * around this problem. Note that this requires the battery
> +	 * be correctly defined in the device tree with a monitored
> +	 * battery node.
> +	 */
> +	if (axp_batt->ts_disable) {
> +		regmap_update_bits(axp_batt->regmap,
> +				   AXP717_TS_PIN_CFG,
> +				   AXP717_TS_PIN_DISABLE,
> +				   AXP717_TS_PIN_DISABLE);
> +	}
> +
>   	if (vmin > 0 && axp717_set_voltage_min_design(axp_batt, vmin))
>   		dev_err(&pdev->dev,
>   			"couldn't set voltage_min_design\n");

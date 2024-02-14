Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6447D41A80
	for <linux-sunxi@lists.linux.dev>; Wed, 14 Feb 2024 20:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707942708; cv=none; b=WO/rUKx6sBbXaA4tSFQEM1wKiikXEwFrY06pU1T79nVHlkcnRrXgp4O4n1L9es3kXbtsqAJsFj4lUFddhg6Kh4GWXY9FAaqMP9xOztdxaWhImjFeHmJI9+De3/ub8oIBsRXFFSdBzMofG7tvyBQiKjtAUzwrwrxN+Tytj4Hakg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707942708; c=relaxed/simple;
	bh=Lgk3C099a2KCc+S9pK08eZpliFuZsqBXvxzz2zm7K/M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KGyqUdLeD3UaCGHy69KPTP603fN/IdBYy+EePL3q4iOLzfjb2bH5YeW62e8nZWTzrZDX/t46ZEIF65yNF5yu5wGSCUTzJVtfsQNJXhX5UcT92c5yQ5AuHNle4hYOfdIY233/oAVtfrrTOB6EqibgX9M9EeHa7uKu0pjGnxUj/i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=doLQwaAQ; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="doLQwaAQ"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-411f03e5c46so1160965e9.0
        for <linux-sunxi@lists.linux.dev>; Wed, 14 Feb 2024 12:31:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707942704; x=1708547504; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=poFBgT5whWeYH5dyu5dJ6KrDGN+Ca5xEvs0UEciRlZE=;
        b=doLQwaAQL4OK0qtmwOT4xP2iIL6L3wInh1Z2nmxpuFCpOK2dmNEL3m1itbE7wS2FAt
         btxYJqBhvUqQZEjPAJSrttQhYpSKV6Zpzelev0sNuWFDmv9srUoMSUVUQPMqIRWOBE12
         hy+OloVptfDUGKCbUOeR6vBTwAnLtkPH+l1us1ezcFDP2H+TGNVXADfg2Xv88XWhWMug
         /DuIuB21BTHbiGxRFKhDBBrRgt9/kFoT4WJjxp9wmgpInFwupvqeqCuq4OBTQijAGiA9
         Uts8TTe0ah5forTtoykQR8VJMy7l/mIyGPMoVk4G+r9qt4xKb4vhmkhqg2YaJhLKNVWZ
         UCaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707942704; x=1708547504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=poFBgT5whWeYH5dyu5dJ6KrDGN+Ca5xEvs0UEciRlZE=;
        b=rQGbXyg4yXcS72Lay0WeEnElNYriuPUcCKeIp6hC1BJ5XApPXmuYOxQCPnfuy1Jk6N
         OsNNhpLlo9kJK+d4Q1aOQS1Wk3m3sbdjn9yIV1xaPl50pdUMHmx4ZH6ne+VJptJDkA1U
         DpjTmbKmgVIciYwyPVsJFWXmVzsJEyAAbkzxta2oCOdNyiwLhHdgAdIOq/6l98eD/KDr
         wLKZjUvSHg3nEnElo56meidvaOOibyT4pXkohXOFZtabxgYr/vCB+hID1/qBWY1c2sNz
         2a+Z1N72UgIFEUAxr91D+j5atxsF/PvKBZxp0BzMq0xJ0+y70E6jOc9f92rcEueyJe7J
         BXpA==
X-Forwarded-Encrypted: i=1; AJvYcCXZrGOLeBm3qMto1jrWaclZzV7MhmO1q1W5vZgefI5s1T7xOUeIt46CFuxqLUcUZPNiJkxo8FGC/wJZ2FA50fGsag+8F2Mw94JqiZQ=
X-Gm-Message-State: AOJu0YxK7/meF7tOk9QRa4ItcFOAc/wqFg7T/vabXzjKd/i4sotUpiZM
	9qH1VtOht/7X9ATqE8mvk8V91XGj+I8gdXKuVGLz1eACM3PXHLzu
X-Google-Smtp-Source: AGHT+IHdHTJdArjAeA9q7r6aKMEmpLgsuX56jLcA4O41GZ4yoXGsnDo4teq/QnLJlTqSAuXSDaOkNw==
X-Received: by 2002:a05:600c:5107:b0:411:c8a7:7b6e with SMTP id o7-20020a05600c510700b00411c8a77b6emr3006463wms.10.1707942704547;
        Wed, 14 Feb 2024 12:31:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUl+MJ6r0kdZ0I0u2FKzvWnTzN1C98F8FB1kXY0mHVsijNsLwnLQDFkSUGlQkaQ0GAf6l3aXN/nTCEQ182oH1u6mixlFKc20elJGyfWwZiMdg9zxVeoM0HDDeWl4cHdueaiU4GJE9wGgjalvq7YUceCmyJlCW7OPXNbAye1CFOUfq8lG7OaSCUF0GXK8Yz5T9gq4Qs/dhb1bE9UUU/wcp+UB2MIqLUDHF9jqiIW8HbqTHvqp8nBr3AbkaPxlxsVcCeZx25luYeJCqi4985jLtm7yIWwYXvrWmgQ2E1Iopktxoi0PO5YPihoX14Bpv5CUIPk3NMfKTfp7icHgsFNqj69RDAK/M2Ps4P7FO9lhuRh/texyxxaIdLtS60aZXMHvAqGQ6KFlCh3PgjRhGbnrt2fNXJgyouZW6Uh6a1Yvk4jKwLuB+qbXyQmJ6tmxsrFCOP1QTWPNuzJs/STY8d1paxa6VNPJ7WAjSdoHZ12gFWg0EMfeyOP+D4AuPmxfpI0EeDX30og2hfGQekJoIVboNnpxBX2NyA4+rwnUy0/ENBbr+T+OGgtwy1ls7ymS/nA8I3t9UB0KJCf9qkFAALkx++Cbih4lz6pgYFr57FVgiisbG50bpcShg==
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id bt9-20020a056000080900b0033b75d0993esm12320613wrb.74.2024.02.14.12.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 12:31:44 -0800 (PST)
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
Subject: Re: [PATCH v4 3/7] thermal: sun8i: explain unknown H6 register value
Date: Wed, 14 Feb 2024 21:31:42 +0100
Message-ID: <3274538.aeNJFYEL58@jernej-laptop>
In-Reply-To: <20240209144221.3602382-4-andre.przywara@arm.com>
References:
 <20240209144221.3602382-1-andre.przywara@arm.com>
 <20240209144221.3602382-4-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 09. februar 2024 ob 15:42:17 CET je Andre Przywara napisal(a):
> So far we were ORing in some "unknown" value into the THS control
> register on the Allwinner H6. This part of the register is not explained
> in the H6 manual, but the H616 manual details those bits, and on closer
> inspection the THS IP blocks in both SoCs seem very close:
> - The BSP code for both SoCs writes the same values into THS_CTRL.
> - The reset values of at least the first three registers are the same.
> 
> Replace the "unknown" value with its proper meaning: "acquire time",
> most probably the sample part of the sample & hold circuit of the ADC,
> according to its explanation in the H616 manual.
> 
> No functional change, just a macro rename and adjustment.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Nice!

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/thermal/sun8i_thermal.c | 29 ++++++++++++++++-------------
>  1 file changed, 16 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/thermal/sun8i_thermal.c b/drivers/thermal/sun8i_thermal.c
> index 6a8e386dbc8dc..42bee03c4e507 100644
> --- a/drivers/thermal/sun8i_thermal.c
> +++ b/drivers/thermal/sun8i_thermal.c
> @@ -50,7 +50,8 @@
>  #define SUN8I_THS_CTRL2_T_ACQ1(x)		((GENMASK(15, 0) & (x)) << 16)
>  #define SUN8I_THS_DATA_IRQ_STS(x)		BIT(x + 8)
>  
> -#define SUN50I_THS_CTRL0_T_ACQ(x)		((GENMASK(15, 0) & (x)) << 16)
> +#define SUN50I_THS_CTRL0_T_ACQ(x)		(GENMASK(15, 0) & ((x) - 1))
> +#define SUN50I_THS_CTRL0_T_SAMPLE_PER(x)	((GENMASK(15, 0) & ((x) - 1)) << 16)
>  #define SUN50I_THS_FILTER_EN			BIT(2)
>  #define SUN50I_THS_FILTER_TYPE(x)		(GENMASK(1, 0) & (x))
>  #define SUN50I_H6_THS_PC_TEMP_PERIOD(x)		((GENMASK(19, 0) & (x)) << 12)
> @@ -410,25 +411,27 @@ static int sun8i_h3_thermal_init(struct ths_device *tmdev)
>  	return 0;
>  }
>  
> -/*
> - * Without this undocumented value, the returned temperatures would
> - * be higher than real ones by about 20C.
> - */
> -#define SUN50I_H6_CTRL0_UNK 0x0000002f
> -
>  static int sun50i_h6_thermal_init(struct ths_device *tmdev)
>  {
>  	int val;
>  
>  	/*
> -	 * T_acq = 20us
> -	 * clkin = 24MHz
> -	 *
> -	 * x = T_acq * clkin - 1
> -	 *   = 479
> +	 * The manual recommends an overall sample frequency of 50 KHz (20us,
> +	 * 480 cycles at 24 MHz), which provides plenty of time for both the
> +	 * acquisition time (>24 cycles) and the actual conversion time
> +	 * (>14 cycles).
> +	 * The lower half of the CTRL register holds the "acquire time", in
> +	 * clock cycles, which the manual recommends to be 2us:
> +	 * 24MHz * 2us = 48 cycles.
> +	 * The high half of THS_CTRL encodes the sample frequency, in clock
> +	 * cycles: 24MHz * 20us = 480 cycles.
> +	 * This is explained in the H616 manual, but apparently wrongly
> +	 * described in the H6 manual, although the BSP code does the same
> +	 * for both SoCs.
>  	 */
>  	regmap_write(tmdev->regmap, SUN50I_THS_CTRL0,
> -		     SUN50I_H6_CTRL0_UNK | SUN50I_THS_CTRL0_T_ACQ(479));
> +		     SUN50I_THS_CTRL0_T_ACQ(48) |
> +		     SUN50I_THS_CTRL0_T_SAMPLE_PER(480));
>  	/* average over 4 samples */
>  	regmap_write(tmdev->regmap, SUN50I_H6_THS_MFC,
>  		     SUN50I_THS_FILTER_EN |
> 





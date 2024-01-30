Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3617B3FE
	for <linux-sunxi@lists.linux.dev>; Tue, 30 Jan 2024 19:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706643679; cv=none; b=RTy+8hzJGS6mG1Cn5n1NS4eNX9VmSZoJE6XHJbss9mgLTewm+NfUXW2NV+cAbq4k+M9NSofkt/8IuJmu5c7ddH9jHu+cOghHeinFkBsZSK7Fw2oWjS9HkcFxQC5c0HkVXhV1SrKnRjPt+baKYm6SfAs1WTj4p0GM2FK509L7FEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706643679; c=relaxed/simple;
	bh=ZakAYJ6X0FFXo6NSxcBi61+Uh2uav76kYOltLGTxBIg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QrmpZ2LN4OH/Ao97Ephh201//jYKUOiLRQrzXjINf4j8TsjHbe7raKFBju//vPtRnaJLkWoTDqyFdzji1H3+5bEY4zmoqYhE0xTAPiFBdFGRhzB1NvfzZLesK8Db2KAAXqL+c1rmtEKcTnt5QAPpNGXu6uw3tp5jc4g/Glg0AIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hBa+7Wxa; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hBa+7Wxa"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-55f0b2c79cdso3702713a12.3
        for <linux-sunxi@lists.linux.dev>; Tue, 30 Jan 2024 11:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706643676; x=1707248476; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tV2jTL1wgNtNZ2OFkWSlg5EStCwbj+Bl8szw2VZf79I=;
        b=hBa+7Wxap5IDeJmGiMbY/97JVwJrmF80M4AOrlB0H5D6O0MgsWVHlsxpdR5f9nTxy5
         Ged8sqYaTnWA1sRE+/KRj6bgzGQMLc06Z9mq3bYK5XXyHn2GDGUxLeY7FmwRuKC6b6PX
         IeGtSLGiEuyTi0e3aXTGLjniYGbz7N/nQyPeaXSFnTng9rYjDqA/JwvMJXiZl8p3mH9s
         +y8jvL/uT4m0/Nd1XBwOjUBJ33NR+lUdvuwqkKs5ERqXmjzIFlvWCdfDwDwvqYyb4vOk
         F4evmLI5MzpYqlYefZLEVsmcFYWB0rfflVg9LunwsMvhSz4lurHpvjSXKExg3BKSHqe/
         8BCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706643676; x=1707248476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tV2jTL1wgNtNZ2OFkWSlg5EStCwbj+Bl8szw2VZf79I=;
        b=Pc/kui8vaosmQ/0KyXEinLMklx9aXC7eyv3/WJdVueVWLm98PgE/Ylspp0ZhZYXV3a
         4qUdqOkQC0ZjSV9ckSmK6EWuBCpcfF4spenhuQuBfXzvSAOqexWxH1TWdSOM68ZIkfrX
         QtKCmIPVrrz2dyjE9EE1bj0OvzSKxFmqXd8aAvq2y0YHhJ99Y8mbqbulie5SYWg87Kq4
         8FqK2O9/Wvuu1yopum3CZ1szmjwOnbkgObOSYkRe0gdagV2SJ3PIYLngnXuEkptfqMGm
         OjfoME545BAfveWrD11/Yflj115FxrCsKD6cqavfPW/69zUfuZlsS0izUF+gKYq5/Sy2
         rVSg==
X-Gm-Message-State: AOJu0YwM06YQjLkffAOIpY9dCa3WH3oY1E9wBGCLCnGUg+kSsxSJBi2x
	kMDCs0/s7iNnI4jiT8WIjhiHNatP7dnxceMPEYS9ruRBoaoSB7q+
X-Google-Smtp-Source: AGHT+IEVIjesSyztYMsiKeNJdYkDMf1U0WWfhSyU1fnCnWNWHFxpNaNAcQzT6VdSd3W0piensaNZ3A==
X-Received: by 2002:a05:6402:40c4:b0:55f:7a8:fdf1 with SMTP id z4-20020a05640240c400b0055f07a8fdf1mr4814703edb.29.1706643676208;
        Tue, 30 Jan 2024 11:41:16 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-14-70.dynamic.telemach.net. [86.58.14.70])
        by smtp.gmail.com with ESMTPSA id i36-20020a0564020f2400b0055effc1e4basm2448375eda.24.2024.01.30.11.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 11:41:15 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-kernel@vger.kernel.org, Aren Moynihan <aren@peacevolution.org>
Cc: Miles Alan <m@milesalan.com>, Ondrej Jirman <megi@xff.cz>,
 Aren Moynihan <aren@peacevolution.org>, Chen-Yu Tsai <wens@csie.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Samuel Holland <samuel@sholland.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject:
 Re: [PATCH 3/4] arm64: dts: sun50i-a64-pinephone: add multicolor led node
Date: Tue, 30 Jan 2024 20:41:14 +0100
Message-ID: <4864457.GXAFRqVoOG@jernej-laptop>
In-Reply-To: <20240128204740.2355092-3-aren@peacevolution.org>
References:
 <20240128204740.2355092-1-aren@peacevolution.org>
 <20240128204740.2355092-3-aren@peacevolution.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne nedelja, 28. januar 2024 ob 21:45:09 CET je Aren Moynihan napisal(a):
> The red, green, and blue leds currently in the device tree represent a
> single rgb led on the front of the PinePhone.
> 
> Signed-off-by: Aren Moynihan <aren@peacevolution.org>
> ---
> 
>  .../boot/dts/allwinner/sun50i-a64-pinephone.dtsi    | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
> index ad2476ee01e4..6eab61a12cd8 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
> @@ -39,21 +39,21 @@ chosen {
>  	leds {
>  		compatible = "gpio-leds";
>  
> -		led-0 {
> +		led0: led-0 {
>  			function = LED_FUNCTION_INDICATOR;
>  			color = <LED_COLOR_ID_BLUE>;
>  			gpios = <&pio 3 20 GPIO_ACTIVE_HIGH>; /* PD20 */
>  			retain-state-suspended;
>  		};
>  
> -		led-1 {
> +		led1: led-1 {
>  			function = LED_FUNCTION_INDICATOR;
>  			color = <LED_COLOR_ID_GREEN>;
>  			gpios = <&pio 3 18 GPIO_ACTIVE_HIGH>; /* PD18 */
>  			retain-state-suspended;
>  		};
>  
> -		led-2 {
> +		led2: led-2 {
>  			function = LED_FUNCTION_INDICATOR;
>  			color = <LED_COLOR_ID_RED>;
>  			gpios = <&pio 3 19 GPIO_ACTIVE_HIGH>; /* PD19 */
> @@ -61,6 +61,13 @@ led-2 {
>  		};
>  	};
>  
> +	multi-led {
> +		compatible = "leds-group-multicolor";
> +		color = <LED_COLOR_ID_RGB>;
> +		function = LED_FUNCTION_INDICATOR;

Does it make sense to have function specified here and above? Example
specifies it only in multi-led node.

Best regards,
Jernej

> +		leds = <&led0>, <&led1>, <&led2>;
> +	};
> +
>  	reg_ps: ps-regulator {
>  		compatible = "regulator-fixed";
>  		regulator-name = "ps";
> 





Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D0C50271
	for <linux-sunxi@lists.linux.dev>; Mon,  5 Feb 2024 18:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707157609; cv=none; b=Q+tDR3cNpyTzWOqurD/AjP2xBdtLGlW8WMNpnusqiPuK66JNmKDumFhPuOUb17Gzk8Jw5L6vZDEifwsG/BVE7dto9merditt3mZNA/Jnaau9/XhUdbhuCvRi8VFwHxfjGPe4QAg7yGDzmb+Y+XbsJTBV0J7vKc72+Fipu909Beo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707157609; c=relaxed/simple;
	bh=NovobhLMJgkAhGKgjW4R1wRviZdr2V6VzfiJFjt5y0M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SpKlrii0WPr63NHcCloZjf2EPRZuKQ9FAtec5Cki27xIsSRfCHUuQmnxlfj3EvErD3keCvvKPbvQ7gFYmwdr4bZsX3Ydj+DF43KzB2aFA3YloOEA1AK/hxusPyR/1DMI3+BajBWF63ga1218g/EirzM3fVeZ0e3tJHTpbJ38unw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PcxHJO93; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PcxHJO93"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-40fdf3bd1f8so2945855e9.3
        for <linux-sunxi@lists.linux.dev>; Mon, 05 Feb 2024 10:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707157606; x=1707762406; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=htnHzi3tYpUcAcax9Oehk8o5es8Q9nPqVSuo3cjUUGU=;
        b=PcxHJO934gC0FiTvFF9tUnSyknWnIzVvOXrEZG1VOC7P93LK94x7YHxppV1IQs6Vhy
         +6eZKP0ypi62/R+o0ZzoDjmeGbF33OxfwDhSCx3vtHBE2DLlilEOQRXhkB0VI4rgVgSh
         bhWkumwK9E5hUCKZgPFZVJpZY7wxOKBiiJ/li1HH9gQ5kc5hbaFzIOEwmv5vxBGpw5g1
         jE/85sZny+YLT/QTCsXyzD5rjZnjZ0TxwPdz/LyM4l7EJFh+mvoZr9hhl90WNSXH7VHN
         Nflmq/piZ11NNn1qAaF5ppZoCaCG3tNpGh4/xpM6iw8BxAXvEuPHlznYljbIri7gVC7O
         fb9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707157606; x=1707762406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=htnHzi3tYpUcAcax9Oehk8o5es8Q9nPqVSuo3cjUUGU=;
        b=l6YK0/YowzxE688ZmflXbDotvH9YdoeBe2mtahPr7Mf81/VVZ3bmPrWC2Ia7wcBF0m
         AjCgRCcKEkNulATreSZmcX/kOX1A05mVXimOb3NyWgOs+wBzJb9VTR1BihSTR1KbYkcB
         bURWjDg8d/HzgYSU/0VIF89Vi7A3AMB5oeGPW4AptUSPhM1QCK88ywd+uEoP+AV0naur
         8WE1AynjpDsfMs7crQNpiF3pBHblKhY5gaLZPZuwTi1VoZ61A8pQh6L092schqKnba2b
         V1uYaMHoeUtptdNGZbbMJ8ph7D6TVaky/agFgjs0QVGhzdcftvKTvDlA+1serZHeXm8V
         pX5g==
X-Gm-Message-State: AOJu0YyPXlXn8SH9nujnq06kflL2cwxdjLL8D5u+NRygrho0wpI0a+w0
	qO8QxYFWOgJ/YPogp/jq1JWbbgzTnQzY010bD98hrt7JwW1QjPMS
X-Google-Smtp-Source: AGHT+IH6pzS+IInTWVn7w59ky+Wlg99QOSRBzzf1n7yhhA/HlTNk3TE1U1UHdYIHMwb4Ko/p8+4j6Q==
X-Received: by 2002:a05:600c:34c1:b0:40f:afe1:c9f8 with SMTP id d1-20020a05600c34c100b0040fafe1c9f8mr417092wmq.12.1707157606004;
        Mon, 05 Feb 2024 10:26:46 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUflLI3w/4X1P/D7ar2lgRwUSNe/Xru+Ga7BxWIpMyTmzBj5kwxROHOXKM18YZtZwbJgY3rzK/dojaOKtjV/Qf/XWKPSTMiDYnH+sxUL7c7o8AfriEYr8vBxr5hLlKrhHFhe1/0iB6S19mf7QoPFLNfNN0WiyaswQ4ZLhK77Qj6dqL4KgAz7Krkl6odaQInzbUvFKFIrHgrWJDIMsXeWNARhA515HjaYCZ+c3Lr5GpaI4pwFl/yGBqv/Q829+Pu0wkV54kTdzPRHIMonSr+IIQ2p9cSiPIjn7/gXC5rJ8wmYbTOvIznvSbLPrBOIk+4Cs06JZm4sFWEmDfeX+kgyykqrw==
Received: from jernej-laptop.localnet (82-149-13-182.dynamic.telemach.net. [82.149.13.182])
        by smtp.gmail.com with ESMTPSA id y8-20020adffa48000000b0033af670213dsm178914wrr.110.2024.02.05.10.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 10:26:45 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Andre Przywara <andre.przywara@arm.com>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Nick Alilovic <nickalilovic@gmail.com>
Subject:
 Re: [PATCH 2/2] arm64: dts: allwinner: Transpeed 8K618-T: add WiFi nodes
Date: Mon, 05 Feb 2024 19:26:44 +0100
Message-ID: <8371906.NyiUUSuA9g@jernej-laptop>
In-Reply-To: <20240204093255.148972-3-andre.przywara@arm.com>
References:
 <20240204093255.148972-1-andre.przywara@arm.com>
 <20240204093255.148972-3-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne nedelja, 04. februar 2024 ob 10:32:55 CET je Andre Przywara napisal(a):
> In contrast to other devices using Allwinner SoCs, the Transpeed 8K618-T
> TV box uses a mainline supported WiFi chip: it's a Broadcom 4335
> compatible, packaged by a company called Murata.
> It works nicely with the Linux driver, when providing the respective
> firmware files.
> 
> Add the required DT nodes to let the kernel find the SDIO device.

Can you reword message in a way to omit Linux?

> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  .../sun50i-h618-transpeed-8k618-t.dts         | 23 +++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dts b/arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dts
> index 8ea1fd41aeba..7ec4098e707b 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dts
> @@ -16,6 +16,7 @@ / {
>  
>  	aliases {
>  		serial0 = &uart0;
> +		ethernet1 = &sdio_wifi;
>  	};
>  
>  	chosen {
> @@ -39,6 +40,15 @@ reg_vcc3v3: vcc3v3 {
>  		regulator-max-microvolt = <3300000>;
>  		regulator-always-on;
>  	};
> +
> +	wifi_pwrseq: wifi_pwrseq {
> +		compatible = "mmc-pwrseq-simple";
> +		clocks = <&rtc CLK_OSC32K_FANOUT>;
> +		clock-names = "ext_clock";
> +		pinctrl-0 = <&x32clk_fanout_pin>;
> +		pinctrl-names = "default";
> +		reset-gpios = <&pio 6 18 GPIO_ACTIVE_LOW>; /* PG18 */
> +	};
>  };
>  
>  &ehci0 {
> @@ -60,6 +70,19 @@ &mmc0 {
>  	status = "okay";
>  };
>  
> +&mmc1 {
> +	vmmc-supply = <&reg_dldo1>;
> +	vqmmc-supply = <&reg_aldo1>;
> +	mmc-pwrseq = <&wifi_pwrseq>;
> +	bus-width = <4>;
> +	non-removable;
> +	status = "okay";
> +
> +	sdio_wifi: wifi@1 {
> +		reg = <1>;
> +	};

I don't think this node and alias are useful in any way. SDIO scan will find
device regardless and potential mac property set up by bootloader will be
ignored anyway.

Best regards,
Jernej

> +};
> +
>  &mmc2 {
>  	vmmc-supply = <&reg_dldo1>;
>  	vqmmc-supply = <&reg_aldo1>;
> 





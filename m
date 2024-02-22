Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B6473F2F
	for <linux-sunxi@lists.linux.dev>; Thu, 22 Feb 2024 20:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708635426; cv=none; b=NqsXvQzbwZOkgYaxYii8gGJN6dibuRNmQYtG6r7kXLo50hry89rR3iVl3kXV4ice6tW7iVjmpyvZ+P17QjHF4FXMidWDM9RF7iywdH066/DSYvdXzoBq/CpDmTBUvE1UlvSn7rqofI634Du9iNE+9q2WSJPKUiS9SK7i+FCGkKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708635426; c=relaxed/simple;
	bh=ZXL/20AOlmDgfRX36Nzj4Pff74rf6CTLJF/MqrlGbAc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=azjXMUXH+lzE5RNmJVr2Ux7N2c0WEbf2VU6gjhfaRo8Bgnic1lRBQkvtJX1FsTOPHbM1qSjr3ki32v79sxC5/2eOyxhPAMgxyHHJy20qZ6Hvexjz32+SJnKHLJ9DUBTq6RMV5APOrYcGpDr1Mpn0wcZ2/YgKHcg43T8Z/EWpTy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gkOD3VY2; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gkOD3VY2"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-563c403719cso78752a12.2
        for <linux-sunxi@lists.linux.dev>; Thu, 22 Feb 2024 12:57:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708635423; x=1709240223; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k2R6exNFMuMyEP9Zs0TU701ZxYwzvvvAfOU9DIEkDzQ=;
        b=gkOD3VY2Sg4LnCE5vjRYLkfBCgTu0B+NtvKbnRE11YpEP5I19iYVB9/Gv/Cyx93f2z
         zbCJPAX3LTARwWgLA7xfi0FCvY4Qz7TJRCUgmyyYSK+ZOu2hB2ljQF4qrKLdWkfQ7DQP
         rZDDZ04Ipxa8FAqbyCvX2wlfhenVyZn+KDVav15DTmho1DNow3Cu0xiXTeMFrlsskDVq
         mtphvlv3Ow3/xgHgaCnOWNqiV3zby3pX7fPWwLAv6g/0i8kNM0f8b5BxQ2p/KuFfMKC+
         ufpDLQItad+og8yj5atzyeojzaqV0Puyqy7m3M7eIxnqLQhak9EwGJRuWPYjfO8EUbB4
         I8Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708635423; x=1709240223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k2R6exNFMuMyEP9Zs0TU701ZxYwzvvvAfOU9DIEkDzQ=;
        b=O8omsH63eKTtJ++7dewF1mX7dbeMZK7KCH0VkE4x/gFynfMSQ+Eqf8G4cpBqXRKpil
         5tQ7p311OUmOzM0EKL+Pj+jh7KTjtXkD1Dp4dA1EspMLIvh2N3YmV0n/aFSCa5404Qiq
         Z1vSyTOQAbqHPDEg4LUFTLc+ReL1kSsYa4z0V1MmzjB8Qgsrs4ZhZ72Vh878MhqtdKTe
         Zr2GwDCqe9M9OtcAhQUs9nHHC3G5eMCZYYtZAuAyuBgAFbk0xcIx9hZY8SztIFoIIAiz
         XnbWbk7QWEM5w2lM+86Stcl8853G+kmNqtvNwo4sNTRH2QODos61N55xFE2vQVdz6kdR
         V0DA==
X-Forwarded-Encrypted: i=1; AJvYcCX40DSRonvuVJUMPlk5Xq75OQFdomYBWFw9i1sMpr8EBmE3BYYQo3fA84morK3rEC0Dy3pDJCRq4LTmjyXMTmJgeG/mHgmrQRx4NeU=
X-Gm-Message-State: AOJu0Yy5ciOutk3SLJLEHyhbSX9DnTauBPpvlElbZmZDNWhWL/MeNYKo
	JLAf86N+Lpbu4NQHvGmETJKTax1ctIDKDY6yzi8/JY0TxOkt1M7T
X-Google-Smtp-Source: AGHT+IE/qvrg3YIq3JMhwgKa7j4LV2SY69KS3EGu1YYakjYgPPsfh2dUaKoCvH0+xzFJkFJVYOeQJA==
X-Received: by 2002:a50:cd58:0:b0:563:e5e0:85e1 with SMTP id d24-20020a50cd58000000b00563e5e085e1mr16447362edj.25.1708635422647;
        Thu, 22 Feb 2024 12:57:02 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id r21-20020a50d695000000b00563f3ee5003sm6120860edi.91.2024.02.22.12.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 12:57:02 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-kernel@vger.kernel.org, Aren Moynihan <aren@peacevolution.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 Jean-Jacques Hiblot <jjhiblot@traphandler.com>, Chen-Yu Tsai <wens@csie.org>,
 Ondrej Jirman <megi@xff.cz>, linux-sunxi@lists.linux.dev,
 Lee Jones <lee@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 linux-arm-kernel@lists.infradead.org, linux-leds@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Miles Alan <m@milesalan.com>,
 Samuel Holland <samuel@sholland.org>, Aren Moynihan <aren@peacevolution.org>
Subject:
 Re: [PATCH v2 4/4] arm64: dts: sun50i-a64-pinephone: change led type to
 status
Date: Thu, 22 Feb 2024 21:57:00 +0100
Message-ID: <2792937.BEx9A2HvPv@jernej-laptop>
In-Reply-To: <20240206185400.596979-4-aren@peacevolution.org>
References:
 <20240206185400.596979-1-aren@peacevolution.org>
 <20240206185400.596979-4-aren@peacevolution.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne torek, 06. februar 2024 ob 19:13:20 CET je Aren Moynihan napisal(a):
> The status function is described in the documentation as being a rgb led
> used for system notifications on phones[1][2]. This is exactly what this
> led is used for on the PinePhone, so using status is probably more
> accurate than indicator.
> 
> 1: Documentation/leds/well-known-leds.txt
> 2: include/dt-bindings/leds/common.h
> 
> Signed-off-by: Aren Moynihan <aren@peacevolution.org>

Sorry for late review.

Please update subject in patches 2-3. Instead of "sun50i-a64-pinephone:"
use "allwinner: pinephone:" (check commit history of sun50i-a64-pinephone.dtsi).
Also rgb -> RGB, led -> LED. Last, please reword commit message to exclude
links and just say DT bindings documentation.

Note that I'll merge patches 2-3 once patch 1 is merged.

Best regards,
Jernej

> ---
> I can't find any documentation describing the indicator function, so
> it's definitely less specific than status, but besides that I'm not sure
> how it compares. Please ignore this patch if it's not useful.
> 
> (no changes since v1)
> 
>  arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
> index e53e0d4579a7..6d327266e6cc 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
> @@ -61,7 +61,7 @@ led2: led-2 {
>  	multi-led {
>  		compatible = "leds-group-multicolor";
>  		color = <LED_COLOR_ID_RGB>;
> -		function = LED_FUNCTION_INDICATOR;
> +		function = LED_FUNCTION_STATUS;
>  		leds = <&led0>, <&led1>, <&led2>;
>  	};
>  
> 





Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD8D111A8
	for <linux-sunxi@lists.linux.dev>; Sat, 18 Nov 2023 21:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZetJYqoC"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-9f27af23443so436566366b.0
        for <linux-sunxi@lists.linux.dev>; Sat, 18 Nov 2023 13:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700344414; x=1700949214; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wtt/oFJ6mp4pvc5MxO64v8GI8P+1Sx5CjrqoYf23NVA=;
        b=ZetJYqoCkbaHe2bDd5wP/oXLR3OMowJXVBISjw5g/c6s2KNFzzyAl08faOTWtrm/Sk
         jUk3Bcn50metmF4iOnVmiV+v5rf3pAPS67gavLoeq5tw7poh/7/TqSjV1XAWiJwBiNvU
         zyE5PG0+Xg+MiBwXrY11jSNxSL9O1lLdWpU/j+sgaIsgsZ12Bzy8T+JqD3GkSicelF+H
         MAH5RnGVKfAwFw+bCNi4XOqlVNszyJbtxGOM7euKAnv9vPWQ6MWFkgVVeqaLyROc0Yha
         cib3YowZJUlNWBpFIVaO/WVDGLtXcVYgFjxdA9JcHsnCG8ROJBUZIgczbYMgXTPA6Jl0
         Yn5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700344414; x=1700949214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wtt/oFJ6mp4pvc5MxO64v8GI8P+1Sx5CjrqoYf23NVA=;
        b=WSYnx5XmceRnzAO78rEatQ4hBhPBh7nCMXa6HNsolUkd2qtiOo23jChcV2BcYoEtmo
         rs0+VL4nqs8NMiW1AkSAaF2bP1ZiSqnd9SS2gsUNwXDAph71k2Ke6RM71zOriQyrhotB
         xezJCcVVgi99FAeKFv1Yzq7y4fsI+K+wlsj0rsDZB8uoV1Q36hG7q/JIhR+DmL5mIdCw
         kuPq74IeiWuBmX/24vin3sVHR9Ko6MQWzRUPOZjba/xidfbP7auGTY/CjoEP7GlySot6
         PbFpHa28byg3xwYDo0XXPa/R6iidRgnsXwGI9tDCT0mxEC6N2Ct8QR4UTHulwmNpBmZk
         vA2A==
X-Gm-Message-State: AOJu0Yx8gC0I2CDveCMCmV3fmxUAjaUFGb6nytQQw8fWKl9IZXNzPyZv
	pNxEKKXjxtEoiav+6jFDauo=
X-Google-Smtp-Source: AGHT+IEsj8NvVPt+C+yDrHzdKUUesSpB0lSD7yp/W/7z0ksNKCl2sWrmAL563BNLNRtvG/DBVkqbfw==
X-Received: by 2002:a17:907:7401:b0:9bf:60f9:9b7c with SMTP id gj1-20020a170907740100b009bf60f99b7cmr1955872ejc.62.1700344413958;
        Sat, 18 Nov 2023 13:53:33 -0800 (PST)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id ca3-20020a170906a3c300b009fc42f37970sm296837ejb.171.2023.11.18.13.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Nov 2023 13:53:33 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Samuel Holland <samuel@sholland.org>,
 Andre Przywara <andre.przywara@arm.com>, Chen-Yu Tsai <wens@csie.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Chukun Pan <amadeus@jmu.edu.cn>
Subject:
 Re: [PATCH v2 1/1] arm64: dts: allwinner: h616: update emac for Orange Pi
 Zero 3
Date: Sat, 18 Nov 2023 22:53:32 +0100
Message-ID: <2303336.ElGaqSPkdT@jernej-laptop>
In-Reply-To: <20231029074009.7820-2-amadeus@jmu.edu.cn>
References:
 <20231029074009.7820-1-amadeus@jmu.edu.cn>
 <20231029074009.7820-2-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne nedelja, 29. oktober 2023 ob 08:40:09 CET je Chukun Pan napisal(a):
> The current emac setting is not suitable for Orange Pi Zero 3,
> move it back to Orange Pi Zero 2 DT. Also update phy mode and
> delay values for emac on Orange Pi Zero 3.
> With these changes, Ethernet now looks stable.
> 
> Fixes: 322bf103204b ("arm64: dts: allwinner: h616: Split Orange Pi Zero 2 DT")
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi | 3 ---
>  arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts | 3 +++
>  arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dts | 2 ++
>  3 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi
> index 15290e6892fc..fc7315b94406 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi
> @@ -68,10 +68,7 @@ &ehci1 {
>  &emac0 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&ext_rgmii_pins>;
> -	phy-mode = "rgmii";
>  	phy-handle = <&ext_rgmii_phy>;
> -	allwinner,rx-delay-ps = <3100>;
> -	allwinner,tx-delay-ps = <700>;
>  	status = "okay";
>  };
>  
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
> index d83852e72f06..b5d713926a34 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
> @@ -13,6 +13,9 @@ / {
>  };
>  
>  &emac0 {
> +	allwinner,rx-delay-ps = <3100>;
> +	allwinner,tx-delay-ps = <700>;
> +	phy-mode = "rgmii";
>  	phy-supply = <&reg_dcdce>;
>  };
>  
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dts b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dts
> index 00fe28caac93..b3b1b8692125 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dts
> @@ -13,6 +13,8 @@ / {
>  };
>  
>  &emac0 {
> +	allwinner,tx-delay-ps = <700>;
> +	phy-mode = "rgmii-rxid";
>  	phy-supply = <&reg_dldo1>;
>  };
>  
> 





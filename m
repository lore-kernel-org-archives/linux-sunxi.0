Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB85653
	for <linux-sunxi@lists.linux.dev>; Thu, 11 May 2023 16:11:53 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-965ddb2093bso1255341866b.2
        for <linux-sunxi@lists.linux.dev>; Thu, 11 May 2023 09:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683821512; x=1686413512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uWK7qDz8RPMSviiiyfY3G5jruaPWYFOFowQ8o3R6mq8=;
        b=omJKwP23WFR5KuQff4NgapjomKQAFdT7hovJKKJfj6juTL7gGiotD2u1rCDtvSGdMv
         iYAx+he6azKGvyO+DKsnm5+lhF+5h2xAfBw4rh9ygDVAVEKKFCbDMGY5oyuzcney19zg
         MESGtElAM0O8bVjtq9IJ7XxJFCJTVx29y5tWYNw5QeQEM/eJKmmjyVeH9lIPcqFGCup2
         3kMeLU8NjmyNtwc7PMK0rzgaombuKw+HhjDIpLHTzZ63mkjoBbyPeFQtqIGdD698RwDu
         mTTkb72bPAR6IhhSG7NbEYWst0nzwXacYO62eAqkaIT3CLD75pLoYdWT6EOFE1AJe8Zz
         J+VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683821512; x=1686413512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uWK7qDz8RPMSviiiyfY3G5jruaPWYFOFowQ8o3R6mq8=;
        b=IdK5tuN614p9EylC9mmvoP4GL3uG7EFqOOHut4kN9/ZguuZVUik2tahkbgQ/LUHj+4
         rHTcaq328VMww/ZMQwy1wNY2bmd5IKn3PwknTjUXAIZ5FhK+NyYiyLG3C+Vnmtqpmsod
         qrliv10k+8caCoi5Ml+ZSdtW1GmZSmH3FZTYNfUFMC936LZqoTNdmIoDX2XfXiIJkSEu
         7S22DKfz1A1tglko8mE9bk7eQZnnS5H91I33TFV1P11pbw63cA/xeb1XdX8DNrrN95/1
         qzfOHjjX2+5SAi4FhcF0355lBTpp3xqWD5TI3PGMr8dcUC1eZz4teVYYLq1Fr0B6Ck2i
         ZWGQ==
X-Gm-Message-State: AC+VfDwMQplNfxVAPwgh7xWs6452rGDj7kQg+dWyKOUXXROufhvkDfYY
	fVcN35G6ucFYxNJh+8ciq1c=
X-Google-Smtp-Source: ACHHUZ6Lmc3sardBsQBIfPjvoITG/uJxmxJi4Pt78kdGUOrIxAirKu3/SHWWN/4TwxIWq3sUTaAJOA==
X-Received: by 2002:a17:906:fe01:b0:94f:322d:909d with SMTP id wy1-20020a170906fe0100b0094f322d909dmr19150863ejb.63.1683821511528;
        Thu, 11 May 2023 09:11:51 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id i18-20020a1709067a5200b009661afd3b86sm4256577ejo.171.2023.05.11.09.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 09:11:51 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Conor Dooley <conor+dt@kernel.org>,
 Jonathan McDowell <noodles@earth.li>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org
Subject:
 Re: [PATCH v2 5/5] ARM: dts: axp209: Add iio-hwmon node for internal
 temperature
Date: Thu, 11 May 2023 18:11:49 +0200
Message-ID: <3421275.QJadu78ljV@jernej-laptop>
In-Reply-To:
 <2a9bd53a65c4a154cccba622c60cbffcdceaeb95.1683719613.git.noodles@earth.li>
References:
 <cover.1681580558.git.noodles@earth.li>
 <cover.1683719613.git.noodles@earth.li>
 <2a9bd53a65c4a154cccba622c60cbffcdceaeb95.1683719613.git.noodles@earth.li>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sreda, 10. maj 2023 ob 14:02:28 CEST je Jonathan McDowell napisal(a):
> This adds a DT node to hook up the internal temperature ADC to the
> iio-hwmon driver. The various voltage + current ADCs are consumed and
> exposed by their respective drivers, but this is not and is always
> available. Naming chosen to match the axp20x_ prefix the power sensors
> use.

Sorry for maybe obvious thing, but where are other ADC channels exposed?

Best regards,
Jernej

> 
> Signed-off-by: Jonathan McDowell <noodles@earth.li>
> ---
>  arch/arm/boot/dts/axp209.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/axp209.dtsi b/arch/arm/boot/dts/axp209.dtsi
> index ca240cd6f6c3..469d0f7d5185 100644
> --- a/arch/arm/boot/dts/axp209.dtsi
> +++ b/arch/arm/boot/dts/axp209.dtsi
> @@ -48,6 +48,13 @@
>   * http://dl.linux-sunxi.org/AXP/AXP209%20Datasheet%20v1.0_cn.pdf
>   */
> 
> +/ {
> +	pmic-temp {
> +		compatible = "iio-hwmon";
> +		io-channels = <&axp_adc 4>; /* Internal temperature */
> +	};
> +};
> +
>  &axp209 {
>  	compatible = "x-powers,axp209";
>  	interrupt-controller;





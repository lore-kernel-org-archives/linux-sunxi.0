Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F96219F8
	for <linux-sunxi@lists.linux.dev>; Fri, 13 Oct 2023 18:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hce5p6+7"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4065f29e933so27734245e9.1
        for <linux-sunxi@lists.linux.dev>; Fri, 13 Oct 2023 11:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697222742; x=1697827542; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nS/B/9nUlLmw6S4KsFUi4nqKiJBJFKciQh4FDxh+L/s=;
        b=hce5p6+7dXXxoMMHa7aaeEq+ElJ3beBbWdeL/Fh9mbbMGj4gdUXniJn1QitH+axqce
         UlrhB4LrTuYlYxd0XiHwe1mvvhOx9huFX0PCsgvSUVhaSZlod28z7MDBQWOjkgYyq+iP
         bB039MGiCdiazip/l5PUVp09r1lpLzzJU0ihZq1C0EllosVsoi2Ha3Dte7LWuuuk7qwu
         k68UhSPl63gbrXSp+TGwcAN4J+m1Ou0RggDE/ns+qcwf124SMR4HqQQcKZoge127TnVW
         Zqj9EHIj/rmPHoRcrcMPylze+nlUy7vQ7rv0cXqsyp2Utpna5rnxul9V3qwW7ULWP7+j
         snFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697222742; x=1697827542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nS/B/9nUlLmw6S4KsFUi4nqKiJBJFKciQh4FDxh+L/s=;
        b=S94GXTGVix27WQQv/zNXs3BOv02vvuwmjWchs9u6dmn2bM/vknedQRwqorBHz/aLyD
         vroO5Dl0AFCqYxRJzGXj8mRmkjXs1EHNFeV9ShVx1WCO7MVhqnwBDEhtrRU7yBiplTX8
         erTa8sMIZEP5lJkkAOL2nK+4+ogqHCFH9ZnPVh2LLMX2TLnjrjp5itqFOC3z5bFh4LEw
         5tTKVvtuBtfbGPe67mxoY4vMYu2YbwAV7mKicHzWrVBx3pLsy+4mj7rjCANyCBVtJRgY
         gZzKwC0kSrrAgeUs4mJXNdtHX/xJH3y5nt+2H1iyJifl7OfQotccqz8Dlrii+05SLgDM
         6xOw==
X-Gm-Message-State: AOJu0Yz6k9RvTB0OIN8nYfPE7X9akleAXJNJ7eUZg3nBo4cxt6QM5ner
	R+SJ3K4nlvfWTsUW/0kapLQ=
X-Google-Smtp-Source: AGHT+IHcbqPBjzX48zCFbc2YsOP+a2i9HmTRCmgyTQhV4W9XaKQNyEHu+7HzI1xt2rz8SXlqw5MDaQ==
X-Received: by 2002:a7b:cb8c:0:b0:406:517f:ac71 with SMTP id m12-20020a7bcb8c000000b00406517fac71mr24094789wmi.29.1697222741548;
        Fri, 13 Oct 2023 11:45:41 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id e16-20020a05600c4e5000b004068495910csm840969wmq.23.2023.10.13.11.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 11:45:40 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>, Chukun Pan <amadeus@jmu.edu.cn>
Cc: Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Chukun Pan <amadeus@jmu.edu.cn>
Subject:
 Re: [PATCH 2/2] arm64: dts: allwinner: h616: update emac properties for
 Orange Pi Zero 3
Date: Fri, 13 Oct 2023 20:45:38 +0200
Message-ID: <3254946.aeNJFYEL58@jernej-laptop>
In-Reply-To: <20231010153812.2869633-2-amadeus@jmu.edu.cn>
References:
 <20231010153812.2869633-1-amadeus@jmu.edu.cn>
 <20231010153812.2869633-2-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi!

Dne torek, 10. oktober 2023 ob 17:38:12 CEST je Chukun Pan napisal(a):
> Add the correct delay value to emac. Also add missing mdio
> properties for the YT8531 PHY (clock output required).
> With these changes, Ethernet now looks stable.

This is also a fix, so it would also deserve Fixes tag. In fact, please merge
previous and this patch into one. After all, you are fixing only one thing -
ethernet on OrangePi Zero 3 board.

Can you also explain how did you figure out that additional PHY properties
are needed? At first glance, based on description of motorcomm,keep-pll-enabled,
it's not immediately clear why it should be needed. Same goes for second
property.

1800 ps delay basically means that rgmii is not correct type and rgmii-rxid
should be used instead. Indeed, schematic confirms that's the case. With that,
allwinner,rx-delay-ps can be 0 and thus ommited from DT file.

Since there is many differences, I suggest that you remove whole emac0
node from common DTSI file and put specific ones to each board. It will
be less confusing that way.

Best regards,
Jernej

> 
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dts | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dts b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dts
> index 00fe28caac93..02c7836b624a 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dts
> @@ -13,10 +13,14 @@ / {
>  };
>  
>  &emac0 {
> +	allwinner,rx-delay-ps = <1800>;
> +	allwinner,tx-delay-ps = <700>;
>  	phy-supply = <&reg_dldo1>;
>  };
>  
>  &ext_rgmii_phy {
> +	motorcomm,keep-pll-enabled;
> +	motorcomm,auto-sleep-disabled;
>  	motorcomm,clk-out-frequency-hz = <125000000>;
>  };
>  
> 





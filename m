Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F223E7F
	for <linux-sunxi@lists.linux.dev>; Sun,  6 Nov 2022 07:56:32 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id 21so13233667edv.3
        for <linux-sunxi@lists.linux.dev>; Sun, 06 Nov 2022 00:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gkzrt0tLXNTRfLm2uFzAkX1Avhsv5RXjjNb/2WJUlik=;
        b=DzrsiMeD6vgcQ6q/Fpth37UDork/jbuMdZxdFqi/9C+/66NmeFCXM19niKP92lHRck
         LhiBjSj8zFFV0sGQk7oVq1MTzhbRaZYJACRyTF0EfQxVZvfjndJYAF/FtkCAUC3X4ols
         DGI0+Z/BCOp1q0K00/Ps75MnolbSCs2QBYY9MDOLQcoUWyY7mavUCtVQP2BXMIh+9fIJ
         E+F4nx2VwRRNvqCsUySYmsikfkkRK1//HhaFLtIP411hu2CsI9q180fm7/Uq2qfW+TSQ
         K4mmflomiQTLnwrbO2uDDevf24nxsftByKhnmLFbzGwVsDXYNFgoye4vxXNYJ26aHdwo
         NZCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gkzrt0tLXNTRfLm2uFzAkX1Avhsv5RXjjNb/2WJUlik=;
        b=azY9HeONaFzAWGiYCLiiTSJcjompGWYrEV7W8snbKoVKbP3tI+3dO81N9ttzqtv+hn
         bxqEooUafuOgx19bcEyjUpAHxLBsPALsQOCLjYpfyoTGsSjWBOfrj5VsHtt09H1c9uLc
         sGldC5owXZ6bdCaBeHzFrYAUwNA/zlGsSemQy5VkDGSY/3sRAVEde83G88e73HRytQM7
         pRDcAdVUvwRLkP/t3bfrjKb4Ikv/yltykJLY84lUycCjnXE2dgMLrD+Fe2W0M/haIPtp
         Y5lSv1JT1PwVzdhfNu0ZwRFo6Lu6SI2dJIUkPFAaNh143ssSAxaG0erfBh1rWmQzv/Ox
         iG8A==
X-Gm-Message-State: ACrzQf2cob3P7VGptVTtcKf1ibFHWmjEWNz042UA7PauxvQMmauzoh2d
	r1gITMPBv5Qatq/dgI3s3tM=
X-Google-Smtp-Source: AMsMyM7ak3tVRHLrcWvyw7Y3Cy7kh+ed4+8e2QUjoi4nw9UBbYSQ8Whe88vZGzla2/4KcXfkgTYFVQ==
X-Received: by 2002:aa7:dcd5:0:b0:461:5fad:4215 with SMTP id w21-20020aa7dcd5000000b004615fad4215mr45981851edu.332.1667721391260;
        Sun, 06 Nov 2022 00:56:31 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id s8-20020a056402164800b004642b35f89esm2301685edx.9.2022.11.06.00.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Nov 2022 00:56:30 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Andre Przywara <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Icenowy Zheng <uwu@icenowy.me>, Thierry Reding <thierry.reding@gmail.com>, Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>, linux-pwm@vger.kernel.org
Subject: Re: [PATCH 2/9] ARM: dts: suniv: f1c100s: add PWM node
Date: Sun, 06 Nov 2022 08:56:29 +0100
Message-ID: <8176089.NyiUUSuA9g@jernej-laptop>
In-Reply-To: <20221101141658.3631342-3-andre.przywara@arm.com>
References: <20221101141658.3631342-1-andre.przywara@arm.com> <20221101141658.3631342-3-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne torek, 01. november 2022 ob 15:16:51 CET je Andre Przywara napisal(a):
> The Allwinner F1C100s family of SoCs contain a PWM controller compatible
> to the one used in the A20 chip.
> Add the DT node so that any users can simply enable it in their board
> DT.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  arch/arm/boot/dts/suniv-f1c100s.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/suniv-f1c100s.dtsi
> b/arch/arm/boot/dts/suniv-f1c100s.dtsi index 0edc1724407b3..d5a6324e76465
> 100644
> --- a/arch/arm/boot/dts/suniv-f1c100s.dtsi
> +++ b/arch/arm/boot/dts/suniv-f1c100s.dtsi
> @@ -192,6 +192,15 @@ wdt: watchdog@1c20ca0 {
>  			clocks = <&osc32k>;
>  		};
> 
> +		pwm: pwm@1c21000 {
> +			compatible = "allwinner,suniv-f1c100s-pwm",
> +				     "allwinner,sun7i-a20-pwm";
> +			reg = <0x01c21000 0xc>;

According to documentation, size is 0x400.

Best regards,
Jernej

> +			clocks = <&osc24M>;
> +			#pwm-cells = <3>;
> +			status = "disabled";
> +		};
> +
>  		uart0: serial@1c25000 {
>  			compatible = "snps,dw-apb-uart";
>  			reg = <0x01c25000 0x400>;





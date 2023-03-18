Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608777F8
	for <linux-sunxi@lists.linux.dev>; Sat, 18 Mar 2023 07:57:42 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id fd5so28546828edb.7
        for <linux-sunxi@lists.linux.dev>; Sat, 18 Mar 2023 00:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679126262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mwEOc5hIeG9CeKtWiV7AEMYJMnkS3/Hf7eGt7j2uMO4=;
        b=MxwHR+yNd1TLM1VXKVH8QQvHdMIj9bNfTTKFZLeNj+3NWlHAAhSwf6U5DsfdBTk749
         E/mOXmsOEK4g2V61JUx+/lKJdzsiFwVhBfzIENyU0UJunOrfqDVknrrZjHacivAdEE7P
         p4r3ep7FKIAI1RIP7FLc1hg+iIRvd1tBNgSY4mR13IE6x0irS5nfHgNNU8Ck9XIq1yud
         qBwOgImWumO0yLQm+FC/kmzzcJWtiIJV0+6HLn4NfoePBFC8J469WarKiUJcNVxTPTEq
         qbHEkNQ/dulOCe2tGI4Lc7ptKS6xe4pz3edM5D2VR3Tk+2cQi6fwi/zxlzTHmuRRJnzy
         Oqvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679126262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mwEOc5hIeG9CeKtWiV7AEMYJMnkS3/Hf7eGt7j2uMO4=;
        b=ZuZvY3zfePqrVE5ZOuhxtFWM0N5Xpmp3zk2SiDFilXuNQ3DFcLsxG3y4WZaHYhjGdV
         XWIyHG3UVEhrNk+65Oj5xdlQfcdlQAfqV6Pd97ggR2GdzBoldLXM2IvzuKorX1JgYyeR
         770l73jqtOnty1yGDKVOauH1lmI2j4KGJ+pzEBfzIFBhwA5amvNYWbMU7UCROGOTGHDd
         PtWcO+EkESTM9TDmK30e1sF4k9LOa2gsUTKwoR09d+vbNHpzQeNHNrF+Mc2IYNw1nWXW
         f+UgyEPSCCnl/xL7n1mF/zTwyqpQjpykxnq/XBbovIBeu0lSYCXHYhAkyjGIobOs4Z+4
         RTNA==
X-Gm-Message-State: AO0yUKWqRV7SEq81pFauhllFuvvIA7kJZiYbF8NwIbkhtk+vZqqHVxtd
	PXtltfMUmYkNVeO+4IQePXU=
X-Google-Smtp-Source: AK7set8GbnpVfJNCu1eoVd9Z9fGylLQXsIimdP5yZ9nesRJ59KZUePcgh+xs6yhfk80f/5Rhh+04uw==
X-Received: by 2002:a17:906:3387:b0:8b1:3483:e3d5 with SMTP id v7-20020a170906338700b008b13483e3d5mr2172986eja.48.1679126261884;
        Sat, 18 Mar 2023 00:57:41 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id ja21-20020a170907989500b0093338259b2bsm316182ejc.207.2023.03.18.00.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Mar 2023 00:57:41 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Hans Ulli Kroll <ulli.kroll@googlemail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh@kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH] dt-bindings: rtc: Drop unneeded quotes
Date: Sat, 18 Mar 2023 08:57:39 +0100
Message-ID: <4814217.31r3eYUQgx@jernej-laptop>
In-Reply-To: <20230317233634.3968656-1-robh@kernel.org>
References: <20230317233634.3968656-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sobota, 18. marec 2023 ob 00:36:33 CET je Rob Herring napisal(a):
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/rtc/allwinner,sun4i-a10-rtc.yaml      | 2 +-
>  .../devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml      | 2 +-

For Allwinner:
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>  .../devicetree/bindings/rtc/atmel,at91rm9200-rtc.yaml         | 2 +-
>  .../devicetree/bindings/rtc/atmel,at91sam9260-rtt.yaml        | 2 +-
>  .../devicetree/bindings/rtc/brcm,brcmstb-waketimer.yaml       | 2 +-
>  Documentation/devicetree/bindings/rtc/faraday,ftrtc010.yaml   | 4 ++--
>  .../devicetree/bindings/rtc/microcrystal,rv3032.yaml          | 2 +-
>  Documentation/devicetree/bindings/rtc/mstar,msc313-rtc.yaml   | 2 +-
>  Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yaml   | 2 +-
>  Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml        | 2 +-
>  Documentation/devicetree/bindings/rtc/rtc-mxc.yaml            | 2 +-
>  Documentation/devicetree/bindings/rtc/rtc-mxc_v2.yaml         | 2 +-
>  Documentation/devicetree/bindings/rtc/sa1100-rtc.yaml         | 4 ++--
>  Documentation/devicetree/bindings/rtc/st,stm32-rtc.yaml       | 2 +-
>  Documentation/devicetree/bindings/rtc/ti,k3-rtc.yaml          | 2 +-
>  Documentation/devicetree/bindings/rtc/trivial-rtc.yaml        | 2 +-
>  16 files changed, 18 insertions(+), 18 deletions(-)




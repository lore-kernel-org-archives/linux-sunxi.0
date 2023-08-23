Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9CD01F18C
	for <linux-sunxi@lists.linux.dev>; Wed, 23 Aug 2023 19:14:38 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-99df11828c6so31547366b.1
        for <linux-sunxi@lists.linux.dev>; Wed, 23 Aug 2023 12:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692818077; x=1693422877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3GfGoPJfPXeL122AI/Y6i59RXbA4MoNTzdh5/a56Xn0=;
        b=QJvDLNUBheJo6Z3mPsuYD5nZRJyW2l/OZodVbzD4U6Js7o5S2sE9dGB1wsabKctn2S
         9tU+TeFm/qQCuHFmp9+YSNZFscM73NNk/0EBbZRVYyqTAlZqp4llP5sc9BvKrnVLTE4J
         ZiQmZdxoRYvkbANv806hjyyKLb20aZqCYbTPdPq7pKNf5wAclWk+vJwjgLjsyvyo6dWZ
         T2klMKPTCV0/DPK1JuLl8yOQEBFqT+8qtxTQxaPkokhC38PM/QV2mIhDHi+rlUHr5Keu
         pU+J2vBCFvlIhfOsnGyHdzCN6h3rlGbVFTKCR7qnIQBk8bLMt/LcglVDySFm/y50gqXY
         GjIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692818077; x=1693422877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3GfGoPJfPXeL122AI/Y6i59RXbA4MoNTzdh5/a56Xn0=;
        b=dNNKNLLd2F4cGxXTfRW6/Gm3jN0CnYk6lk67P8jj12EEUDSAUIvMgYU/btTpfOfq1B
         3510VUT1YX/g7KLwZ74hI/VuPnvj3537F8DmhtdSBXK5ImSFBcwERZWpl5XfA2Qbc3WN
         0ZmIsqA9siKKEyVX2lQX6wDOnwqEsK5W3tqTq8b8jwcoYZUWj472FVUoAxqYLkkrKsE8
         dxLVpJCu/2GajQmdWbGs5wx1k/FM2o0ovQDlxgx2HMtGznXhAlHOd84iAP7RJsBPvFJE
         P7uMVLNbMSiHFyCrS5MyCspMubtM1lggvOhybIUaGBzhypY4srI1F5ldr+xUOlQghHqn
         xZrg==
X-Gm-Message-State: AOJu0Yx/MviqFa0xm7/emafnLNG4gpIHFe34DLGzhlw77vsLYxBNdpik
	P/advW39JtUqqdSyQiKZoys=
X-Google-Smtp-Source: AGHT+IEyB/ZIs6kkflGm4CaDR9JI8pIkw1oTLixQ0Y4DZJKD0Tq/QtdPvoLjd898II3fszhvDVCRmw==
X-Received: by 2002:a17:906:3051:b0:99c:5056:4e31 with SMTP id d17-20020a170906305100b0099c50564e31mr17063070ejd.15.1692818076698;
        Wed, 23 Aug 2023 12:14:36 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id ci16-20020a170906c35000b0098e34446464sm10091272ejb.25.2023.08.23.12.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 12:14:36 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 arm@kernel.org, soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-renesas-soc@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject:
 Re: [PATCH 2/2] arm64: dts: use capital "OR" for multiple licenses in SPDX
Date: Wed, 23 Aug 2023 21:14:34 +0200
Message-ID: <4824782.GXAFRqVoOG@jernej-laptop>
In-Reply-To: <20230823085146.113562-2-krzysztof.kozlowski@linaro.org>
References:
 <20230823085146.113562-1-krzysztof.kozlowski@linaro.org>
 <20230823085146.113562-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sreda, 23. avgust 2023 ob 10:51:46 CEST je Krzysztof Kozlowski napisal(a):
> Documentation/process/license-rules.rst and checkpatch expect the SPDX
> identifier syntax for multiple licenses to use capital "OR".  Correct it
> to keep consistent format and avoid copy-paste issues.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Rebased on next-20230822, so might not apply cleanly.  What does not
> apply, can be skipped and I will fix it after next RC.
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-a100-allwinner-perf1.dts  | 2 +-
>  arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi                 | 2 +-
>  arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64-model-b.dts   | 2 +-
>  arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi   | 2 +-
>  arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts   | 2 +-
>  arch/arm64/boot/dts/allwinner/sun50i-h616-x96-mate.dts         | 2 +-
>  arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dts   | 2 +-

For Allwinner:
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>  arch/arm64/boot/dts/arm/corstone1000-fvp.dts                   | 2 +-
>  arch/arm64/boot/dts/arm/corstone1000-mps3.dts                  | 2 +-
>  arch/arm64/boot/dts/arm/corstone1000.dtsi                      | 2 +-
>  arch/arm64/boot/dts/broadcom/stingray/bcm958802a802x.dts       | 2 +-
>  arch/arm64/boot/dts/broadcom/stingray/stingray-board-base.dtsi | 2 +-
>  arch/arm64/boot/dts/broadcom/stingray/stingray-pcie.dtsi       | 2 +-
>  arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi        | 2 +-
>  arch/arm64/boot/dts/freescale/imx8mm-emcon-avari.dts           | 2 +-
>  arch/arm64/boot/dts/freescale/imx8mm-emcon-avari.dtsi          | 2 +-
>  arch/arm64/boot/dts/freescale/imx8mm-emcon.dtsi                | 2 +-
>  arch/arm64/boot/dts/renesas/r8a77980a.dtsi                     | 2 +-
>  arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi           | 2 +-
>  arch/arm64/boot/dts/renesas/r8a779f0-spider.dts                | 2 +-
>  arch/arm64/boot/dts/renesas/r8a779f0.dtsi                      | 2 +-
>  arch/arm64/boot/dts/renesas/r8a779m0.dtsi                      | 2 +-
>  arch/arm64/boot/dts/renesas/r8a779m1-salvator-xs.dts           | 2 +-
>  arch/arm64/boot/dts/renesas/r8a779m1-ulcb-kf.dts               | 2 +-
>  arch/arm64/boot/dts/renesas/r8a779m1-ulcb.dts                  | 2 +-
>  arch/arm64/boot/dts/renesas/r8a779m1.dtsi                      | 2 +-
>  arch/arm64/boot/dts/renesas/r8a779m2.dtsi                      | 2 +-
>  arch/arm64/boot/dts/renesas/r8a779m3-salvator-xs.dts           | 2 +-
>  arch/arm64/boot/dts/renesas/r8a779m3-ulcb-kf.dts               | 2 +-
>  arch/arm64/boot/dts/renesas/r8a779m3-ulcb.dts                  | 2 +-
>  arch/arm64/boot/dts/renesas/r8a779m3.dtsi                      | 2 +-
>  arch/arm64/boot/dts/renesas/r8a779m4.dtsi                      | 2 +-
>  arch/arm64/boot/dts/renesas/r8a779m5-salvator-xs.dts           | 2 +-
>  arch/arm64/boot/dts/renesas/r8a779m5.dtsi                      | 2 +-
>  arch/arm64/boot/dts/renesas/r8a779m6.dtsi                      | 2 +-
>  arch/arm64/boot/dts/renesas/r8a779m7.dtsi                      | 2 +-
>  arch/arm64/boot/dts/renesas/r8a779m8.dtsi                      | 2 +-
>  arch/arm64/boot/dts/renesas/r8a779mb.dtsi                      | 2 +-




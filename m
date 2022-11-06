Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0E67F
	for <linux-sunxi@lists.linux.dev>; Sun,  6 Nov 2022 08:23:49 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id f27so23049499eje.1
        for <linux-sunxi@lists.linux.dev>; Sun, 06 Nov 2022 01:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hqOjl3YDp3QYyk+XJ1fvBqeCjQn4CSk3UbMru12Aw9k=;
        b=chtVFA0fINNDwSTrhNohv2ylebukOXjdIOLme0UNr0YKQBTDy5BFLLXn1ewMdByTgV
         OmkvS0UcU2qlF90CPy07nGMslYCsloBfFa8VOEUDWISPAo3UKfASK4iRs4PzF/qoeDfn
         AyTxOgLESYqCA9yoE7A/kiM9n7/OkRNprRF4Rg5juH6GjCXmdxq6v1YGW1I2D/NEnWt5
         yJN/AIjkaI3/PYHx9omSUNs8S5uWR4lRLeMva+s2FphaOMlT430DngI6TRKxJQJLFuTs
         y21OboH4Y0GMFmNNMKpVAufCFWU5EPgOb32vSjBilLeZrrj2zcgql2c9msTezP55JHc2
         nxHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hqOjl3YDp3QYyk+XJ1fvBqeCjQn4CSk3UbMru12Aw9k=;
        b=HJKYE4iZi9TfG1Dho3GQXTiu34qZG8FndFy/keJJ5a4vhPMVHecTLJnmc4b5zbsT10
         OukquvYv3IC6fOwaqwtmMgpEPQRZWRXtqW2gj0u9htmBvsWMVtWSi3iMJbgPqIQjTRcK
         nGAW6ZxJ1mag8zsm1vU64ILVWJZGKgFlI4p661Q9lGRwXVF+edrVVeubZx7F2JCpJ2s+
         QlJESgC3krBL5Ymx6h2Higx4UiKsTniis+7PTMjUXGQ2/9GuYodOI8OV//CN10yv41mc
         Vc4FkotUihG1HZhz+CQIsOUH82MS1sYjCvK75/TWT3AT4AK+DkqihFZ7Gb1SyVyC5ZZp
         xMzg==
X-Gm-Message-State: ACrzQf1u7MHstKV9ZyOTx9+mi44lK8P/K6g7XRf/YD1IB/F7DTGZJtGN
	bWDW2+Ws2f8kEeKAvM6pKmA=
X-Google-Smtp-Source: AMsMyM6lL15jO4UmwUaSfbq3sXOjsrZl8ilqlrBJASTBMYjpaSCB7eW0FcFUAg6mrxdez4OEBMMVrg==
X-Received: by 2002:a17:907:3f93:b0:7ae:3241:da1 with SMTP id hr19-20020a1709073f9300b007ae32410da1mr11357768ejc.177.1667723028212;
        Sun, 06 Nov 2022 01:23:48 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id o19-20020a170906769300b00722e50dab2csm1861200ejm.109.2022.11.06.01.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Nov 2022 01:23:47 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Andre Przywara <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Icenowy Zheng <uwu@icenowy.me>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Subject: Re: [PATCH 7/9] ARM: dts: suniv: f1c100s: add CIR DT node
Date: Sun, 06 Nov 2022 09:23:46 +0100
Message-ID: <1876938.taCxCBeP46@jernej-laptop>
In-Reply-To: <20221101141658.3631342-8-andre.przywara@arm.com>
References: <20221101141658.3631342-1-andre.przywara@arm.com> <20221101141658.3631342-8-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne torek, 01. november 2022 ob 15:16:56 CET je Andre Przywara napisal(a):
> The CIR (infrared receiver) controller in the Allwinner F1C100s series
> of SoCs is compatible to the ones used in other Allwinner SoCs.
> 
> Add the DT node describing the resources of the controller.
> There are multiple possible pinmuxes, but none as them seem to be an
> obvious choice, so refrain from adding any pincontroller subnodes for
> now.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



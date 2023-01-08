Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B69B2F2D
	for <linux-sunxi@lists.linux.dev>; Sun,  8 Jan 2023 20:27:01 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id hw16so3562986ejc.10
        for <linux-sunxi@lists.linux.dev>; Sun, 08 Jan 2023 12:27:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YpchQ6Q+Z3Z1pgSznAxblNSZYuByy6PgjDzbmrqx+mQ=;
        b=e9vfO3BmWBBw7y1qoCule4JRgmvrVZNE9fjsR+dr1x3OdV4E+jJeqapDqN+yt2FbxG
         KfVUHsPOIeAKUZOaOCMyiStOp7RD38x0D9jLQ6O5FG7bFjOCMU0KuN3rgZewWkit2MMr
         ORruanm+3Hiz6tQAqXootjDQBxtSELMknxrXOz0hoYJjIHaNRbFTa0jWLzpikQHuvuAF
         uCZyehF/UuZjkzNujPLbRgZVdaoLbvrZPhpN/CW2iNsbT7S1pofJdOtUjEj3kieRhwWa
         hFJSrG+y1ZAN9ZOKyR707MfZZsvZRCE22EizMLydNOVAEOy1H5MY1RolgFkEgJ4fzfuq
         eZnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YpchQ6Q+Z3Z1pgSznAxblNSZYuByy6PgjDzbmrqx+mQ=;
        b=ehXHu61qO8878Ia9gLf1w0VGMTDKaDEBcMO9Vc7w1OdA4zYaS7FirAQRPiCaFRqsvK
         bKkXx/6gzPONX58QmvMvyxAIGD/DmduCi9gz3kEtPXr3AoG9UL00bb3hXDAxk0H+c+/z
         VEZp3fUSq7oY+lw3KkhiPVdI2VGUtIOo6g8g6APz/RKq8uGWmzmiU5YuD8Cy57mvzNj5
         4Xy4wB8GmfVKhBiIs8YVbueLrZL2yDvBxtxFRmFfb8Uo9ksPaW3Rcqy0NwoMkJ/cMLPM
         rAOOwgaEC9O69mYtjRvcniGWCtL5oPjEcQ9dFEXuH33jYMylOp1q95tPkCmtFPM5Ibr5
         D7WQ==
X-Gm-Message-State: AFqh2krTa+ejsygkr0MQp8A7eP1Y+5f5DYuLduytS+2gK2p3aPTKudan
	v2hY4VFAusBCijs77duTVJ5C66QHEB/njQ==
X-Google-Smtp-Source: AMrXdXtl7IHUDJ0msL+MgltU/IR+/JRLPFVTDTzqeGEqmjDXlTYLrMT0f854x3Tg0VYTX3HNA4NO3w==
X-Received: by 2002:a17:906:9399:b0:7ac:2db9:6f4d with SMTP id l25-20020a170906939900b007ac2db96f4dmr58590679ejx.8.1673209620212;
        Sun, 08 Jan 2023 12:27:00 -0800 (PST)
Received: from jernej-laptop.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id lb25-20020a170907785900b007c00323cc23sm2879814ejc.27.2023.01.08.12.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 12:26:59 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Kishon Vijay Abraham I <kishon@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>,
 Samuel Holland <samuel@sholland.org>
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Samuel Holland <samuel@sholland.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject:
 Re: [PATCH v2 0/8] phy: allwinner: phy-sun6i-mipi-dphy: Add the A100 DPHY
Date: Sun, 08 Jan 2023 21:26:58 +0100
Message-ID: <3245174.aeNJFYEL58@jernej-laptop>
In-Reply-To: <20221114022113.31694-1-samuel@sholland.org>
References: <20221114022113.31694-1-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne ponedeljek, 14. november 2022 ob 03:21:05 CET je Samuel Holland 
napisal(a):
> This series adds support for the updated DPHY found in a couple of
> recent Allwinner SoCs. The first three patches fix an omission in the
> existing binding. The remaining patches add the new hardware variant.
> 
> Changes in v2:
>  - Add the interrupts property to the binding example
>  - Drop the inappropriate Fixes tags
>  - Rename "supports_rx" to "rx_supported"
>  - Add a blank line for readability
> 
> Samuel Holland (8):
>   dt-bindings: sun6i-a31-mipi-dphy: Add the interrupts property
>   ARM: dts: sun8i: a33: Add DPHY interrupt
>   arm64: dts: allwinner: a64: Add DPHY interrupt
>   dt-bindings: sun6i-a31-mipi-dphy: Add the A100 DPHY variant
>   phy: allwinner: phy-sun6i-mipi-dphy: Make RX support optional
>   phy: allwinner: phy-sun6i-mipi-dphy: Set the enable bit last
>   phy: allwinner: phy-sun6i-mipi-dphy: Add a variant power-on hook
>   phy: allwinner: phy-sun6i-mipi-dphy: Add the A100 DPHY variant

Applied 2 and 3, thanks!

Best regards,
Jernej

> 
>  .../phy/allwinner,sun6i-a31-mipi-dphy.yaml    |  11 +
>  arch/arm/boot/dts/sun8i-a33.dtsi              |   1 +
>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi |   1 +
>  drivers/phy/allwinner/phy-sun6i-mipi-dphy.c   | 236 +++++++++++++++---
>  4 files changed, 218 insertions(+), 31 deletions(-)





Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A490408CE
	for <linux-sunxi@lists.linux.dev>; Fri,  9 Jun 2023 20:44:26 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-30af159b433so2119056f8f.3
        for <linux-sunxi@lists.linux.dev>; Fri, 09 Jun 2023 13:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686343464; x=1688935464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vH0nkJICH5SoZihWGavJs2/Bnil9QT2kDyKVokHxQ+Y=;
        b=D8L/H1llciKeg2OaECls2piv/ZlGcZPz1fARREAdEPOEgkCvtZ4CHK8PsxWjTgI/TX
         y9Nu22Sltg+JSRzvMTud6VPlG83KpTpsUOfMFPO1PJBTbKtLNLWkq7ELwZXTHVnjklgL
         O6QZWHUygZx5p42j/aRcsEdTeTz718PEH/5OcjBj76Wd5Ziop5BwcMKLo9NyByVb/Mpq
         vTpbzle6IUbyvgB88Pwi3ySHYCy34bCFZAHwaeSAzyrbtYpNq1KepLKlEKqiaR6O7qwE
         jCUZkS84f3vPv3B+YjMzB9p6tIMFc3JA3y/wArk6FmTvMesQM7+YAeZDBjXRUuZUi8XM
         NUYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686343464; x=1688935464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vH0nkJICH5SoZihWGavJs2/Bnil9QT2kDyKVokHxQ+Y=;
        b=T0FIpRp9yD3bimSYUDPpo5/oJ1k5y1X5JfMSrKUWIZ8R/0E0XGzjBTk7gWaV+8OYab
         M/a7KWjpTpO1zIShFEK78Y0CLGenSR/wJRkcLRqi3XXoLgn1M/oLmZiS0yd3ou0PfB/h
         JeEb5zD/bN1LQ3hoUVx87Tw/iaoryMcxgjHZ192IT2NzaFY/+SaUd4gLTl0/SSmYOf3S
         GwWeWFOjwdcTNj+M7RIoGaZPWdE6XUQzpRNuUKdLULSPugDA6kh4U2r4rwELtATWJwm0
         E4Q+W5BrH6rRTUgtrM4jQxNE4x7yfdF8Qn0f+092cBdk28gKGFe7JOuM9SvBC061Q+2b
         wXSA==
X-Gm-Message-State: AC+VfDyEv0kSzn9daIl/35bv9DqSGN7qEBAEuaMq4IPqWxZQ0kIbw9xR
	nspE14fAuM8MZhyLwGTdpxw=
X-Google-Smtp-Source: ACHHUZ7zNI1VWszzFX6QGR4B6hdYDGcU3iIOW4+UBNrHCJzvjNIhjWN7Qei9tDrm/d/2h6PBBSYKMw==
X-Received: by 2002:a5d:63ce:0:b0:306:4031:63c5 with SMTP id c14-20020a5d63ce000000b00306403163c5mr1948735wrw.51.1686343464260;
        Fri, 09 Jun 2023 13:44:24 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id z10-20020a05600c220a00b003f42ceb3bf4sm3652865wml.32.2023.06.09.13.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 13:44:23 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Doug Berger <opendmb@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Heiko Stuebner <heiko@sntech.de>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Maxime Ripard <mripard@kernel.org>,
 "G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>,
 Biao Huang <biao.huang@mediatek.com>, Clark Wang <xiaoning.wang@nxp.com>,
 David Wu <david.wu@rock-chips.com>,
 Grygorii Strashko <grygorii.strashko@ti.com>, Sekhar Nori <nsekhar@ti.com>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] dt-bindings: net: drop unneeded quotes
Date: Fri, 09 Jun 2023 22:44:22 +0200
Message-ID: <3169693.5fSG56mABF@jernej-laptop>
In-Reply-To: <20230609140713.64701-1-krzysztof.kozlowski@linaro.org>
References: <20230609140713.64701-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 09. junij 2023 ob 16:07:12 CEST je Krzysztof Kozlowski napisal(a):
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/net/allwinner,sun7i-a20-gmac.yaml     | 2 +-
>  .../devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml    | 2 +-

For Allwinner:
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>  .../devicetree/bindings/net/amlogic,meson-dwmac.yaml          | 2 +-
>  Documentation/devicetree/bindings/net/brcm,bcmgenet.yaml      | 2 +-
>  Documentation/devicetree/bindings/net/intel,dwmac-plat.yaml   | 2 +-
>  Documentation/devicetree/bindings/net/mediatek-dwmac.yaml     | 2 +-
>  Documentation/devicetree/bindings/net/nxp,dwmac-imx.yaml      | 2 +-
>  Documentation/devicetree/bindings/net/rockchip-dwmac.yaml     | 2 +-
>  .../devicetree/bindings/net/ti,k3-am654-cpsw-nuss.yaml        | 4 ++--
>  .../devicetree/bindings/net/toshiba,visconti-dwmac.yaml       | 2 +-
>  10 files changed, 11 insertions(+), 11 deletions(-)




Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9FA7B
	for <linux-sunxi@lists.linux.dev>; Mon, 11 Apr 2022 15:26:23 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id u3so23593319wrg.3
        for <linux-sunxi@lists.linux.dev>; Mon, 11 Apr 2022 08:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RWQkTK3rSopa+8qydH4cKynBwojuwyz5cLnIhJAViHI=;
        b=GRiTgBcRca6sECMacftvFpl+a0/eMYsWuTLi5kdaEw2MYVFiv/5dqE79gmrDQKHwDj
         58ekxBYj4TauMYafu44BJOZgNuo5mVwdSkSMSFyCSsU9Wyu4SyXWHtCuKcLVFp16FKB7
         D5cMqscqt2nHnXo77ZDFytCC9+fnpBpa90B5BGXEMhClQ+syz3b3P80bRbCdW8D8Di5t
         YeotdxshhBo7GP4D1bzzUNA4IAYPTAO/RXFm8cL+eFsn/008Q/KWXMeqpm0f7y593NM+
         CNhQsNbee7+21aSpHWz/ycVM3JETUX09vnxZvEQqsI/4zpebhFsy1qu3ecPyfS3NI9C8
         DqAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RWQkTK3rSopa+8qydH4cKynBwojuwyz5cLnIhJAViHI=;
        b=G/K2Wg1CYtl6BF3SYEF+S5IGV2sucxsBVW9aGRCOGs0fP74bA2qXXFnTKnKQBizmjb
         OdiPaJU00pARJunORcsxkGP/5qW6p84jbZWWkNaPElnY/+svmL3kiU4kk9ZfqsKU+v0B
         zkofjNkzbbOkDtalB+b3mgTrSofGdGBiNV5L/q9WGKmqaTjzQ0rHVGja2jyjhPmAXDkj
         cvvZnvF45qQtSnAPwFObjCOW10BVKxw1+2ERZ7ZMH6d4p8sM6nQIeKg8cAMKwuJgQKcT
         zl2ETcheVpASoCiX3sTMGKi96nhZWJiFBR9NHTLwklTsp/llfKN4E9zb3uq24832qbhR
         0xOw==
X-Gm-Message-State: AOAM5320M4UxH4i68C6xV/qCjDq/2OuV/uU3rhPBa1ic6+Q6qST6ulxG
	CauyZQBm9RegghIeUOYK3cg=
X-Google-Smtp-Source: ABdhPJwKM1YG/JgnOOVdHFFtRjVMNl3v2yETrecwEBgXJy9DyzKjATELxoXpvLb+SDzu5iGVkC3UJA==
X-Received: by 2002:a5d:588b:0:b0:204:1c1a:965d with SMTP id n11-20020a5d588b000000b002041c1a965dmr25246909wrf.669.1649690781695;
        Mon, 11 Apr 2022 08:26:21 -0700 (PDT)
Received: from kista.localnet (cpe-86-58-32-107.static.triera.net. [86.58.32.107])
        by smtp.gmail.com with ESMTPSA id c8-20020a056000184800b002040e925afasm31421816wri.59.2022.04.11.08.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Apr 2022 08:26:21 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>, Samuel Holland <samuel@sholland.org>
Cc: Samuel Holland <samuel@sholland.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] dt-bindings: clock: Add compatible for D1 DE2 clocks
Date: Mon, 11 Apr 2022 17:26:19 +0200
Message-ID: <1811990.tdWV9SEqCh@kista>
In-Reply-To: <20220411044002.37579-1-samuel@sholland.org>
References: <20220411044002.37579-1-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne ponedeljek, 11. april 2022 ob 06:40:01 CEST je Samuel Holland napisal(a):
> Allwinner D1 contains a display engine 2.0. Its clock controller
> matches the layout of the H5 DE2 clocks (2 mixers, no rotation engine,
> and separate resets), so use that compatible as a fallback.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
> 
>  .../bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml           | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t-
de2-clk.yaml b/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t-
de2-clk.yaml
> index e79eeac5f086..17caf78f0ccf 100644
> --- a/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t-de2-
clk.yaml
> +++ b/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t-de2-
clk.yaml
> @@ -28,6 +28,9 @@ properties:
>        - items:
>            - const: allwinner,sun8i-r40-de2-clk
>            - const: allwinner,sun8i-h3-de2-clk
> +      - items:
> +          - const: allwinner,sun20i-d1-de2-clk
> +          - const: allwinner,sun50i-h5-de2-clk
>  
>    reg:
>      maxItems: 1
> -- 
> 2.35.1
> 
> 



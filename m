Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841A26FA6
	for <linux-sunxi@lists.linux.dev>; Sun, 13 Aug 2023 15:38:04 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-3fe8242fc4dso27439865e9.1
        for <linux-sunxi@lists.linux.dev>; Sun, 13 Aug 2023 08:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691941082; x=1692545882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XNmDOME263tbNnJDox2WuqRcHXZN+XqB+OMfOqpA9xQ=;
        b=WNqBOi4ZZC6V6xRgRLsfitnrUocDN44nmI2hwUzUaFeK2Ey4eCQ3XiKbzkPj+8IK+f
         Zc6QGbNAD3ZYzDXGt1BR/HDnQi0Z+205k54AX+n7M17nfRK54q3Q4m70bI0JWL4SnPPG
         sAQGDvFGjh0VhrcdkKsVw1l0PvHFscTPBEk/TRg29lw128Tg8y2cFzAjZcxB7b24kS2G
         AlPAn4LgKVWHKasQYODf1oyDyFku+7pnoGwibto1NqnoVpzDxHrQQwjP70B5R781EDg0
         z6X8UkWVyXrx/BF+H+MZGgPCvN4w35lD2Xdz29stgweKUhTAGvKgs1isa9pPzw3pabWL
         /yWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691941082; x=1692545882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XNmDOME263tbNnJDox2WuqRcHXZN+XqB+OMfOqpA9xQ=;
        b=NxtoDFCfUvJPlzqWUiv2WUTh/qshZmr1H9EYgDweY25d+PBmmdwERZKPa8CY5wQGmr
         2oQ0+2QfyT2rTvCBtG5t30SykkFACNza4GkUDUP8I8H42DvaKV+UJomiyo/jqCEjBnru
         rOYYEs9ILXExAf4EMFGKsoRLV1S+3+FD4SYYXiM6Xyec2yKJ33+gWBVQGuICK69K5Q3w
         uax3tLPjcC8uluETuO0Qc2C9cHPseX36wYsUCjrLNAbAqXk3LJrzLTZkSMc1spRJNKZm
         kRk2WQnT2qX2aacE0D+R7i843TaW00yCaP1361TnIy64i4yertQGc/JKZm254to28Ytu
         pv1w==
X-Gm-Message-State: AOJu0YwbJNjzBryy/2wab5BGpCja58hhSqhDmOUlWj1CWZDT4ipkLqj4
	NMLEBDCsENzQ+tzB9zSxxUQ=
X-Google-Smtp-Source: AGHT+IFR9Cvz4CIyUP1iq9gFAC2zyjVR2KXeCO2wabvTXPUPFUWnjVOzIYFmlO4lwwSjRS33Gmro6A==
X-Received: by 2002:a05:600c:3648:b0:3fd:29cf:20c5 with SMTP id y8-20020a05600c364800b003fd29cf20c5mr5963620wmq.7.1691941082325;
        Sun, 13 Aug 2023 08:38:02 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id p19-20020a05600c205300b003fe17901fcdsm14472709wmg.32.2023.08.13.08.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Aug 2023 08:38:02 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Martin Botka <martin.botka1@gmail.com>, Martin Botka <martin@biqu3d.com>
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Jami Kettunen <jamipkettunen@somainline.org>,
 Paul Bouchara <paul.bouchara@somainline.org>,
 Martin Botka <martin.botka@somainline.org>,
 Andre Przywara <andre.przywara@arm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Ludwig Kormann <ludwig.kormann@ict42.de>, Icenowy Zheng <uwu@icenowy.me>,
 Andrew Lunn <andrew@lunn.ch>, Heiko Stuebner <heiko@sntech.de>,
 Shawn Guo <shawnguo@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Chris Morgan <macromorgan@hotmail.com>, Jagan Teki <jagan@edgeble.ai>,
 Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/4] dt-bindings: arm: sunxi: Add BigTreeTech boards
Date: Sun, 13 Aug 2023 17:37:59 +0200
Message-ID: <1859280.tdWV9SEqCh@jernej-laptop>
In-Reply-To: <309C7C26158AF852+20230807145349.2220490-3-martin@biqu3d.com>
References:
 <20230807145349.2220490-1-martin@biqu3d.com>
 <309C7C26158AF852+20230807145349.2220490-3-martin@biqu3d.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne ponedeljek, 07. avgust 2023 ob 16:53:22 CEST je Martin Botka napisal(a):
> From: Martin Botka <martin.botka@somainline.org>
> 
> Add name & compatible for BigTreeTech Manta boards and
> BigTreeTech Pi
> 
> Signed-off-by: Martin Botka <martin.botka@somainline.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
> Changes in V2:
>     - Remove CB1 SoM as its own entry
>     - Squash BTT Pi and manta patches into 1
> Changes in V3,V4: none
> 
>  Documentation/devicetree/bindings/arm/sunxi.yaml | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml
> b/Documentation/devicetree/bindings/arm/sunxi.yaml index
> ee8fdd2da869..b90d2a7dbe2d 100644
> --- a/Documentation/devicetree/bindings/arm/sunxi.yaml
> +++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
> @@ -151,6 +151,17 @@ properties:
>            - const: roofull,beelink-x2
>            - const: allwinner,sun8i-h3
> 
> +      - description: BigTreeTech Manta M4/8P
> +        items:
> +          - const: bigtreetech,cb1-manta
> +          - const: bigtreetech,cb1
> +          - const: allwinner,sun50i-h616
> +
> +      - description: BigTreeTech Pi
> +        items:
> +          - const: bigtreetech,pi
> +          - const: allwinner,sun50i-h616
> +
>        - description: Chuwi V7 CW0825
>          items:
>            - const: chuwi,v7-cw0825





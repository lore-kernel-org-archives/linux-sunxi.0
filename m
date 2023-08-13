Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D276FA6
	for <linux-sunxi@lists.linux.dev>; Sun, 13 Aug 2023 15:36:24 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-3fe12baec61so31997775e9.2
        for <linux-sunxi@lists.linux.dev>; Sun, 13 Aug 2023 08:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691940983; x=1692545783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0HmyT9viofQwFO46Ag0TcEyc/eSeZtVKY9Vgh1cnGEs=;
        b=asGfA/zadH3EzscS9pqL8hD9PkPJ4/WZnKGgBg0rVwo4UdOWRev46I9/CnAf6guzUf
         NW0XrD20NpxsstWqh4FekZXXReMmJQmc8rJnDKIWFMoKqPredd7AGIyzbhcBoBiPKlUc
         ZVZht/Elip16apR/VnS6qQLpvWYfML4xwHVlMYINasLxg0tw75NB0BYV4dEv4OX02bi3
         oW5Y1EgGUSr6JM8t/WAmbTofAVVVivJbSyMWFCSCYRf9SypRLlhPBudbAOHedSZuOucF
         3gtv2bkpHr6c/qVEQwsASu22PrIUZEVvhGlEIFUa94hmgNRRvf1vQA38gSTPnkEjKuV8
         JLOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691940983; x=1692545783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0HmyT9viofQwFO46Ag0TcEyc/eSeZtVKY9Vgh1cnGEs=;
        b=RtlVQVUYHAjZGH0+AkI7gFsHQVs2SV7D6F0bVAahs/reuwxlUV9CQi5Wkr666cvwIf
         1hreY6B2+aXa5NGC7ofGsrSLFn2zPdYE4xEwHD8KUrPzm5QSG8nKtgcNrvTJVsJFAluT
         n6NxhwCKGTZU+y0NJVB1s0jFpl2ul9kpO+CAz1YAihPNIyU93RlyeLPf4uDtkkccxOAx
         h8Zw5ySypLWK4vXce+f3hPpajRw9pkz4crBGMycgKjG2d0Nm2qzqnkZ09NoNMeD7iRCc
         g6Tmtmn1qXMPBwnuNMMYP6lwDwdeB+fliF5i5fgCel+QVpyU77GrMxmUdRciPWV4VV2f
         OKQQ==
X-Gm-Message-State: AOJu0Yyv1GuCJqha3MQoecqPb8R0z0tyEnBhysgGK2WtxVHT5yZqGPNq
	smC1zE+/dVjqB8nil3dv+Vw=
X-Google-Smtp-Source: AGHT+IE9qkC2Ej8imYc6src4+3L/KGU0/FB4hp4AxhdHUalCY46flCcIBsPMWdx2pp/wNCgM4p9F0g==
X-Received: by 2002:a5d:42d2:0:b0:317:52d2:d05f with SMTP id t18-20020a5d42d2000000b0031752d2d05fmr5663858wrr.26.1691940982982;
        Sun, 13 Aug 2023 08:36:22 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id w17-20020adff9d1000000b00313f61889ecsm11645608wrr.66.2023.08.13.08.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Aug 2023 08:36:22 -0700 (PDT)
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
 Samuel Holland <samuel@sholland.org>, Icenowy Zheng <uwu@icenowy.me>,
 Ludwig Kormann <ludwig.kormann@ict42.de>, Andrew Lunn <andrew@lunn.ch>,
 Heiko Stuebner <heiko@sntech.de>, Shawn Guo <shawnguo@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Chris Morgan <macromorgan@hotmail.com>, Jagan Teki <jagan@edgeble.ai>,
 Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] dt-bindings: vendor-prefixes: Add BigTreeTech
Date: Sun, 13 Aug 2023 17:36:20 +0200
Message-ID: <2291546.ElGaqSPkdT@jernej-laptop>
In-Reply-To: <EB8B7A5FD2D8E12A+20230807145349.2220490-2-martin@biqu3d.com>
References:
 <20230807145349.2220490-1-martin@biqu3d.com>
 <EB8B7A5FD2D8E12A+20230807145349.2220490-2-martin@biqu3d.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne ponedeljek, 07. avgust 2023 ob 16:53:21 CEST je Martin Botka napisal(a):
> From: Martin Botka <martin.botka@somainline.org>
> 
> BigTreeTech is a company based in Shenzhen that makes
> 3D printers and accessories.
> 
> Add prefix for it.
> 
> Signed-off-by: Martin Botka <martin.botka@somainline.org>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
> Changes in V2:
>     - Fix alphabetical order
> Changes in V3,V4: none
> 
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> b/Documentation/devicetree/bindings/vendor-prefixes.yaml index
> af60bf1a6664..a1f3bb7be860 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -192,6 +192,8 @@ patternProperties:
>      description: BeagleBoard.org Foundation
>    "^bhf,.*":
>      description: Beckhoff Automation GmbH & Co. KG
> +  "^bigtreetech,.*":
> +    description: Shenzhen BigTree Tech Co., LTD
>    "^bitmain,.*":
>      description: Bitmain Technologies
>    "^blutek,.*":





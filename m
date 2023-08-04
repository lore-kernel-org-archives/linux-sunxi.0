Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB2918026
	for <linux-sunxi@lists.linux.dev>; Fri,  4 Aug 2023 19:03:16 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-317b31203c7so2187483f8f.2
        for <linux-sunxi@lists.linux.dev>; Fri, 04 Aug 2023 12:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691175794; x=1691780594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aBQznZc6KngA0qSX8JhcbfCzyQcmohoYG9cU4rXPPQk=;
        b=LDEC7ag2o3gTORvOstYA3ZrCBzX0wu0RuaKKvZAF47hjYUMgw4IqJUc7PzopJeWR0R
         Fw5VHUHA9kqKRFSA9R4+weld8Bj8zp6APiKfBF163vBnEWZDZxENPtxDDqSy2DRA6aV+
         dYRuKm5BQ1Yw34VU8K45IbOgSxgxbQatxm7M57nSXjUCg7u+aVZD06rUHj91zb9b7t9I
         7Eup6AlYYAYuh56/fPiOMsfwORkkGf9cfBXK2D8PKERDbmVxY7vurxbqDyhLHF2oK6Xc
         MMq3lOfAOGciv2IGZIdsb2CGn0r2MhbvoP3rTxHAnhdZDROCpWyI2/P8PNvMzgbHR/72
         2eMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691175794; x=1691780594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aBQznZc6KngA0qSX8JhcbfCzyQcmohoYG9cU4rXPPQk=;
        b=UYZsinIy49UOA1awslBTktV79cRlav25gTjh+NL3/T1GxEa4CmvQKCpCmC5hEZzPS1
         ieyoqHROk4TOs244olC8y8cujHmLAUaP9pRD4yGt7EpkWQcweaN0abZ+VwjaTwLKhtfH
         mpHpIpzsk2lo/lNQMp4v87edstXqe9+gQ67z4O/AGGxISM12ASdBH0wOi+QrwQVXz9vl
         iZbxAPhCZcQjab8BdoT3jL4ctkq9xCXX7vFKQGiNrvadVQ/xNpqT1i0uzALli6k9E4Uu
         hhC7c8b5gwie51gkeynnKZyMfKsAIWWLcSEo7oDJM/3Q4e75l+vRXf4uOvjFcRPUz73M
         r2Eg==
X-Gm-Message-State: AOJu0YwR7nHfih29ME1geWC83cLboKNk7pA95G3juWdnFIy/jr6XrbPJ
	YdG1VhcEwy6+Rk9sPzeZucw=
X-Google-Smtp-Source: AGHT+IEYJGHc532Wwdt2wL64d5EBMgXcif26NnW434MUKhvoFJEJh0b+cNfvs8etfBAolMfVUJK18A==
X-Received: by 2002:adf:ed0f:0:b0:314:1aed:8f5f with SMTP id a15-20020adfed0f000000b003141aed8f5fmr1593821wro.34.1691175794130;
        Fri, 04 Aug 2023 12:03:14 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id g6-20020a056000118600b00314398e4dd4sm3137260wrx.54.2023.08.04.12.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 12:03:13 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>
Cc: Icenowy Zheng <uwu@icenowy.me>,
 Piotr Oniszczuk <piotr.oniszczuk@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v2 2/3] dt-bindings: arm: sunxi: document Orange Pi Zero 3 board
 name
Date: Fri, 04 Aug 2023 21:03:12 +0200
Message-ID: <5696551.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <20230804170856.1237202-3-andre.przywara@arm.com>
References:
 <20230804170856.1237202-1-andre.przywara@arm.com>
 <20230804170856.1237202-3-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 04. avgust 2023 ob 19:08:55 CEST je Andre Przywara napisal(a):
> The Orange Pi Zero 3 board is an updated version of the Zero 2 board.
> It uses a SoC called H618, which just seems to be an H616 with more L2
> cache.
> 
> Add the board/SoC compatible string pair to the list of known boards.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml
> b/Documentation/devicetree/bindings/arm/sunxi.yaml index
> ee8fdd2da869a..58f322b9585f2 100644
> --- a/Documentation/devicetree/bindings/arm/sunxi.yaml
> +++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
> @@ -997,4 +997,9 @@ properties:
>            - const: xunlong,orangepi-zero2
>            - const: allwinner,sun50i-h616
> 
> +      - description: Xunlong OrangePi Zero 3
> +        items:
> +          - const: xunlong,orangepi-zero3
> +          - const: allwinner,sun50i-h618
> +
>  additionalProperties: true





Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4647D179A0
	for <linux-sunxi@lists.linux.dev>; Tue, 12 Sep 2023 15:54:06 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-522dd6b6438so7014585a12.0
        for <linux-sunxi@lists.linux.dev>; Tue, 12 Sep 2023 08:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694534044; x=1695138844; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nMxqjxINpBKmoDA3h46D0q6wWk2nU0MFsPl5bWg4Cmg=;
        b=URF1F7280MoEBt+TbhKVO83ds4aa1e0J6LsxpJaS8AlLR9OdrZ13CuFcvTsd0feJ5b
         2jxTqSDUxrc2lQrY+AEGe7jrHbSK7HjIjaOP6X5yPZl01aEOTB1J5QOzKFXhfwczIJbH
         9Xk5IP/IVSbS9i3ldNsktX1rMAtY5NEeHpzafbnV+/3KCG+RXA4VvDXtXvqynmG1nQ8p
         ala1LKHnLrxLxjqLUYpeGbElZT8J23riWAxNXU2M9gOESggycjWIIhohJjfo2DM+955C
         1XclqefT9PzbyvQ20T0ywlXeHq1Rymt7sqnLHBXTsrLYQo4k9o7sOwU3hyvm2/6X9E+4
         KNLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694534044; x=1695138844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nMxqjxINpBKmoDA3h46D0q6wWk2nU0MFsPl5bWg4Cmg=;
        b=O4TOFnTJ2VCZCfVUZZoXqRZb1Z01ccCYY7pIWanIKcC5dWiGY4MwzzuLfJkkTsKIWz
         XcisWCBZ9SmZqJH/NTiF+hXnTMZVE7yIus9ZExoGmDaT7vOjrRC4JiM2ie6zri8gG88K
         anAAYi/aGxP4T3aQ2huQyaFbS8ekz/+hBd6vlwsz3wSBp/Gy+YlVxcIQkuyo9D7C9WW9
         tuU0qiphSI303C7jrgleyybVbba6hZa4OvbQeyt44qD+zubIepE+tH2U2eqNTFl1uHrm
         kUnrPevNCM1lN4b6n4YuzRMz2IYuvDEyoevvVM5METo0xdSWtf5qz1kEux2C/1XyZGW3
         yz5A==
X-Gm-Message-State: AOJu0YwPFtWRJrE6LZO3ddKoAGcoRFINbfkSnNbpeRefL8LPsmLSpuZL
	J1AtjcsW/7BCLwqsIrSOULk=
X-Google-Smtp-Source: AGHT+IFtlqJFjepBWnpt2aVpFMTJpzCouDuA9rqIlouy2f2Zvq4jrDKJs5qfWVg5IApWZhEf7i0+5g==
X-Received: by 2002:a05:6402:14c7:b0:52f:c073:9c37 with SMTP id f7-20020a05640214c700b0052fc0739c37mr55181edx.3.1694534044308;
        Tue, 12 Sep 2023 08:54:04 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id d4-20020aa7d684000000b0051dfa2e30b2sm6142713edr.9.2023.09.12.08.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 08:54:03 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>,
 Martin Botka <martin.botka@somainline.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andre Przywara <andre.przywara@arm.com>, Alan Ma <tech@biqu3d.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Martin Botka <martin.botka@somainline.org>
Subject:
 Re: [PATCH v3 1/2] dt-bindings: nvmem: SID: Add binding for H616 SID
 controller
Date: Tue, 12 Sep 2023 17:54:02 +0200
Message-ID: <3517711.iIbC2pHGDl@jernej-laptop>
In-Reply-To: <20230912-sid-h616-v3-1-ee18e1c5bbb5@somainline.org>
References:
 <20230912-sid-h616-v3-0-ee18e1c5bbb5@somainline.org>
 <20230912-sid-h616-v3-1-ee18e1c5bbb5@somainline.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne torek, 12. september 2023 ob 14:25:12 CEST je Martin Botka napisal(a):
> Add binding for the SID controller found in H616 SoC
> 
> Signed-off-by: Martin Botka <martin.botka@somainline.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml | 4
> +++- 1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git
> a/Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml
> b/Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml
> index 296001e7f498..0928ec408170 100644
> --- a/Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml
> @@ -23,7 +23,9 @@ properties:
>        - const: allwinner,sun20i-d1-sid
>        - const: allwinner,sun50i-a64-sid
>        - items:
> -          - const: allwinner,sun50i-a100-sid
> +          - enum:
> +              - allwinner,sun50i-a100-sid
> +              - allwinner,sun50i-h616-sid
>            - const: allwinner,sun50i-a64-sid
>        - const: allwinner,sun50i-h5-sid
>        - const: allwinner,sun50i-h6-sid





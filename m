Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A405B2069C
	for <linux-sunxi@lists.linux.dev>; Thu, 11 May 2023 16:39:02 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-96a2b6de3cbso393212466b.1
        for <linux-sunxi@lists.linux.dev>; Thu, 11 May 2023 09:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683823141; x=1686415141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wa3SOvISZGaKHOA8+TPFpP/9VnubTDpNEPMLKFetZ+8=;
        b=K8TNyHobvnQWygzUwnU3H8Zqy+ySP0IfO9S2cuZ+akESC67EELHYE+Q5xiI8i6m+RT
         znFamR1F1Ylt3QWPBLwrZ7XCQzoOhzTOUZ3zKhE+zuoH5XoVG59E9Z5XuuxN+U52Wj2Q
         lavQ5Ycrjk2ECWezh08gdoDrnPOgFnXitYwZC+UBRhsxRMnjwJV6qkg2ePCgmg0zuZSp
         JbA7jsqLwva/hzFGFu2Sv1w5USSD/WBEOJSjIySsHEdShB0Qr/EgdWtPREoGrBcwM18W
         3BS9NiTSizMZJg9F3yFtRmmEzUg+zLr/+0uH4M6rcxrMVJvPGQxyqhE7ZX9FDfHOGJw2
         2ZCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683823141; x=1686415141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wa3SOvISZGaKHOA8+TPFpP/9VnubTDpNEPMLKFetZ+8=;
        b=PTJwYkqgdwSh6/7jYLvvbA2RlVOxlCmGGDjfKnaBWg5l5Vt72uzdQEFmPVSQod5gE+
         PQPPvIFXcmgx2nQF77PJ7xpcRfi1P9jUC8OG3fDFFElhzfkM3iO2zwqFbSQe57HFBs3f
         CFpgRa9Jgve2btYufGowQF2AS0c4B7z/5MO/bKbA4Pjs2JfSlM1+YVRrVs72xhCBsNs/
         e3rDegjGBLQtibaOFynqQfpa2gSYb0QL6Xo1q/rvQ7tu33H7ymdQ4lszEAyU4b/TbDHk
         2zsCb29M6snEmRBNmW9GldJ2dAeOMyyysublQclMuu4HKW1cBtA9dEqewNL+EW5p5aOF
         OBTA==
X-Gm-Message-State: AC+VfDyG1I1VOm7eWVq+kv+g1t9lQo4SZOOiG3Q7gRRYZUPNPIwEXNmk
	gr00vXJ5k9+dVC90K6Bqqik=
X-Google-Smtp-Source: ACHHUZ6FTNvxZ52Lw7NBAuRpzL4lNKYkUViPH7hIkSsrbZqqnREejzk9ADHcMFBkgEvRr4ylKMP7ZQ==
X-Received: by 2002:a17:907:98d:b0:96a:37af:ff37 with SMTP id bf13-20020a170907098d00b0096a37afff37mr4554954ejc.15.1683823140726;
        Thu, 11 May 2023 09:39:00 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id p8-20020a170906a00800b009658264076asm4198381ejy.45.2023.05.11.09.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 09:39:00 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>,
 Maksim Kiselev <bigunclemax@gmail.com>
Cc: Icenowy Zheng <icenowy@aosc.io>, Maksim Kiselev <bigunclemax@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Maxime Ripard <mripard@kernel.org>, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject:
 Re: [PATCH v5 3/5] spi: sun6i: add quirk for in-controller clock divider
Date: Thu, 11 May 2023 18:38:58 +0200
Message-ID: <23071886.6Emhk5qWAg@jernej-laptop>
In-Reply-To: <20230510081121.3463710-4-bigunclemax@gmail.com>
References:
 <20230510081121.3463710-1-bigunclemax@gmail.com>
 <20230510081121.3463710-4-bigunclemax@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sreda, 10. maj 2023 ob 10:11:10 CEST je Maksim Kiselev napisal(a):
> Previously SPI controllers in Allwinner SoCs has a clock divider inside.
> However now the clock divider is removed and to set the transfer clock
> rate it's only needed to set the SPI module clock to the target value
> and configure a proper work mode.
> 
> According to the datasheet there are three work modes:
> | SPI Sample Mode         | SDM(bit13) | SDC(bit11) | Run Clock |
> |
> |-------------------------|------------|------------|-----------|
> |
> | normal sample           |      1     |      0     | <= 24 MHz |
> | delay half cycle sample |      0     |      0     | <= 40 MHz |
> | delay one cycle sample  |      0     |      1     | >= 80 MHz |
> 
> Add a quirk for this kind of SPI controllers.
> 
> Co-developed-by: Icenowy Zheng <icenowy@aosc.io>
> Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



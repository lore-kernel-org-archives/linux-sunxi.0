Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E79F20F6
	for <linux-sunxi@lists.linux.dev>; Thu, 11 May 2023 16:39:58 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-50bc37e1525so16680194a12.1
        for <linux-sunxi@lists.linux.dev>; Thu, 11 May 2023 09:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683823196; x=1686415196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mpg8XDB92ynuRzY1i3UBYEufHNkhwJLAak/2Lx31N6M=;
        b=ibTgPIrHlC7KM/tGyqwtf1UyJoDnPrrLqtP2Zqej1oTbR/ruuQMX9ZXvgnS39ULJvo
         DERGtBVBE4r78wvrzmORpxZDKusSm7SnefyLARh9hy9m3JL7n5Yu7HlfQmQ34BXafg7r
         1/GM07+C5kHldeoOv7dn4eYcXFOHvIFUJfDuGzTvPdmfmLIMUh916Sa1Ffbe8Glz5uTC
         veeqqFL58PtyBrn682RVe0XbnqYAtyRHlIAJyhX/Lwp3/ynI/wiZolwdiO+KfG5L/QIl
         24BSF3UgtwsHic13L1N4Qvk31GZG9r9hpBup0hFkQFGdYLqJuhnrTbkXNvTIGn9i5+ga
         eFTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683823196; x=1686415196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mpg8XDB92ynuRzY1i3UBYEufHNkhwJLAak/2Lx31N6M=;
        b=ValOH4VmN0++P7cJKc9EaIALbX8TygDySge9KkP7hG+DGwX7gF1nzBU10EHecvLMPi
         uqeubzavVNEzb+ass1d5eEQ0eUnnG+esAQx6qiEg20haH269AjC7RF5SNIcC9ThUW8Xc
         mO9h5I13Voh2a5Xr7pZAI1mmlbDeUtfDfOQcr/dSlmtQc/olto1P/py+cP9JnUmpI7ne
         MfBvTc3Lb94iw4lUJZIFOQS73AN8b/HPewEFZTkme+efsMjoXATVBkOBRwI+IL+kf6Xd
         s6pT1ZeVbjJP2Vp0xtHKvdcUNl7yz9/9N1UlWy5nL8+vociPHE2wmYajwaxlq9cmEdVX
         DwjQ==
X-Gm-Message-State: AC+VfDxNYy0WYmPKs5iDhLkP5KWTPsOBOrspW+MTTcjIAvalUUs9AsNQ
	N1kLxXXcnvYm8ek7D7p9+ZE=
X-Google-Smtp-Source: ACHHUZ5M06vBgci6zS42m3wRUWv6RwPtzqUTomGRUWOkHFF5nSTmaSbApuSRzoOCjc6tHcHBsCYfeQ==
X-Received: by 2002:a17:907:843:b0:94f:5847:8ac with SMTP id ww3-20020a170907084300b0094f584708acmr19514441ejb.51.1683823196255;
        Thu, 11 May 2023 09:39:56 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id r12-20020a1709062ccc00b0094e954fd015sm4260699ejr.175.2023.05.11.09.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 09:39:55 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>,
 Maksim Kiselev <bigunclemax@gmail.com>
Cc: Icenowy Zheng <icenowy@aosc.io>, Maksim Kiselev <bigunclemax@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
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
 Re: [PATCH v5 1/5] dt-bindings: spi: sun6i: add DT bindings for Allwinner
 R329/D1/R528/T113s SPI
Date: Thu, 11 May 2023 18:39:54 +0200
Message-ID: <3558185.R56niFO833@jernej-laptop>
In-Reply-To: <20230510081121.3463710-2-bigunclemax@gmail.com>
References:
 <20230510081121.3463710-1-bigunclemax@gmail.com>
 <20230510081121.3463710-2-bigunclemax@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sreda, 10. maj 2023 ob 10:11:08 CEST je Maksim Kiselev napisal(a):
> Listed above Allwinner SoCs has two SPI controllers. First is the regular
> SPI controller and the second one has additional functionality for
> MIPI-DBI Type C.
> 
> Add compatible strings for these controllers
> 
> Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



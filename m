Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492CE21CC3
	for <linux-sunxi@lists.linux.dev>; Wed, 10 May 2023 21:05:35 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-9619095f479so1242403666b.1
        for <linux-sunxi@lists.linux.dev>; Wed, 10 May 2023 14:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683752733; x=1686344733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nFI/AGkZEYwWG8fSHOsXcamR405M2Qv38gjoGfCKNeM=;
        b=ovchRibZYAQviLH9dX5jb99BxG+AS7aDTIwBB7C8HLtQorCHH4eNTbtCDLiS0fj3nB
         dR3Pyxh+jKBgm+/Wri7zEvpNZvjdNLI44jE3hjiTVVTh6odErkG0Ns+BUsa3/3UDeyra
         0BivPjhBTIcC8wSIiJtStqh0XU/kFmBRiD0bq+gyicLBq46gtZZlEaxBhK+NZaciPJ9Q
         iEEk9WgZY8MiVNzvu/lNc435FXTzL7rreouRg10OjZpVt0uGrwYUvTeQPMMdslu+1QX0
         ExDrE1yhfPZD5hPkI4oKo1gWQM43H+/lf08JlqKqmn30SXPvwA7SR0Y1kLCJyfuvDgGG
         wqDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683752733; x=1686344733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nFI/AGkZEYwWG8fSHOsXcamR405M2Qv38gjoGfCKNeM=;
        b=atc5zK2DhnaewUGXcNYAvO/sMtO/7xiioQrZWcRPhlhlUqkziN2WNFFQ0xRm+0XwHP
         D6yxpNmnShb29yBB6cUDct6zhIC97Yo/tdXizUdeqUX89xdgmtnhaYLQh15EJnpy3nLX
         ZpTVsjoAlKxHboIXt8EeXdipzV3KWZ5g5OdDn5/ulmVANYfdDOgYZEwhqxWUJaiifbK6
         bTBQjUSaBAxhHu0Bw2Mej1LuNGA9l8FhNKv0U/jbR3LdnU6kg8VKZWyfuwtJqCSFZrz4
         MGQ8CrGYgzy68/fvMpu6uRUKy2S5sRKizBZT44FVEAiBOkNst3yh2dEpZGyec9NqKWE8
         VyNA==
X-Gm-Message-State: AC+VfDxJBLQw5FW874yc6OtJloutgASfq9PLfqlHWzrfGagOC0GfJlf5
	9WCWBKBELJ/Gtmog0sgJC3Y=
X-Google-Smtp-Source: ACHHUZ61hk+OAcODH4eeT51yIZ3XxxsSviX9vqg5Cf3X9lqBzmuOBS43oBR6cQfmDcqe2MzRJXJCuw==
X-Received: by 2002:a17:907:26c2:b0:94f:788:6bc with SMTP id bp2-20020a17090726c200b0094f078806bcmr18796096ejc.37.1683752733238;
        Wed, 10 May 2023 14:05:33 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id n25-20020a056402061900b0050a276e7ba8sm2329786edv.36.2023.05.10.14.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 May 2023 14:05:32 -0700 (PDT)
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
 Re: [PATCH v5 4/5] spi: sun6i: add support for R329/D1/R528/T113s SPI
 controllers
Date: Wed, 10 May 2023 23:05:31 +0200
Message-ID: <3739192.kQq0lBPeGt@jernej-laptop>
In-Reply-To: <20230510081121.3463710-5-bigunclemax@gmail.com>
References:
 <20230510081121.3463710-1-bigunclemax@gmail.com>
 <20230510081121.3463710-5-bigunclemax@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sreda, 10. maj 2023 ob 10:11:11 CEST je Maksim Kiselev napisal(a):
> These SoCs has two SPI controllers. One of it is quite similar to previous
> ones, but with internal clock divider removed; the other added MIPI DBI
> Type-C offload based on the first one.
> 
> Add basical support for these controllers. As we're not going to
> support the DBI functionality now, just implement the two kinds of
> controllers as the same.
> 
> Co-developed-by: Icenowy Zheng <icenowy@aosc.io>
> Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A5C2573
	for <linux-sunxi@lists.linux.dev>; Sun, 14 Aug 2022 18:28:28 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id s11so7148435edd.13
        for <linux-sunxi@lists.linux.dev>; Sun, 14 Aug 2022 11:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=TDq4TxM/Ckg6Qko1e2UClQr3wI8LPMR2dsNUHG49cJs=;
        b=Gfh2U705sN4INdM10kgqOB4ZriC46K8BvgYY/hul2G0RqTRa1rzw8IW0ZG7twbx1+s
         GYwA/2/W79dqfny+Lk97hALHWqzhk9VQLFMEyGf6PG+oVh4EO2e6+6G/EuA6Tzv9Il2D
         agzLdWCEBllZZzfp/SRTEH8PTZ2SydRz+wGg1kqh50cUeSlS9XNdn2WfTJnOua498pMY
         Mc9S7c3Lpyz5An5vfAS4JtZeSiLJ/UUzYLp+qwd3EuqhT85JWLr/qa1rgqBwUoiU2zmC
         GlPL0MHgNe5loKj+sqh8B9sfiX/9amAOjmcQbuVasxA05mEmR2q6edS9qBN2KGWBy0Vc
         A6Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=TDq4TxM/Ckg6Qko1e2UClQr3wI8LPMR2dsNUHG49cJs=;
        b=M3lJ9TeWg3yjG5deXnun0bKQI0WLsWpmRZbR3B9KoK4kchtcv6stgNG8upAglTOMPh
         y6WPZIeLYn6U8Xr7g0ZDu+upHk5J5lbAhrqAzPPEtWxLe5h4NgknWBnn0+3/iYLKS1KN
         O+bdwG96n/8o7WQhX2FdJCSADCBYPXoi/EVy4O8WCLuSH32YRy20Xs1dStnPwl80Qyrr
         2rU4gzDxu4Av/HKS3AihPXV15CjCLsBKzPjc+UtdVu8zR0BmoJdryAPjbBidm4ooDpO+
         nmLXjOLgmRpYOk8Wsmdg57gOz0Hdzn/hK2SZUKIE0m3yFGpmnmzRwgB4krgNUoVOWHGF
         ms5Q==
X-Gm-Message-State: ACgBeo3Wugyc9BdLRcVWOZrDv+q3KP6JS+r15YrxCmCgma1VZTyEXi9V
	kFkTOxy4ZtoZxJfsVaLhRVA=
X-Google-Smtp-Source: AA6agR6hgf1Q+tCnYs80QZTSFEm/fFieWNnYZD/LRsYaFKc5cbadXjo60qzsFGnKncHuwdKH0z+AUQ==
X-Received: by 2002:aa7:c30c:0:b0:440:a189:541d with SMTP id l12-20020aa7c30c000000b00440a189541dmr11562979edq.64.1660501707004;
        Sun, 14 Aug 2022 11:28:27 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id 1-20020a170906300100b006fee98045cdsm3283836ejz.10.2022.08.14.11.28.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Aug 2022 11:28:26 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>
Cc: Samuel Holland <samuel@sholland.org>, Arnd Bergmann <arnd@arndb.de>, Hans de Goede <hdegoede@redhat.com>, Icenowy Zheng <icenowy@aosc.io>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 5/9] soc: sunxi: sram: Fix debugfs info for A64 SRAM C
Date: Sun, 14 Aug 2022 20:28:25 +0200
Message-ID: <3503978.R56niFO833@jernej-laptop>
In-Reply-To: <20220801030509.21966-6-samuel@sholland.org>
References: <20220801030509.21966-1-samuel@sholland.org> <20220801030509.21966-6-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne ponedeljek, 01. avgust 2022 ob 05:05:05 CEST je Samuel Holland napisal(a):
> The labels were backward with respect to the register values. The SRAM
> is mapped to the CPU when the register value is 1.
> 
> Fixes: 5e4fb6429761 ("drivers: soc: sunxi: add support for A64 and its SRAM
> C") 
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



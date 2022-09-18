Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B7146A8
	for <linux-sunxi@lists.linux.dev>; Sun, 18 Sep 2022 21:49:11 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id z97so38733779ede.8
        for <linux-sunxi@lists.linux.dev>; Sun, 18 Sep 2022 14:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=P6S6LshpwgqP4u2Qp5J9LrUP6dyOR3py1H73QdQkr+8=;
        b=byODDZqjDOXISKuvoOVjruzPjk2kL7kmzaGbWtyraZbtsGSG7biN3VHswXta14pOLZ
         Udyqh8biLK88qhky8WnIH0GKSkXBtEJS6Lj9DNaFBU11bGAaetdVLDgkoi8A5vhNGpNv
         84RoaHCHMUuk7brlOVWGIs3z21L0hR0BAONOIlLvsAgcbZY0qXtr+NWYTnR8sIqAI1iP
         IkvX1jMSVO/Ck8l/DJ/jNUARqYQCqt5lva8EY0lXL0HWKx5qSdXN+tmtiO4xmyfGnchH
         D+0CgEllmaMhDoaV2d4T6rMkzHDRkyofV1jOirpAKEndR4+LHWi7Bml7IxogTR9CZy5R
         3Dew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=P6S6LshpwgqP4u2Qp5J9LrUP6dyOR3py1H73QdQkr+8=;
        b=yFjxtrfUrugzn4yfRfGk/26k+C0xt8IRu283M1GCtpM1BAEIsDwxvSBT7jua5yZIKB
         FzY5HU766lNiJabt342WUdIrNAiQ68wfnhSghDSN0GR39uchNWC3ldlCVL8p2pVHbABw
         omHgWSiNzPzO1PyKyCA7f75bdSeBmKpkmwwr9WcoLaQfOEdaKwAngJfEcnfcev5aeJYx
         0gedrVcWkbyDRZ5XnNuHBJFGMyVSdj5cma7Q0m/pdD+XBReJVbluSwm3jIa1ecFdrnwj
         38Ywr5SrrssIkZ17WNTJHnyAjio4p9utYQnLJx0Fzr2wmuPDkG4cGHBoGD9a800wZZhk
         O3rg==
X-Gm-Message-State: ACrzQf0uolDL4LK8CXELI9isy4K0PITNgbjO+WDrax7bbxevqi0ZxUFX
	V69sVnLz6yOojWZ9lFv7FXM=
X-Google-Smtp-Source: AMsMyM5YXccGcZWDHWBdl4JZk8RyuLxu8RKUcRZ3cq8XLcuqqH+3wkG1CfuhJK93RAZs67GYfD6Kqw==
X-Received: by 2002:aa7:da4f:0:b0:44e:864b:7a3e with SMTP id w15-20020aa7da4f000000b0044e864b7a3emr13311882eds.378.1663537749929;
        Sun, 18 Sep 2022 14:49:09 -0700 (PDT)
Received: from kista.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id b13-20020aa7c90d000000b0044eda621b08sm19047074edt.54.2022.09.18.14.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Sep 2022 14:49:09 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>
Cc: Samuel Holland <samuel@sholland.org>, Arnd Bergmann <arnd@arndb.de>, Hans de Goede <hdegoede@redhat.com>, Icenowy Zheng <icenowy@aosc.io>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 00/10] soc: sunxi: sram: Fixes and D1 support
Date: Sun, 18 Sep 2022 23:49:08 +0200
Message-ID: <2646007.mvXUDI8C0e@kista>
In-Reply-To: <20220815041248.53268-1-samuel@sholland.org>
References: <20220815041248.53268-1-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne ponedeljek, 15. avgust 2022 ob 06:12:37 CEST je Samuel Holland napisal(a):
> This series cleans up a few issues in the system controller driver, and
> then expands the exported regmap to support one of the pairs of LDOs
> built in to the D1 SoC.
> 
> Eventually, we will need to update the SRAM region claiming API so
> ownership can be swapped back and forth by consumer drivers. This will
> be necessary for uploading firmware to the R329/D1 DSPs, but it is not
> needed for initial bringup.
> 
> Changes in v2:
>  - New patch to first clean up the binding
> 
> Samuel Holland (10):
>   dt-bindings: sram: sunxi-sram: Clean up the compatible lists
>   dt-bindings: sram: sunxi-sram: Add D1 compatible string
>   soc: sunxi: sram: Actually claim SRAM regions
>   soc: sunxi: sram: Prevent the driver from being unbound
>   soc: sunxi: sram: Fix probe function ordering issues
>   soc: sunxi: sram: Fix debugfs info for A64 SRAM C
>   soc: sunxi: sram: Return void from the release function
>   soc: sunxi: sram: Save a pointer to the OF match data
>   soc: sunxi: sram: Export the LDO control register
>   soc: sunxi: sram: Add support for the D1 system control

Applied all, thanks!

Best regards,
Jernej

> 
>  .../allwinner,sun4i-a10-system-control.yaml   | 82 ++++++++-----------
>  drivers/soc/sunxi/sunxi_sram.c                | 74 +++++++++--------
>  include/linux/soc/sunxi/sunxi_sram.h          |  2 +-
>  3 files changed, 73 insertions(+), 85 deletions(-)
> 
> --
> 2.35.1



Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F078200CA
	for <linux-sunxi@lists.linux.dev>; Sat, 10 Jun 2023 19:04:39 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-30af86a966eso1941378f8f.2
        for <linux-sunxi@lists.linux.dev>; Sat, 10 Jun 2023 12:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686423878; x=1689015878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P+YjzUo1B2S2csqhYjgytz5WXmvhzS96d+qxUFRdrfc=;
        b=FiZkOzgUV4WCSgew0MvSsd/J2ST7V62H/PbPxj6U9tz3f2mwkjLLt3zw1HbDLtjF1W
         O/shoVGScGEQ0UwqJTyWX/8EFv0CmSl15OH4qwVDN5umIYmpMyRs6A29TBgQTr6ITLk5
         Z0h3jDWIJuCVp3hjL4rufQHX9lpEz45mPdFILSqbPM1q2cc/asJKuImPV2Nq16Fywuzl
         DajsNuquw8QvP7Rh1m2qCXNj641jxEvMrTMxnNMNdGg+yZua95BioqffM5VNGhP4miZw
         uzSKUmDWIkjSdDqkWT+Qb5tyiP1dCIlkTdt0+PMr8IMb/dTiudd0u1YfmH9E1C+us7X/
         fj3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686423878; x=1689015878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P+YjzUo1B2S2csqhYjgytz5WXmvhzS96d+qxUFRdrfc=;
        b=D+DqpEEiO8hPrg5v8n1hvPTKxAry4Zx4rmwuah9nQJWOXiNMTsgHtWCNBeeRQDxypj
         W7UMNT4o6Ol+H29mxulwj1WAxgBolNYRA2X0S8p2p8cy3HlBo5Pul1ZvgcQWnfEcn3BZ
         SWxRlcnV/wBVgwBP2aadQsMxGU1H7L9Bj2RUdPdPkkSXCSbYXMto1RjOWZC6BSC8BHlB
         hft1osaJovDUtdyiiWKRZf0TU7b82lnBhxEw+PyECzpFgdBfnE/NxR76X85dDqu5YdAm
         PxIEaIcxR2hb8wpJZ03KJK3iJ3jkMaBPdoRl1/Q5JGEvh8L+Mpd0+m5RW4rJ4CLGhEPp
         XdEw==
X-Gm-Message-State: AC+VfDw2ktvhZPhbpyPfS96tCY8SFxD474RivlownP3uNYiomMPzdpqc
	IT4XGCA+WTh0XtUdD9eYCb4=
X-Google-Smtp-Source: ACHHUZ7+FwyXPExmCGfTdhBoc8oJvU/zTiio5BdCHihsSEDTYpwdfYxIiMhA0liy4/BsVzbnEHqTuw==
X-Received: by 2002:a5d:448a:0:b0:30d:8490:58 with SMTP id j10-20020a5d448a000000b0030d84900058mr1191214wrq.9.1686423877776;
        Sat, 10 Jun 2023 12:04:37 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id i1-20020adff301000000b002f28de9f73bsm7764607wro.55.2023.06.10.12.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jun 2023 12:04:37 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-kernel@vger.kernel.org, Maksim Kiselev <bigunclemax@gmail.com>
Cc: Maksim Kiselev <bigunclemax@gmail.com>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria <amitk@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v1 0/3] Add D1/T113s thermal sensor controller support
Date: Sat, 10 Jun 2023 21:04:34 +0200
Message-ID: <4275249.ejJDZkT8p0@jernej-laptop>
In-Reply-To: <20230610141739.999268-1-bigunclemax@gmail.com>
References: <20230610141739.999268-1-bigunclemax@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sobota, 10. junij 2023 ob 16:17:31 CEST je Maksim Kiselev napisal(a):
> This series adds support for Allwinner D1/T113s thermal sensor controller.
> THIS controller is similar to the one on H6, but with only one sensor and
> uses a different scale and offset values.
> 
> Maxim Kiselev (3):
>   thermal: sun8i: Add D1/T113s THS controller support
>   riscv: dts: allwinner: d1: Add thermal sensor and thermal zone
>   dt-bindings: thermal: sun8i: Add binding for D1/T113s THS controller

As mentioned elsewhere, please fix SoB tags. Also binding patch should
come before driver changes.

Best regards,
Jernej

> 
>  .../thermal/allwinner,sun8i-a83t-ths.yaml     | 20 +++++++++++++-
>  .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    | 26 +++++++++++++++++++
>  drivers/thermal/sun8i_thermal.c               | 13 ++++++++++
>  3 files changed, 58 insertions(+), 1 deletion(-)
> 
> 





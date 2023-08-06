Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904CA28EF
	for <linux-sunxi@lists.linux.dev>; Sun,  6 Aug 2023 13:33:11 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-4fe10f0f4d1so6061177e87.0
        for <linux-sunxi@lists.linux.dev>; Sun, 06 Aug 2023 06:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691328789; x=1691933589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hM7OnaKmFiiSy0YU2WCKkAldSyarebqNo/myAZ18qU8=;
        b=FJfZuaM4j80QUdDjysNJZOw02GVH0GcWm7lp/coj/KtptlBxP8a6GNNgV/5TKV4+SD
         CQfj/rNryEbF5GyZskXib6qk02JT5OFf3urcA+N7jSMniHQJu2WwOsabSTFd7XAlYQGG
         9kOafQghRR6MtX1C8ni+Dn+oUSG10SMjR2gCh7yxx+zGkvtterCJ1PVQWsElaljWW/0Y
         KJe1jAN8hNkEBRx7owVUISMWPBF3zQmQ2xt5VOhjv+1DSkVSA00Uew14xnEmYHPBq/C2
         tq441o40Tti1ERPTlmub34tuklk3MxWvMFQFITM7t3uCsT+EpFwEBEi4Rj8EyheUAAF0
         +YAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691328789; x=1691933589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hM7OnaKmFiiSy0YU2WCKkAldSyarebqNo/myAZ18qU8=;
        b=ZY9+pX3FIJcmo7FpO8WHf3DnDQvpn/VrZQY6IgF97Gqi+l0sLKS7ZUlJwLrs4z94p7
         prtACR6ogbbZu0bpvsH0a7Vv6Jd8+6nxIN3IEpZgBAl9isd6quXlSIRA71ej/k0vtm91
         6Zjxi8FsmEzydP2AbSRlDBZvc/tkl8w4sMEvYCB0X9VLdhcvu1Nc6mDHMGKR8AYxqLa6
         RsvyCRURLHLE9oOKJj7vXTN+lp1EJwgL8jzBWIgjq6VcCBdajaIx8dGQdzd5HcCh1LXU
         lV93AOgpR+vBOPoCcOCqBnb5Tfz7YPTTU5robWQYTlFQnRoACz5HRQ0CRVgLgnyuTL0H
         q2hQ==
X-Gm-Message-State: AOJu0YwE/FsPOBjpZnhG5Dy/cunVags2/hnOJwwkWB5xsbVFrtsXktNg
	dYGFW5mGjpDQ1bLFv7wIdhg=
X-Google-Smtp-Source: AGHT+IHpsJxV8MF78Dy5TgBPH8NmXIYmknmepVRE2sYKgeBkvcU+vR0WIy+JY0Vy32lTiWtBkDtPhA==
X-Received: by 2002:a05:6512:311c:b0:4f6:3677:54e with SMTP id n28-20020a056512311c00b004f63677054emr3910959lfb.36.1691328789322;
        Sun, 06 Aug 2023 06:33:09 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id t18-20020aa7d712000000b0051e0be09297sm3946253edq.53.2023.08.06.06.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Aug 2023 06:33:09 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Andre Przywara <andre.przywara@arm.com>, Roman Beranek <me@crly.cz>,
 Frank Oltmanns <frank@oltmanns.dev>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Frank Oltmanns <frank@oltmanns.dev>
Subject: Re: [PATCH v5 04/11] clk: sunxi-ng: Add feature to find closest rate
Date: Sun, 06 Aug 2023 15:33:07 +0200
Message-ID: <5854308.MhkbZ0Pkbq@jernej-laptop>
In-Reply-To:
 <20230806-pll-mipi_set_rate_parent-v5-4-db4f5ca33fc3@oltmanns.dev>
References:
 <20230806-pll-mipi_set_rate_parent-v5-0-db4f5ca33fc3@oltmanns.dev>
 <20230806-pll-mipi_set_rate_parent-v5-4-db4f5ca33fc3@oltmanns.dev>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne nedelja, 06. avgust 2023 ob 15:06:49 CEST je Frank Oltmanns napisal(a):
> The default behaviour of clocks in the sunxi-ng driver is to select a
> clock rate that is closest to but less than the requested rate.
> 
> Add the CCU_FEATURE_CLOSEST_RATE flag, which can be used to allow clocks
> to find the closest rate instead.
> 
> Acked-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/clk/sunxi-ng/ccu_common.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/sunxi-ng/ccu_common.h
> b/drivers/clk/sunxi-ng/ccu_common.h index fbf16c6b896d..5ad219f041d5 100644
> --- a/drivers/clk/sunxi-ng/ccu_common.h
> +++ b/drivers/clk/sunxi-ng/ccu_common.h
> @@ -18,6 +18,7 @@
>  #define CCU_FEATURE_MMC_TIMING_SWITCH	BIT(6)
>  #define CCU_FEATURE_SIGMA_DELTA_MOD	BIT(7)
>  #define CCU_FEATURE_KEY_FIELD		BIT(8)
> +#define CCU_FEATURE_CLOSEST_RATE	BIT(9)
> 
>  /* MMC timing mode switch bit */
>  #define CCU_MMC_NEW_TIMING_MODE		BIT(30)





Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C606763AF
	for <linux-sunxi@lists.linux.dev>; Mon, 24 Apr 2023 19:59:49 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-957dbae98b4so450223366b.1
        for <linux-sunxi@lists.linux.dev>; Mon, 24 Apr 2023 12:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682366388; x=1684958388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SfzbbQMKtZ6pNWHjqROvt8NUNsppjtk4tv5OODMyIJQ=;
        b=rTft6vgnkDSyz11Uvhnevn/YDIAU0GNs5euOC8JLM/KYzoNiDApKthdHmaUvz9BYOj
         xjrLTeZrD7hVLY01DEPuSgavi14k0HVbyB/SYnNSQAfaPb0NqWaSxglQqIcrPjcNb8VY
         XAWsuPM+M//iF6Ibj0Ab7BYMKVxyrdPJQiVDByeF2RD8upD4YP3lVkRQbr61PuwYda+o
         NzW3zbFHOGeYAu14u3i15YkUYhLXRI0f98VIooPqiaqs1eMI73EFkPq08rx5s2HEUFfv
         vryrrB02q9kxRO941q165OfJAvD7oJTFavksSzLSrmwDuZZBZBtIKwMfAgNxa+VYBJtd
         D2Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682366388; x=1684958388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SfzbbQMKtZ6pNWHjqROvt8NUNsppjtk4tv5OODMyIJQ=;
        b=SwBosK16N0/21jiexdw7OuJz6tmYq6YQTzMkkEghPBj0TZu2bdjNgh/rov7XGcY6ar
         n/u1xIjZaLNHLruLbWMf2ZtLkFD1519J/lGYpq3pSwotmX1ImHZzSLOw5yChXqzOQFK1
         NW0fGwUZoJYwnO+bPamtmOFtnJgFCUi6G/VYI0BqYLswHUxYeb5W6yM9uYgJGxIZZk2h
         PGX11xIUUX60rnUE+7TGDY4U30Him41H134D26/XqMIFX00Ql2TCOFfmJGJqZuUftRof
         JvhRuOVoyoo32rLNxmBSnEsH3eaf5qpEiXUQAD4eXejf2N749Zv5bdyl//I1xTJCFAzs
         oArg==
X-Gm-Message-State: AAQBX9e8HdbTRDL+Ov02UQgdAuttNHhFrQVYH+Rv7ChFpU7VlA44AMXV
	ofiWWPZYl21bw8y8a27FPOs=
X-Google-Smtp-Source: AKy350bQP7cOQA5rf30OAirCb9kcsxaBObwGZVtLing0vHj1EMwP+frcY/0IBsTkTmS0nPvA55ppNQ==
X-Received: by 2002:a17:906:3391:b0:939:e870:2b37 with SMTP id v17-20020a170906339100b00939e8702b37mr10544328eja.70.1682366387914;
        Mon, 24 Apr 2023 12:59:47 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id hy12-20020a1709068a6c00b0094f09cd4658sm5956355ejc.71.2023.04.24.12.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Apr 2023 12:59:47 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] arm64: dts: allwinner: a64: add missing cache properties
Date: Mon, 24 Apr 2023 21:59:46 +0200
Message-ID: <2676764.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20230421223137.115015-1-krzysztof.kozlowski@linaro.org>
References: <20230421223137.115015-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sobota, 22. april 2023 ob 00:31:37 CEST je Krzysztof Kozlowski napisal(a):
> As all level 2 and level 3 caches are unified, add required
> cache-unified property to fix warnings like:
> 
>   sun50i-a64-pine64-lts.dtb: l2-cache: 'cache-unified' is a required
> property
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> 
> Please take the patch via sub-arch SoC tree.
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi index
> 62f45f71ec65..a9c7f82c2c66 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> @@ -93,6 +93,7 @@ cpu3: cpu@3 {
>  		L2: l2-cache {
>  			compatible = "cache";
>  			cache-level = <2>;
> +			cache-unified;
>  		};
>  	};





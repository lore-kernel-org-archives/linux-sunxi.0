Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46BA2263A
	for <linux-sunxi@lists.linux.dev>; Wed, 24 Apr 2024 18:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713985098; cv=none; b=qiWnEhVQXcSQ9lEPhTrUqCutty306IhR9pluEAlVIGfF3QtCGI80Mrqin0aHxn4ovFsBpx8y2JKNufa+7vzc8Gg5+8irpCXJ5d0rb37kH/yem3bUVpdQPZ87lMY4ASH2PkenWgqvQ6eaS6GkCodArDajLA1NnPyoTJgx/xMcapc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713985098; c=relaxed/simple;
	bh=HCt7b5jZVpt+S9X/iE7IN+XtRTt3TR+LfOAu0uJIZiY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PjCwifQzLqz2YaudRNrw3EqqhtENhubTQQjHFAlfYmFmTJjIX/xBZcdE/SCL6lHjxAph+EG+D4b/2IWWVGfZfvoxhbCllfhyZW8Bg0eCvrOfThyZ/hr/EqMmIeMDmwdCl2hLW2mdZkBUAuvQjxTVTVPcFePMR5sePugW5y9jhMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XjZx4qvy; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XjZx4qvy"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-56e1baf0380so147827a12.3
        for <linux-sunxi@lists.linux.dev>; Wed, 24 Apr 2024 11:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713985095; x=1714589895; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DwvbZeXK2LmNo0b/liHJV6gTDtg1IGPQpDm4DyK4ylU=;
        b=XjZx4qvyZcqP02Cr0+ZfthiAl6fCy5EbzQyZCEjFXge00Cg51afrE+npGRIulzF5Wx
         eeCMtaZpOQ7xUEH38IBFJP5TuP2eKwx6H5xpe9FwSV6jMyp52ezZBm+5/XdOurlsqZZQ
         UN4sjs9ie1NHIhgG0zXpE7uW2gJQaJR3RRrMw/3DvD/6UQLxy+bsRaoihG/lSMgwnIkc
         /HzQZ5G+DRasV0EwtddZFiAl6vrYi8zU1zwh97GdlH6NP+sejr4hycSlO0U3JRFZbvdQ
         WM30wOd8x3dtWuttsTCB6+HGHfdu079l2Mjfnx6V6TSkBTYGDqNv4h0FH93O8pm5Jf0Y
         KOQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713985095; x=1714589895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DwvbZeXK2LmNo0b/liHJV6gTDtg1IGPQpDm4DyK4ylU=;
        b=o41jp64QWj8DatLXcOx8zOe+7hvH+roaarGrK5RTxiEBHwI12Q+n/GnWGmdVo8qhh9
         jTLcsW9v5nMFrgtAsDq3h0V3I+SJmfOGByCSu69bqddmqEJFAU1wc5RlgsdYB1TSPrkX
         hJHWh/usyWQvryEO87AxPszPb7FNf+GGSPo48o1zipRPUkfXC9/uUDicKgl5TFPIuwYQ
         /fpaNP7oRjJkuChVtNhH08OZ2zWUJulvOAs0yeEgX+p09fTuBuIZUcLb3g+asYeHkKuy
         3N/9zyhW5DDngy08emcoVi0I6323vKo7hovrdoxMgJvtPRG/RI2HVPxlR7YNlTfR24RI
         p0sA==
X-Forwarded-Encrypted: i=1; AJvYcCUNnBGrtrzB8fCpzx+8G2pHKbFqNh3R4JfS8M6ediHT10UP8w+DtQly+ftSNzXG256n/bNNN9zo/hNLRk4YhxqRLX/YYaFZ+RmG6AA=
X-Gm-Message-State: AOJu0YxQt2puXrYg6SVpvjWhOBq2SswQdQaOpklfAQxD/sztYqTrsroo
	LvzLu8uLrRAFIWigE+qyFPYebQvVPXiQCctYoNIo5GhsyLs5v0Vp
X-Google-Smtp-Source: AGHT+IFFeaRzMd/7Smdm00f104rcu/P7ErgzU3rDoChCfzP3EQsfV2DOJK5NtUDrizGxdpXgYZNMBQ==
X-Received: by 2002:a50:c90a:0:b0:572:3cc4:2dcf with SMTP id o10-20020a50c90a000000b005723cc42dcfmr95098edh.14.1713985094787;
        Wed, 24 Apr 2024 11:58:14 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id ij6-20020a056402158600b005705bfeeb27sm8103284edb.66.2024.04.24.11.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Apr 2024 11:58:14 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject:
 Re: [PATCH] dt-bindings: mfd: allwinner,sun6i-a31-prcm: Use hyphens in node
 names
Date: Wed, 24 Apr 2024 20:58:13 +0200
Message-ID: <2320577.ElGaqSPkdT@jernej-laptop>
In-Reply-To: <20240424045521.31857-1-krzysztof.kozlowski@linaro.org>
References: <20240424045521.31857-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Dne sreda, 24. april 2024 ob 06:55:21 GMT +2 je Krzysztof Kozlowski napisal(a):
> Underscores should not be used in node names (dtc with W=2 warns about
> them), so replace them with hyphens.  This should have no impact on
> known users: Linux MFD driver does not care about children node names.
> DTS was already adjusted in commit 0f47ef3ff1bd ("arm: dts: allwinner: drop
> underscore in node names"), so without this change, we observe
> dtbs_check warnings:
> 
>   sun6i-a31s-colorfly-e708-q1.dtb: prcm@1f01400: 'ahb0-clk', 'apb0-clk', 'apb0-gates-clk', 'apb0-rst', 'ar100-clk', 'ir-clk' do not match any of the regexes: '^.*_(clk|rst)$', 'pinctrl-[0-9]+'
> 
> Reported-by: Rob Herring <robh@kernel.org>
> Closes: https://lore.kernel.org/all/CAL_JsqJfT-jui5P56CO4Fr37kr5iNN8dpxt8ecKeFmdVGnRYbA@mail.gmail.com/
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  .../bindings/mfd/allwinner,sun6i-a31-prcm.yaml     | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/allwinner,sun6i-a31-prcm.yaml b/Documentation/devicetree/bindings/mfd/allwinner,sun6i-a31-prcm.yaml
> index 8789e3639ff7..ca0e9f1f2354 100644
> --- a/Documentation/devicetree/bindings/mfd/allwinner,sun6i-a31-prcm.yaml
> +++ b/Documentation/devicetree/bindings/mfd/allwinner,sun6i-a31-prcm.yaml
> @@ -20,7 +20,7 @@ properties:
>      maxItems: 1
>  
>  patternProperties:
> -  "^.*_(clk|rst)$":
> +  "^.*-(clk|rst)$":
>      type: object
>      unevaluatedProperties: false
>  
> @@ -171,7 +171,7 @@ examples:
>          compatible = "allwinner,sun6i-a31-prcm";
>          reg = <0x01f01400 0x200>;
>  
> -        ar100: ar100_clk {
> +        ar100: ar100-clk {
>              compatible = "allwinner,sun6i-a31-ar100-clk";
>              #clock-cells = <0>;
>              clocks = <&rtc 0>, <&osc24M>,
> @@ -180,7 +180,7 @@ examples:
>              clock-output-names = "ar100";
>          };
>  
> -        ahb0: ahb0_clk {
> +        ahb0: ahb0-clk {
>              compatible = "fixed-factor-clock";
>              #clock-cells = <0>;
>              clock-div = <1>;
> @@ -189,14 +189,14 @@ examples:
>              clock-output-names = "ahb0";
>          };
>  
> -        apb0: apb0_clk {
> +        apb0: apb0-clk {
>              compatible = "allwinner,sun6i-a31-apb0-clk";
>              #clock-cells = <0>;
>              clocks = <&ahb0>;
>              clock-output-names = "apb0";
>          };
>  
> -        apb0_gates: apb0_gates_clk {
> +        apb0_gates: apb0-gates-clk {
>              compatible = "allwinner,sun6i-a31-apb0-gates-clk";
>              #clock-cells = <1>;
>              clocks = <&apb0>;
> @@ -206,14 +206,14 @@ examples:
>                                   "apb0_i2c";
>          };
>  
> -        ir_clk: ir_clk {
> +        ir_clk: ir-clk {
>              #clock-cells = <0>;
>              compatible = "allwinner,sun4i-a10-mod0-clk";
>              clocks = <&rtc 0>, <&osc24M>;
>              clock-output-names = "ir";
>          };
>  
> -        apb0_rst: apb0_rst {
> +        apb0_rst: apb0-rst {
>              compatible = "allwinner,sun6i-a31-clock-reset";
>              #reset-cells = <1>;
>          };
> 





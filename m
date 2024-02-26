Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87EC412E1C3
	for <linux-sunxi@lists.linux.dev>; Mon, 26 Feb 2024 17:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708968703; cv=none; b=Aq1hNh4O0RmD4Zzti9lFltpvvWZnP1XzCz783iI1As/482/cp3SYBj9Og05UynBYeZIP7zfGhkOgUDBNzNdbLIv/CLFFbKIZNx6VbcPCUGa2cZGhQwAYnLTzHLjUToTxylksL+RDy7cZfV2Fn/sqKbWwD/9rWFEFaAJ8JCYqle8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708968703; c=relaxed/simple;
	bh=JqR/nbtraPfs2ZLthyKJWlx6wGyBAgMXjbmnp7oiyqU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Eon/QGBqlWhG/ioljTsq2PHx4jOaG8ivz6nghRrgGduMPPZWdVJBaM4UVF08YwrxS1FKh+9KMkQSLAGONyJVbXIfVrhj9lNA0+FxUCXg28gTJi1yGErKz6hf/X/gEQo5nS6VszS4UNZDxIEvVMZJeNRpDhMUqI+3u9wC1/tnjDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=idB5kMMQ; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="idB5kMMQ"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a3e6f79e83dso367804666b.2
        for <linux-sunxi@lists.linux.dev>; Mon, 26 Feb 2024 09:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708968700; x=1709573500; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+WU5hdSHBzbEr/EOa1is0WCLMDW3bS3kIX0rAhn0rg8=;
        b=idB5kMMQn2zJW0H40qtlAlco5voLk3DAz57xaUzVwEKMXQdSYoZh2DBtGyAsFe0kcz
         L0L+QnFUd0uHGWhPVsYnPtZqzCM1cNym8fJ47LzzOfoH0DgSAHyI0kEzCuI5YAGLF4OM
         e4Eyc4Xg88JgVepGMzfFxMGfUJtpAd7bE/Jwc0t1yS11J/VBZL3D+ynB3Di45WlT1ifl
         4e3vI21nXB32VAVfMh6vjhmFGeDtRSsqDpEYTSpftQNXHYLkxBfkyP7XyfhZ7oaH34T6
         ud5TX+/9OdZ+5SdSjY0d/g5ldzai+UjiYtqKTGzNtRK+NzZnbBJMuVJvV8tG5J+1y/zo
         roUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708968700; x=1709573500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+WU5hdSHBzbEr/EOa1is0WCLMDW3bS3kIX0rAhn0rg8=;
        b=Kqms4Qh4SuJdxDXA0k9yDQ3Zfa5qwMQBIbgHNr+RM3py0oDDqWBvkLmi4h0JNYfXih
         pZk9UmrcFtkdf0tXVLD3agsheRNn3T7iFCg+OLbfDefVI/UQzOgGhmmtfVhEZr4Movid
         /GOCwEJzzJt9ZhJx1T2k3qBfVcKYfF/pWfbUabvcZsyVcbULAKSJuY+jjC/HhvCrZrQh
         4gInWOZppOKrJF8Oxzw/nFS+8hXIfRXvGG1uOL3cOxXpt7SKCRBrFyh62llj+/dDwb0k
         mLOFEaNMEFof9VddpVHCjYHsNc2tqeniiixfULpMizElsYBW1sa8rruTtKzi9aLXmDq8
         tZxw==
X-Forwarded-Encrypted: i=1; AJvYcCXFI11OINw7L4zWyPl7ehLbABWAzsTS0H/c+pv8MihSTp+QQxGjDw1odQjnbX2w8vMMDZAyb63cvgu2IpyJ8YCr4G0t1tDRVsAxYRc=
X-Gm-Message-State: AOJu0YztxecTPs+tM8v1ijNOxvu8juS15NxG1BljeaqiMOrGfT8k/Mrj
	GqEKCUIDbaxSCFIMp8Q9OnHjPAPHe1vyU8CyCVzM9IRgwqiYElOT
X-Google-Smtp-Source: AGHT+IFQIbGtRJZcvdmjxtUF9k7iAj+aV2asa5agG4pUYnayde6hWZh9DoU0ud+zNuxKQdrFfIsQgQ==
X-Received: by 2002:a17:906:1310:b0:a43:c72:4146 with SMTP id w16-20020a170906131000b00a430c724146mr4081186ejb.58.1708968699695;
        Mon, 26 Feb 2024 09:31:39 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id ps8-20020a170906bf4800b00a42ee2af521sm2535227ejb.137.2024.02.26.09.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 09:31:39 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>,
 linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject:
 Re: [PATCH] dt-bindings: input: allwinner,sun4i-a10-lrad: drop redundant type
 from label
Date: Mon, 26 Feb 2024 18:31:38 +0100
Message-ID: <3207352.5fSG56mABF@jernej-laptop>
In-Reply-To: <20240226122934.89257-1-krzysztof.kozlowski@linaro.org>
References: <20240226122934.89257-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne ponedeljek, 26. februar 2024 ob 13:29:34 CET je Krzysztof Kozlowski napisal(a):
> dtschema defines label as string, so $ref in other bindings is
> redundant.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

I already send PR for 6.9. Do you mind if it waits on next cycle?

Best regards,
Jernej

> ---
>  .../bindings/input/allwinner,sun4i-a10-lradc-keys.yaml           | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/input/allwinner,sun4i-a10-lradc-keys.yaml b/Documentation/devicetree/bindings/input/allwinner,sun4i-a10-lradc-keys.yaml
> index 5efceb313879..c384bf0bb25d 100644
> --- a/Documentation/devicetree/bindings/input/allwinner,sun4i-a10-lradc-keys.yaml
> +++ b/Documentation/devicetree/bindings/input/allwinner,sun4i-a10-lradc-keys.yaml
> @@ -49,7 +49,6 @@ patternProperties:
>      $ref: input.yaml#
>      properties:
>        label:
> -        $ref: /schemas/types.yaml#/definitions/string
>          description: Descriptive name of the key
>  
>        linux,code: true
> 





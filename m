Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42FE413D8BA
	for <linux-sunxi@lists.linux.dev>; Tue, 26 Mar 2024 22:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711491407; cv=none; b=QwgsceBP6Nu27UGam0DG5r0aPKLK6LVIhF5/Gpl2SMjOFrRvj9u9XcErQYjFQr0D+lh0lnWAJvcqV3P2ImBb1St1jNCfHoI+h7LeP6yzv2n+UnW6DFt2rSEEYN+xzcxWQv2tlw6/1S66+5mSUFAgHf6gRgoC/QI+k9c6JYUfBt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711491407; c=relaxed/simple;
	bh=1dSSE8o/7fxaic7JQ5aKoMmd7jjmFoEpVi/s2r32H28=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QOM+TPS+5mHatQsmko90TtWcBD7HqSNJLXCJlo8QfZVLCqu+AFxSFJci2rui1k/6ZgbJzpAnD5pliUmG2d16gtz+9eP2pn3qw5tIxQxdJkZ2B6k7TzlOwe3kOhl9ulFYxGYpnGMHNtJSCyQFUQORFr/5GOUC4Dhgut8Zh1Z8hcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J1ACnBgC; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J1ACnBgC"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a4a393b699fso44512566b.0
        for <linux-sunxi@lists.linux.dev>; Tue, 26 Mar 2024 15:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711491404; x=1712096204; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Frayo+csvFud+6F8lmDKVzF8ivbvgaqjKrnjbYcfWB0=;
        b=J1ACnBgCEZ7gdI9XUM/LQGkhKVwV8zmOt0kXCDaFK1oeMPK2wtLFBbV8hDkpLDUwP7
         7/9OP93eEjujzdZq0OLcs9/iD7+iqk+fj0UUnkm7nqoHFez4v3Zb3YQhZQ2j6VFiUFSf
         QWI68byB12flE8SCl79J9v9Rz0hUgY/GZne5aP6Vg7AkTEsmVVVTJlj0pH1xGxdlbjv6
         TdVyDiVMzuf9s+A9SjJsVQoZoNaZt4jF556WuMRggi05RQ2OoSxYkU0jVImyd98M7Al9
         5lyCRZFnGMSSCppLE+DN6mUSkPbPjfab4cnlphBwgDCDOaFNiZAuAIO/NZ37uLNzPAfO
         BSEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711491404; x=1712096204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Frayo+csvFud+6F8lmDKVzF8ivbvgaqjKrnjbYcfWB0=;
        b=YGjdYy2i+tBzwI5ZIBjbeEk8YdKpH02V2BmDsRXNVohkpWMzNicM5ECdLtv3AI9jnR
         jdHqe/FL+4EUUwYR0jZQKhbdZWZm+xtha4Jf4Pic4Lt2FxrDjpFTAtywL6gWwXNCLuqQ
         6Fvs/JnUz/m0wXB2EOrrfoMSoScZhZnl0tVs+/n9DZPWZfhWYrqGNyy/RjWuJnM7JfYd
         +1vR75OJH4rG7nfeaKYft7QmbpMEvDZyyD1Q1Lpu0D7gYiaqYVFJU0TxKv5aSmQr3iFx
         /e+kCqmDxeulPj8YBPNkPubtwS25z0mS4W4EuhexmfB2znMMWwB0nIAZayAjc+GV0aFU
         dwUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkUqWgD2PMt1C+AMVRaCWORsY/hJMDeE6T8/w0WZxSLfxo7MO8zQKmkCQK564mm8B6zFOgFxylGzlFa6B3DY0yM9VncdkD2FMiRHA=
X-Gm-Message-State: AOJu0Yz/xsQWLYsBB6EW5/qwNAnRfIfC9ttxCQxnZPskJCCnWVbRwjZY
	1LAwEIxeZha4xgPUIKRvzzGQwnp8TcLLpHRO3xuyDd7mUUNqENiu
X-Google-Smtp-Source: AGHT+IFT2nNhb6UgfQJfTCphu5HmlZV4ZvD9Mjgcz5Z++uTHWQbnlhi2t1X6P7AdnDcf85HK3UtIjg==
X-Received: by 2002:a17:906:e24d:b0:a4a:39f3:b195 with SMTP id gq13-20020a170906e24d00b00a4a39f3b195mr2314395ejb.4.1711491404403;
        Tue, 26 Mar 2024 15:16:44 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id q5-20020a170906388500b00a473362062fsm4672367ejd.220.2024.03.26.15.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 15:16:43 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Corentin Labbe <clabbe@baylibre.com>,
 Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject:
 Re: [PATCH 1/4] arm64: dts: allwinner: Pine H64: correctly remove
 reg_gmac_3v3
Date: Tue, 26 Mar 2024 23:16:42 +0100
Message-ID: <2722214.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20240317184130.157695-1-krzysztof.kozlowski@linaro.org>
References: <20240317184130.157695-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Dne nedelja, 17. marec 2024 ob 19:41:27 CET je Krzysztof Kozlowski napisal(a):
> There is no "reg_gmac_3v3" device node in sun50i-h6-pine-h64.dts,
> although there is "gmac-3v3" with "reg_gmac_3v3" label, so let's assume
> author wanted to remove that node.  Delete node via phandle, not via
> full node path, to fix this.
> 
> Fixes: f33a91175029 ("arm64: dts: allwinner: add pineh64 model B")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64-model-b.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64-model-b.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64-model-b.dts
> index b710f1a0f53a..1b6e5595ac6e 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64-model-b.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64-model-b.dts
> @@ -5,12 +5,12 @@
>  
>  #include "sun50i-h6-pine-h64.dts"
>  
> +/delete-node/ &reg_gmac_3v3;
> +
>  / {
>  	model = "Pine H64 model B";
>  	compatible = "pine64,pine-h64-model-b", "allwinner,sun50i-h6";
>  
> -	/delete-node/ reg_gmac_3v3;
> -
>  	wifi_pwrseq: wifi_pwrseq {
>  		compatible = "mmc-pwrseq-simple";
>  		reset-gpios = <&r_pio 1 3 GPIO_ACTIVE_LOW>; /* PM3 */
> 





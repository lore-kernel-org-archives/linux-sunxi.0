Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E8C155A58
	for <linux-sunxi@lists.linux.dev>; Mon, 15 Apr 2024 21:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713215446; cv=none; b=J+c84cts7mrfl2tUXmNh6vZVEx5FOCu/hCtZSLDJoPZ9E5UCorumptQpbqcSIFBN0m9K4cDhkGQJtQvjj+71Ox3m1Vh5IlKznPgz1tOLQOyPaLfdYOQCD0L/TUbOA1W/OYg+niEqCEuLU0ZSAo01BdhLeWT36FfHtgz1YhumP2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713215446; c=relaxed/simple;
	bh=xWsOHMwDq20aIhCRQXclo2deHd25wdzzVkxVCdIGEhA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BiaOQlr6FEb9iyuWT+VZJkwtIRPVCQbe6jbKMFlQvskslhbE0RO6xT9+1F2S3wwyi2ju4Yyu65UnzZwN2RdZpm52dSuFS41tAbbal22Ez80NbuaabKmQv0M6z/KnX5Nds3/EjNHtBGMcw86z23aTUDdHxQmfREkxJ5MdnbqXkiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iJhDfknv; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iJhDfknv"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-41882c16824so4290855e9.3
        for <linux-sunxi@lists.linux.dev>; Mon, 15 Apr 2024 14:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713215443; x=1713820243; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=POu8ivNdiDybNb2buQjdK1aWft9b5HTgPPEBvxZY5SM=;
        b=iJhDfknv3l8sQUQvXll+4E/9deiQPrVzhfK5WFKmRMRrMnurntUCbyIFwnE1cfJV2v
         HGrl+9/mIHIkMInc2SgAEeGfBs70C+Mb7AZh20+h0EELI0Ju3Inci66/htObonhwveQ0
         x2GOfJCwhbQ/pUq3UJJwD9xPegb9qWPbX7Ie58qjCoi0pMwJrXdA29GqkuLvnBGRkApJ
         etyvZEdH8kee4jH2w1QASv0nXnWp/LDIwY/1yk+C2c0FhWkO1u7cOSsmJpfme0xgV3u1
         JPenhNvlyb2q1NCxNqtcmnLEuCUel5KFJ8BGSPO6WVIT8fTlRbNtoymCkUIP2XoWxNAm
         ci9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713215443; x=1713820243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=POu8ivNdiDybNb2buQjdK1aWft9b5HTgPPEBvxZY5SM=;
        b=SMm72JY+IYLw3Py05sN7nJ7fyqHVYgafkUNErc8cwDZDOY/fMS3yBCHuiXgyT3KIGD
         FCZ357iujDJuyYwXCtJ4DbuNLYQJe3kJE/RcSshgHhb2PTcAhy1DJwO/GKOiE1IHwDRj
         o2JEn0vvXjPBDSehwtf7qy9jcCgZu0IEO0RpRp0ETOrOd5CSUPlrIS7FLSTAOXD0zayb
         uKXiqTz/v/m8kEFBo9gkCPNDS9ddQbj/yQfkriUVwtOLesElIWwmW9sMsCqZWCAFXS1z
         owLF5vt+0mpe+hDsEb21Qf4zdJgS1eBUlwfAps7m7dlHZz+SuOKxW1g7pOJgPTSrZdlL
         +G4w==
X-Forwarded-Encrypted: i=1; AJvYcCXsDeC/Pwu9Vd2W21URnkbgxy20HIOY3ov4fdm+FTIulIqJeLzQLXwOTiyJP21Hv1xDg0atrZlqE5BLR9pBw9bnnTYNCgT8V5WYQeo=
X-Gm-Message-State: AOJu0YzOJmgvhO3KYiiyGkCeM/9S6bEXntd7EE+5XuG5axYnQ49tiRA6
	a3ILXHdhBNjk0cpti+6z5iJuD9Y90X87dfyQbalajZ6GUzBcufnn
X-Google-Smtp-Source: AGHT+IG2p9m0jXcUa5+DHZuhGziToQ0Nz6/fB0gCfrIcRX7Kn8dYiFFVLNTE3sOo8pUzHpdfzw4S1w==
X-Received: by 2002:a05:600c:458d:b0:415:6afd:9ba6 with SMTP id r13-20020a05600c458d00b004156afd9ba6mr8104239wmo.1.1713215442970;
        Mon, 15 Apr 2024 14:10:42 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id fc18-20020a05600c525200b0041563096e15sm20910578wmb.5.2024.04.15.14.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 14:10:42 -0700 (PDT)
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
Date: Mon, 15 Apr 2024 23:10:41 +0200
Message-ID: <10447698.nUPlyArG6x@jernej-laptop>
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

Dne nedelja, 17. marec 2024 ob 19:41:27 GMT +2 je Krzysztof Kozlowski napisal(a):
> There is no "reg_gmac_3v3" device node in sun50i-h6-pine-h64.dts,
> although there is "gmac-3v3" with "reg_gmac_3v3" label, so let's assume
> author wanted to remove that node.  Delete node via phandle, not via
> full node path, to fix this.
> 
> Fixes: f33a91175029 ("arm64: dts: allwinner: add pineh64 model B")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied all, thanks!

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





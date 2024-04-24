Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71981BC46
	for <linux-sunxi@lists.linux.dev>; Wed, 24 Apr 2024 18:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713984712; cv=none; b=gqsLwjVTpWNrUV6bzVzBRyVnXHnUHPJi5fUsvaT+CZyAMDlVJIOjZwfBOqkpprcZWVz9u6Ft3TgVsUHPUJNLD/zMJyUwQKhAs9JR+MPY8uTaL0l732ckCINEUREg/WpjLMN+y/phW3JNTyCImXc6iPJY+/egIqtEJ15ozris9c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713984712; c=relaxed/simple;
	bh=vuMk1QgikSDEEeGco6UMeBCTBd5f/GEtFZc991ed59Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UwRLN03+8TH9PZrVzLGTXyQERN6bDH+LetqiVraa0e+gpzWY2gxC2BTxPe/2KuIxMqEIAE8qDUPK5CRChfohJ3fra3JmDwPQHwaz1bLO3KwiHZR/FvunpoPud9Ex1o975JzlQuXm4e6UlaTtLXP6DRLIKP1dRSu0YpHUzYXMltc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ss5Qpoc/; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ss5Qpoc/"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2d8a24f8a3cso1777991fa.1
        for <linux-sunxi@lists.linux.dev>; Wed, 24 Apr 2024 11:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713984709; x=1714589509; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FLPBsj6B/3tiV7UWLTUL+3NKJx/evfhdoy7p88aVBXw=;
        b=Ss5Qpoc/lM0QKKxd73Kri+9DBq5mN9zVh6JsuBpdiVT9/fZtn4OcFA900t+hlsbjMp
         /damqVTcnHSAiyQdMqBXr7WsPB4LI7e7bq4IucLgqyyBuXKvGr68DZPoeKfgwMSQzJkC
         jnI126I3SIKbW037LiVmWfnPj2SRGnvyRHrQBY9l+1dyQep3TFwrkENWiTesOYVLIzn0
         +mqla2UUx7sBvaFMKYhjQ630zfsaizV11UaVjk1ZAcMCRxy84f8efgH+xPAbljyML/Sm
         EdQBhMpSbP4/IeY8k7K9IoobkZ1PMULEf128qY8tGbCNWH7m4K9heGB/6zRc1rnzcGYM
         M8Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713984709; x=1714589509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FLPBsj6B/3tiV7UWLTUL+3NKJx/evfhdoy7p88aVBXw=;
        b=IoGqutQZxKrXyx8XshuKIqmccHRn+zJuLsxDWzIwVhVsSc8Z/aXD3EMai1fEBy/8ZS
         A5Cbipj6f3pwg839JeNQ6XB1VD95AtI56RlqzGdaqHJjSEPMVogpM4nZ1j8EojX6KM2x
         YJ+6z3nwXmthk4MfHuMMVg6vPIvHHrGRUKOBqy04QI2JAAKg3k6AL7XJcC4ymw1Uoscx
         HGfr2hE4OhHIOUsnSZHiMh6SwUn3DgmxE789bBLnLT3UngvGlH9XJpBP2SM4GKsIKRm8
         PEltnF3wKCHeLdRNWLmvBPrfHq5KZwWjTFVN3i4tQns/AtuOs3H25yzBjlHK/Ba8lBmT
         v+AQ==
X-Gm-Message-State: AOJu0Yyi6T8ifpaepSCJ9M3CmAhJzaOzhpSR2wQv4nJsK4e3dtbycP2o
	CV2xlbqPtLlwAEh+0533NK7YnV1j7yaWH80xUVNJvOjpJpQR4NsC9Omlo8KQ
X-Google-Smtp-Source: AGHT+IFok3DPe7JKDynCYR8HngXGI/y/zfSzeeITC6snJlIfRG1DDapNIoerRXX4eFWIXdwwvXl1vQ==
X-Received: by 2002:a2e:a4c5:0:b0:2d5:9703:263f with SMTP id p5-20020a2ea4c5000000b002d59703263fmr1967751ljm.44.1713984708642;
        Wed, 24 Apr 2024 11:51:48 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id s3-20020a056402164300b00562d908daf4sm8193466edx.84.2024.04.24.11.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Apr 2024 11:51:48 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-sunxi@lists.linux.dev, Dragan Simic <dsimic@manjaro.org>
Cc: wens@csie.org, samuel@sholland.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-kernel@vger.kernel.org, didi.debian@cknow.org,
 Marek Kraus <gamiee@pine64.org>
Subject:
 Re: [PATCH 2/2] arm64: dts: allwinner: Correct the model names for Pine64
 boards
Date: Wed, 24 Apr 2024 20:51:47 +0200
Message-ID: <4912377.31r3eYUQgx@jernej-laptop>
In-Reply-To:
 <f4a7e60040aa7cc1ad346bd1cc35b64256413858.1713833436.git.dsimic@manjaro.org>
References:
 <d2943d9f4c99a239f86188eaf45a73972685c255.1713833436.git.dsimic@manjaro.org>
 <f4a7e60040aa7cc1ad346bd1cc35b64256413858.1713833436.git.dsimic@manjaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Dne torek, 23. april 2024 ob 03:00:20 GMT +2 je Dragan Simic napisal(a):
> Correct the model names of a few Pine64 boards and devices, according
> to their official names used on the Pine64 wiki.  This ensures consistency
> between the officially used names and the names in the source code.
> 
> Cc: Marek Kraus <gamiee@pine64.org>
> Signed-off-by: Dragan Simic <dsimic@manjaro.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
> 
> Notes:
>     This completes the correction of the model names of the Pine64 boards
>     and devices, which was started with the Pine64 boards and devices based
>     on Rockchip SoCs. [1]
>     
>     These improvements may cause certain issues if some scripts misuse
>     /proc/device-tree/model to detect the board they're executed on.  Though,
>     the right way to detect a board is to use /proc/device-tree/compatible
>     instead, because its contents is part of the ABI.  Such scripts, if they
>     actually exist in the field, should be improved to use the right way to
>     detect the board model.
>     
>     [1] https://lore.kernel.org/linux-rockchip/06ce014a1dedff11a785fe523056b3b8ffdf21ee.1713832790.git.dsimic@manjaro.org/
> 
>  arch/arm64/boot/dts/allwinner/sun50i-a64-pine64-lts.dts         | 2 +-
>  arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts           | 2 +-
>  .../boot/dts/allwinner/sun50i-a64-pinetab-early-adopter.dts     | 2 +-
>  arch/arm64/boot/dts/allwinner/sun50i-a64-pinetab.dts            | 2 +-
>  arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts   | 2 +-
>  arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64-model-b.dts    | 2 +-
>  arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts            | 2 +-
>  7 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64-lts.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64-lts.dts
> index 596a25907432..4aab1f98fac7 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64-lts.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64-lts.dts
> @@ -5,7 +5,7 @@
>  #include "sun50i-a64-sopine-baseboard.dts"
>  
>  / {
> -	model = "Pine64 LTS";
> +	model = "Pine64 A64 LTS";
>  	compatible = "pine64,pine64-lts", "allwinner,sun50i-r18",
>  		     "allwinner,sun50i-a64";
>  
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts
> index 50ed2e9f10ed..a3c1752fc5d8 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts
> @@ -13,7 +13,7 @@
>  #include <dt-bindings/pwm/pwm.h>
>  
>  / {
> -	model = "Pinebook";
> +	model = "Pine64 Pinebook";
>  	compatible = "pine64,pinebook", "allwinner,sun50i-a64";
>  	chassis-type = "laptop";
>  
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinetab-early-adopter.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinetab-early-adopter.dts
> index 6265360ce623..86cc85eb3d48 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinetab-early-adopter.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinetab-early-adopter.dts
> @@ -9,7 +9,7 @@
>  #include "sun50i-a64-pinetab.dts"
>  
>  / {
> -	model = "PineTab, Early Adopter's version";
> +	model = "Pine64 PineTab Early Adopter";
>  	compatible = "pine64,pinetab-early-adopter", "allwinner,sun50i-a64";
>  };
>  
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinetab.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinetab.dts
> index 0a5607f73049..ebeb04156eb6 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinetab.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinetab.dts
> @@ -14,7 +14,7 @@
>  #include <dt-bindings/pwm/pwm.h>
>  
>  / {
> -	model = "PineTab, Development Sample";
> +	model = "Pine64 PineTab Developer Sample";
>  	compatible = "pine64,pinetab", "allwinner,sun50i-a64";
>  	chassis-type = "tablet";
>  
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts
> index 5e66ce1a334f..411d97610be9 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts
> @@ -8,7 +8,7 @@
>  #include "sun50i-a64-sopine.dtsi"
>  
>  / {
> -	model = "SoPine with baseboard";
> +	model = "Pine64 SOPine on Baseboard carrier board";
>  	compatible = "pine64,sopine-baseboard", "pine64,sopine",
>  		     "allwinner,sun50i-a64";
>  
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64-model-b.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64-model-b.dts
> index b710f1a0f53a..52d81ff0d77d 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64-model-b.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64-model-b.dts
> @@ -6,7 +6,7 @@
>  #include "sun50i-h6-pine-h64.dts"
>  
>  / {
> -	model = "Pine H64 model B";
> +	model = "Pine64 H64 Model B";
>  	compatible = "pine64,pine-h64-model-b", "allwinner,sun50i-h6";
>  
>  	/delete-node/ reg_gmac_3v3;
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts
> index 1ffd68f43f87..f8b524d02429 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts
> @@ -9,7 +9,7 @@
>  #include <dt-bindings/gpio/gpio.h>
>  
>  / {
> -	model = "Pine H64 model A";
> +	model = "Pine64 H64 Model A";
>  	compatible = "pine64,pine-h64", "allwinner,sun50i-h6";
>  
>  	aliases {
> 





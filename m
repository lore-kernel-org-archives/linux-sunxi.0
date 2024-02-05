Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D6245961
	for <linux-sunxi@lists.linux.dev>; Mon,  5 Feb 2024 18:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707157416; cv=none; b=Rg61jrvGd5XMcapGODKjYBRkq7g6USx6l8Mqyylg6kkTwzfxNg1tf5ioTJXZpHeE5HgScs826i/611X7Gliba/Dr6slOs+ahp/vmAYPXtzWMxYLU0MZTh5g5hhehjwONM4gp1HffbxraeCokwcJUhC0SaSxuOt+Kr07GyAS8Foo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707157416; c=relaxed/simple;
	bh=Vtb/mOeHAse8yaMORtCdfIl8sKi0fRGFhD1NJ+u7Ftw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u4ptpfKum9m/0Gxe5kAWlfWiyekXmI/5/ksWdntqZav54s5U6Lx90tKb9dRYJ2H94EhtUaeKbfbp1mVTQ1JsYhG4gjoUdbrkKUuQdzBZEKVzw73fTShxyvdrMezrHWeBPFbpzduw4y7JQ/nMI2yURioRU/xyHoYO98tc7+l6ecc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mB3ilaaO; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mB3ilaaO"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-40fc52c2ae4so31493155e9.3
        for <linux-sunxi@lists.linux.dev>; Mon, 05 Feb 2024 10:23:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707157413; x=1707762213; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=llwmL9ShaEp//MaiML1a5WGyBP2svlmp4kDFM1egn8Q=;
        b=mB3ilaaO9vnbz40KpaPCUbXDkqA7YlbLchNNNLRYd49ZLfWOXfUxUfefiJmGkBXZbt
         0UDILAUZ1CQXe7U1EdYbrAIxQmtFpmW6hJ17JKXW8o2jgX/eHBuCAxI0OOTjom8puN9D
         5e9EfSeKiu9AHPHuEmxF8Ir4fy0nJ8wZ3bEBr7rXaYXyHYU+MDbCYfEXUEeU5s2YADHF
         lFLdmR/YxIKrSIFiJWVtBJsh38AFZ/mBHGhpLUm2LqxV5ga9jDi78SSqI/VFgvTTBt+H
         1V7PHhz/DhALS6oiB/oHb8/qnQG4q+x2Hs7pU3w/7sOc9Jd+ia9ebTK4TbRbNMNewH0C
         0tPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707157413; x=1707762213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=llwmL9ShaEp//MaiML1a5WGyBP2svlmp4kDFM1egn8Q=;
        b=Rjhy7O2v745SAMvwh78QYB84Oh10ooeGFHQnzBdg02F8L3kp6s/HxcJglKIZb5NkvD
         5ZOerOIIgPH4Jj6Q4XfnbjHiMiCOGWqlGoO+MoVn3N6XW9/uQsHpzM/ERTDmgNK7NXAy
         hrb5e8SmlBV965dHJEmvfnOaxOHhukXD0FzjhskE7R4RuT7GEQnWu2w1jS6Uv7xR9dco
         TM0JSdj/chzODwZyaxcdKlXf6VO3XvIvsAbMvIryyW6VeXjCbDAZGvQNsDEYGJkJbtb0
         0HipRqXA9LbgYxUeh9oNYF2T6fIWN2tNx175h78g+8Qd64d5Upq8w8dOx4zlnXeU+tL5
         oB9A==
X-Gm-Message-State: AOJu0YwCVFzmdQdVLK4ixrCxzfWlznqBT9Pp+yDZ1oJ5fl257v5t1O1D
	8QLg7CJpqePlFaC/TGAu027tefGF0eTJOiau/jHzIk9EOr0hPfcT
X-Google-Smtp-Source: AGHT+IF+PRrZ+wNF0mdYihXzAakKUW/t1o6iXTNrX2i9w22geW2gA879qLYEWTo72IZb+gzNd85HOg==
X-Received: by 2002:a05:600c:4fcd:b0:40e:d2da:fc6b with SMTP id o13-20020a05600c4fcd00b0040ed2dafc6bmr423873wmq.38.1707157412692;
        Mon, 05 Feb 2024 10:23:32 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXEXjKAWo4Sfp0o4IVMebdxdm/yOr/7WYPc8ZWNcsq2Q5uopoSqL/PW9++OiPhiTEvlBFfp2+LP5i9JIePAWDh8RwsRBQAO8XyuxSsKZly+LivVuiOl2gm1DkxniWkwPWDVtYxJwvj1z1ypBXYhW64/nAGuBet0P92JOlpM5zopEXZO2lCK4ylAtEjpCgBoejvk2c0abLcWjFf10MxxocBn+DvbOeKYcZ0AYNlBk7Cyhc7ifXPVe/+MriY8V+n4FSz4Sq6ICWZtE4hfYGbFzZQ2J5jHJqc+CJIxLCdT8/dCVqtmQCtAq7npKqkm4wBATDYcqQakQOQ4798ZKYtQrS6Rsw==
Received: from jernej-laptop.localnet (82-149-13-182.dynamic.telemach.net. [82.149.13.182])
        by smtp.gmail.com with ESMTPSA id n17-20020a5d4211000000b0033940016d6esm174561wrq.93.2024.02.05.10.23.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 10:23:32 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Andre Przywara <andre.przywara@arm.com>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Nick Alilovic <nickalilovic@gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: allwinner: h616: Add 32K fanout pin
Date: Mon, 05 Feb 2024 19:23:31 +0100
Message-ID: <3206408.5fSG56mABF@jernej-laptop>
In-Reply-To: <20240204093255.148972-2-andre.przywara@arm.com>
References:
 <20240204093255.148972-1-andre.przywara@arm.com>
 <20240204093255.148972-2-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne nedelja, 04. februar 2024 ob 10:32:54 CET je Andre Przywara napisal(a):
> On some boards the designers saved on a 32KHz crystal for some external
> chips, so the SoC has to help out, with providing a 32 KHz clock signal.
> 
> Add a pinctrl group node to allow DT nodes to reference this fanout signal.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> index d549d277d972..107256eeedc3 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> @@ -256,6 +256,11 @@ uart1_rts_cts_pins: uart1-rts-cts-pins {
>  				pins = "PG8", "PG9";
>  				function = "uart1";
>  			};
> +
> +			x32clk_fanout_pin: x32clk-fanout-pin {
> +				pins = "PG10";
> +				function = "clock";
> +			};

Please add /omit-if-no-ref/

Best regards,
Jernej

>  		};
>  
>  		gic: interrupt-controller@3021000 {
> 





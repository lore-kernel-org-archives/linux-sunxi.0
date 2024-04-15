Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A99823CE
	for <linux-sunxi@lists.linux.dev>; Mon, 15 Apr 2024 21:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713216523; cv=none; b=AR2HT4QUvy7O1/5keb2UeMdwhcnNGxd7Ie6cYjbnt9lEvqftx49gTnPL1nhCZ1W13pQqqlvC/3acbinm3Z9XLmxp74C2pQMjBtzsn5vNGY8tuba8gZ34DNfKsuzphxKhi3Xrx5ffS1HVR47ELRKJsKArUX43JW9Q/v1XXzn7pNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713216523; c=relaxed/simple;
	bh=6o2RNpAOIIImMwHc2nDc4z9HtThbUA8rtQ+95VzL2dU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M6GV5oFcABqXsbKTR2Cp8NYzQJGayLM8d4l3HIidYKMGni9s6iA9Zbt/+WaY0R5AfB6o+WhRkNj2ykBc4LUbJlcUFsVq8mm5z71yxJaGXls0kFnvUjqB2kLed7tGg415XkvyyptYbZkZseRKadKfzniWKeSd1rddbrwvS/T5BL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Klbcv7gE; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Klbcv7gE"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-343c891bca5so2413272f8f.2
        for <linux-sunxi@lists.linux.dev>; Mon, 15 Apr 2024 14:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713216519; x=1713821319; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M389Tk4mAmP3K0cjNFAlzwXHEn7CaYIwFlCUxuAdzkw=;
        b=Klbcv7gE+sgwU63Ocdb3mbqh65AAQI6JBMouM1DAcaArluPEV3fGvELeADPzLnaGrf
         NF3rpMwY1HD4gxKDvvk7mvYBIWSrpHuOrNdNkuhbOQQuDAv82KaLafeMzYWVtA3YxAiy
         m+OLQUH0gVhdZs133TIbaaK1Ar5Gsyc63OeAb+MKpUjJOpLvicJMCL22+X+8+wpGfz4t
         GmDi97GcnaKP0s1fEPgiErnrBUKQraFZZYSQBstRzAyIUzknoHjhI+1FWoczL1k12kvd
         q1Cm4oqoBTuJ+1R9ZnlPRsgxFB3UUc42zhvnQy+2WR0emARXsWAab+aUEPl/XzqC0UUt
         S1SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713216519; x=1713821319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M389Tk4mAmP3K0cjNFAlzwXHEn7CaYIwFlCUxuAdzkw=;
        b=I/1d96R9/v54Yk4CPCv1mIEgaocj/V6dzwe5b8XLduKrVkaJXVlBy4ajiSoDmQByZo
         Xkt0JDsqO/C1Z46NByb4dQp9piicJJqw6kM8oUBOq8KfO6FDGs97naGmu/pBQyjhK5OX
         if0BOtNY6+mw3o+3OFLVK0ZrOQ2J2/KVa+IRFsa6f15mOANizj2Hj1BxbusXzwPg/cSg
         siyJCj/+7ctvy1Pg76+qjHbeAA7peCOVfZ8+eTUwgg4fR5QDIVRsoMmOWJaMwt71eMMD
         tmWUdtQ63PgYvSbVFaH6WiYpJwRsKHSVxUg/766IxB/hxmB4KVxT4MMFhTudJWHQAkeB
         ffOw==
X-Forwarded-Encrypted: i=1; AJvYcCUajEav+s9NchuL5/G5FA+w/k7tE6dgq+kssD1dtUhr1rPEZgQuY4V4cC52tCylgau7zY5EucikIPDwliEm2aWgAfYRBzqZyOBdtzo=
X-Gm-Message-State: AOJu0YyOP5G413wFHu9FEIrvHvBDPRXIIA/5ZUCHjLnJszIF9fTDv5i6
	4Wfw3XoznM2mtUhq9CVl96Gr16GQAOJ8a79XtQuGyTr0xb/97Lq3
X-Google-Smtp-Source: AGHT+IFEfrCMJfFLq0sZcwQtrD3siw+Wnm6zImHGHNwxQSkjweWfxHE2BRfiQXHiDokuHXDITmhXzA==
X-Received: by 2002:adf:e607:0:b0:349:40dd:8d7b with SMTP id p7-20020adfe607000000b0034940dd8d7bmr5502wrm.67.1713216519489;
        Mon, 15 Apr 2024 14:28:39 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id r26-20020adfb1da000000b0033e745b8bcfsm13214006wra.88.2024.04.15.14.28.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 14:28:39 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] arm64: dts: allwinner: h616: Fix I2C0 pins
Date: Mon, 15 Apr 2024 23:28:38 +0200
Message-ID: <9261892.CDJkKcVGEf@jernej-laptop>
In-Reply-To: <20240329103825.25463-1-andre.przywara@arm.com>
References: <20240329103825.25463-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Dne petek, 29. marec 2024 ob 11:38:25 GMT +2 je Andre Przywara napisal(a):
> Currently we specify the pins for the I2C0 function as PI6 and PI7, even
> though they are actually PI5 and PI6. Linux' pinctrl driver and the H616
> user manual confirm this.
> 
> Fix the pin names in the pins property. None of the existing DTs in the
> tree seems to use I2C0, which explains why this went unnoticed.
> 
> Fixes: 0d17c8651188 ("arm64: dts: allwinner: Add Allwinner H616 .dtsi file")
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Queued for 6.10 as it doesn't affect any current DT.

Best regards,
Jernej

> ---
>  arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> index f756a396ea3da..95f09204337f0 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> @@ -227,7 +227,7 @@ ext_rgmii_pins: rgmii-pins {
>  			};
>  
>  			i2c0_pins: i2c0-pins {
> -				pins = "PI6", "PI7";
> +				pins = "PI5", "PI6";
>  				function = "i2c0";
>  			};
>  
> 





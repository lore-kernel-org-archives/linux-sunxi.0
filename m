Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40EF2C1A3
	for <linux-sunxi@lists.linux.dev>; Fri, 22 Dec 2023 17:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kDN9MwM3"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a2370535060so581236966b.1
        for <linux-sunxi@lists.linux.dev>; Fri, 22 Dec 2023 09:51:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703267494; x=1703872294; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g5PzFyYcX86yCLXNKDOjJWI+21oWYWqgqfLfuKAPKRg=;
        b=kDN9MwM3HNSh5FKqQbKMDYm8JZ6z3CqIVuiSFQnDXanwebHWL3LlnTbQ3HobvAIuh8
         MHkTP9y83/2+wkdCe0cCUu6QMsJ9t9Tsn2now3uchMcqtSWrOAEW0mIm9fnnbi/Wsyce
         TseD7j0vt6dRwFCpbxlCCxyJgrN1DeaqeCM8GULLCGb4IK7QCYbHTHeH5gXm+GEmKeOk
         1xwfuVkrJFcZMy5ezCd9KsWsTExVqOF9qn7bgzc70PEdFJyZJJtfR2Vm7PE1+52L4K/w
         OPVtgQZqIjlB9N598w9Y6F/jpsDPpUcyTN7PvInXqBzObVnYNVb1t0t5h300tS97ytQ2
         pgew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703267494; x=1703872294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g5PzFyYcX86yCLXNKDOjJWI+21oWYWqgqfLfuKAPKRg=;
        b=CuV0IE2boxFTmS0SGKqznW9P9Q6MazoI9/N1nGDJMhU4Vg3PS6BR/VY8rFVpHFeWVI
         fnbnGaC7RXdCM375gHECHOXQJlnHvQDOV736QQ1+76+i5PfGXvs8UTLqQNLmj6axDz0E
         0JqjLjGISW0l7pBSu6fescWCHaW2txZb+QQGz4wwbC3RbEWiWl1dSntb5JEIjH2MMHLN
         6Y3qUB4NqK47A+Bk2h1HXc26fGD35vl5+nvmVSqR8CmHpDAxa1Pm1alI6LDV/anxkS+k
         rPPyV3wJ6eRWveWUL4qn+qNAyR2r+ye8HQqrM9FvyBOx9tvW8e82eZ2QjY9ocrLK9+xh
         dF7g==
X-Gm-Message-State: AOJu0YwpisxzuS7qevIRUllzFzBWOXkvi93ZyAqUtLlOQNr1gRTOKSfj
	mGvmQ2wNUMweYXtQJ1C2djI=
X-Google-Smtp-Source: AGHT+IEmmfJDl8r9eainIjCEsYgu5V4LJQxCLxpqL7aCrNTs+kDc9ivnEx+x6SbJCwhPn1EFWFUnwQ==
X-Received: by 2002:a17:906:4ed6:b0:a26:c590:1b4e with SMTP id i22-20020a1709064ed600b00a26c5901b4emr1013585ejv.36.1703267493630;
        Fri, 22 Dec 2023 09:51:33 -0800 (PST)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id v27-20020a17090610db00b00a2689e28445sm2225366ejv.106.2023.12.22.09.51.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 09:51:32 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Andre Przywara <andre.przywara@arm.com>,
 Alexandre TORGUE <alexandre.torgue@st.com>,
 Enric Balletbo i Serra <eballetbo@gmail.com>,
 Baruch Siach <baruch@tkos.co.il>, Paul Barker <paul.barker@sancloud.com>,
 fuyao <fuyao1697@cyg.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] ARM: dts: sun8i: r40: open the regulator aldo1
Date: Fri, 22 Dec 2023 18:51:30 +0100
Message-ID: <9259140.rMLUfLXkoz@jernej-laptop>
In-Reply-To: <ZYKjYypuAx7gNuam@debian.cyg>
References: <ZYKjYypuAx7gNuam@debian.cyg>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sreda, 20. december 2023 ob 09:18:43 CET je fuyao napisal(a):
> the aldo1 is connect regulator pin which power the TV.
> The USB core use TV ref as reference Voltage.
> 
> Signed-off-by: fuyao <fuyao1697@cyg.com>

Subject line must have board name in it. Please also update message
as it's unclear.

Best regards,
Jernej

> ---
>  arch/arm/boot/dts/allwinner/sun8i-r40-feta40i.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/allwinner/sun8i-r40-feta40i.dtsi b/arch/arm/boot/dts/allwinner/sun8i-r40-feta40i.dtsi
> index 9f39b5a2bb35..8906170461df 100644
> --- a/arch/arm/boot/dts/allwinner/sun8i-r40-feta40i.dtsi
> +++ b/arch/arm/boot/dts/allwinner/sun8i-r40-feta40i.dtsi
> @@ -42,6 +42,13 @@ &pio {
>  	vcc-pg-supply = <&reg_dldo1>;
>  };
>  
> +&reg_aldo1 {
> +	regulator-always-on;
> +	regulator-min-microvolt = <3300000>;
> +	regulator-max-microvolt = <3300000>;
> +	regulator-name = "vcc-aldo1";
> +};
> +
>  &reg_aldo2 {
>  	regulator-always-on;
>  	regulator-min-microvolt = <1800000>;
> 





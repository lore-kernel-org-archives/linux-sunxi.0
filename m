Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784A55E224
	for <linux-sunxi@lists.linux.dev>; Sun, 11 Feb 2024 20:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707682729; cv=none; b=PBbZWNxVGQ9WF1PW+JLYaOZ6nm3xtUXSp01tpvRE1StMzmRIkkwGue+5U+i1Hmm8RGPC8h4pw+YNN5yRn2NCx5ltKQzBvk4gY7WWkMdXN/IKSIMZnCB8CvmPF5+zXLkkKEC4sSdKI1wj7i9dvHxCD5ppQEEyes7+x6fXOq/fygk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707682729; c=relaxed/simple;
	bh=dKCtnqQrdPiAcB5tU3OAGqv2wvew/q0hoFczpMUZQuo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pyPufK+Sey/jVIOC7D23fKcRFjckf0UCgSD0XY6YRTNXS1pqCIiwN3/fTN8WHIcDirQ95XiaiWGat/CxpBDj5je5604OcNjY2vgxdzPuBdQ/6ezMwLOMkJjZjxRpL8e0cR8KqhZ5GgXSUSlFtzUZ55Z9vdU2MbgPhibSrO7M+zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lO9JJUGX; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lO9JJUGX"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-40fd72f7125so21520265e9.1
        for <linux-sunxi@lists.linux.dev>; Sun, 11 Feb 2024 12:18:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707682726; x=1708287526; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5+YiYsQBrTTOvviGUFRUVFiil2HbbY6cTsvycoefVBE=;
        b=lO9JJUGXlidckfZarSGZ7Hb8D+6XTMIDPft88wnpDP2KZJDbbIEJXe8/kSFNQUioSz
         fjm377HSQh0/hKqV6JRvzlIdKsVRn6kkuZPrrITK+SD7aVJIOMtUPZfBDMjalNCbW4t7
         rly2BZDxnn2aMsxzpvoWAjnuqrfeNmXEq/9Uar+xDXSN4F4+qYwrA+FlGNvPbdp5xhgY
         hLoirODhNHX2zgcCxdVTAObDL0E+CEjS5bVjSaVMoACMmbaC3xeE2b1WTMS/8vkbasRG
         BpL5S0syGePNTYvrjeNWK/9EJnQJMKDST/KG6+v9Tg50fHGHOGCoM50dsaSR8wOtSQzz
         i/aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707682726; x=1708287526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5+YiYsQBrTTOvviGUFRUVFiil2HbbY6cTsvycoefVBE=;
        b=KTR/ARs+V8DMk/DW6nTr9tjWv9ldKymJx8WW0lPrluyeqVsur9JhlbGafG24YeUTv3
         ZGIF4oEafoTQk8Lp1BUUx57FwpFAMyIeQZXx9tK1tcsCWmnzB/DSFNJRL4jwp+DsrJEg
         sqP+EMKEyJTCj3f/tXS7zZQ09+5is2tXiBZVrUhWOG+SJ0hiLaNShwQtku8CtB1rD+WB
         W6nwennwvzOv/4Q197hEwO1obiF+s6EI3dWYFTCfbS9TMtfmqfIlWvwBtU8sJkpH0g+X
         ySGQtYNfXpUiTLX/jeUaj9cM9A93PBExSUcCMB3X42b9sTlnL7GDXVkcYvO8bTxgOAKb
         c+cA==
X-Forwarded-Encrypted: i=1; AJvYcCWzJDg9yhY3Hmgypc/+ozxOn+33Nre0TdUCRCZ2+/SY85qClIrzGj3BrDvsaxvMi5HiJRpNv7SRd8xMtmZBfOwkwCOFzoXox4yw1QA=
X-Gm-Message-State: AOJu0YwoccOp5zwmj6CIZz8Ftr95K+5d1o1sUVnZEA8eO68bbr1Dt98J
	KRmDHLN0pnQezjrj2iEj4kyBrcdShcgCnK1wYnEkXWEjmlnAet+hm9s6tvfb
X-Google-Smtp-Source: AGHT+IG/07bMwCShxjkLi2N6MPnqgrqRM4NBXbflM3tKfwK+14p/k/CnwbsQvu10AaXMiynZX0TXZw==
X-Received: by 2002:a05:600c:46c9:b0:40f:ddb6:a63b with SMTP id q9-20020a05600c46c900b0040fddb6a63bmr4345296wmo.24.1707682725574;
        Sun, 11 Feb 2024 12:18:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVkm7WeMzZocmE3nk64qrBJmiwW4HTrGgXGwgNE+N6FdmH5kVUsxznMLAMhXaGcAomSUOhkQtxc9ePhJNTHhbjiejXoj8Eg3jyA354G5YjBLKJ67+MKso/KEdyn/BMnvEOei5ZD9BQjJuRCoGbC2ySYRSZa2LfTr/JKKk2TG3TAtSYDn0+Ag6pZyFpoJ/rUeWIhzGJ7RHZOOIhqgkAr/glEWqpheiTntE3bm6/GWXn5mdAX5XABoLASYUViB0lFoAUW4IRrhIJ/lfImnh/qd8M0uYiOr8vbRTKZ0FyuHCFOodpQv94=
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id o19-20020a05600c511300b0040fd2f3dc0esm6609776wms.45.2024.02.11.12.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Feb 2024 12:18:45 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject:
 Re: [PATCH 1/2] arm64: dts: allwinner: use capital "OR" for multiple licenses
 in SPDX
Date: Sun, 11 Feb 2024 21:18:44 +0100
Message-ID: <1959194.PYKUYFuaPT@jernej-laptop>
In-Reply-To: <20240208105301.129005-1-krzysztof.kozlowski@linaro.org>
References: <20240208105301.129005-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne =C4=8Detrtek, 08. februar 2024 ob 11:53:00 CET je Krzysztof Kozlowski n=
apisal(a):
> Documentation/process/license-rules.rst and checkpatch expect the SPDX
> identifier syntax for multiple licenses to use capital "OR".  Correct it
> to keep consistent format and avoid copy-paste issues.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied both, thanks!

Best regards,
Jernej

> ---
>  .../boot/dts/allwinner/sun50i-h616-bigtreetech-cb1-manta.dts    | 2 +-
>  arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-cb1.dtsi  | 2 +-
>  arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-pi.dts    | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-cb1-ma=
nta.dts b/arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-cb1-manta.d=
ts
> index dbce61b355d6..4bfb52609c94 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-cb1-manta.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-cb1-manta.dts
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: (GPL-2.0+ or MIT)
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>  /*
>   * Copyright (C) 2023 Martin Botka <martin.botka@somainline.org>.
>   */
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-cb1.dt=
si b/arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-cb1.dtsi
> index 1fed2b46cfe8..b2988f500231 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-cb1.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-cb1.dtsi
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: (GPL-2.0+ or MIT)
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>  /*
>   * Copyright (C) 2023 Martin Botka <martin.botka@somainline.org>.
>   */
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-pi.dts=
 b/arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-pi.dts
> index 832f08b2b260..ff84a3794470 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-pi.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-pi.dts
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: (GPL-2.0+ or MIT)
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>  /*
>   * Copyright (C) 2023 Martin Botka <martin@biqu3d.com>.
>   */
>=20





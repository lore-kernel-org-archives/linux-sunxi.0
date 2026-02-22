Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1771D6BB
	for <linux-sunxi@lists.linux.dev>; Sun, 22 Feb 2026 12:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771763438; cv=none; b=M9WVR7gQGQacshoiE00ekByasXRLVH1irLq+E2a0yfNVUp2WpqWe6/K9KGAmirJoNBXOW1Q58MxcX92TtS1R1DJMGfV8QrCz4pQUp7SRZT0rjEbd/J+GLCrR+LSbcqDtFWXVjT2902wh56kskZMhi6N/oZn1KwlRbQwS8lSb0eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771763438; c=relaxed/simple;
	bh=tzxl38FPzMo6zN1VmPw1jU1ks9I5QTmsXkZQLi+PoK4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mKk7uT2Q0RO5BflDYqOb5gnu+6a1loDy+u8rLkuBCKaGk0Q3tgd3qBugJVsTQE19AjYP3MP2hgEjhDXFgVtDl8wnexmcxR8nMSRWc0CW1b4vM5rhpmOt5MaejCAM2jhrE0V8Tst3wHp9P3lQzXkdRsBcsJ/y4fqzF8viGad6nzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WyIr6gsz; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WyIr6gsz"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4806f3fc50bso39283695e9.0
        for <linux-sunxi@lists.linux.dev>; Sun, 22 Feb 2026 04:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771763435; x=1772368235; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oSJS2GkYexnr2R3qwinnT+ROgZLneAGoFNuJa+6p93s=;
        b=WyIr6gsz46SjyDwlCKITVPJjCcoyveIlVohKnyleQ7AMOSrfNa6CH08OOmccjNmNA7
         om327OJVqxKIcEES/EdllCK3LFkTVnsOW8rek2uhAlKuXDcY9JKjFG/6EvcbCuYtpOol
         6wobpEVldUaJUsZB5d9PxLv92KGW1/Quhi2ykckT+y+BeD+VHP84j6feSzk4kLwIMpcK
         csIFij/Rtqieij/0YoYO4YnAjpyR3XxRRtZo5dWvRnN3wB39WqaS0aaqAZgYP2KNIUto
         6wGhHYDYNDdcwiAfX+i0GL2CSmmOjKc1bgsXNZVfKkz483Lhn2vH3tROs2mcLMgmusRN
         bJow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771763435; x=1772368235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oSJS2GkYexnr2R3qwinnT+ROgZLneAGoFNuJa+6p93s=;
        b=mF9M2r7OdAUHz8DhsCU3Nw5oFhBJicKkrJkhjYbnMisiY7mVltwNcX465rluweVR1w
         R9d3VlRAlphQ23qqzpuwjggK49SVOjq4TaLI0+z8ltoSX0/jl7jHEiIzq91BUjB30oru
         kSfc+wyvZJPsEA5b3EhwMbmPAR+VetBfK4GNYLq+raKvMJvPGG6z8m2BjSYDJbmCs/i4
         ZJNVdsZKGKM/e6JI8ejEMnt3eDJgo4X5ZwqkbTuKwqoQWiPDEUoRlKYaCrPyJBIg1FQZ
         70AK2OrR30jcfx/eWnrtdjpQumYfzYXNcaXBcVCwEhgSAo0mggiKiwqZ4Te3EiZqDPMx
         kTxg==
X-Forwarded-Encrypted: i=1; AJvYcCV7T7Gr4L3KEauEdmBKn1j91YpX8hqFingW0qdP47zRoYIbNgPLLovyTP9XGVFTsyal0p73e3pUGUWyCA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy8H9FzDaaxQrr6jzgvMjBM7pcRljvdEK/5cxvq27OLDi2iRXDH
	Uv0cbB9ZTsbiFfnpcA3ODyMLtAtyv/SF5XXETv+B97xJYW1mnFCaWQAe
X-Gm-Gg: AZuq6aJ63HJkyc9/jBFWDZZPY/zAHr5Xv16fY9Cqr3VkzHYxuqmhXzBAVaLiwtAKjUW
	ryMIM525l3iPur44e3hvxuEiWxLTbs0AJKZ4VjGXavqvXhofZldC8vJEpbOMH8qNVS8XdmQiV+w
	LjiOCm8UBpwo8HVQEXplV+cyqP8ypMNBwykPWZugB5m8ic3JPT90UtkgkXMFdw+kBxMhCHGjYm8
	xts7pGdBsidwnYob8WLK0F8m7D4chl8dbOcWC7chSzK4PixS60UHLYCzFZ/CTsfNDh4sN615iFt
	88rfbC5voDAxwGQbcyTsaHWdbZ/WTXBEsN/p4CGfTSkFaCeFpJkckeNPy5X4/0WvJtJxIKMqR9f
	HyF5alLQaU8mwb5xVAdi6oFQUaYRjIF5y60TE6xQPQx/0fxnR9L/Exat4qgEEdPndwSuNxaNR+o
	70fa4FrIx6b2OELT6T9gs2Yn5w4HfSVLOd5ZMvto9jLYxdDvQuE4Bf28/tiSs2LrwT+NvZTZ/Ol
	98QV/v55HGtPqOOAQ==
X-Received: by 2002:a05:600c:8183:b0:47d:3ffa:5f03 with SMTP id 5b1f17b1804b1-483a962e09fmr77433955e9.21.1771763435348;
        Sun, 22 Feb 2026 04:30:35 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-126-118.dynamic.telemach.net. [86.58.126.118])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a3dd3391sm124921405e9.1.2026.02.22.04.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 04:30:34 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-kernel@vger.kernel.org, Aleksandr Shubin <privatesub2@gmail.com>
Cc: Aleksandr Shubin <privatesub2@gmail.com>,
 Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <ukleinek@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Philipp Zabel <p.zabel@pengutronix.de>,
 Lukas Schmid <lukas.schmid@netcube.li>, Cheo Fusi <fusibrandon13@gmail.com>,
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v13 3/3] riscv: dts: allwinner: d1: Add pwm node
Date: Sun, 22 Feb 2026 13:30:32 +0100
Message-ID: <2265500.irdbgypaU6@jernej-laptop>
In-Reply-To: <20260221183609.95403-4-privatesub2@gmail.com>
References:
 <20260221183609.95403-1-privatesub2@gmail.com>
 <20260221183609.95403-4-privatesub2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sobota, 21. februar 2026 ob 19:35:53 Srednjeevropski standardni =C4=8Da=
s je Aleksandr Shubin napisal(a):
> D1 and T113s contain a pwm controller with 8 channels.
> This controller is supported by the sun8i-pwm driver.
>=20
> Add a device tree node for it.
>=20
> Signed-off-by: Aleksandr Shubin <privatesub2@gmail.com>
> ---
>  arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>=20
> diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/ris=
cv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> index 63e252b44973..8e38a0d95f5a 100644
> --- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> +++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> @@ -193,6 +193,19 @@ uart3_pb_pins: uart3-pb-pins {
>  			};
>  		};
> =20
> +		pwm: pwm@2000c00 {
> +			compatible =3D "allwinner,sun20i-d1-pwm";
> +			reg =3D <0x02000c00 0x400>;
> +			clocks =3D <&ccu CLK_BUS_PWM>,
> +				 <&dcxo>,
> +				 <&ccu CLK_APB0>;
> +			clock-names =3D "bus", "hosc", "apb";
> +			resets =3D <&ccu RST_BUS_PWM>;
> +			status =3D "disabled";

Move status at the bottom.

> +			#pwm-cells =3D <0x3>;

Just use decimal format.

Best regards,
Jernej

> +			allwinner,npwms =3D <8>;
> +		};
> +
>  		ccu: clock-controller@2001000 {
>  			compatible =3D "allwinner,sun20i-d1-ccu";
>  			reg =3D <0x2001000 0x1000>;
>=20





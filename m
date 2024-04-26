Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6D51494A6
	for <linux-sunxi@lists.linux.dev>; Fri, 26 Apr 2024 15:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714146652; cv=none; b=Rw7yVoTccdp+jSJPi5ZR1hPdsw+AR93f9P8gGepQ+QbwB+WAbdCfGsZQww9n2l/POMiCe4Ld20woH/AmgUEOD3Dn/0TrR7CuS1UBShiv1o1pbzdWFh7yGVsQ6qI0zma414ArYCUsLVQXiD/QgV+XmTy7Qz7z5Y3V1PioSekTF/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714146652; c=relaxed/simple;
	bh=HEZxzTUlvfAvWH362AImClgysiczjyTH9oIQoyBYXfQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GGc2XbaekWUez33TxIY1OQloUuASbMioTg1BJdbPjmS6oJfjRCN0Pg2bZkWUgm07ylWcDT4rREj4jWVFoQMWUekp7ZvL5o4WwiUkP7bL82P3OSV+9K9GuRrpWPQTPIIWrWV7Xo5Rizl6h2ufm05gNpom4grwsI9N6qQsMZgJVCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g+IMj0q9; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g+IMj0q9"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-34be34b3296so1777353f8f.1
        for <linux-sunxi@lists.linux.dev>; Fri, 26 Apr 2024 08:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714146650; x=1714751450; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dwBRvxZJTvr5sS2FaOQcws8h2pvQvln9cuhoPBlSIXg=;
        b=g+IMj0q9dC0n7CJ45cghAih1ywGqx5tkFSmJTqU7uwEcy/t0bpSc3KDaVN0eSDB8Mj
         0LBMJ4ujYQ+qBVwz3v7uOlBkTDheQ0YGHIiMCgNM9q/G14nxtUvM4T93R0dSLh8mrefg
         fLFlcEQnyPB2z2GncHhtsPaYatlbcmeKgLnBdOKs/ouWjRkpZZk/9vwVtFxItFQldE8P
         w48gHAkR4piwFuJEWWHI1xRFODgEnOusEY2kK/z5FWuTU20LV+JbwDjXO82sWaCfF0Hf
         Oigj9Ytbb1LUGVHf220Ci2QDalczkdfJwmtZzKNmQ0DDxKapdowYiycyU+d+dt3FPpGX
         hkjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714146650; x=1714751450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dwBRvxZJTvr5sS2FaOQcws8h2pvQvln9cuhoPBlSIXg=;
        b=WGFJQ+MKk+cX+R5nN6mRB1x1xCeyDxbAICo/aj0dyC6TxgjGXLooNO5xMIxBJk+4gS
         l5fz2TfW6LW9siSIGhpUGvuYsYPIL7fsi5M9GScIWwfStb+PEuyk1c8BYxmkiITncjqQ
         6INWNeKIF6nhZ5DvPG7dnRe//lWVw2w8vi/K94REv1QV4Hy0jNG19RfjiM6NYEYkl4zG
         8SHCkZ4Oeq2cAdIVYEIWDsl7JLEdmpqbwvHca4Jgrpc6K6h4bwPmO5Rp+ToUfMdYuF/p
         mped1nXcWUKufChQpaKhzzF7pi98oHDqwUdCXRwBa9OD9dx2ZeEySVfUCiOTY2uRsStH
         2s2g==
X-Gm-Message-State: AOJu0Yy/A+2luPzvGyCDCmyqsOWKNPQwPIif44DehAP1SmNVvF5dZ9/T
	v6g11avWN83psDKTkYCjrc7l4umvmL6KfEn7LVW8wGTGiRN9gkHoZOyc4Dvj
X-Google-Smtp-Source: AGHT+IFSkQKVS4L9bRnLMqiPlSV4hCkr22LUrY8PWUZrtmGGbHNA7rl6TvT9/JKufs9BvNl9wJkCgQ==
X-Received: by 2002:a05:6000:719:b0:34a:48a0:fa70 with SMTP id bs25-20020a056000071900b0034a48a0fa70mr3350287wrb.40.1714146649673;
        Fri, 26 Apr 2024 08:50:49 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id q30-20020adfb19e000000b0034a9addd4e6sm17704489wra.81.2024.04.26.08.50.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 08:50:49 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-sunxi@lists.linux.dev, Chris Morgan <macroalpha82@gmail.com>
Cc: devicetree@vger.kernel.org, mripard@kernel.org, wens@csie.org,
 conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org, tglx@linutronix.de,
 Chris Morgan <macromorgan@hotmail.com>,
 Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH V2 2/2] arm64: dts: allwinner: h616: Add NMI device node
Date: Fri, 26 Apr 2024 17:50:48 +0200
Message-ID: <3217281.5fSG56mABF@jernej-laptop>
In-Reply-To: <20240418181615.1370179-3-macroalpha82@gmail.com>
References:
 <20240418181615.1370179-1-macroalpha82@gmail.com>
 <20240418181615.1370179-3-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne =C4=8Detrtek, 18. april 2024 ob 20:16:15 GMT +2 je Chris Morgan napisal=
(a):
> From: Chris Morgan <macromorgan@hotmail.com>
>=20
> Add device node for the H616 Non Maskable Interrupt (NMI) controller.
> This controller is present on all H616 boards and derivatives such as
> the T507 and H700. Note that on the H616 no NMI pad is exposed.
>=20
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>

Applied, thanks!

Best regards,
Jernej

> ---
>  arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/=
boot/dts/allwinner/sun50i-h616.dtsi
> index b2e85e52d1a1..1e066f3057be 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> @@ -775,6 +775,15 @@ r_ccu: clock@7010000 {
>  			#reset-cells =3D <1>;
>  		};
> =20
> +		nmi_intc: interrupt-controller@7010320 {
> +			compatible =3D "allwinner,sun50i-h616-nmi",
> +				     "allwinner,sun9i-a80-nmi";
> +			reg =3D <0x07010320 0xc>;
> +			interrupt-controller;
> +			#interrupt-cells =3D <2>;
> +			interrupts =3D <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
> +		};
> +
>  		r_pio: pinctrl@7022000 {
>  			compatible =3D "allwinner,sun50i-h616-r-pinctrl";
>  			reg =3D <0x07022000 0x400>;
>=20





Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B2D3FB88
	for <linux-sunxi@lists.linux.dev>; Sun, 21 Apr 2024 20:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713730009; cv=none; b=SQTaRwLlvUoDExbouy00Ijk9jnI30G+tT8nM4S1NOEVr0vWCLBkTjzM6hy//Bft28ZnglsYhCDRxObPZXVuTj5NX2cdg2sYOt0wFy7bgomU7JpsPD4wFg6NgUf7+pEyloJuzFnoAjVukL6IY5O6h4gomZzwxqGcpenbKq0lsKVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713730009; c=relaxed/simple;
	bh=hgojV3GIIl3CJ/W+5Aj/j6JOXjVVVtp4oVkpIJvA5Lc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QJGuTNm9bcBjNyNE4VIdwjEFVaxgrC6LeYjpIZMl+p0DcRyg4n0SaHoMdLaDxz/9La/XiqOvWCzot7s99QjtfYWMlO1ADw4k0u5AZOg3CIb0mp+12dC2hjMDIlDXh7q+clkj1IzL1ioHxQxw2jKuKTywLjYbnwRX8QjH2A7fCQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JPyrWwNr; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JPyrWwNr"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-417f5268b12so38460925e9.1
        for <linux-sunxi@lists.linux.dev>; Sun, 21 Apr 2024 13:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713730006; x=1714334806; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jL23OrHQEvtzokbYyBc6E+JAMoW6a1hpEFDs+++zhYo=;
        b=JPyrWwNr33LzZTjzV/UiPz6n2F8uDEMTqp6GOfEOd+eVDMut0keAJhcIpn/hYQTq76
         wcbsFrKL/uTui66lo71IvZX3pceFyzypQGdUAP1Y0fxOES3C+4Bo2f4IDgUcAazCHDiV
         nBkzmnTBNY59KzdTW0tklRzQNvh2wUi42FogJCQph7FSOEKHAFk6QHVXFiV1NHxVivTD
         veksKnLX1bEpAjnSwZXhCvWkNomaXs9LLjesiz8Wma90VgoQk40k+aCAtsOEQwqRZcXh
         FyxSW3nB8tXwm77xQDENwpPzgHSQvGR3Ec5gCLthuQHuk3J0UpDxDZf8SkmrrzKFTtKq
         1bsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713730006; x=1714334806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jL23OrHQEvtzokbYyBc6E+JAMoW6a1hpEFDs+++zhYo=;
        b=NAj5kiFAXvN8gGYayhgTMqhDmjn6YVB88+VkvCtSVIAmr+9sWnhoj9j6djSeL9X7XC
         ojjp41IFj1yzH/kKt3b1dkOyYHtXM3WtR2MPXFIHjJ5gv1si9kAE5reWydjWfUhgsTkf
         5EDtMeOdvBvRYmBx0xuX7FmSa/DjDNqa8Xbvvih5sDtSk0lVvzdyq9bFfT8qKzWIDl6x
         w5/67oC0SOeLIyJ0PtdoVZf7F1p/WQCuKdmktn1Nf41nh8bppYPmjBDMhTN5i8UAf1tm
         PCGWPyjrfa5O9giJqB4pbepkZpEON9+k+ypKNeNQsrs9qV/nPtJD7K6tw20msvMnjRZq
         vk8Q==
X-Gm-Message-State: AOJu0YxkpUOVwnYbfLYhv2uI7kWoWmEhyUpZKZU+FbDKzVmGmWlecW9p
	go3aID0FopKxRiPCO7iCWp9d01DL7iPMQSVD6qdAbfkhpYq+dbHjeuXtXQ==
X-Google-Smtp-Source: AGHT+IGHSK1GUn0NJtEnOV4tdeXl3xAjml5XChwI32E0WIECeOtZb6ab6z+4WxvRuVKu1qbxxIXFsA==
X-Received: by 2002:a05:600c:4f41:b0:41a:ea0:4bbc with SMTP id m1-20020a05600c4f4100b0041a0ea04bbcmr3348701wmq.38.1713730006401;
        Sun, 21 Apr 2024 13:06:46 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id l16-20020a05600c4f1000b0041a1fee2854sm3699213wmq.17.2024.04.21.13.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Apr 2024 13:06:46 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-sunxi@lists.linux.dev, Chris Morgan <macroalpha82@gmail.com>
Cc: devicetree@vger.kernel.org, mripard@kernel.org, wens@csie.org,
 conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org, tglx@linutronix.de,
 Chris Morgan <macromorgan@hotmail.com>,
 Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH V2 2/2] arm64: dts: allwinner: h616: Add NMI device node
Date: Sun, 21 Apr 2024 22:06:45 +0200
Message-ID: <1882404.tdWV9SEqCh@jernej-laptop>
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

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

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





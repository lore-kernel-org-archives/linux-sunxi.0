Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60673CC33F
	for <linux-sunxi@lists.linux.dev>; Sat, 13 Jun 2026 08:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781338840; cv=none; b=HsH+6QS+5YDQHwzHZc9POp8rsECXwfonS694CM+SD/gxLuS8i0N+M0gPCVKhh91bl8eXQsKjyL7pdUfGmRmWwHAr2WrNaUo3bKvUvbwpdHVetClj2gWtXHdYGMRvRWVIdJei0Njay3zrZrnvmiMaEvOv04Xyj/Z5jeqdWmPCom8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781338840; c=relaxed/simple;
	bh=sv6/e/ZTEkkgP8TdkpODVWO7G+8MZcZpFN0/dqmSQ2s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=snrhwG39r58f+VRd4/RdWJqJtSMl2QeZsP6pthrAkZwRgt56+nD/7P2CoZ5B3jEAwOmPms/YCL7fFfLhSXBRXRTC3AX/uMrSZZWo94eFm+8qJUtXfOl9sQ9MQ1zE5HJ95ZIWafEJu4E7D75QsA9HEjncXyNAUWrnosjbnnDSIq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lnw6bz8j; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lnw6bz8j"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490cf3000f0so17536885e9.1
        for <linux-sunxi@lists.linux.dev>; Sat, 13 Jun 2026 01:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781338837; x=1781943637; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ud8CqUMs31Lbag+rPY0L/C65qKiCj6gLmHREZB+Ipfw=;
        b=Lnw6bz8jbhxTilkD6VEkhiEWILvb4VT4MSZOgBoSTnPAdpSFCdAmhloWPhvoTnvFFA
         abrXFeUmWBuvw41EblN0asKv+AXLHTsviA/rJ/PnJExcYDws7Uc4360On6+lTYfVjmo9
         2XRM5pN25Ril699Pr+MPvAsC9BvOwTO2K7u9bb1Y2FETmcRtMMosHLBXtFE5MoDtNYTo
         UM3YXd46CMyl75OsGImO2oB2n2S2BinYi7E3lDVe3vAr0tDcEs5FaLSVA4qCXBDNgEee
         fVSFpPP+dchRrA8CsYOTah2nVN5pbLh6oBJXWWw1F/B35AiJLKXfH7d9WMo3ax4+WUiv
         JvGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781338837; x=1781943637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ud8CqUMs31Lbag+rPY0L/C65qKiCj6gLmHREZB+Ipfw=;
        b=a5EIdyfZIxVxrS/NIY+S0yZgVs7W616vAEhc9KZlUoB9IAQij4fyv9Kdca0nj5x9Sa
         MeK30ulsswhL5ZoZwT423hnJZLsk7cID2zVzhDEpw5QxEUIjFdf0WxoZr0F+NhQTnIfg
         Gb5TVpWkMYDrxWZcHmFKGvpV4LfPgF7IsM2AwqRtVvX1lYE1jpTI/kOWxSiqzQseibtf
         ldCAonAC6LnU/nInPcOeh8LFEoy+dfxGOXwP7rf8125KdbeqQlvunw6JirXAss1ythC3
         g0D34Nx78S7aflcqYOe3tHOHcUYnouCS9nDeZ91eBglvnNhqaj9aiGQHWkXJ20cgCLsa
         sBLQ==
X-Forwarded-Encrypted: i=1; AFNElJ8XWSXcWZJqK1IUf9GHxmShd3UZUJglZPdKL6mM31Z0yy7J//sQ0DM9gbkyh7orBs2nGPNpHFqk1GllbQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7WWUEHFywBn+CTxJhTVH7RDIYn0DuJQ75jqxSj8TJSTWXRjjG
	0SGpcHKTuStXD0qvrHoLLKBFqtHf3jFN2w9B5vWm8e8tXZafzfzRy5YW
X-Gm-Gg: Acq92OGOVKdJlCeuxx/yPacQHI1rmIH7RH4/6wM2xNa73AgOiMoRU+cGh/AS6uiT3Mc
	sbI2fcwKccdQRRTSesVYbXcWjnHSBJo+46dUGfyQoqiUra5DXwJkEEAaWLqIZ9sv73399VCc/Rr
	ulnEhysgIyoF2S4X27TaW87ZS2qqVziFoCk3XIC3vqDj2nXpnbpHOctvM//8Yadv6h8B24PYMf6
	3xaWTnAE4xnXoWTvyFnBVuw48D2mv2owT3D76T0xnCNLL4sku4beIAy1FhLf6BWIfFLCA8IWT9f
	UK5M3tM0hTih/8YSLgnf29+OPDZBM4MICfjg4WEROuCIDPircHTuhot+YNrtt1uSOIyupmAuCip
	5IkuogLKp/+OiJTHexupnvv5YGQpjhkcab5FfGVrTHe3SkDmGpR11v4WQ3bznawVtCoHJO1iCvb
	9ivHlF6h67YRe1k5iPdNKtF1J67SyZW15zfFt6dUp9yFdA
X-Received: by 2002:a05:600c:c3cd:20b0:490:d3ef:fa4a with SMTP id 5b1f17b1804b1-490ec4ea4f1mr58033045e9.14.1781338837061;
        Sat, 13 Jun 2026 01:20:37 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922032ae56sm54483765e9.7.2026.06.13.01.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 01:20:36 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Hans de Goede <hansg@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Andre Przywara <andre.przywara@arm.com>, Jun Yan <jerrysteve1101@gmail.com>,
 Lukas Schmid <lukas.schmid@netcube.li>,
 =?UTF-8?B?Si4gTmV1c2Now6RmZXI=?= <j.ne@posteo.net>,
 Eric Biggers <ebiggers@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Luca Weiss <luca@lucaweiss.eu>, Sven Peter <sven@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v4 5/7] arm64: dts: allwinner: a100: Add LRADC node
Date: Sat, 13 Jun 2026 10:20:35 +0200
Message-ID: <5lITDd8mTsaQJaoJhGu1EA@gmail.com>
In-Reply-To: <20260605070923.3045073-6-alexander.sverdlin@gmail.com>
References:
 <20260605070923.3045073-1-alexander.sverdlin@gmail.com>
 <20260605070923.3045073-6-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne petek, 5. junij 2026 ob 09:09:19 Srednjeevropski poletni =C4=8Das je Al=
exander Sverdlin napisal(a):
> A100/A133 SoCs feature a Low Rate ADC (LRADC) for Key application.
>=20
> Specs:
> - Power supply voltage: 1.8 V
> - Reference voltage: 1.35 V
> - Interrupt support
> - Support Hold Key and General Key
> - Support normal, continue and single work mode
> - 6-bits resolution, sample rate up to 2 kHz
> - Voltage input range between 0 and 1.35 V
>=20
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> ---
> Changelog:
> v4:
> - added allwinner,sun50i-a100-lradc compatible
> v3:
> - new patch
>=20
>  arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi b/arch/arm64/=
boot/dts/allwinner/sun50i-a100.dtsi
> index b3fb1e0ee796..7cb06b19b5a5 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
> @@ -466,6 +466,15 @@ ths: thermal-sensor@5070400 {
>  			#thermal-sensor-cells =3D <1>;
>  		};
> =20
> +		lradc: lradc@5070800 {
> +			compatible =3D "allwinner,sun50i-a100-lradc", "allwinner,sun50i-r329-=
lradc";

Break this into two lines, like usb_otg below. With that:
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej Skrabec

> +			reg =3D <0x05070800 0x400>;
> +			interrupts =3D <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&ccu CLK_BUS_LRADC>;
> +			resets =3D <&ccu RST_BUS_LRADC>;
> +			status =3D "disabled";
> +		};
> +
>  		usb_otg: usb@5100000 {
>  			compatible =3D "allwinner,sun50i-a100-musb",
>  				     "allwinner,sun8i-a33-musb";
>=20





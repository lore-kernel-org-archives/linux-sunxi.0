Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5226213C9A3
	for <linux-sunxi@lists.linux.dev>; Fri, 26 Apr 2024 14:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714141264; cv=none; b=OHMTzXQG8SZMeuXTQUed6QUgwkJjuTdUymP1B45pEd8ekcdiGgXFGVAyvTaONmyEnuwV6de6LU0YLIV3W4aTq0wIuS/pVhu4mkaaPwDkKsvdNRRCW90CDW1k9poMr5J9848yO/NUEOFZ8NhoDwe3fiJCORTO7IkawtjyMX3JYPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714141264; c=relaxed/simple;
	bh=HtaE9K5koiwN6wG3R9aBkT6Go6kjdIeW/lsuxiuyX9I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Kx+WpIJ1wj5mJDGG32YDJQ8f0NbTVu8W16UtwDcMluxfgWOuRB5JrpLNgoPd+z39oN4KkPV9+cjkVyq9S8400hnCdffAgt9MayXyoqOFPIyZDYjw1vTmEDMTThTXbt79Nn2O3qfqiKFW+csETRw3IJLUSadU3OAV/UtXSirUiwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bq000Zpq; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bq000Zpq"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4187c47405aso15063355e9.3
        for <linux-sunxi@lists.linux.dev>; Fri, 26 Apr 2024 07:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714141261; x=1714746061; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rcSYxBKA+TZoPvet+d86+0v1ZeIYTYUADrPblLGoYOs=;
        b=bq000ZpqaUdwNFAEezeVnNO6ZCt1vPCh+ydbGjGgxc1RnHCahEeGXz2uYvIBUc8Hig
         fvtd3N/QlF0yENSUheJfdhNFpFJwAqrlRdskkWHvNsl8rLHrP3A+uHZ00dEfK8F/naaY
         Bnkfowp4NVLXbyDNyR+fhBI9VLxNFAKa1zZwa/DadDxNex9fM/SEPHixLoYRn1i6Dmct
         fUmbrSkxxIFqWaPSsUqlbimViyLGHa3eJKiZ6hpHTU+SccShGhAhh/V1lLkwjt3WdBXX
         VtAZ8To+6TXF7nhTyXwHt3fJH/f164tdRArvoJRv+uNh2yvfxdGO+XJJwhdlBgmSP2Kk
         x35A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714141261; x=1714746061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rcSYxBKA+TZoPvet+d86+0v1ZeIYTYUADrPblLGoYOs=;
        b=dr46o113NCaOoM5yodbj0CSm3o5Ou2RigfP9oD1RQB0A8n5JRAPKwUTaLzRqu0xRN3
         BacNDqeDPSUm5+5jxGBMxb23Qtn6UW8eg0NGXY3YFPnRoFU7FpluYthJyDxBmCeI2D/Q
         s7KopVPkRceJLM/gC+yzatEL6d+M/HN/FAiGhH9n3OzgtQrZ9r3Gi8PD+6u70ZMVZ6YG
         TbRakp5aXqqJBhAK785EKOyITlAp6otvvmJpzy4YihKTSza4sBwpokKhNZ5a5oAahBlH
         qMgaWGA/8AQ4cn2mc2OwaJO5YS6TgEhDFPKcdc3A8WwVnyNtxzmccZTBFp2SjA7beX9N
         qNMw==
X-Forwarded-Encrypted: i=1; AJvYcCXNMJcS9exyr/eh4EYeNDKAE5hb43rcyFoU/Cde1wRX/S/yfCXhFKuuPxguMPlQMigYOUAW7Ro0cQqtPbyOYyQWFRC7ZGlu57DZUBM=
X-Gm-Message-State: AOJu0YycRSMaSEOJ0Gx+/rd1Z7ToA0uDDtgawr3PPukr++Au4Lk0XGDe
	qJ+dJOOQA6MtUrqSCiKvphXYXTd/g/JHbtENGx+1P3WR+lhfvNeh
X-Google-Smtp-Source: AGHT+IHK9nY7Tv7ih36ZXaVgFvH1aWTsjGgKFE5p3b1QCazf/uW3rKdX92rte5HJY7Ee1W4pAMhazg==
X-Received: by 2002:a05:600c:4e93:b0:418:e88b:92c3 with SMTP id f19-20020a05600c4e9300b00418e88b92c3mr2139031wmq.2.1714141260741;
        Fri, 26 Apr 2024 07:21:00 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id h13-20020a05600c314d00b0041ac4aafd3dsm12701566wmo.12.2024.04.26.07.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 07:21:00 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Andre Przywara <andre.przywara@arm.com>,
 James McGregor <jamcgregor@protonmail.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 2/2] ARM: dts: sun50i: Add LRADC node
Date: Fri, 26 Apr 2024 16:20:51 +0200
Message-ID: <2931402.e9J7NaK4W3@jernej-laptop>
In-Reply-To: <20240426092924.15489-3-jamcgregor@protonmail.com>
References:
 <20240426092924.15489-1-jamcgregor@protonmail.com>
 <20240426092924.15489-3-jamcgregor@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne petek, 26. april 2024 ob 11:29:48 GMT +2 je James McGregor napisal(a):
> Add a DT node for the Allwinner H616 LRADC describing the base address,
> interrupt, reset and clock gates.
>=20
> Signed-off-by: James McGregor <jamcgregor@protonmail.com>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej =C5=A0krabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
> V1 -> V2: Moved DT node to correct place in tree order
>=20
>  arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/=
boot/dts/allwinner/sun50i-h616.dtsi
> index a061b69c07c2..1e8538ca7db0 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> @@ -594,6 +594,16 @@ ths: thermal-sensor@5070400 {
>  			#thermal-sensor-cells =3D <1>;
>  		};
> =20
> +		lradc: lradc@5070800 {
> +			compatible =3D "allwinner,sun50i-h616-lradc",
> +				     "allwinner,sun50i-r329-lradc";
> +			reg =3D <0x05070800 0x400>;
> +			interrupts =3D <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&ccu CLK_BUS_KEYADC>;
> +			resets =3D <&ccu RST_BUS_KEYADC>;
> +			status =3D "disabled";
> +		};
> +
>  		usbotg: usb@5100000 {
>  			compatible =3D "allwinner,sun50i-h616-musb",
>  				     "allwinner,sun8i-h3-musb";
>=20





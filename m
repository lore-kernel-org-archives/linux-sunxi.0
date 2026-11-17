Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794933479;
	b=VAqytmQrONnYIh+jQRphPVSvQc8bQZyq/E6zJYJ/JJfeGaNgVwC0vfo9ppoTjDFx9Ynf
	 NCJ4me4/PD0Q5c+vSoeo0299kVeYOsOsc2FIQnpqxZJ5ztcympRB4ngLZIN14jNu0Z6bt
	 gLdcGGm+8rWPZeaGssQs1F0uq9u6vwaMYkz352m078KDUkvt3mUEbQmTUhJEbdo6bZwDB
	 T7rwYfTEK5jGy0jCyyHDfFm2loMXoYtaw95vEAoDGmPC7Yz/tRqHG1A00Un2w2OnUV2p1
	 HnXDO0Py86iZd4wtvbDCNzkwX+S5+2/2FQkT3GcqPg3zvcTxLkWlnt6oX7JKNGgS5wQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794933479;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=LBXiyQLy540aAEPtNSta6m8Ru37kUuPxCoM4iwVRxzo=;
	b=5IU1KkfOkKj4uEQg2gZye2HIfks1ZhdrSeuy2JegCJM1ZTWFIKS8ZXQAjau9OnqtRsSC
	 m6VJeFptojHXBxvn3LAPtplHH/oWKSba9236b8UjbMtiQTkgQeEO/WE+DQo+ywP/QpLKA
	 Qw7YrLKL0y3cqJRTpe932AWWccJNY6IlUTSNG64R/ky0yAhJV8BB1dJP2mXTUsnhFYhj6
	 eaCxzve0doAM4ekbOj4ko2tW8mEmc+umNgPW1wPcft18KXyI7YNaM+5WGQXrPUE2K5NeV
	 OPy2B+KM4JbZaQHr+gUK574tGnFhybMZhjlJZdlA5Ra3Ti8Cp0xpHbCCXy0X+U04BnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y12A0v3N;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D161B606A32F
	for <linux-sunxi@lists.linux.dev>; Tue, 17 Nov 2026 16:37:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D161B606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y12A0v3N
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4b467581b98so954835e9.0
        for <linux-sunxi@lists.linux.dev>; Tue, 17 Nov 2026 08:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794933477; x=1795538277; darn=lists.linux.dev;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LBXiyQLy540aAEPtNSta6m8Ru37kUuPxCoM4iwVRxzo=;
        b=Y12A0v3NLKrgcg+SpS9N8whLUwHRK0xgKUPFQRqqEundFz18v5MzafByY++xdVjb7X
         +2yFZBZJjs1OAuy3hFhEhmdCrJts65XDzDZRl07K9e4+hBUvZxwKCfLUxb42Wbz6utcT
         Efv5x/JhFn5yI1W3LYei4axp2J0/a15+SzgXitVtrJ68+CA1/uAnxrQ+fubhvlZrqg65
         w4LKJJE7qyQlkXgmigwzT0Z7vOqSWy2uPE3Sm4uRc4gBnA0i5hUyloV6+XakAFI8q+yz
         BzbQqYuQEY5OOG2OlAxT6zOs90qSsuLnT0yM6c+DnCx79eOrSAgwNeiqbvlJMmIh+Ewv
         epyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794933477; x=1795538277;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LBXiyQLy540aAEPtNSta6m8Ru37kUuPxCoM4iwVRxzo=;
        b=pVGfaOpX4AOfJcjpT3Si3Uy7HipyAEukAbcd1f1al9/n5kHvZ521eR2s5qMlIm9IuF
         JbEAnXFKinFSZdp8KGKRLtM91zYkQ5E8XvpPlMC3itJWHC2EmnA+WgQgllv9L7c11jdm
         ieFbl3A4s0nEsEwUjYTz0cCoRRQwsDTX8NaiaaD9jXRYUG1R7WNu/892xcZmqKbjpQF7
         5u2bQtSjRZIm7e9PqpVEXK0Mu0D75jqbGeptNzY63TOt+wPENaks0t/B3TS+A0lHh9lQ
         hBsg6Eo64QrHs58p6hu9wII0jRtaYRLbCGxOFDTqBYWu1LzaR97YXZGNS6yakJYbB62q
         pyNA==
X-Forwarded-Encrypted: i=1; AL+hErEANffVWaXfEZSy8k/A3laGDnmlr36OX7n2JAOy3YzZoE7kluOGt5P75jqaeuCVYutDsGcmF6laJvE8Ug==@lists.linux.dev
X-Gm-Message-State: APuU4Z9xO/AujjjEm6t0VMOJTsi1bPyUWsfdHEfex+ZwaZqyowwhjkv1
	jE8jLgIXJKeQqXEgIt25CSAPb9d0kbi7oqjTgkW+NJ5sNO9ppMV48HzU
X-Gm-Gg: AYBFou0ZJ4I/JnTd65Rqd9waGsJjO/NpQdhlPVHrJT++UYWF5n9UYBo5kwg/LlXAAq1
	HV/EbkBvxhFGgjbihKWwMTFFBiTXCkqqF1QkS+UIyc0H2gcHIA2WqHs/7jN8mtTnKDOsnhi2Cad
	W+aUTrlW8QaxYGhVqxfiZ0xOBF5/BpDjFOgAgu0waaVAxe5VuApGUpZkaSZxiHnTxDzGoQLOBiw
	ZHXj5GZdkFKmAQOLeLUnRTceF5aM+ZhsewskPLnoih6QZDcat+qI/roUx54LezuzOyAhVRqypYq
	UyIPIVMiWWKplJoaaIXLWJySJI3S2PlRxgsto2U5U9cQwS9iiT1bpXvpxm98a22FLxVyjhI2yXP
	TeMxK6JoqLQ1TLv7PHoSIWTCZRa46RElB9gX2ELuLi4dgZannawKmKeC3oWF24biPW3cJfMhyTU
	w27ihGf+7DvhSPFdski7fMlrIVw0XpsM93mcXhJ5pMICwIyb6g2/eHyEg7RvRXgfy0bEQceLJ10
	2UtLPFemFQ8+/yuDxCfg/AScSc40FHBmITuFzNFMBTxJJ7/lMLKtWztNpgKXSObAUmgNWUo0HfX
	Ln/xV0Nwjbc+D4cDq/Wxbahqubaud/EUWzAT7ekZm7C+rvg5k9j0P5uQ5AP2teUvN6yE4YsxAXN
	MabGWRS3oINziUQdOWC7QGhf5/DbNxhr5MOCXhOiAlPlLFNqlEIYs6UW/TuaceBH9tZM6iv970B
	rk6Q/DBG1jm/jvmuEqMAOQZvUuNzlThRqJ3QGpm0l1kYF4ClwOduICrSCGfr3Wp0ywk2CDX+xBi
	UvDq/2tsrLQF9JAO9cuCbV5qPwv1cvPAhIQxj1zsCU8knRCUFYsx5lp6NkaxRtz3W5m
X-Received: by 2002:a05:600c:a0b:b0:4bb:6847:7927 with SMTP id 5b1f17b1804b1-4bb68477b90mr206657185e9.7.1794933477039;
        Tue, 17 Nov 2026 08:37:57 -0800 (PST)
Received: from jernej-laptop.localnet (95-143-148-21.dynamic.telemach.net. [95.143.148.21])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d03b104sm29882037f8f.6.2026.11.17.08.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 08:37:56 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Jun Yan <jerrysteve1101@gmail.com>
Cc: Jun Yan <jerrysteve1101@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: allwinner: h6: taiqicat-a01: Enable Ethernet
Date: Tue, 17 Nov 2026 17:37:55 +0100
Message-ID: <n0Gb_HzYRTi_JMXR8vuZwg@gmail.com>
In-Reply-To: <20261117142122.246986-1-jerrysteve1101@gmail.com>
References: <20261117142122.246986-1-jerrysteve1101@gmail.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne torek, 17. november 2026 ob 15:21:21 Srednjeevropski standardni =C4=8Da=
s je Jun Yan napisal(a):
> The TaiqiCat A01 has a 100 Mbit/s Ethernet port, which uses the EPHY
> integrated into the co-packaged AC200 of the Allwinner H6 SoC.
>=20
> The AC200 derives its 24 MHz reference clock from PWM1, so enable the
> PWM controller and the pwm-clock node that supplies it. Also enable
> I2C3, over which the AC200 is accessed, and describe the AC200 EPHY
> package on the EMAC MDIO bus, with the EMAC operating in RMII mode.
>=20
> Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>=20
> ---
> The AC200 MFD and EPHY drivers/bindings and the sun50i-h6.dtsi AC200
> description this depends on are already merged in sunxi/dt-for-7.5.
> ---
>  .../dts/allwinner/sun50i-h6-taiqicat-a01.dts  | 40 +++++++++++++++++++
>  1 file changed, 40 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-taiqicat-a01.dts b/a=
rch/arm64/boot/dts/allwinner/sun50i-h6-taiqicat-a01.dts
> index 225f42bd3b9e..9b192caeecb2 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h6-taiqicat-a01.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-taiqicat-a01.dts
> @@ -14,6 +14,7 @@ / {
>  	compatible =3D "ultrapower,taiqicat-a01", "allwinner,sun50i-h6";
> =20
>  	aliases {
> +		ethernet0 =3D &emac;
>  		ethernet1 =3D &sdio_wifi;
>  		serial0 =3D &uart0;
>  	};
> @@ -87,6 +88,10 @@ wifi_pwrseq: wifi-pwrseq {
>  	};
>  };
> =20
> +&ac200_clk {
> +	status =3D "okay";
> +};
> +
>  &cpu0 {
>  	cpu-supply =3D <&reg_dcdca>;
>  };
> @@ -107,6 +112,14 @@ &ehci3 {
>  	status =3D "okay";
>  };
> =20
> +&emac {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&rmii_pins>;
> +	phy-mode =3D "rmii";
> +	phy-handle =3D <&ac200_ephy>;
> +	status =3D "okay";
> +};
> +
>  &gpu {
>  	mali-supply =3D <&reg_dcdcc>;
>  	status =3D "okay";
> @@ -123,6 +136,29 @@ hdmi_out_con: endpoint {
>  	};
>  };
> =20
> +&i2c3 {
> +	status =3D "okay";
> +};
> +
> +&mdio {
> +	ethernet-phy-package@1 {
> +		compatible =3D "x-powers,ac200-ephy-package";
> +		reg =3D <1>;
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +		vcc-supply =3D <&reg_aldo2>;
> +		nvmem-cells =3D <&ephy_calibration>;
> +		nvmem-cell-names =3D "configuration";
> +		x-powers,ac200 =3D <&ac200>;
> +		x-powers,xmii-rx-clock-inverted;
> +
> +		ac200_ephy: ethernet-phy@1 {
> +			compatible =3D "ethernet-phy-id0044.1400";
> +			reg =3D <1>;
> +		};
> +	};
> +};
> +
>  &mmc0 {
>  	vmmc-supply =3D <&reg_cldo1>;
>  	cd-gpios =3D <&pio 5 6 GPIO_ACTIVE_LOW>; /* PF6 */
> @@ -173,6 +209,10 @@ &pio {
>  	vcc-pg-supply =3D <&reg_bldo3>;
>  };
> =20
> +&pwm {
> +	status =3D "okay";
> +};
> +
>  &r_i2c {
>  	status =3D "okay";
> =20
>=20





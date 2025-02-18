Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338BF26FA6D
	for <linux-sunxi@lists.linux.dev>; Tue, 18 Feb 2025 17:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739899441; cv=none; b=rT1P3EWl5wyOqjXoHuXIRMu7lebeRCAqiX/j9CxpmZSqm1QP8o1JPMbZvzGLLM+2t7FA7k3W4EZxX1prk2jWRJh6FnPmYPy2ZNasZNv/ZGQvg+6tvNm91u/KDKPUqG87icfTc4qWenHINW8OaZYteTkEUW8j9xsrweYVy302DoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739899441; c=relaxed/simple;
	bh=WmheXIVvAj3UxMixyj4UA80+kW7AvVq4N+19neOVuTw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Yi2yZ/w8W+ctjSn1EiQIBFa8gyiZ+wd+2bt2MU32/gj5A74Mt0FiD4gr6jzz583RodP7eE+QoF6LAD0wOAZ+MMvGBPmjZZfNhXGw4650ALugwy105lyPaNEZn7O2cLJ+sU+uWXhgcDl9hHvAqF3sAKGtvNnO9rH+7571YvsPmEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Eg6FTOfw; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Eg6FTOfw"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43932b9b09aso64311515e9.3
        for <linux-sunxi@lists.linux.dev>; Tue, 18 Feb 2025 09:23:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739899437; x=1740504237; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C9Kw7qFxKXcr45whwRwvA4Mj2NB/oA7RxSCK/IlKNzo=;
        b=Eg6FTOfw7Q82a0JAYzl4b5LXQD8zaWNfh/Z6JDJ38AHrUyJBIP6rXhOD8hjMkM/Duz
         6kVw96YN5L4hUFD9xjc2UaBDjUQQClVs05s/o4tO7pAx+LACxrKb3ljPllNaOvB7bXGz
         VxpCufhPxPJcrArt2JGATVcUv5gmG5Bx8d0CAtnMGqIiEORDdIkm+EE+QQbByU++B4YT
         woArqP8uEajAMX1OCGN8X9+g7gm/psaoYDQCka49mUlcRtwcqZ38Mqdsb4OadWVb30Tq
         /Dw6tILLdxDsh7M6MKrjNiZ/w0c4zs6v54c4AcxCVYDeP5mD5ewdPme+cJnfFiLwjGdb
         XNfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739899437; x=1740504237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C9Kw7qFxKXcr45whwRwvA4Mj2NB/oA7RxSCK/IlKNzo=;
        b=JftqZwPbKXdRKypQGAv5YteDqLuuWVChkyzEPXLLqD1OAwkvMosipdzd/HUf2qrVdY
         BmpBEnWBO9mPqdafX1VCLYxrMm3n5jkg+9LZIWpPxYogEPrdXcqcKnyCqx0qk424jyhs
         5Mpbrdi/1Hahmvft/IbWxzSSyURzSzYPzUJNQmSRFTpGbNZehulfhgQdg8RZ0Q+16yEK
         UoibGMMeFKBIwB1yYPTH3YJXO55/pGz+yhkmsKNfXjPsq5pkftOju3WhFkmFyBwwg2PP
         chLQT7DIzwAupdENurfhSWVA6fFY8SXzU9psodAZbISS9lpuX5altBgYA+n71RHdOALZ
         zitA==
X-Forwarded-Encrypted: i=1; AJvYcCXrpKNt3SBnwH8rodwjE09ByNCNJYLSVPJn20f2Nb1hbKT6A0txypblgbZg0hBz/3vFYQ1jWhGgwxFVXg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzsQUixnwuTWSSUEu9cK4s48fITGcnJbpJ45NPBPQ9XhegHbNcz
	3ZFLVqbwbHatNyB4dBXZXxaKpLrijoxOklR3NK1L5zzuZq1z8RZ6
X-Gm-Gg: ASbGncuxX1+ZiRNGIwthP2sWjgW7sPM/gcGTLeWjbYBw18UXOg/IDEqsxU+RwyQihrq
	Kb2vyB4UjilTiifkSgklabcP+gTXCcTmoo1XyBoc4rOxvpm36cPnZWLrK+z8iBmbJmMYrBOb6sm
	o+0vygrhVKW5TSqvsXKmDA9vKcXE6HDJGtiX8U1/IPa6ITGQHh5DDvyakgALZcxc42dBlgG2GXd
	FhJ3S5KR1BNA+Z8T5UMSVSOL56zprgea+0PR/PJcQqStd/iKEi6kmb7WmUIfDoHoKM6lBYtOvXx
	BTr3HXv3Vun5dJU9MaFEuF6t9pi8JBm/mEGHSz8TKAS83SoLPbL1PLH5t+MayP8QoHA=
X-Google-Smtp-Source: AGHT+IGdwqkgJU4MRYllMptDMTLx9Cq7fV8Bn0/VLRCRyd2ghtgYLKpjvlKzjZW3cSM9dRF5TKWB+w==
X-Received: by 2002:a05:600c:4450:b0:439:916a:b3db with SMTP id 5b1f17b1804b1-439916ab5bdmr58879435e9.6.1739899437098;
        Tue, 18 Feb 2025 09:23:57 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439922141a5sm32958965e9.2.2025.02.18.09.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 09:23:56 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Alex Studer <alex@studer.dev>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Alex Studer <alex@studer.dev>
Subject:
 Re: [PATCH] riscv: dts: allwinner: d1: Add CPU thermal sensor and zone
Date: Tue, 18 Feb 2025 18:23:52 +0100
Message-ID: <4628970.LvFx2qVVIh@jernej-laptop>
In-Reply-To: <20250218020629.1476126-1-alex@studer.dev>
References: <20250218020629.1476126-1-alex@studer.dev>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne torek, 18. februar 2025 ob 03:06:29 Srednjeevropski standardni =C4=8Das=
 je Alex Studer napisal(a):
> The sun20i THS (built in CPU thermal sensor) is supported in code, but
> was never added to the device tree. So, add it to the device tree,
> along with a thermal zone for the CPU.
>=20
> Signed-off-by: Alex Studer <alex@studer.dev>
> ---
>  arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi | 31 +++++++++++++++++++
>  .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    | 16 ++++++++++
>  2 files changed, 47 insertions(+)
>=20
> diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi b/arch/riscv/b=
oot/dts/allwinner/sun20i-d1s.dtsi
> index 6367112e6..bdde82aa8 100644
> --- a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> +++ b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> @@ -3,6 +3,8 @@
> =20
>  #define SOC_PERIPHERAL_IRQ(nr)	(nr + 16)
> =20
> +#include <dt-bindings/thermal/thermal.h>

Put above line on top (before SOC_PERIPHERAL_IRQ()).

> +
>  #include "sunxi-d1s-t113.dtsi"
> =20
>  / {
> @@ -115,4 +117,33 @@ pmu {
>  			<0x00000000 0x0000000e 0xffffffff 0xffffffff 0x00010000>,
>  			<0x00000000 0x0000000f 0xffffffff 0xffffffff 0x00020000>;
>  	};
> +
> +	thermal-zones {
> +		cpu-thermal {
> +			polling-delay-passive =3D <0>;
> +			polling-delay =3D <0>;
> +			thermal-sensors =3D <&ths>;
> +
> +			cooling-maps {
> +				map0 {
> +					trip =3D <&cpu_alert>;
> +					cooling-device =3D <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +			};
> +
> +			trips {
> +				cpu_alert: cpu-alert {
> +					temperature =3D <85000>;
> +					hysteresis =3D <2000>;
> +					type =3D "passive";
> +				};
> +
> +				cpu-crit {
> +					temperature =3D <100000>;
> +					hysteresis =3D <0>;
> +					type =3D "critical";
> +				};

Where do those limits come from?

> +			};
> +		};
> +	};
>  };
> diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/ris=
cv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> index e4175adb0..fcfcaf06c 100644
> --- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> +++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> @@ -426,6 +426,10 @@ sid: efuse@3006000 {
>  			reg =3D <0x3006000 0x1000>;
>  			#address-cells =3D <1>;
>  			#size-cells =3D <1>;
> +
> +			ths_calibration: thermal-sensor-calibration@14 {
> +				reg =3D <0x14 0x8>;
> +			};
>  		};
> =20
>  		crypto: crypto@3040000 {
> @@ -934,5 +938,17 @@ rtc: rtc@7090000 {
>  			clock-names =3D "bus", "hosc", "ahb";
>  			#clock-cells =3D <1>;
>  		};
> +
> +		ths: thermal-sensor@2009400 {
> +			compatible =3D "allwinner,sun20i-d1-ths";
> +			reg =3D <0x2009400 0x100>;

Size should be 0x400.

Best regards,
Jernej

> +			interrupts =3D <SOC_PERIPHERAL_IRQ(58) IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&ccu CLK_BUS_THS>;
> +			clock-names =3D "bus";
> +			resets =3D <&ccu RST_BUS_THS>;
> +			nvmem-cells =3D <&ths_calibration>;
> +			nvmem-cell-names =3D "calibration";
> +			#thermal-sensor-cells =3D <0>;
> +		};
>  	};
>  };
>=20





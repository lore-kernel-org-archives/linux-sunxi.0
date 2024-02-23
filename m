Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD86EAD2
	for <linux-sunxi@lists.linux.dev>; Fri, 23 Feb 2024 20:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708720900; cv=none; b=qk2Akk62QZTwUmSCyUoJyLf+v+W4s9D289EJurwAUTlXv+RF7ZKPcMP61CnJhWeY6qQLrBT8EA78i9tp9+So/TJ5QGvv/d3vaBWg76FHGc8oC4+lTmi3E2LvuHa9edvrr9ubPrc7AJXXLHujR0DhsEmQgbsY89TBz70bgwAagrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708720900; c=relaxed/simple;
	bh=h7Lx0jQ4dl7jKRJSCenNZoCOEDhfi18hDxw3dD5ReaQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XC5hNCoQwHlpi3m77QGVxvlEuoH6X8aqtTJGhkCHOw+11SInE4BlMxnnhEk8wawQ3gjLTMHKp7WvNj9/3kkAZAH4MuXYI/XvN4OkXQG3ObHJC0TigNn0LYLLb7PpzQTp/cumYE8Os08A2DxxVc+FBtKkHrizeXUI2weQ7MdkIJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ju0Qj1e1; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ju0Qj1e1"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-563c403719cso1446559a12.2
        for <linux-sunxi@lists.linux.dev>; Fri, 23 Feb 2024 12:41:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708720896; x=1709325696; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZfQMOvarM5YXluKmxjyf8kg0u/LvgCShKkrNwvbX5RY=;
        b=Ju0Qj1e1lTt4tAeja2UekAFsIUAe2UXTX7aTSoVacf8RnNYB0YJM1rlWHaXa2vvSuU
         gFGy9/uh+nwI1kqQ7lNVmNZkBsE3tYvh1tHUad5uY/jzHaMzz+2JofplE4Oo4Dwkq3ps
         qtHOiRNlJu4czqxooxA15YnpPO8j/BK2iQh9pdP3+vTYfyJP5kuy3p9qbI4pp/zs1Q+d
         FR+lks3aYAgUOHGRohm5RcEgRMhnpAsPfHwavs8hAX0OyvknjDLdv9hTQE5L5a7s9bk2
         1O8hl6JNuAfkzjo0Oxr3JCtcqH/lp5Ct7OhQdCMKhMtAaYUrW2jkUzTtCBG8hxjEd+B/
         JUyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708720896; x=1709325696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZfQMOvarM5YXluKmxjyf8kg0u/LvgCShKkrNwvbX5RY=;
        b=FVS65XCZGGgH4t12tocMvxqvXt/VGi3Tha4lnYx8pCYsGzOIS22Eow3CDXebRzSryt
         A8F1GYGXD35UX9TTfjEVgI7j5tJEUgzqpZrF/sYxhTxOPYCfpCI/cqqHMwIf7h/+yDhj
         DJAuG3n2H7cluX8cSYjqTr1uozBpp41rF8LTr9Wpf4xADSJtJkbOHMaQJ0nhM7SgVhgp
         cTGKp7DzMq262oq6wLTUHUg5YS22SCHpDfc4ZXlsr70suDL7+JTwDJm3TNoypv57yTRv
         rpyuO0juJY1cGcLo8vOa/nMgJkxXTEdVTlpkUwp8blYtDFuWWK5qv6pmCzKoMNF8gK0U
         be7w==
X-Forwarded-Encrypted: i=1; AJvYcCXvFIlKLvfUD+BiXuFu0+rM7xINvhvFuyJ3HsMSZE7A88b+VdcujhRHrHb1g/y0qAwrimodXr4vxPCOEHXUQ8jFmkVRAs3WQS4UYZw=
X-Gm-Message-State: AOJu0Yxr+fWSxNJcPbw8EvflxJIAEKPPnvKFrB5JlSb+2Z4ssueB8Yst
	OrzQn6mlT0J1tJsmddqmA9JbzIwD7YsmiuQ5+PHpaSMqxANBoOlH
X-Google-Smtp-Source: AGHT+IF/qpn86Bjd0nToevWU3u82HCSLTOOj3XhqK/HahY6igDRqhNN2SlnXNlbV8okxQWXuvNuYcg==
X-Received: by 2002:aa7:c64d:0:b0:565:9938:a881 with SMTP id z13-20020aa7c64d000000b005659938a881mr225843edr.36.1708720895972;
        Fri, 23 Feb 2024 12:41:35 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id k20-20020aa7c054000000b005657eefa8e9sm603852edo.4.2024.02.23.12.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 12:41:35 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Vasily Khoruzhick <anarsoul@gmail.com>,
 Yangtao Li <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Martin Botka <martin.botka@somainline.org>,
 Maksim Kiselev <bigunclemax@gmail.com>,
 Bob McChesney <bob@electricworry.net>, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject:
 Re: [PATCH v5 7/7] arm64: dts: allwinner: h616: Add thermal sensor and zones
Date: Fri, 23 Feb 2024 21:41:34 +0100
Message-ID: <4545502.LvFx2qVVIh@jernej-laptop>
In-Reply-To: <6017645.lOV4Wx5bFT@jernej-laptop>
References:
 <20240219153639.179814-1-andre.przywara@arm.com>
 <20240219153639.179814-8-andre.przywara@arm.com>
 <6017645.lOV4Wx5bFT@jernej-laptop>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne petek, 23. februar 2024 ob 20:59:08 CET je Jernej =C5=A0krabec napisal(=
a):
> Dne ponedeljek, 19. februar 2024 ob 16:36:39 CET je Andre Przywara napisa=
l(a):
> > From: Martin Botka <martin.botka@somainline.org>
> >=20
> > There are four thermal sensors:
> > - CPU
> > - GPU
> > - VE
> > - DRAM
> >=20
> > Add the thermal sensor configuration and the thermal zones.
> >=20
> > Signed-off-by: Martin Botka <martin.botka@somainline.org>
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>=20
> I can't cleanly apply patch on top of sunxi/dt-for-6.9. Can you please re=
base?

I rebased and applied. Thanks!
=20
Best regards,
Jernej

> > ---
> >  .../arm64/boot/dts/allwinner/sun50i-h616.dtsi | 88 +++++++++++++++++++
> >  1 file changed, 88 insertions(+)
> >=20
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm6=
4/boot/dts/allwinner/sun50i-h616.dtsi
> > index 12ffabc79bcde..7c7d7c285505c 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> > @@ -9,6 +9,7 @@
> >  #include <dt-bindings/clock/sun6i-rtc.h>
> >  #include <dt-bindings/reset/sun50i-h616-ccu.h>
> >  #include <dt-bindings/reset/sun50i-h6-r-ccu.h>
> > +#include <dt-bindings/thermal/thermal.h>
> > =20
> >  / {
> >  	interrupt-parent =3D <&gic>;
> > @@ -138,6 +139,10 @@ sid: efuse@3006000 {
> >  			reg =3D <0x03006000 0x1000>;
> >  			#address-cells =3D <1>;
> >  			#size-cells =3D <1>;
> > +
> > +			ths_calibration: thermal-sensor-calibration@14 {
> > +				reg =3D <0x14 0x8>;
> > +			};
> >  		};
> > =20
> >  		watchdog: watchdog@30090a0 {
> > @@ -517,6 +522,19 @@ mdio0: mdio {
> >  			};
> >  		};
> > =20
> > +		ths: thermal-sensor@5070400 {
> > +			compatible =3D "allwinner,sun50i-h616-ths";
> > +			reg =3D <0x05070400 0x400>;
> > +			interrupts =3D <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
> > +			clocks =3D <&ccu CLK_BUS_THS>;
> > +			clock-names =3D "bus";
> > +			resets =3D <&ccu RST_BUS_THS>;
> > +			nvmem-cells =3D <&ths_calibration>;
> > +			nvmem-cell-names =3D "calibration";
> > +			allwinner,sram =3D <&syscon>;
> > +			#thermal-sensor-cells =3D <1>;
> > +		};
> > +
> >  		usbotg: usb@5100000 {
> >  			compatible =3D "allwinner,sun50i-h616-musb",
> >  				     "allwinner,sun8i-h3-musb";
> > @@ -761,4 +779,74 @@ r_rsb: rsb@7083000 {
> >  			#size-cells =3D <0>;
> >  		};
> >  	};
> > +
> > +	thermal-zones {
> > +		cpu-thermal {
> > +			polling-delay-passive =3D <500>;
> > +			polling-delay =3D <1000>;
> > +			thermal-sensors =3D <&ths 2>;
> > +			sustainable-power =3D <1000>;
> > +
> > +			trips {
> > +				cpu_threshold: cpu-trip-0 {
> > +					temperature =3D <60000>;
> > +					type =3D "passive";
> > +					hysteresis =3D <0>;
> > +				};
> > +				cpu_target: cpu-trip-1 {
> > +					temperature =3D <70000>;
> > +					type =3D "passive";
> > +					hysteresis =3D <0>;
> > +				};
> > +				cpu_critical: cpu-trip-2 {
> > +					temperature =3D <110000>;
> > +					type =3D "critical";
> > +					hysteresis =3D <0>;
> > +				};
> > +			};
> > +		};
> > +
> > +		gpu-thermal {
> > +			polling-delay-passive =3D <500>;
> > +			polling-delay =3D <1000>;
> > +			thermal-sensors =3D <&ths 0>;
> > +			sustainable-power =3D <1100>;
> > +
> > +			trips {
> > +				gpu_temp_critical: gpu-trip-0 {
> > +					temperature =3D <110000>;
> > +					type =3D "critical";
> > +					hysteresis =3D <0>;
> > +				};
> > +			};
> > +		};
> > +
> > +		ve-thermal {
> > +			polling-delay-passive =3D <0>;
> > +			polling-delay =3D <0>;
> > +			thermal-sensors =3D <&ths 1>;
> > +
> > +			trips {
> > +				ve_temp_critical: ve-trip-0 {
> > +					temperature =3D <110000>;
> > +					type =3D "critical";
> > +					hysteresis =3D <0>;
> > +				};
> > +			};
> > +		};
> > +
> > +		ddr-thermal {
> > +			polling-delay-passive =3D <0>;
> > +			polling-delay =3D <0>;
> > +			thermal-sensors =3D <&ths 3>;
> > +
> > +			trips {
> > +				ddr_temp_critical: ddr-trip-0 {
> > +					temperature =3D <110000>;
> > +					type =3D "critical";
> > +					hysteresis =3D <0>;
> > +				};
> > +			};
> > +		};
> > +	};
> >  };
> >=20
>=20
>=20
>=20
>=20
>=20





Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA23207A03
	for <linux-sunxi@lists.linux.dev>; Sat, 22 Feb 2025 09:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740217532; cv=none; b=fwdoK4t9q2oZyt+4uAw5SaG3Rtctu8oHT+L3cpDHH2WPVeYT3tQttjtthR7ILsx/c7NNqP4h+d/1ISvoRafFcK5LRq+Cb6LX34mLUolMIQ/Ban8KCpRIUHbmsB65Hr0dpj2b47of9HcNnO7ZM6r26PCuvUcLC5AKOcYkbfOZglI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740217532; c=relaxed/simple;
	bh=wNKI8xge3m0Gcbkh0b6miN4JWFCahXKWFtCZ48Mzv2Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b+XPL8HRCekDFjXu4ZHNFsxVbRgxZJPmp1tEn0Jo3OTM1u0LdcGMWiigFrrVDj98AacRbbbN8CKhlHDON694Ue1fofF4zQIz0DDkyo7oOXR897LxkmEz93Uhy7h+AP3XQcnozlPhzSGTg/7AtJqN9PvcGe4pjYLcxHaY6dQlGIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TMyF2N3F; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TMyF2N3F"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-439a331d981so25098505e9.3
        for <linux-sunxi@lists.linux.dev>; Sat, 22 Feb 2025 01:45:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740217529; x=1740822329; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LM99SZJhiYckZeRf7zBWhT51kFSY0wK17dmbVXYXC8o=;
        b=TMyF2N3Fw3N+UiuWEpL1Oq+FSkO3rkW4ksb1AfPo0PEw9h5NICNAF39Xo9L5GSnOsK
         qDtsAGHGsfIpCSsLOvcWgk7+SM1JBvwTLTtkbuiM2Oa8eOULZZzJGSS742kkRpNIkkj5
         Tnb+r3ik/blI2O3yfnD6avjRUJ9xN1YzgedE61d6gs+pR6el6cFWEOk9gU6+XdpVbDbp
         S8Z6qlitUvfn/kK4AiDyfuLUk2MOdXziYyhPaG6/kZ5xiezHL4by9CkiRT/0URayFi3P
         4y7o5bySJGozkrpDgLoI+0kFiP1hlKcVSdZxn0/7QsQDS1iPEbAHbvNFXKVBAxhTSfAY
         BO1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740217529; x=1740822329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LM99SZJhiYckZeRf7zBWhT51kFSY0wK17dmbVXYXC8o=;
        b=GoBOg9RxydnBT8LqRsFvgzeJi/vyXrATMY+GX9lHHCT1jZRcf0ET4Jv1NOmueovcm2
         9dRia01xTEST8+AlPTVlJWkdjrA2PNk3E+kz4bnjTYivtAYrLBij3CEDharfS8F+EQEt
         X2RN7VugGdY5ZxVfr4D5yjaDHAkwoBiGmF52WbADhWJM6zem65Hutfh8xBOcxCMU8K15
         YTn8hxuwUQ5+HdcDWKqhXX+PEOcYIM/m5WCj1Xj4jUAR5nRMJjFO6h+RNPmqHPL0D0C8
         aGdvQUSpecFS54n9349bWKzEPqfjMiGJQSkNDX+ozAiCwu44Gv6i8VqwB97+VxQykKNi
         c26g==
X-Forwarded-Encrypted: i=1; AJvYcCW+RBgHjAluDYBVQJYLvgh7pMeM+wSMJoHShspEA5VX6OfhdnKq+HigtpAGHEQXkOJLNE6ZGmH92hfXFQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yylrx66Y4+5+nSlBIGCgkyzhA2AV3eWjSTWP2wrwG6+IoBMrN0/
	zP58y8pdxDY3SWKmDg7ZiYwHjuPJkbzQzN7ZGD/4SxIjogX++odN
X-Gm-Gg: ASbGncszNqvMYeAxMyhTsEZacodVCr27COOzwA1U3HWVQJBYVByfSGoTmiLOR2KdSHO
	gLC0Tt0D9i5iZPiB8nAgOgll3SC84XNnV/8RX87psXXKrBCOMLNhpAtfV3CEKGPnoqcPBRsRBT0
	sl5fKjC8zcPjK0S7IGxIWADew+U2PhwtrHxWbsD4uYaYkWVsQxdLF/Y8SnNgK14bdiE77XVfwGy
	oqvJttXYLTC6vle+Q+P8x1tmeBSwjdyzWP08WwxumlYNRvPMQn0XO8IfmTM+x20hL95/X6FPw85
	dIBbhTqysFKZ90fP7BdAX7X+u7UVetworzWVT54411Z3a2rgRV7M2hAoN5jrjMTq73PogLT7mCc
	VIQ==
X-Google-Smtp-Source: AGHT+IElc5lFlH37PVUP+d0Nts8TxGEBKie4yrCYq8UZcLNclnFFC/us6pnWUIep7DBJZWJMU/+Bqg==
X-Received: by 2002:a5d:6daa:0:b0:38f:28cb:4d35 with SMTP id ffacd0b85a97d-38f6e95b175mr5481843f8f.13.1740217528506;
        Sat, 22 Feb 2025 01:45:28 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d8dd6sm26089591f8f.62.2025.02.22.01.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Feb 2025 01:45:28 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Ryan Walklin <ryan@testtoast.com>
Cc: Andre Przywara <andre.przywara@arm.com>,
 Chris Morgan <macroalpha82@gmail.com>,
 Hironori KIKUCHI <kikuchan98@gmail.com>,
 Philippe Simons <simons.philippe@gmail.com>, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Ryan Walklin <ryan@testtoast.com>
Subject:
 Re: [PATCH 5/8] arm64: dts: allwinner: h616: Add TCON nodes to H616 DTSI
Date: Sat, 22 Feb 2025 10:45:27 +0100
Message-ID: <1916004.CQOukoFCf9@jernej-laptop>
In-Reply-To: <20250216092827.15444-6-ryan@testtoast.com>
References:
 <20250216092827.15444-1-ryan@testtoast.com>
 <20250216092827.15444-6-ryan@testtoast.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne nedelja, 16. februar 2025 ob 10:27:12 Srednjeevropski standardni =C4=8D=
as je Ryan Walklin napisal(a):
> From: Jernej Skrabec <jernej.skrabec@gmail.com>
>=20
> The Allwinner H616 has a display pipeline similar to other Allwinner
> devices, specifically the A10, but using a newer display engine
> revision (DE33).
>=20
> Not all output pins are exposed on all package variants, for example
> only the H700 and T507 have LCD pins exposed, but all variants support
> HDMI output. However on the die these are connected to a display engine
> via a TCON TOP and one or more timing controllers (TCONs).
>=20
> HDMI output support is not provided in this series (but will be in a
> subsequent patch) so for now note this within the relevant node to
> prevent a DT compiler error.
>=20
> Add TCON nodes for the TOP, and the LCD and TV timing controllers. The
> timing controllers are compatible with the existing R40 driver.
>=20
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> ---
>  .../arm64/boot/dts/allwinner/sun50i-h616.dtsi | 133 ++++++++++++++++++
>  1 file changed, 133 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/=
boot/dts/allwinner/sun50i-h616.dtsi
> index ab8b70ce7df89..242bac95840f8 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> @@ -7,9 +7,12 @@
>  #include <dt-bindings/clock/sun50i-h616-ccu.h>
>  #include <dt-bindings/clock/sun50i-h6-r-ccu.h>
>  #include <dt-bindings/clock/sun6i-rtc.h>
> +#include <dt-bindings/clock/sun8i-de2.h>
> +#include <dt-bindings/clock/sun8i-tcon-top.h>
>  #include <dt-bindings/reset/sun50i-h616-ccu.h>
>  #include <dt-bindings/reset/sun50i-h6-r-ccu.h>
>  #include <dt-bindings/thermal/thermal.h>
> +#include <dt-bindings/reset/sun8i-de2.h>
> =20
>  / {
>  	interrupt-parent =3D <&gic>;
> @@ -909,6 +912,136 @@ ohci3: usb@5311400 {
>  			status =3D "disabled";
>  		};
> =20
> +		tcon_top: tcon-top@6510000 {
> +			compatible =3D "allwinner,sun50i-h6-tcon-top";
> +			reg =3D <0x06510000 0x1000>;
> +			clocks =3D <&ccu CLK_BUS_TCON_TOP>,
> +				 <&ccu CLK_TCON_TV0>;
> +			clock-names =3D "bus", "tcon-tv0";
> +			clock-output-names =3D "tcon-top-tv0";
> +			#clock-cells =3D <0>;
> +			resets =3D <&ccu RST_BUS_TCON_TOP>;
> +
> +			ports {
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +
> +				tcon_top_mixer0_in: port@0 {
> +					#address-cells =3D <1>;
> +					#size-cells =3D <0>;
> +					reg =3D <0>;
> +
> +					tcon_top_mixer0_in_mixer0: endpoint@0 {
> +						reg =3D <0>;
> +						remote-endpoint =3D <&mixer0_out_tcon_top_mixer0>;
> +					};
> +				};
> +
> +				tcon_top_mixer0_out: port@1 {
> +					#address-cells =3D <1>;
> +					#size-cells =3D <0>;
> +					reg =3D <1>;
> +
> +					tcon_top_mixer0_out_tcon_lcd0: endpoint@0 {
> +						reg =3D <0>;
> +						remote-endpoint =3D <&tcon_lcd0_in_tcon_top_mixer0>;
> +					};
> +
> +					tcon_top_mixer0_out_tcon_tv0: endpoint@2 {
> +						reg =3D <2>;
> +						remote-endpoint =3D <&tcon_tv0_in_tcon_top_mixer0>;
> +					};
> +				};
> +
> +				tcon_top_hdmi_in: port@4 {
> +					#address-cells =3D <1>;
> +					#size-cells =3D <0>;
> +					reg =3D <4>;
> +
> +					tcon_top_hdmi_in_tcon_tv0: endpoint@0 {
> +						reg =3D <0>;
> +						remote-endpoint =3D <&tcon_tv0_out_tcon_top>;
> +					};
> +				};
> +
> +				tcon_top_hdmi_out: port@5 {
> +					reg =3D <5>;
> +
> +					tcon_top_hdmi_out_hdmi: endpoint {
> +						/* placeholder for HDMI  - remote-endpoint =3D <&hdmi_in_tcon_top>=
;*/
> +					};
> +				};
> +			};
> +		};
> +	=09
> +		tcon_lcd0: lcd-controller@6511000 {
> +			compatible =3D "allwinner,sun8i-r40-tcon-lcd";
> +			reg =3D <0x06511000 0x1000>;
> +			interrupts =3D <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&ccu CLK_BUS_TCON_LCD0>, <&ccu CLK_TCON_LCD0>;
> +			clock-names =3D "ahb", "tcon-ch0";
> +			clock-output-names =3D "tcon-data-clock";
> +			#clock-cells =3D <0>;
> +			resets =3D <&ccu RST_BUS_TCON_LCD0>, <&ccu RST_BUS_TCON_LCD1>;
> +			reset-names =3D "lcd", "lvds";

That's not true, is it? LVDS should be LVDS reset. Check my WIP patch:
https://github.com/jernejsk/linux-1/commit/8b090dc866d4c4b5b0a1804da021a9f4=
4c67d5f1

It turns out that H616 clock driver missed LVDS reset, as it can be seen he=
re:
https://github.com/jernejsk/linux-1/commit/88bad1a59876f5d385bcd45a363784ed=
2beec6ae#diff-b340c978bcdbe240f7b99f4d0d96ea130a8acb1a5786a8efbb24d9e7a0b14=
e53R1084

I also commented on this series:
https://lore.kernel.org/linux-sunxi/20250213172248.158447-1-macroalpha82@gm=
ail.com/T/#t

Best regards,
Jernej

> +			status =3D "disabled";
> +
> +			ports {
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +
> +				tcon_lcd0_in: port@0 {
> +					reg =3D <0>;
> +
> +					tcon_lcd0_in_tcon_top_mixer0: endpoint {
> +						remote-endpoint =3D <&tcon_top_mixer0_out_tcon_lcd0>;
> +					};
> +				};
> +
> +				tcon_lcd0_out: port@1 {
> +					reg =3D <1>;
> +				};
> +			};
> +		};
> +	=09
> +		tcon_tv0: lcd-controller@6515000 {
> +			compatible =3D "allwinner,sun50i-h6-tcon-tv",
> +				     "allwinner,sun8i-r40-tcon-tv";
> +			reg =3D <0x06515000 0x1000>;
> +			interrupts =3D <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&ccu CLK_BUS_TCON_TV0>,
> +				 <&tcon_top CLK_TCON_TOP_TV0>;
> +			clock-names =3D "ahb", "tcon-ch1";
> +			#clock-cells =3D <0>;
> +			resets =3D <&ccu RST_BUS_TCON_TV0>;
> +			reset-names =3D "lcd";
> +			status =3D "disabled";
> +
> +			ports {
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +
> +				tcon_tv0_in: port@0 {
> +					reg =3D <0>;
> +
> +					tcon_tv0_in_tcon_top_mixer0: endpoint {
> +						remote-endpoint =3D <&tcon_top_mixer0_out_tcon_tv0>;
> +					};
> +				};
> +
> +				tcon_tv0_out: port@1 {
> +					#address-cells =3D <1>;
> +					#size-cells =3D <0>;
> +					reg =3D <1>;
> +
> +					tcon_tv0_out_tcon_top: endpoint@1 {
> +						reg =3D <1>;
> +						remote-endpoint =3D <&tcon_top_hdmi_in_tcon_tv0>;
> +					};
> +				};
> +			};
> +		};
> +
>  		rtc: rtc@7000000 {
>  			compatible =3D "allwinner,sun50i-h616-rtc";
>  			reg =3D <0x07000000 0x400>;
>=20





Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3777A14E2D4
	for <linux-sunxi@lists.linux.dev>; Wed, 27 Mar 2024 21:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711574689; cv=none; b=FgjKCdpeJf3EEmlFbbBOTNo6Ba3LDwNbYBDyuk572HOUGcghFaSyZW6syrZPlVnzerDbbkWhJj8ERJC+JDZAowHkDErKmX2Wgl/nMAVyGoUV+H/Z0StzqrcbrE78Z0S6x8ysct8aTUu+6VLEJibGQtS5QDbGCJ02xWe5BIsgxI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711574689; c=relaxed/simple;
	bh=AT9KFGQQ9sqHmU0GvGUAx/lXcN4gMV2bNh15AQJ+3Ug=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YWKXFHCFtZKgbLepnaN18GX1KpRHN3bqyOiAmyzlhryj49eRjQRW4Y/MbYwktPx0t+isLa+BhNdWXrlUEExDfUQ1/mu6TZ1TWUUIQJ653C1PkF5SHWlnPQXVWUAQ4jSIzskPlM3Wh/Z31oWgHq6VPoPUHWXs+yEF0AjicErnq38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MHcisw+K; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MHcisw+K"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-56bc5a3aeb9so331927a12.3
        for <linux-sunxi@lists.linux.dev>; Wed, 27 Mar 2024 14:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711574686; x=1712179486; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1eawYx38ABDnE1SDp1aNunxt7lkWGLWWm8mQqMXuM70=;
        b=MHcisw+KWS+LKQ82wi10g0+vc69qxufX9Qdtahz6IgNVY7O3/ieuFDXLF1+IDcKPi2
         BcyVjqLMHYhIeWfNFK3p6hD1L6RYdG7c9lJ15SNF8FnIR+fLmzgTYZwYKaf15dnIAzPs
         hRpmTrqeRcGBvehORdkIb0M+FEzJwBJM0CKHPNy8kpbA9FS2igF57WvIbfpCXdHCtFFa
         RDr0WAeWQgbeVFc5yhAvTCMFc67eRsKzzL8C9X/Ca13pHYHzjwxE66nkHsJ8UAqYjXTo
         JF45PYgVF74I8qAz+n61yIADRxHUygL2+ticQEuRpuAsgBhbYhAxQAKAQUVe7/hdfGO/
         qrMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711574686; x=1712179486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1eawYx38ABDnE1SDp1aNunxt7lkWGLWWm8mQqMXuM70=;
        b=hbkiQPLTaXcbGdeMrAM1cSALIxSB3MhSeaB/p8uRp5INaaxs0jB8ICVOMTECwEvaeH
         iczZ2oX/LYvFZdDT6pSdPV/BX3jvbuc6f3uCyaSl8CDtEoJqvu5eyiOZ1ZU8zJZGbeeb
         gFKeosA37+YEinSXujSddgJEP/KCmYg0S2FVg4+vlqWwtsGVlAhNrGXMPPZu3BhlGhHi
         FSo2DeEB/lX4ljMhyx+3GktTyE3nNJwuZktQhRJr00F9q2NW679LUwzfWp9UnRXV/Prg
         6fluPAHI3oHsRbrE7oFTlOsIzOZMaKCIJ7yyjje1UbeAAYPPaXuiH1Cxx8yoO0ywZ5H9
         2eWA==
X-Forwarded-Encrypted: i=1; AJvYcCVSaiXb4zr6iTBRes/MkS00XoUyR9hiHu0100oTQXLZY8KU+NofAX0dbe7I9XI27HR0Av6OF/auCZhlPn9DFKzdjP8gMZU5rgvo3+M=
X-Gm-Message-State: AOJu0YxXOP9Jwx5Lanv1jDmlfIoTn00XIyyDsz/gzMW4FvfCWYgYHr7O
	Zt/jaIA3/MZso4OZadf5ND6xN/Ml5Quz51oG9zy7j1kh1GUM4Nar
X-Google-Smtp-Source: AGHT+IGYmY0ghm0yr8Pe9NEizV2ZCw3A+KRCLXyoDjDLsubmZrEcjNQyYa+mH5D0o38fVg9fCSXMwQ==
X-Received: by 2002:a17:907:7255:b0:a46:be3d:1ed8 with SMTP id ds21-20020a170907725500b00a46be3d1ed8mr539387ejc.54.1711574686294;
        Wed, 27 Mar 2024 14:24:46 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id i1-20020a170906a28100b00a4668970f74sm5913600ejz.108.2024.03.27.14.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 14:24:45 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Yangtao Li <tiny.windzz@gmail.com>, Viresh Kumar <vireshk@kernel.org>,
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Andre Przywara <andre.przywara@arm.com>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Brandon Cheo Fusi <fusibrandon13@gmail.com>,
 Martin Botka <martin.botka@somainline.org>,
 Martin Botka <martin.botka1@gmail.com>,
 Chris Morgan <macroalpha82@gmail.com>, Ryan Walklin <ryan@testtoast.com>
Subject: Re: [PATCH v3 7/8] arm64: dts: allwinner: h616: Add CPU OPPs table
Date: Wed, 27 Mar 2024 22:24:44 +0100
Message-ID: <114106220.nniJfEyVGO@jernej-laptop>
In-Reply-To: <20240326114743.712167-8-andre.przywara@arm.com>
References:
 <20240326114743.712167-1-andre.przywara@arm.com>
 <20240326114743.712167-8-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Dne torek, 26. marec 2024 ob 12:47:42 CET je Andre Przywara napisal(a):
> From: Martin Botka <martin.botka@somainline.org>
> 
> Add an Operating Performance Points table for the CPU cores to enable
> Dynamic Voltage & Frequency Scaling (DVFS) on the H616.
> The values were taken from the BSP sources. The (newer) H700 chips we
> have seen seem to use a separate speed bin, its OPP values were taken
> from a live system and added to the mix.
> 
> Also add the needed cpu_speed_grade nvmem cell and the cooling cells
> properties, to enable passive cooling.
> 
> Signed-off-by: Martin Botka <martin.botka@somainline.org>
> [Andre: rework to minimise opp-microvolt properties]
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  .../dts/allwinner/sun50i-h616-cpu-opp.dtsi    | 125 ++++++++++++++++++
>  .../arm64/boot/dts/allwinner/sun50i-h616.dtsi |   8 ++
>  2 files changed, 133 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h616-cpu-opp.dtsi
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-cpu-opp.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616-cpu-opp.dtsi
> new file mode 100644
> index 0000000000000..6073fdf672592
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-cpu-opp.dtsi
> @@ -0,0 +1,125 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +// Copyright (C) 2023 Martin Botka <martin@somainline.org>
> +
> +/ {
> +	cpu_opp_table: opp-table-cpu {
> +		compatible = "allwinner,sun50i-h616-operating-points";
> +		nvmem-cells = <&cpu_speed_grade>;
> +		opp-shared;
> +
> +		opp-480000000 {
> +			opp-hz = /bits/ 64 <480000000>;
> +			opp-microvolt = <900000>;

Ideally triplet of voltages should be specified, to support PMIC-less boards,
but that's unlikely to happen with these SoCs.

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> +			clock-latency-ns = <244144>; /* 8 32k periods */
> +			opp-supported-hw = <0x3f>;
> +		};
> +
> +		opp-600000000 {
> +			opp-hz = /bits/ 64 <600000000>;
> +			opp-microvolt = <900000>;
> +			clock-latency-ns = <244144>; /* 8 32k periods */
> +			opp-supported-hw = <0x12>;
> +		};
> +
> +		opp-720000000 {
> +			opp-hz = /bits/ 64 <720000000>;
> +			opp-microvolt = <900000>;
> +			clock-latency-ns = <244144>; /* 8 32k periods */
> +			opp-supported-hw = <0x2d>;
> +		};
> +
> +		opp-792000000 {
> +			opp-hz = /bits/ 64 <792000000>;
> +			opp-microvolt-speed1 = <900000>;
> +			opp-microvolt-speed4 = <940000>;
> +			clock-latency-ns = <244144>; /* 8 32k periods */
> +			opp-supported-hw = <0x12>;
> +		};
> +
> +		opp-936000000 {
> +			opp-hz = /bits/ 64 <936000000>;
> +			opp-microvolt = <900000>;
> +			clock-latency-ns = <244144>; /* 8 32k periods */
> +			opp-supported-hw = <0x0d>;
> +		};
> +
> +		opp-1008000000 {
> +			opp-hz = /bits/ 64 <1008000000>;
> +			opp-microvolt-speed0 = <950000>;
> +			opp-microvolt-speed1 = <940000>;
> +			opp-microvolt-speed2 = <950000>;
> +			opp-microvolt-speed3 = <950000>;
> +			opp-microvolt-speed4 = <1020000>;
> +			clock-latency-ns = <244144>; /* 8 32k periods */
> +			opp-supported-hw = <0x1f>;
> +		};
> +
> +		opp-10320000 {
> +			opp-hz = /bits/ 64 <1032000000>;
> +			opp-microvolt = <900000>;
> +			clock-latency-ns = <244144>; /* 8 32k periods */
> +			opp-supported-hw = <0x20>;
> +		};
> +
> +		opp-1104000000 {
> +			opp-hz = /bits/ 64 <1104000000>;
> +			opp-microvolt-speed0 = <1000000>;
> +			opp-microvolt-speed2 = <1000000>;
> +			opp-microvolt-speed3 = <1000000>;
> +			opp-microvolt-speed5 = <950000>;
> +			clock-latency-ns = <244144>; /* 8 32k periods */
> +			opp-supported-hw = <0x2d>;
> +		};
> +
> +		opp-1200000000 {
> +			opp-hz = /bits/ 64 <1200000000>;
> +			opp-microvolt-speed0 = <1050000>;
> +			opp-microvolt-speed1 = <1020000>;
> +			opp-microvolt-speed2 = <1050000>;
> +			opp-microvolt-speed3 = <1050000>;
> +			opp-microvolt-speed4 = <1100000>;
> +			opp-microvolt-speed5 = <1020000>;
> +			clock-latency-ns = <244144>; /* 8 32k periods */
> +			opp-supported-hw = <0x3f>;
> +		};
> +
> +		opp-1320000000 {
> +			opp-hz = /bits/ 64 <1320000000>;
> +			opp-microvolt = <1100000>;
> +			clock-latency-ns = <244144>; /* 8 32k periods */
> +			opp-supported-hw = <0x1d>;
> +		};
> +
> +		opp-1416000000 {
> +			opp-hz = /bits/ 64 <1416000000>;
> +			opp-microvolt = <1100000>;
> +			clock-latency-ns = <244144>; /* 8 32k periods */
> +			opp-supported-hw = <0x2d>;
> +		};
> +
> +		opp-1512000000 {
> +			opp-hz = /bits/ 64 <1512000000>;
> +			opp-microvolt-speed1 = <1100000>;
> +			opp-microvolt-speed3 = <1100000>;
> +			opp-microvolt-speed5 = <1160000>;
> +			clock-latency-ns = <244144>; /* 8 32k periods */
> +			opp-supported-hw = <0x2a>;
> +		};
> +	};
> +};
> +
> +&cpu0 {
> +	operating-points-v2 = <&cpu_opp_table>;
> +};
> +
> +&cpu1 {
> +	operating-points-v2 = <&cpu_opp_table>;
> +};
> +
> +&cpu2 {
> +	operating-points-v2 = <&cpu_opp_table>;
> +};
> +
> +&cpu3 {
> +	operating-points-v2 = <&cpu_opp_table>;
> +};
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> index b2e85e52d1a12..c0fa466fa9f07 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> @@ -26,6 +26,7 @@ cpu0: cpu@0 {
>  			reg = <0>;
>  			enable-method = "psci";
>  			clocks = <&ccu CLK_CPUX>;
> +			#cooling-cells = <2>;
>  		};
>  
>  		cpu1: cpu@1 {
> @@ -34,6 +35,7 @@ cpu1: cpu@1 {
>  			reg = <1>;
>  			enable-method = "psci";
>  			clocks = <&ccu CLK_CPUX>;
> +			#cooling-cells = <2>;
>  		};
>  
>  		cpu2: cpu@2 {
> @@ -42,6 +44,7 @@ cpu2: cpu@2 {
>  			reg = <2>;
>  			enable-method = "psci";
>  			clocks = <&ccu CLK_CPUX>;
> +			#cooling-cells = <2>;
>  		};
>  
>  		cpu3: cpu@3 {
> @@ -50,6 +53,7 @@ cpu3: cpu@3 {
>  			reg = <3>;
>  			enable-method = "psci";
>  			clocks = <&ccu CLK_CPUX>;
> +			#cooling-cells = <2>;
>  		};
>  	};
>  
> @@ -156,6 +160,10 @@ sid: efuse@3006000 {
>  			ths_calibration: thermal-sensor-calibration@14 {
>  				reg = <0x14 0x8>;
>  			};
> +
> +			cpu_speed_grade: cpu-speed-grade@0 {
> +				reg = <0x0 2>;
> +			};
>  		};
>  
>  		watchdog: watchdog@30090a0 {
> 





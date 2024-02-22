Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B6D137908
	for <linux-sunxi@lists.linux.dev>; Thu, 22 Feb 2024 18:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708626475; cv=none; b=s7KDiw3jhfP6rvnIMS95hhi5ZKJ6bKARJD+AZ/uRvUTobeMk1D0DrWWQZ/yB/bCmvKuDHQcXItMqpssCqht11xx+vSUAtFJxgZNdobyEZtiFLHnbHqCNuFmFvPggn+Jv+3ZLlSGd0cCzXhvYQ85GU8V7Ld0HTdTx3jKSlMDM11s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708626475; c=relaxed/simple;
	bh=/ERQAEsXu0G6kcuTagglxUQka6jY9dYPE/DzuZNf3dI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YKID/gPhUuYKaok+h5miSr+T3sSfCqkFbpgUtM4T3XF3PVKbJDGANJpxKBD8W+dN8uzDsAZaZF6dXTKCYrrgA/V6qM+u9aSin0/Z8B7WFvyCsTO5mJbHMxv8VXW2IrVQe0tZNUGKixMx9pcqpNo7lFkRcWCI+b7KLoPx3mzWQew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ms/Ftln1; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ms/Ftln1"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a3ed9cae56fso242360466b.1
        for <linux-sunxi@lists.linux.dev>; Thu, 22 Feb 2024 10:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708626472; x=1709231272; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tELClXvgGOtyHBZZBd2XEfCIwH1azmS4e74QYILe7xI=;
        b=Ms/Ftln1dMNjM9/EFpz7E0wMhg5TBZXN4xcvswmmODIKLZsBfLp56cyWH21sEJUKS5
         gtfK1uAUnTHsPDrt25g9I5rEgFw4ZOsJDhIvhvwnZjR2b15zfDbIL0TOh4TUiAJhsWB9
         l91Ob+vwsrv7/nHBTfj5pZCvDatIQotZOsU/i73Bo3Wq92tzt38onax6l0E6S0ZqlJFE
         nF65k8FdQi/TA7PYgUh2qvXMh1x8AMbs/0/Qh6j3L5tVYZagQ38jTnK6Ni03BlxbtUxk
         cmbSRWUYtawPnSJYo3pvArAbFCpkFnqVB9+rVyo3kRMn9XjvH+zmemwndhVelfSDbUjj
         QJUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708626472; x=1709231272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tELClXvgGOtyHBZZBd2XEfCIwH1azmS4e74QYILe7xI=;
        b=qIuEDAAVlDNGjWHaK0D+63nTMWNFeV4iujkh2ZedBUYJImQykdMrdqtKTbHftTXUWC
         Dwr5svRPCHKxI8xtDnnk/BqtrhVgqQmhmCQM+ZoNw08SaTS1zKlmJZVTgay652lyb4p+
         1d1WS9qGOUS0tnidB5tQ6ACdvJvzpjJBDJR+vm7E5VG5vevCLvMbNgkaTx5O/2y6a47L
         lEYJtsF+dUxPOdYVEpsKpty+Jwst56hGLu5TDSxs5OWwmv53AZajVPTMm1SHyIxR2OuE
         bgnjxG/T4kAW+D5OKxLWjQxkpnbhMOnBdqQ33l5TCIX+x1x+UTZw6QvPZ24Ttt6v0fuc
         rVfg==
X-Forwarded-Encrypted: i=1; AJvYcCU2fDsQegFLDhSr344tw/5T2x4auWo/2q4KUPcVrBWJY2RE15vtdZ3PSOmb9MVxuOr21Gmzwv2l2UUFI1h/DsW84C4LJun4Yfx+1NM=
X-Gm-Message-State: AOJu0Yx8cVvcYqTLte6dQT6m2fkZK/Q40pkjC7ozFRLqfkCYky0CeG8y
	4PTJM4LSoeXeYkCpcvx5CMrOe1WVfm/0S+/D5zX6wzmxjruZJaBD
X-Google-Smtp-Source: AGHT+IEyETD3CnHapZN/pItaYfe7T2SP89qHiRZOnxnaXo9m2VgXcYMwYEO4qUFvxVQA2rz+LGVA2Q==
X-Received: by 2002:a17:906:3398:b0:a3e:8b8e:8795 with SMTP id v24-20020a170906339800b00a3e8b8e8795mr2534984eja.34.1708626471678;
        Thu, 22 Feb 2024 10:27:51 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id bn9-20020a170907268900b00a3db46018a4sm6143818ejc.71.2024.02.22.10.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 10:27:51 -0800 (PST)
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
Date: Thu, 22 Feb 2024 19:27:49 +0100
Message-ID: <6017340.lOV4Wx5bFT@jernej-laptop>
In-Reply-To: <20240219153639.179814-8-andre.przywara@arm.com>
References:
 <20240219153639.179814-1-andre.przywara@arm.com>
 <20240219153639.179814-8-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne ponedeljek, 19. februar 2024 ob 16:36:39 CET je Andre Przywara napisal(a):
> From: Martin Botka <martin.botka@somainline.org>
> 
> There are four thermal sensors:
> - CPU
> - GPU
> - VE
> - DRAM
> 
> Add the thermal sensor configuration and the thermal zones.
> 
> Signed-off-by: Martin Botka <martin.botka@somainline.org>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  .../arm64/boot/dts/allwinner/sun50i-h616.dtsi | 88 +++++++++++++++++++
>  1 file changed, 88 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> index 12ffabc79bcde..7c7d7c285505c 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> @@ -9,6 +9,7 @@
>  #include <dt-bindings/clock/sun6i-rtc.h>
>  #include <dt-bindings/reset/sun50i-h616-ccu.h>
>  #include <dt-bindings/reset/sun50i-h6-r-ccu.h>
> +#include <dt-bindings/thermal/thermal.h>
>  
>  / {
>  	interrupt-parent = <&gic>;
> @@ -138,6 +139,10 @@ sid: efuse@3006000 {
>  			reg = <0x03006000 0x1000>;
>  			#address-cells = <1>;
>  			#size-cells = <1>;
> +
> +			ths_calibration: thermal-sensor-calibration@14 {
> +				reg = <0x14 0x8>;
> +			};
>  		};
>  
>  		watchdog: watchdog@30090a0 {
> @@ -517,6 +522,19 @@ mdio0: mdio {
>  			};
>  		};
>  
> +		ths: thermal-sensor@5070400 {
> +			compatible = "allwinner,sun50i-h616-ths";
> +			reg = <0x05070400 0x400>;
> +			interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&ccu CLK_BUS_THS>;
> +			clock-names = "bus";
> +			resets = <&ccu RST_BUS_THS>;
> +			nvmem-cells = <&ths_calibration>;
> +			nvmem-cell-names = "calibration";
> +			allwinner,sram = <&syscon>;
> +			#thermal-sensor-cells = <1>;
> +		};
> +
>  		usbotg: usb@5100000 {
>  			compatible = "allwinner,sun50i-h616-musb",
>  				     "allwinner,sun8i-h3-musb";
> @@ -761,4 +779,74 @@ r_rsb: rsb@7083000 {
>  			#size-cells = <0>;
>  		};
>  	};
> +
> +	thermal-zones {
> +		cpu-thermal {
> +			polling-delay-passive = <500>;
> +			polling-delay = <1000>;
> +			thermal-sensors = <&ths 2>;
> +			sustainable-power = <1000>;
> +
> +			trips {
> +				cpu_threshold: cpu-trip-0 {
> +					temperature = <60000>;
> +					type = "passive";
> +					hysteresis = <0>;
> +				};
> +				cpu_target: cpu-trip-1 {
> +					temperature = <70000>;
> +					type = "passive";
> +					hysteresis = <0>;
> +				};
> +				cpu_critical: cpu-trip-2 {
> +					temperature = <110000>;
> +					type = "critical";
> +					hysteresis = <0>;
> +				};
> +			};
> +		};
> +
> +		gpu-thermal {
> +			polling-delay-passive = <500>;
> +			polling-delay = <1000>;
> +			thermal-sensors = <&ths 0>;
> +			sustainable-power = <1100>;
> +
> +			trips {
> +				gpu_temp_critical: gpu-trip-0 {
> +					temperature = <110000>;
> +					type = "critical";
> +					hysteresis = <0>;
> +				};
> +			};
> +		};
> +
> +		ve-thermal {
> +			polling-delay-passive = <0>;
> +			polling-delay = <0>;
> +			thermal-sensors = <&ths 1>;
> +
> +			trips {
> +				ve_temp_critical: ve-trip-0 {
> +					temperature = <110000>;
> +					type = "critical";
> +					hysteresis = <0>;
> +				};
> +			};
> +		};
> +
> +		ddr-thermal {
> +			polling-delay-passive = <0>;
> +			polling-delay = <0>;
> +			thermal-sensors = <&ths 3>;
> +
> +			trips {
> +				ddr_temp_critical: ddr-trip-0 {
> +					temperature = <110000>;
> +					type = "critical";
> +					hysteresis = <0>;
> +				};
> +			};
> +		};
> +	};
>  };
> 





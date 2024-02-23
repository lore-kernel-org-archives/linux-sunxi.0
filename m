Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C229213DBA8
	for <linux-sunxi@lists.linux.dev>; Fri, 23 Feb 2024 19:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708718353; cv=none; b=rWoRbl/aXvgHf3MQu9/o9kq00uG0HFzpqkJI3N6z4SKE8d2N1XI7J3mp5M7ltI9FBj+EAo6V9RD60NO879Gpdc8JHqD/JTk12W0SP7JbGpRbT7yPmUEgoxXyRRqEAhbpXaWm6xTWssGWO6mT0BPnkDRiCquEhgQIoWL6J9vnRFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708718353; c=relaxed/simple;
	bh=0RfNMB8U2OJeZoXfNYmx+4+5DBHIL//3DzUbkh54gbM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M3OzvxaMmUAwzteIOgtuj6hqAIOITPeXxs2OsK3hsx61rJ4us0UnxvuHBspLvjm0Z+0f0zX/4du1ByUanirC1mkytjoZJBG1aXdmieNOpr61HrWAU6LlwKOWfkraLaNiDRrLUjNA7GIRrP0ev7y8FwH1UK2z8QxKXQj/li4Dpno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bKDRB4GR; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bKDRB4GR"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a3d484a58f6so177811366b.3
        for <linux-sunxi@lists.linux.dev>; Fri, 23 Feb 2024 11:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708718350; x=1709323150; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z894Zg2CSZbZzbMtWOcHDsDVjOprmfGRO35Ki4YUhH0=;
        b=bKDRB4GRfSTLH3Z8Q+yuaca0ePeQVU0mlYP/jy6hSUU33sIkmw7Uvjmc4i/pHL7jL/
         usMeqwHrWU7dbK5HxFhfuGsPIy1G08yV/RT0Tq1ZRNVCGRsSHS5RAeyBQWk9YToAdEUy
         ZdufsTicB1DHTvetyHyx9v2XXiIMKcDUOfyejf+HTkmMps88tEo8579TVonN/rMjoLVq
         Tk/u2urvh3ZBuroATj2gNbunNY/NXErmyjm0EfDMpRJo5kOPQNptg2BIkm+K95exd4xg
         cl+RDFX7nIVFVDzUK8B64Dq94WqYrYoruwYEf+vFg84X5gyIa479SvaIL13d1e26pHox
         AkmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708718350; x=1709323150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z894Zg2CSZbZzbMtWOcHDsDVjOprmfGRO35Ki4YUhH0=;
        b=a2VEi8VPbfwwQqBd83yEd8fEVx0DWIIFTTCkYT5/ZqUUFnxrwBMAg2/n6Te7VBLOK6
         8RWibs6HJ55YExl01pKW1xsyp6lPbyomiCp/fiuHLm77sZ7lbTBi9+sDvLMH8/KxL9hk
         P+VTujVsle0h1EHNY1GY5IaWWMagcMiThyrMD8HA/jbkdtkAvCz2Ef21tGDQw6GBB5mV
         eeu6aHSFz6aq9sGHG/60E7P6QD0T8vE+nfYCP4dwOkG28C85YHzY03IMO6x3nJK2amRt
         go59qRybnRAtLfymPLdzyxsqGFttho4LkwmfPlnoOR5DiYmwprZl4MYHwp1uhRtoawer
         GdPg==
X-Forwarded-Encrypted: i=1; AJvYcCUNEvcCir+1DzX4fAFKhGmC7kudVi92soucTAyg665ZCAT4pl6hDNxiTDsCHElTR3+d6LhihYiw1O+QfSo6KnsaGP5VOuphy4/d/M8=
X-Gm-Message-State: AOJu0Yw8hIV/wYIoxuw//VsraINV3bOpSWt0Huvw4huYnf7s2QX2IfqR
	5BvF2Rg93XBm5hfXVtt4PuMjUcb+t5drmbs8o8EZh4sHVMuy+AO4P5AV7hC/dq4=
X-Google-Smtp-Source: AGHT+IHa3BodFIBcxDRDYeqP+u89pkUBXtdIKmif9raMa9dTkft1TZXDVm+m+J5uzAoci0my3baSQw==
X-Received: by 2002:a17:906:4bd4:b0:a3e:7a8f:27dc with SMTP id x20-20020a1709064bd400b00a3e7a8f27dcmr485556ejv.49.1708718350027;
        Fri, 23 Feb 2024 11:59:10 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id vw15-20020a170907a70f00b00a3f3a5d6752sm2811107ejc.51.2024.02.23.11.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 11:59:09 -0800 (PST)
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
Date: Fri, 23 Feb 2024 20:59:08 +0100
Message-ID: <6017645.lOV4Wx5bFT@jernej-laptop>
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

I can't cleanly apply patch on top of sunxi/dt-for-6.9. Can you please rebase?

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





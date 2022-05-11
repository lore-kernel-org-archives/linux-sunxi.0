Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B3C3207
	for <linux-sunxi@lists.linux.dev>; Wed, 11 May 2022 20:13:27 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id s11so50589edy.6
        for <linux-sunxi@lists.linux.dev>; Wed, 11 May 2022 13:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Nm89gfLqtSP3TfQoaVyZOT3oxzHwcL28ZW4W5CS/9qo=;
        b=DCSfEwi/ZFlNlmvv+UkFcfWq90jcjs1SXyu3yKp6oYQ5GnnJms08VToWJ9z6a1DlJT
         eY5mhTZTW5Ix4ptglCA9GFwi7iHce6jKIdyKVI4roVhkxrotKQFZo58LE6A9NNre/mwy
         CE3qnm2pGTwy8TUiNBHNYJrNh+Ax2DfRr0Biy1pOdWKENSxJSPWDM/zgNPj+o0hqX+G9
         WB1mDJOfNkTKAnLhFnRhVOmxowH+gmZ7jKLQWLs/8VRStrhUS9C8ssJVTJd+Do5jPxQ9
         n13K2eTY75Q/7E5q7eLZVTqWqum9VTXoPs07dSH2mxTuiAfWILjN+/zhZZhzemrrUSMy
         oAjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Nm89gfLqtSP3TfQoaVyZOT3oxzHwcL28ZW4W5CS/9qo=;
        b=Bq4a5L7yVVihmtbbwgePoWvwMJluE5BT1R2ie/7eGE8xd6s2gk+E4nbCwq0oduEnky
         btvb6pONN9eU7CYg6IlDb8i2Sex6hlpAc3B3yHWBWbDo/1v6qi5OoMvfl19CTn0anKkF
         v8sDVIP8OZDcuXudaSjrhN/25tlSJzvJ7JkFozfZStfllM9cB0Hs+KqyJZIbqEDeJ2+/
         NUvDsQD6EAc2gYZFkCFB1CiY5H/XqdpAQiQJFc2UyYencq4bYutZhhwCrU6/NFZPt1Xs
         I7VfrrJe5kNHEwfEXRuFlZ7Gn73BnTxkUFiiFU1Y3OM6u3FDmVDXnCuiEtqzE06LiN21
         3JzQ==
X-Gm-Message-State: AOAM531GZ36/lcUEiqK3dZyp3ech3W6JXQPX+KnhkZ/DXN//sIgrY2Gr
	qmQ2HaWtBqML0nTJ2lTARqpUSnsEkayLuw==
X-Google-Smtp-Source: ABdhPJxwFRdLfiMvDB5YKZpJTQp0z3Ohhe7yXCCx50Ljz5hzv9ZJovC6a5xfyy8LPah7sHr4dZbKAw==
X-Received: by 2002:a05:6402:17c1:b0:428:8016:d98d with SMTP id s1-20020a05640217c100b004288016d98dmr24417591edy.5.1652300006185;
        Wed, 11 May 2022 13:13:26 -0700 (PDT)
Received: from kista.localnet (cpe1-3-76.cable.triera.net. [213.161.3.76])
        by smtp.gmail.com with ESMTPSA id oz35-20020a1709077da300b006f3ef214e1csm1359454ejc.130.2022.05.11.13.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 May 2022 13:13:25 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-sunxi@lists.linux.dev, qianfanguijin@163.com
Cc: Rob Herring <robh+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, qianfan Zhao <qianfanguijin@163.com>
Subject: Re: [PATCH v2] drivers: cpufreq: sun8i-r40: Add cpufreq support
Date: Wed, 11 May 2022 22:13:24 +0200
Message-ID: <1902551.yKVeVyVuyW@kista>
In-Reply-To: <20220510003611.1812-1-qianfanguijin@163.com>
References: <20220510003611.1812-1-qianfanguijin@163.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne torek, 10. maj 2022 ob 02:36:11 CEST je qianfanguijin@163.com napisal(a):
> From: qianfan Zhao <qianfanguijin@163.com>
> 
> OPP table value is get from allwinner lichee 3.10 kernel.
> And completed 'cpu-supply' on sun8i based board.
> 
> Signed-off-by: qianfan Zhao <qianfanguijin@163.com>
> ---
>  .../boot/dts/sun8i-r40-bananapi-m2-ultra.dts  |  4 ++
>  arch/arm/boot/dts/sun8i-r40-feta40i.dtsi      |  4 ++
>  arch/arm/boot/dts/sun8i-r40.dtsi              | 47 +++++++++++++++++++
>  arch/arm/boot/dts/sun8i-t3-cqa3t-bv3.dts      |  4 ++
>  .../boot/dts/sun8i-v40-bananapi-m2-berry.dts  |  4 ++
>  drivers/cpufreq/cpufreq-dt-platdev.c          |  1 +

This patch needs to be split in two:
1. driver change
2. DT changes

And please add change log here for next submission.

>  6 files changed, 64 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts b/arch/arm/
boot/dts/sun8i-r40-bananapi-m2-ultra.dts
> index a6a1087a0c9b..4f30018ec4a2 100644
> --- a/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts
> +++ b/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts
> @@ -113,6 +113,10 @@ &ahci {
>  	status = "okay";
>  };
>  
> +&cpu0 {
> +	cpu-supply = <&reg_dcdc2>;
> +};
> +
>  &de {
>  	status = "okay";
>  };
> diff --git a/arch/arm/boot/dts/sun8i-r40-feta40i.dtsi b/arch/arm/boot/dts/
sun8i-r40-feta40i.dtsi
> index 265e0fa57a32..b872b51a346d 100644
> --- a/arch/arm/boot/dts/sun8i-r40-feta40i.dtsi
> +++ b/arch/arm/boot/dts/sun8i-r40-feta40i.dtsi
> @@ -6,6 +6,10 @@
>  
>  #include "sun8i-r40.dtsi"
>  
> +&cpu0 {
> +	cpu-supply = <&reg_dcdc2>;
> +};
> +
>  &i2c0 {
>  	status = "okay";
>  
> diff --git a/arch/arm/boot/dts/sun8i-r40.dtsi b/arch/arm/boot/dts/sun8i-
r40.dtsi
> index 291f4784e86c..90de119095fa 100644
> --- a/arch/arm/boot/dts/sun8i-r40.dtsi
> +++ b/arch/arm/boot/dts/sun8i-r40.dtsi
> @@ -54,6 +54,41 @@ / {
>  	#size-cells = <1>;
>  	interrupt-parent = <&gic>;
>  
> +	cpu0_opp_table: opp_table0 {
> +		compatible = "operating-points-v2";
> +		opp-shared;
> +
> +		opp-720000000 {
> +			opp-hz = /bits/ 64 <720000000>;
> +			opp-microvolt = <1000000 1000000 1300000>;
> +			clock-latency-ns = <2000000>;
> +		};
> +
> +		opp-912000000 {
> +			opp-hz = /bits/ 64 <912000000>;
> +			opp-microvolt = <1100000 1100000 1300000>;
> +			clock-latency-ns = <2000000>;
> +		};
> +
> +		opp-1008000000 {
> +			opp-hz = /bits/ 64 <1008000000>;
> +			opp-microvolt = <1160000 1160000 1300000>;
> +			clock-latency-ns = <2000000>;
> +		};
> +
> +		opp-1104000000 {
> +			opp-hz = /bits/ 64 <1104000000>;
> +			opp-microvolt = <1240000 1240000 1300000>;
> +			clock-latency-ns = <2000000>;
> +		};
> +
> +		opp-1200000000 {
> +			opp-hz = /bits/ 64 <1200000000>;
> +			opp-microvolt = <1300000 1300000 1300000>;
> +			clock-latency-ns = <2000000>;
> +		};
> +	};
> +
>  	clocks {
>  		#address-cells = <1>;
>  		#size-cells = <1>;
> @@ -84,24 +119,36 @@ cpu0: cpu@0 {
>  			compatible = "arm,cortex-a7";
>  			device_type = "cpu";
>  			reg = <0>;
> +			clocks = <&ccu CLK_CPU>;
> +			clock-names = "cpu";
> +			operating-points-v2 = <&cpu0_opp_table>;
>  		};
>  
>  		cpu1: cpu@1 {
>  			compatible = "arm,cortex-a7";
>  			device_type = "cpu";
>  			reg = <1>;
> +			clocks = <&ccu CLK_CPU>;
> +			clock-names = "cpu";
> +			operating-points-v2 = <&cpu0_opp_table>;
>  		};
>  
>  		cpu2: cpu@2 {
>  			compatible = "arm,cortex-a7";
>  			device_type = "cpu";
>  			reg = <2>;
> +			clocks = <&ccu CLK_CPU>;
> +			clock-names = "cpu";
> +			operating-points-v2 = <&cpu0_opp_table>;
>  		};
>  
>  		cpu3: cpu@3 {
>  			compatible = "arm,cortex-a7";
>  			device_type = "cpu";
>  			reg = <3>;
> +			clocks = <&ccu CLK_CPU>;
> +			clock-names = "cpu";
> +			operating-points-v2 = <&cpu0_opp_table>;
>  		};
>  	};
>  
> diff --git a/arch/arm/boot/dts/sun8i-t3-cqa3t-bv3.dts b/arch/arm/boot/dts/
sun8i-t3-cqa3t-bv3.dts
> index 6931aaab2382..0eb1990742ff 100644
> --- a/arch/arm/boot/dts/sun8i-t3-cqa3t-bv3.dts
> +++ b/arch/arm/boot/dts/sun8i-t3-cqa3t-bv3.dts
> @@ -88,6 +88,10 @@ &ahci {
>  	status = "okay";
>  };
>  
> +&cpu0 {
> +	cpu-supply = <&reg_dcdc2>;
> +};
> +
>  &de {
>  	status = "okay";
>  };
> diff --git a/arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts b/arch/arm/
boot/dts/sun8i-v40-bananapi-m2-berry.dts
> index 47954551f573..fdf8bd12faaa 100644
> --- a/arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts
> +++ b/arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts
> @@ -107,6 +107,10 @@ &ahci {
>  	status = "okay";
>  };
>  
> +&cpu0 {
> +	cpu-supply = <&reg_dcdc2>;
> +};
> +
>  &de {
>  	status = "okay";
>  };
> diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-
dt-platdev.c
> index ca1d103ec449..971a99219d4d 100644
> --- a/drivers/cpufreq/cpufreq-dt-platdev.c
> +++ b/drivers/cpufreq/cpufreq-dt-platdev.c
> @@ -26,6 +26,7 @@ static const struct of_device_id allowlist[] __initconst = 
{
>  	{ .compatible = "allwinner,sun8i-a23", },
>  	{ .compatible = "allwinner,sun8i-a83t", },
>  	{ .compatible = "allwinner,sun8i-h3", },
> +	{ .compatible = "allwinner,sun8i-r40", },

Why on allow list? Comment says operatings-point-v2 should be on block list, 
just like H6.

Best regards,
Jernej

>  
>  	{ .compatible = "apm,xgene-shadowcat", },
>  
> -- 
> 2.25.1
> 
> 



Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17CE3E483
	for <linux-sunxi@lists.linux.dev>; Thu, 14 Dec 2023 11:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ORIa5KVI"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1d075392ff6so3829755ad.1
        for <linux-sunxi@lists.linux.dev>; Thu, 14 Dec 2023 03:14:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702552489; x=1703157289; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FVPTp88lkoUNclLNyMQ28Q4aUPFrbO4VyJ2R1jHccBw=;
        b=ORIa5KVIbry0fKy1Jy1nZkqiHNwWD6zmA5A3Y3UY7Dak46b0lVnVSwYVO0JSQo5a4x
         kYjrsQZ2VcoLZbdv7Lu3C4pAHppqInbD739nBNE68/sTeWJ94vJTxy2nkLq+z1VCBmvg
         GjYCZfZWNSKE9s/p9OocsSi++419WGjs3NOTTXR0xnwpfYpk4/KAglFgJWW3fLTrV3wF
         VTa0yIilsWNOlaQanm8mo74OqvOUP5iLPWxg8bVGx2qbSyCijLfGyZbQSp0GmwEVn/yU
         Kfj3dweh6pPBqUjqt6IymzOq2xgPigAdPYw9qbppCauFzbsdicIRMAXzyqRqzQ+E4JRZ
         1Ctg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702552489; x=1703157289;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FVPTp88lkoUNclLNyMQ28Q4aUPFrbO4VyJ2R1jHccBw=;
        b=OqQa7Fzd+mpi7ImFVj2NseS5Yuqa3j+5uEUDtpGUbjNWpdGjSuewZMupXRg4OjzW8w
         wJ/Ziaaw8jpHMNF4xRIqwQnq9in8Z0xJ1MdiIkw0sf68mmSgIK4nziTvry8RTyrchS1K
         q+oSnznNz2c/LmhLGwVrD06/ogOe4WM8hqWf1XSGMEHEB4XXR5AkQi4MQcc418OZt8Z/
         1YQPNHCCxFY1z/9jzS2s2bmWG/xDvZFBYr4eX6pfGmqMIADcbGgIpa532zxCaGQLSFlC
         B3FtJNG/ugTEeTcmgU8fVcCIBuwDcKpIMsZznQbvaCJohT9/YdCpcfzPMF3ASRPnkAVm
         tERQ==
X-Gm-Message-State: AOJu0Ywl9bUaqNzFr9R0arFL6k1BhIs83lr0ATniXCnG/LWm6M6/HdXV
	htnLz0tj6a7AbOSSCXnU+vQzQg==
X-Google-Smtp-Source: AGHT+IGOq6hMOmxs2rxUvcaHRqnepK0+YXJSK1x4rZ1t/yLDbiZCF+pmSCx8HAr3XtqPRa+sDOje9g==
X-Received: by 2002:a17:902:ce86:b0:1d3:7368:663 with SMTP id f6-20020a170902ce8600b001d373680663mr343871plg.7.1702552488925;
        Thu, 14 Dec 2023 03:14:48 -0800 (PST)
Received: from localhost ([122.172.82.6])
        by smtp.gmail.com with ESMTPSA id j4-20020a170902da8400b001d072591d77sm12200392plx.247.2023.12.14.03.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 03:14:48 -0800 (PST)
Date: Thu, 14 Dec 2023 16:44:46 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Brandon Cheo Fusi <fusibrandon13@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Yangtao Li <tiny.windzz@gmail.com>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 1/5] riscv: dts: allwinner: Update opp table to allow CPU
 frequency scaling
Message-ID: <20231214111446.camz2krqanaieybh@vireshk-i7>
References: <20231214103342.30775-1-fusibrandon13@gmail.com>
 <20231214103342.30775-2-fusibrandon13@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231214103342.30775-2-fusibrandon13@gmail.com>

On 14-12-23, 11:33, Brandon Cheo Fusi wrote:
> Two OPPs are currently defined for the D1/D1s; one at 408MHz and
> another at 1.08GHz. Switching between these can be done with the
> "sun50i-cpufreq-nvmem" driver. This patch populates the opp table
> appropriately, with inspiration from
> https://github.com/Tina-Linux/linux-5.4/blob/master/arch/riscv/boot/dts/sunxi/sun20iw1p1.dtsi
> 
> The supply voltages are PWM-controlled, but support for that IP
> is still in the works. So stick to a fixed 0.9V vdd-cpu supply,
> which seems to be the default on most D1 boards.
> 
> Signed-off-by: Brandon Cheo Fusi <fusibrandon13@gmail.com>
> ---
>  arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> index 64c3c2e6c..e211fe4c7 100644
> --- a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> +++ b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> @@ -39,16 +39,22 @@ cpu0_intc: interrupt-controller {
>  	};
>  
>  	opp_table_cpu: opp-table-cpu {
> -		compatible = "operating-points-v2";
> +		compatible = "allwinner,sun20i-d1-operating-points",

I don't think you should add a new compatible for every SoC that needs
to be supported by a DT bindings and cpufreq driver. Maybe you should
just reuse "allwinner,sun50i-h6-operating-points" and it will work
fine for you ?

Rob ?

> +				 "allwinner,sun50i-h6-operating-points";
> +		nvmem-cells = <&cpu_speed_grade>;
> +		nvmem-cell-names = "speed";
> +		opp-shared;
>  
>  		opp-408000000 {
> +			clock-latency-ns = <244144>; /* 8 32k periods */
>  			opp-hz = /bits/ 64 <408000000>;
> -			opp-microvolt = <900000 900000 1100000>;
> +			opp-microvolt-speed0 = <900000>;

The separate property name thing was required when you could have
different values for different SoC instances, which can be read from
efuses, like in your case.

But all I see is speed0 here, why don't you always set opp-microvolt
then ?

Also why degrade from min/max/target type to just target ?

>  		};
>  
>  		opp-1080000000 {
> +			clock-latency-ns = <244144>; /* 8 32k periods */
>  			opp-hz = /bits/ 64 <1008000000>;
> -			opp-microvolt = <900000 900000 1100000>;
> +			opp-microvolt-speed0 = <900000>;
>  		};
>  	};
>  
> @@ -115,3 +121,8 @@ pmu {
>  			<0x00000000 0x0000000f 0xffffffff 0xffffffff 0x00020000>;
>  	};
>  };
> +
> +&sid {
> +	cpu_speed_grade: cpu-speed-grade@0 {
> +		reg = <0x00 0x2>;
> +	};
> +};
> -- 
> 2.30.2

-- 
viresh

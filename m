Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D31B1F945
	for <linux-sunxi@lists.linux.dev>; Wed, 23 Aug 2023 19:46:14 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-525bd0b2b48so7728096a12.0
        for <linux-sunxi@lists.linux.dev>; Wed, 23 Aug 2023 12:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692819972; x=1693424772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jD19Ogt/378xzKnnKi8H8LKoWiQ2oQFwsnEJWVrMQT4=;
        b=dxeLTk2ARZSXdeYEhXELdB44i6PDv2vX2GhArJkVAL3LGAiH+qEpmj6XN2vHZ1NiLF
         ZGV7pCrHPqFO695ivFzOYu53/J+K5eDgc79a57+MHBO67Wu8flbFDf+6TXtloK9c6mzR
         1DApHMhP28GpZogE1a4LQy4vIn0RY8q6Q4nKrND/yvpUvJTGuRTI0fWRJWm88fRhg1qW
         ctza45Kch6HvJ9azauTyAgwBfVUOgEr6u38j7H/HspIkwZyjhjGBfXAeKLFmK0znzU9a
         1Nkql3koCTbWelEW7TpIj9Mw+SuDm3ReFIRdN14AUoq0jDK+lGynHFktzlzlxAZ+gU54
         gRGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692819972; x=1693424772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jD19Ogt/378xzKnnKi8H8LKoWiQ2oQFwsnEJWVrMQT4=;
        b=hUbGnSQlK66F19XItXNff5mtyCvuCTJz+d7fk855DGuTcycBLghRRpIowPPtKJueRi
         jVnAbNE1KsVBatTM60BaNFbPDIfcZu0iw9Ggm7wyUtdUmDgpW30oN8LXq0KVTETLb0MM
         Uc4IYHR6CD3+S5PKetOmqiZfmzw4pBvcloaxs315j+6FSVhkcNiRO9j8rycDuhYCL9qq
         bWF7buyVfISSzbdNU20YddnzZgpMykEN6c77ubDbmDGLfkFzS4uRw0hSFTfdpJ79YdJu
         aDDnzxhJz3LL5rUIUwlkoZBvu4havxL2yNs2QHbCsi1M0VZUHHxNGjcXimHWeeWqySM0
         ONDA==
X-Gm-Message-State: AOJu0YxOnmml+VZVuV8CHtqoB0fwr7IF3cMOMWq2d1yjm8inAXTPD3kC
	GoGK9/KYtXiH/okGgTcYhAE=
X-Google-Smtp-Source: AGHT+IHtlZ2xQ51Ya04k4xszCEQvbd9z325dchvkcHgj0VjX26Sv5ima9GKPoE5IuL0rsAdsTlUCXw==
X-Received: by 2002:a17:906:25d:b0:9a1:bcf9:4f99 with SMTP id 29-20020a170906025d00b009a1bcf94f99mr3891626ejl.36.1692819972018;
        Wed, 23 Aug 2023 12:46:12 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id p23-20020a170906141700b009931a3adf64sm10216051ejc.17.2023.08.23.12.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 12:46:11 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH] arm64: dts: allwinner: h5/h6: Drop spurious 'clock-latency-ns'
 properties
Date: Wed, 23 Aug 2023 21:46:10 +0200
Message-ID: <3755420.kQq0lBPeGt@jernej-laptop>
In-Reply-To: <20230823193239.2758505-1-robh@kernel.org>
References: <20230823193239.2758505-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sreda, 23. avgust 2023 ob 21:32:27 CEST je Rob Herring napisal(a):
> 'clock-latency-ns' is not a valid property for CPU nodes. It belongs in
> OPP table (which has it). Drop them from the CPU nodes.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi | 4 ----
>  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 4 ----
>  2 files changed, 8 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi
> b/arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi index
> a56fae761a1f..939f1c0a5eaa 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi
> @@ -16,7 +16,6 @@ cpu0: cpu@0 {
>  			reg = <0>;
>  			enable-method = "psci";
>  			clocks = <&ccu CLK_CPUX>;
> -			clock-latency-ns = <244144>; /* 8 32k 
periods */
>  			#cooling-cells = <2>;
>  		};
> 
> @@ -26,7 +25,6 @@ cpu1: cpu@1 {
>  			reg = <1>;
>  			enable-method = "psci";
>  			clocks = <&ccu CLK_CPUX>;
> -			clock-latency-ns = <244144>; /* 8 32k 
periods */
>  			#cooling-cells = <2>;
>  		};
> 
> @@ -36,7 +34,6 @@ cpu2: cpu@2 {
>  			reg = <2>;
>  			enable-method = "psci";
>  			clocks = <&ccu CLK_CPUX>;
> -			clock-latency-ns = <244144>; /* 8 32k 
periods */
>  			#cooling-cells = <2>;
>  		};
> 
> @@ -46,7 +43,6 @@ cpu3: cpu@3 {
>  			reg = <3>;
>  			enable-method = "psci";
>  			clocks = <&ccu CLK_CPUX>;
> -			clock-latency-ns = <244144>; /* 8 32k 
periods */
>  			#cooling-cells = <2>;
>  		};
>  	};
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi index
> ca1d287a0a01..3b56beed6fee 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> @@ -27,7 +27,6 @@ cpu0: cpu@0 {
>  			reg = <0>;
>  			enable-method = "psci";
>  			clocks = <&ccu CLK_CPUX>;
> -			clock-latency-ns = <244144>; /* 8 32k 
periods */
>  			#cooling-cells = <2>;
>  		};
> 
> @@ -37,7 +36,6 @@ cpu1: cpu@1 {
>  			reg = <1>;
>  			enable-method = "psci";
>  			clocks = <&ccu CLK_CPUX>;
> -			clock-latency-ns = <244144>; /* 8 32k 
periods */
>  			#cooling-cells = <2>;
>  		};
> 
> @@ -47,7 +45,6 @@ cpu2: cpu@2 {
>  			reg = <2>;
>  			enable-method = "psci";
>  			clocks = <&ccu CLK_CPUX>;
> -			clock-latency-ns = <244144>; /* 8 32k 
periods */
>  			#cooling-cells = <2>;
>  		};
> 
> @@ -57,7 +54,6 @@ cpu3: cpu@3 {
>  			reg = <3>;
>  			enable-method = "psci";
>  			clocks = <&ccu CLK_CPUX>;
> -			clock-latency-ns = <244144>; /* 8 32k 
periods */
>  			#cooling-cells = <2>;
>  		};
>  	};





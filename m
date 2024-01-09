Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51083D577
	for <linux-sunxi@lists.linux.dev>; Tue,  9 Jan 2024 20:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W+jcoQoe"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-40e4d778e5eso13810795e9.1
        for <linux-sunxi@lists.linux.dev>; Tue, 09 Jan 2024 12:13:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704831213; x=1705436013; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ri1A4PylPs61GP02N60LyoFg+L+Yu7M2YLplX+7G6Qk=;
        b=W+jcoQoeIlZI1M9LqNDFRmDCD/wrSvp4kf2+0YE8owY7kiwkYPVWt7EybuPJMGoxde
         yS8JrvtG3sBYnhRPDL1M4YHKZTC7vUAJ3fdA7cS16lrM7ejQbT5yBCnGZ51tNMf3oCdz
         +Gw2l2WNknnSGC3fkO6RtF8f7gkk0zd2dHxl2j8QNrkeZtP3OHWzeSu9MhcPXxuQNlHs
         D2lIYfzS9SwcMtGoMkrBc1apBQ8RSFNdWRh+BNiEVuT6K8iZT8QyC1UOM9ut5h/K0iBH
         TsOB9lgeaAwVhSorIQTanTONAHzzwtHxTb/QdDHqR11/doDvzkoDtE+Vu7I6EB9MWhZ5
         Nz7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704831213; x=1705436013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ri1A4PylPs61GP02N60LyoFg+L+Yu7M2YLplX+7G6Qk=;
        b=WpAyFDW/fL+oAnAp2nqBFernvHg5f0oTyX29s2FHsh89HgqZcaFr7zyDq/MVGUjAlG
         BZJXjXjnQRvStH3Y5qHEhsNEGhsNDHFirjPCCWtXo3kxLNCW0GDrEOqbH9+lv9jKmu6I
         EFZyS4Dy5EGp8o/7lOekFzXz0pBakTx2ppabR6bC5mH+zAmZPOMzbLVlQ2HLc/GklPLQ
         n29dIYdNw+1BGqxO59zQnhwg2l/ckWoP8XBX/mEecDUT9qpPffFWFYKUqmaTGaatdbAO
         RuMVUBC6yiEL/0Vq/0wwULjU76AKxjgEz/w/zw7Q1ZEYWsiKEDuSIEdgbNfPIlKUB0FR
         edTA==
X-Gm-Message-State: AOJu0YxWHL68YI45v9HO2zJPgt8uDIu92o+6PjggJD8Fk1rNsNGY3rBp
	2I8nRunmBH/Pf/JUjRJKXOI=
X-Google-Smtp-Source: AGHT+IFWeqJH8v4d6+tnLLqV4BNVKn2y5I5WhwFYoAeVK8N9t53Q9defYknIcJu4v4RiYmRY0DHgYA==
X-Received: by 2002:a05:600c:34cd:b0:40e:44eb:c3a with SMTP id d13-20020a05600c34cd00b0040e44eb0c3amr2112091wmq.31.1704831212907;
        Tue, 09 Jan 2024 12:13:32 -0800 (PST)
Received: from jernej-laptop.localnet (213-161-3-116.dynamic.telemach.net. [213.161.3.116])
        by smtp.gmail.com with ESMTPSA id s11-20020a05600c45cb00b0040e395cd20bsm15857094wmo.7.2024.01.09.12.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 12:13:32 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: anarsoul@gmail.com, tiny.windzz@gmail.com, linux-sunxi@lists.linux.dev,
 Alexey Klimov <alexey.klimov@linaro.org>
Cc: rafael@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 wens@csie.org, samuel@sholland.org, daniel.lezcano@linaro.org,
 peter.griffin@linaro.org, klimov.linux@gmail.com
Subject:
 Re: [PATCH RESEND] arm64: dts: allwinner: a64: Add thermal trip points for
 GPU
Date: Tue, 09 Jan 2024 21:13:02 +0100
Message-ID: <2252115.iZASKD2KPV@jernej-laptop>
In-Reply-To: <20240101000008.65747-1-alexey.klimov@linaro.org>
References: <20240101000008.65747-1-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Alexey!

Dne ponedeljek, 01. januar 2024 ob 01:00:08 CET je Alexey Klimov napisal(a):
> Without trip points for GPU, the following errors are printed in the
> dmesg log and the sun8i-thermal driver fails to load:
> 
> thermal_sys: Failed to find 'trips' node
> thermal_sys: Failed to find trip points for thermal-sensor id=1
> sun8i-thermal: probe of 1c25000.thermal-sensor failed with error -22

Please no Linux specific talk. Since DT is OS neutral let just talk about HW.

> 
> When thermal zones are defined, trip points definitions are mandatory.
> Trip values for the GPU are assumed to be the same values as the CPU
> ones. The available specs do not provide any hints about thermal regimes
> for the GPU and it seems GPU is implemented on the same die as the CPU.
> 
> Tested on Pine a64+.
> 
> Cc: Samuel Holland <samuel@sholland.org>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> index 62f45f71ec65..07963eea1bf0 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> @@ -243,6 +243,29 @@ gpu0_thermal: gpu0-thermal {
>  			polling-delay-passive = <0>;
>  			polling-delay = <0>;
>  			thermal-sensors = <&ths 1>;
> +
> +			trips {
> +				gpu0_alert0: gpu0_alert0 {
> +					/* milliCelsius */
> +					temperature = <75000>;
> +					hysteresis = <2000>;
> +					type = "passive";
> +				};

Since GPU has OPP, can you add cooling maps with at least first trip point?

Best regards,
Jernej

> +
> +				gpu0_alert1: gpu0_alert1 {
> +					/* milliCelsius */
> +					temperature = <90000>;
> +					hysteresis = <2000>;
> +					type = "hot";
> +				};
> +
> +				gpu0_crit: gpu0_crit {
> +					/* milliCelsius */
> +					temperature = <110000>;
> +					hysteresis = <2000>;
> +					type = "critical";
> +				};
> +			};
>  		};
>  
>  		gpu1_thermal: gpu1-thermal {
> @@ -250,6 +273,29 @@ gpu1_thermal: gpu1-thermal {
>  			polling-delay-passive = <0>;
>  			polling-delay = <0>;
>  			thermal-sensors = <&ths 2>;
> +
> +			trips {
> +				gpu1_alert0: gpu1_alert0 {
> +					/* milliCelsius */
> +					temperature = <75000>;
> +					hysteresis = <2000>;
> +					type = "passive";
> +				};
> +
> +				gpu1_alert1: gpu1_alert1 {
> +					/* milliCelsius */
> +					temperature = <90000>;
> +					hysteresis = <2000>;
> +					type = "hot";
> +				};
> +
> +				gpu1_crit: gpu1_crit {
> +					/* milliCelsius */
> +					temperature = <110000>;
> +					hysteresis = <2000>;
> +					type = "critical";
> +				};
> +			};
>  		};
>  	};
>  
> 





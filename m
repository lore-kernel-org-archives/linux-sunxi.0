Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6479924509
	for <linux-sunxi@lists.linux.dev>; Wed,  9 Aug 2023 22:34:31 +0000 (UTC)
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-3498795048aso1295845ab.0
        for <linux-sunxi@lists.linux.dev>; Wed, 09 Aug 2023 15:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691620470; x=1692225270;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pLzyYcq9iF6HJheiLOndlSozTXyWHSqLtHUKzJeKXiI=;
        b=HIK6/cpy3PuusUQFScOuaNEuP5SFwkjQlJ5g2lvNRgLpLyihlYFL3xVwsrvaPj8DSp
         DdY2HPB3AtIKm/3p918bvILYD1jQpKr2ETbnDDV101NVKa531oTc6UgXQCW3xxz0e3kH
         EQ1QpckF7GyM5gyYWEa3DErkkQIspfjqC5AcJBU9+isyAO7bpwbDRMdU2VuifACBCurk
         J8/dIzYQO3E+PGAMLsT6BLYUQJ9sSFoV5tVTWgLEr4CM/21lJwF/3Ssx1MGoMYENSuxF
         WsvnGNaJif2HKHmci2zhzalo3ocdypwYjr/0i8bPcInp+KxPPvIa7rSZi60wOnQcQu4z
         nf4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691620470; x=1692225270;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pLzyYcq9iF6HJheiLOndlSozTXyWHSqLtHUKzJeKXiI=;
        b=YFdaCfMLmx4DLasHwQ5DrdOzoU8tCwQkhqV5UT7f3XgI/v0b2dLKmp1XA/mdnyxCzI
         3iJaaTdKF1bmIn04DTt2qJl/qZ4AbXd8el4fycIKsYWR1DhnZbIUbp6qNeSCVpBeD/Kp
         unfPZPqdIwIKMJmUknW/sOQNZO0qt5325lf/dHWBk97eh+WSwfuH3khOD8hlVLmisJ4K
         6qeS94NWIqiHGixED5e5cde3E/Zi/vzZRpGFDmgtdD00YajIF5DoSgk+qMQuPFDDvr4r
         PG6L/ISCf3ddU7EITyXRX9Dsa0Dp/GVJSRVxKsnKk9p+WMU9FCmOU2VmEFc0MvDfPUE/
         sBmQ==
X-Gm-Message-State: AOJu0YwoLJG8hjVYMmTG3El86K2ifCVt8SMygAHrbbS2/4YUSkcyn8rD
	plt+U4oIkdKx0zOai91gVno=
X-Google-Smtp-Source: AGHT+IHTWMDb324F5P8/eT3kLbsgHOwrl0Jrp2JhoqfINPUqeVvMuQcyXcUFqvpB4kxivkCmnHIOsA==
X-Received: by 2002:a05:6e02:1d81:b0:349:862e:a863 with SMTP id h1-20020a056e021d8100b00349862ea863mr697581ila.15.1691620470216;
        Wed, 09 Aug 2023 15:34:30 -0700 (PDT)
Received: from ?IPV6:2001:470:42c4:101:6e71:1f10:2120:d11d? ([2001:470:42c4:101:6e71:1f10:2120:d11d])
        by smtp.gmail.com with ESMTPSA id u21-20020a02aa95000000b0042b28813816sm8412jai.14.2023.08.09.15.34.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Aug 2023 15:34:29 -0700 (PDT)
Message-ID: <21596546-48a8-36bf-8324-a5e07bf6d0a9@gmail.com>
Date: Wed, 9 Aug 2023 16:34:28 -0600
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 19/20] ARM: dts: sunxi: add Allwinner T113-s SoC .dtsi
Content-Language: en-US
To: Andre Przywara <andre.przywara@arm.com>,
 Jagan Teki <jagan@amarulasolutions.com>, u-boot@lists.denx.de
Cc: Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Icenowy Zheng <uwu@icenowy.me>,
 Maxim Kiselev <bigunclemax@gmail.com>, linux-sunxi@lists.linux.dev
References: <20230721134606.4505-1-andre.przywara@arm.com>
 <20230721134606.4505-20-andre.przywara@arm.com>
From: Sam Edwards <cfsworks@gmail.com>
In-Reply-To: <20230721134606.4505-20-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/21/23 07:46, Andre Przywara wrote:
> The Allwinner T113-s SoC is apparently using the same (or at least a very
> similar) die as the D1/D1s, but replaces the single RISC-V core with
> two Arm Cortex-A7 cores.
> Since the D1 core .dtsi already describes all common peripherals, we
> just need a DT describing the ARM specific peripherals: the CPU cores,
> the Generic Timer, the GIC and the PMU.
> We include the core .dtsi directly from the riscv DT directory.
> 
> The ARM core version of the DT specifies the CPUX watchdog as
> "reserved", which means it won't be recognised by U-Boot. Override this
> in our generic sunxi-u-boot.dtsi, to let U-Boot pick up this watchdog,
> so that the generic reset driver will work.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: Sam Edwards <CFSworks@gmail.com>
Tested-by: Sam Edwards <CFSworks@gmail.com>

> diff --git a/arch/arm/dts/sunxi-u-boot.dtsi b/arch/arm/dts/sunxi-u-boot.dtsi
> index af419c7e590..a0c8abb7033 100644
> --- a/arch/arm/dts/sunxi-u-boot.dtsi
> +++ b/arch/arm/dts/sunxi-u-boot.dtsi
> @@ -23,6 +23,13 @@
>   	};
>   };
>   
> +/* Let U-Boot be the firmware layer that controls the watchdog. */
> +#ifdef CONFIG_MACH_SUN8I_R528
> +&wdt {
> +	status = "okay";
> +};
> +#endif
> +
>   &binman {
>   	u-boot-sunxi-with-spl {
>   		filename = "u-boot-sunxi-with-spl.bin";

Nice!!

Thanks,
Sam

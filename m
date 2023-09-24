Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCCB2DDD2
	for <linux-sunxi@lists.linux.dev>; Sun, 24 Sep 2023 20:09:52 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-9ad8bba8125so674258566b.3
        for <linux-sunxi@lists.linux.dev>; Sun, 24 Sep 2023 13:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695586191; x=1696190991; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DxREjewkNFrWDAgPsnTZpMxgPvvi0KDP02tpQh/XKD0=;
        b=Jo9JuASvEUjnm7JkhLTBh82g7nbQNY00cURTyDCVYlPAzrs7fSs1+HSYH+RMJAJB+i
         +8S2N4qGslboTvH5munAboQD59xhN0zMxc7AWvPN6EZAut+N/rLt2oON+VaTGiwmDKB4
         WcMQBsXIFDIpUwMbFkKi5VH5USMMp84HvSeLFkQAfO17JnAnTSNYdLi8z0nD/vWuHhIg
         ZXkeEewA26ZQcEs9BcSROUmsYB1K5E+1Zk8fvww8osckENjsv74AFZ4mHZ0XAPmfMv36
         RnpMukNjEr2Ou+4JJF2EuhCNg1KpEuBxON+r91aMLpIuky9KWW+yNRcP1PC3zV4u/8VI
         H8Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695586191; x=1696190991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DxREjewkNFrWDAgPsnTZpMxgPvvi0KDP02tpQh/XKD0=;
        b=vnc5aTsoTDhTZPSiwVF+fQ22LMpKhriHEF9vCw0Igw9Xvk7+uIskj7sk+wlPDOPs2v
         qP2schBCJfoPPCwU+o9cUHMY9apn82FnTNlMWzzNMEp59JesdJJKtDfneMZZXn2ETRvk
         nPytMsPyQ9Wb2iOC4bo92mHAlClvnEAGxHY2+MfCe1Ya9ER9c25/Mlrqlm5V0KVx/wnx
         6bdXG31dac5CPhsHkIKh4/irELbv4uiMvoyTjxZvi76UV6ZRbKVH52T1nkQDku7vH3Tx
         qi/IZ3MJ0ENXcOUWsm2vq3TW06S5HRfdv2t099yd67BLCwsgUDjAggdTzA0Ftq4GZk/r
         ViZw==
X-Gm-Message-State: AOJu0Yy3LfSdjf4trfqL3DkNSwrdl2duMi4fCLpXG6akTO31N7DUvXwk
	pev5uo1OvP/YWy+wPJ6q/Cs=
X-Google-Smtp-Source: AGHT+IFacAw8IlUF7W7gT0BHUL/iwLFqkcmREgIzUohJpb5r19xZXpCugD8qQ2/zyVfpFPTyuLkyFg==
X-Received: by 2002:a17:907:7818:b0:9ae:654d:5105 with SMTP id la24-20020a170907781800b009ae654d5105mr4480937ejc.47.1695586190881;
        Sun, 24 Sep 2023 13:09:50 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id la9-20020a170906ad8900b0098f33157e7dsm5342713ejb.82.2023.09.24.13.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Sep 2023 13:09:50 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Inochi Amaoto <inochiama@outlook.com>, Heiko Stuebner <heiko@sntech.de>,
 Wei Fu <wefu@redhat.com>, Pei Chen <cp0613@linux.alibaba.com>,
 Wenhan Chen <chenwenhan.cwh@alibaba-inc.com>, Guo Ren <guoren@kernel.org>,
 Inochi Amaoto <inochiama@outlook.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] riscv: dts: allwinner: d1: Add PMU event node
Date: Sun, 24 Sep 2023 22:09:49 +0200
Message-ID: <1770354.VLH7GnMWUR@jernej-laptop>
In-Reply-To:
 <IA1PR20MB49534918FCA69399CE2E0C53BBE0A@IA1PR20MB4953.namprd20.prod.outlook.com>
References:
 <IA1PR20MB49534918FCA69399CE2E0C53BBE0A@IA1PR20MB4953.namprd20.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne ponedeljek, 28. avgust 2023 ob 06:30:22 CEST je Inochi Amaoto napisal(a):
> D1 has several pmu events supported by opensbi.
> These events can be used by perf for profiling.
> 
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> Link: https://dl.linux-sunxi.org/D1/Xuantie_C906_R1S0_User_Manual.pdf
> Link: https://github.com/T-head-Semi/openc906/blob/main/C906_RTL_FACTORY/gen_rtl/pmu/rtl/aq_hpcp_top.v#L657

Applied, thanks!

Best regards,
Jernej

> ---
> changed from v3:
> 1. remove wrong event mapping of 0x0000a
> 2. add reference url of c906 events implementation (D1 only support events
> described in R1S0 user manual, but event mapping is the same)
> 
> changed from v2:
> 1. move pmu node from /soc to / to avoid warnings when checking.
> 
> The meaning of T-HEAD events can be found in this pending patch:
> https://lore.kernel.org/linux-perf-users/IA1PR20MB4953DD82D0116EC291C21777BBE2A@IA1PR20MB4953.namprd20.prod.outlook.com
> 
> The patch above also provides a example that shows how to setup
> environment and use perf with T-HEAD events.
> ---
>  arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> index 8275630af977..53a984d78e3f 100644
> --- a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> +++ b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> @@ -73,4 +73,43 @@ plic: interrupt-controller@10000000 {
>  			#interrupt-cells = <2>;
>  		};
>  	};
> +
> +	pmu {
> +		compatible = "riscv,pmu";
> +		riscv,event-to-mhpmcounters =
> +			<0x00003 0x00003 0x00000008>,
> +			<0x00004 0x00004 0x00000010>,
> +			<0x00005 0x00005 0x00000200>,
> +			<0x00006 0x00006 0x00000100>,
> +			<0x10000 0x10000 0x00004000>,
> +			<0x10001 0x10001 0x00008000>,
> +			<0x10002 0x10002 0x00010000>,
> +			<0x10003 0x10003 0x00020000>,
> +			<0x10019 0x10019 0x00000040>,
> +			<0x10021 0x10021 0x00000020>;
> +		riscv,event-to-mhpmevent =
> +			<0x00003 0x00000000 0x00000001>,
> +			<0x00004 0x00000000 0x00000002>,
> +			<0x00005 0x00000000 0x00000007>,
> +			<0x00006 0x00000000 0x00000006>,
> +			<0x10000 0x00000000 0x0000000c>,
> +			<0x10001 0x00000000 0x0000000d>,
> +			<0x10002 0x00000000 0x0000000e>,
> +			<0x10003 0x00000000 0x0000000f>,
> +			<0x10019 0x00000000 0x00000004>,
> +			<0x10021 0x00000000 0x00000003>;
> +		riscv,raw-event-to-mhpmcounters =
> +			<0x00000000 0x00000001 0xffffffff 0xffffffff 0x00000008>,
> +			<0x00000000 0x00000002 0xffffffff 0xffffffff 0x00000010>,
> +			<0x00000000 0x00000003 0xffffffff 0xffffffff 0x00000020>,
> +			<0x00000000 0x00000004 0xffffffff 0xffffffff 0x00000040>,
> +			<0x00000000 0x00000005 0xffffffff 0xffffffff 0x00000080>,
> +			<0x00000000 0x00000006 0xffffffff 0xffffffff 0x00000100>,
> +			<0x00000000 0x00000007 0xffffffff 0xffffffff 0x00000200>,
> +			<0x00000000 0x0000000b 0xffffffff 0xffffffff 0x00002000>,
> +			<0x00000000 0x0000000c 0xffffffff 0xffffffff 0x00004000>,
> +			<0x00000000 0x0000000d 0xffffffff 0xffffffff 0x00008000>,
> +			<0x00000000 0x0000000e 0xffffffff 0xffffffff 0x00010000>,
> +			<0x00000000 0x0000000f 0xffffffff 0xffffffff 0x00020000>;
> +	};
>  };
> --
> 2.42.0
> 
> 





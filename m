Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92102C14B
	for <linux-sunxi@lists.linux.dev>; Mon,  4 Sep 2023 19:33:37 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-529fb04a234so2325032a12.3
        for <linux-sunxi@lists.linux.dev>; Mon, 04 Sep 2023 12:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693856015; x=1694460815; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fyqh9KieADPlDrhoiQmtiolrcxF+wgTTmnR9hQetGoE=;
        b=OcN4viHJwxRM6G6cSVov5VwIxOpOXtMBpl4hMtm3mZLi+4BgcpQKqU3EQpDMFxzNmO
         8WRppC8SiPq4QGW6h0gK3fKRJYC3HeUQYd5vc8eno5XPTKZcRkBZiTQFDsCamQoe5MBo
         /DRDR3+hXvSCSPQmzEX0FgUt153BoinhnUMMeblffyHkg6sc/hFosXvI3Q6kyfdEf/dZ
         GImKmnWfcANnDCkoLHz0P7b3NTPfL7kfcigG01FomBRo4BSXjLYkkHJ8RKofukmdGwCv
         K9+zythrjHEiBlf8JiI3NbErvZsWNJ28O3ECptQUU6fi+jc6+B3qXMn3Z6vGlLOpcxno
         AABg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693856015; x=1694460815;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fyqh9KieADPlDrhoiQmtiolrcxF+wgTTmnR9hQetGoE=;
        b=gMobJFmZUNWRkl1GScemcu3hrx4jr3gfMWUKMWu8e5F/xojhEBApcblb5oX70BchEe
         72M4ARbefRBwyuHoZty3c8JHQ5JFDZlqZxCvbdqbojk0XloDnnlWO+nFqlL2mPnEC9G2
         M6h7FipzRxonBBOvQD+qR+NUuV7I8xOUwJdHuuSf50jQTtnaumECPLmkCyEOZsrP7yDR
         WL1d6hY/5Fc8JP1zO7EtgCsRDAm6Kl7qL5L2ag48Cc01YCDH4vNi7bmkZh9gaswBsUgL
         Cpdasf0u4GHTXh7KVa2MzBm9Ijpf8YllKPhQqiAW4zzWHwfsTYAZxUXiA/cXmbmsxxcO
         1xeQ==
X-Gm-Message-State: AOJu0YwT1wqVJm8c3k+HHFQY+RwuYHRdhegaeNvU3mMlP36y6yEps5Ds
	z2Zle+8baO84XsMTv9uPeEsi6A==
X-Google-Smtp-Source: AGHT+IECh66OM0WQyvbaTq/MMccQJZK12gMVL5VRUK8NzO3Lt69so2ApRkT7/AI/iWf/W3rRE0Je4Q==
X-Received: by 2002:aa7:c391:0:b0:524:9564:4fee with SMTP id k17-20020aa7c391000000b0052495644feemr7852456edq.10.1693856015578;
        Mon, 04 Sep 2023 12:33:35 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id w4-20020aa7da44000000b0052241b8fd0bsm6183170eds.29.2023.09.04.12.33.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Sep 2023 12:33:35 -0700 (PDT)
Message-ID: <a6c074ec-81d6-4fde-98c7-fc2750483514@linaro.org>
Date: Mon, 4 Sep 2023 21:33:33 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 5/6] arm64: dts: allwinner: h616: Add CPU Operating
 Performance Points table
Content-Language: en-US
To: Martin Botka <martin.botka@somainline.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Sudeep Holla <sudeep.holla@arm.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Yangtao Li <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>,
 Alan Ma <tech@biqu3d.com>, Luke Harrison <bttuniversity@biqu3d.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rogerio Goncalves <rogerlz@gmail.com>, Martin Botka <martin@biqu3d.com>
References: <20230904-cpufreq-h616-v1-0-b8842e525c43@somainline.org>
 <20230904-cpufreq-h616-v1-5-b8842e525c43@somainline.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230904-cpufreq-h616-v1-5-b8842e525c43@somainline.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/09/2023 17:57, Martin Botka wrote:
> Add an Operating Performance Points table for the CPU cores to
> enable Dynamic Voltage & Frequency Scaling on the H616.
> 

...

> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> index 063db9634e5f..78e79c591dba 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> @@ -143,6 +143,10 @@ sid: efuse@3006000 {
>  			ths_calibration: thermal-sensor-calibration@14 {
>  				reg = <0x14 0x8>;
>  			};
> +
> +			cpu_speed_grade: cpu_speed_grade@0 {

Underscores are no allowed in node names.

It does not look like you tested the DTS against bindings. Please run
`make dtbs_check W=1` (see
Documentation/devicetree/bindings/writing-schema.rst or
https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sources-with-the-devicetree-schema/
for instructions).

Best regards,
Krzysztof


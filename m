Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D749DC14B
	for <linux-sunxi@lists.linux.dev>; Mon,  4 Sep 2023 19:32:48 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-9a648f9d8e3so213857966b.1
        for <linux-sunxi@lists.linux.dev>; Mon, 04 Sep 2023 12:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693855967; x=1694460767; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JZ6H5M4q548gV0CNQehrzM4g+Qp6ZkTiIwLgzPLmdrE=;
        b=wjcz8S7DuF9ADn8AhAlqoEcMxXj1GZRXF+6b8kqy73htPjoIkGpn1ut05BAH+M88NG
         q3S2t9gq2AdmGYKqFKkP/FMDn5dRd0stkpjdpopDf0CDVvw1JHKmQJ8K7WkA4AdEcoFw
         YsXFJJrJU8XcI44W+sC/euCQ2FlkxWR1yytxVr941CUatnXP7P5MgWmTJ5c8SAo1PTWD
         Sbcqf6MyP0fbjO8lWn66JPORW8opzAO/FKh9Xy9g3jj/DhdS4i7u5OMZddp+e1IVH5Ye
         BYkHCEJhuiwfBN+Dl3u61E+O/EocrsE0o3RX0Ynlrcr6Um3TrJPtvZNSGdClAKLCcldp
         xQ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693855967; x=1694460767;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JZ6H5M4q548gV0CNQehrzM4g+Qp6ZkTiIwLgzPLmdrE=;
        b=hxqx40LTXB4SdAObv6ESoVaHswved7zJSYjDKrGJXFhBL0HCHXJKZ7+YFcNXyALZ5g
         WTxD2N/B1GTGXdFL4PcZOGUOYOmULOuHipQcomuPhBpXfKnxyOcAKwIcqCs80KOJKmPX
         GWLAOlfSubV4Sxs1A5MQGii22a7s8kTFLjuvUIw5TaraoWtRro1QCquGvwXkCJRRwM7Q
         p5wxyFk+gA87ofvoJowMkQwDsmhX/aXk3LnNyPXpn4R9Ld0RJLHwc1z4zey8922eP1vU
         ibfYDaiBwEMT+MRoURKW3yQHKlgTbSVwdmuODG6tK6mQjsNkrAtfDR8dR7bR6/+c5xwb
         nWgA==
X-Gm-Message-State: AOJu0YwLKR6decoyZ3HngP9r399Ch7ETLCCosrrhFBmxHriDzpOIpFmw
	LyYwPAQpTGdiv8ERu5EBHBCw2A==
X-Google-Smtp-Source: AGHT+IH0xh+QO8RhaNAVW0WGOeQOxfC0ae3lGMMNGhE9JO1OTC8YPy5jmTHCLOWkkmmbswgc2wghsw==
X-Received: by 2002:a17:907:b12:b0:9a1:aea2:d18d with SMTP id h18-20020a1709070b1200b009a1aea2d18dmr7710392ejl.48.1693855966844;
        Mon, 04 Sep 2023 12:32:46 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id qc8-20020a170906d8a800b009a5f7fb51dcsm6480287ejb.42.2023.09.04.12.32.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Sep 2023 12:32:46 -0700 (PDT)
Message-ID: <bda77747-aa97-0da9-fa73-cbb2dca48aeb@linaro.org>
Date: Mon, 4 Sep 2023 21:32:44 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 3/6] dt-bindings: opp: Add compatible for H616
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
 <20230904-cpufreq-h616-v1-3-b8842e525c43@somainline.org>
 <f512f11a-6b66-5892-ad9e-cc45d4abc508@linaro.org>
In-Reply-To: <f512f11a-6b66-5892-ad9e-cc45d4abc508@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/09/2023 21:31, Krzysztof Kozlowski wrote:
> On 04/09/2023 17:57, Martin Botka wrote:
>> We need to add compatible for H616 to H6 cpufreq driver bindings.
> 
> Please describe the hardware, not what is needed for drivers.
> 
>>
>> Also enable opp_supported_hw property that will be needed for H616.
>>
>> Signed-off-by: Martin Botka <martin.botka@somainline.org>
>> ---
>>  .../bindings/opp/allwinner,sun50i-h6-operating-points.yaml          | 6 +++++-
>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/opp/allwinner,sun50i-h6-operating-points.yaml b/Documentation/devicetree/bindings/opp/allwinner,sun50i-h6-operating-points.yaml
>> index 51f62c3ae194..2fa1199f2d23 100644
>> --- a/Documentation/devicetree/bindings/opp/allwinner,sun50i-h6-operating-points.yaml
>> +++ b/Documentation/devicetree/bindings/opp/allwinner,sun50i-h6-operating-points.yaml
>> @@ -23,7 +23,10 @@ allOf:
>>  
>>  properties:
>>    compatible:
>> -    const: allwinner,sun50i-h6-operating-points
>> +    contains:
> 
> This does not look like part of allOf, so contains is no correct here.
> This must be specific, so drop contains.

BTW, I also do no see it used by the driver at all.

Best regards,
Krzysztof


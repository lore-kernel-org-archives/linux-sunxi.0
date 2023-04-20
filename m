Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F065688
	for <linux-sunxi@lists.linux.dev>; Thu, 20 Apr 2023 12:53:31 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id b16so6203050ejz.3
        for <linux-sunxi@lists.linux.dev>; Thu, 20 Apr 2023 05:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681995209; x=1684587209;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yt/93M/ZglXCV5CdFMYaJPyFKnZmjhNWMeYNcvDG6Tw=;
        b=XhOmjAMRB2e+Qpr3a2unzCwIqWMnXTkLGkgmKSw0hT4kQEfDAet5siIZR0pugqzn9Y
         p1zlW4+hyVgl63cWo2i5zfeDSm4OyqyDZI8+8nvNTH4ki+i1v7Hit3PwFF68gMQ/Bp6Q
         W6M8y8rHBoJ1zuHn6DGIvus71YqoGkZjQKlBGpJiIuAmZuvTRoPiGn/yUlCJ+N4S7Ym7
         0X9qIfP7+lDXnOsN1GIPkoSK1Yu916xun5VnAStqybqXSrULVUNHAWnmlw7shqbwYdR3
         gc8ErvbBsLRStDmaBQ2jWcKKKUWqR/PHTybAZv9X8KgDfPMB5h7rKDt5V6+dCE4vefHJ
         qmpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681995209; x=1684587209;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yt/93M/ZglXCV5CdFMYaJPyFKnZmjhNWMeYNcvDG6Tw=;
        b=l9XZqCjVkkCwOGp58SpMr6oEVp2nuuAhwk8xseqHiagPfRuDayFyVjnPIoB9NH+s/K
         QHsClexc34O+1oJ+qZ5jMAs0x8dttqdSqdNPrLb6nVIdAWvFuU/P9/VH/QnFkmpeZaFw
         4nReHqsiqZKBwhyzchwNmGykGF5K7Pl7lFxQNjM1wtZ4I6ln60XuIuDbwVy1vpRgeBhY
         3cZxHkToFgmQRn+L6bOrtx0+fAoNL+LM136d9A1uvRQ3jhRMmsYKTR5Ix1vBRYCO+UMh
         Mjw7lOVK7iIYAdT7Tu2ODb44XTut9KwC1enGsqpQfh22yM9bNn2xQ7J9ETxeuLWvBhIC
         K2Dg==
X-Gm-Message-State: AAQBX9dcCJZdmR+7LEZIfSBq41zWRYAJJhH6A6xchSTnn+VwGmjlNjKI
	0xdr3WBigcF8BIq3fzLfHFZE9Q==
X-Google-Smtp-Source: AKy350baSjVgWRqOUGHMeVmFH80WRC9SRLw80YwzKRtI2kUKPfO5wRzIp1r9y3oLBMp/xs3FAmWLIQ==
X-Received: by 2002:a17:906:7308:b0:932:7f5c:4bb2 with SMTP id di8-20020a170906730800b009327f5c4bb2mr1613373ejc.75.1681995209486;
        Thu, 20 Apr 2023 05:53:29 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:bcb8:77e6:8f45:4771? ([2a02:810d:15c0:828:bcb8:77e6:8f45:4771])
        by smtp.gmail.com with ESMTPSA id d16-20020a1709063ed000b0094f499257f7sm695940ejj.151.2023.04.20.05.53.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Apr 2023 05:53:29 -0700 (PDT)
Message-ID: <fab4f22e-cb22-6ad4-6e14-19c1e80c11be@linaro.org>
Date: Thu, 20 Apr 2023 14:53:28 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 1/1] arm: dts: sunxi: Add ICnova A20 ADB4006 board
 support
Content-Language: en-US
To: Andre Przywara <andre.przywara@arm.com>
Cc: Ludwig Kormann <ludwig.kormann@in-circuit.de>, samuel@sholland.org,
 jernej.skrabec@gmail.com, wens@csie.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20230419121229.1384024-1-ludwig.kormann@in-circuit.de>
 <b84537c0-cb58-621a-2b6d-3bbaac5091de@linaro.org>
 <20230420095315.5aaab9eb@donnerap.cambridge.arm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230420095315.5aaab9eb@donnerap.cambridge.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/04/2023 10:53, Andre Przywara wrote:
>> Bindings are always separate patches. checkpatch did not complain?
>>
>>>  arch/arm/boot/dts/Makefile                    |   1 +
>>>  .../boot/dts/sun7i-a20-icnova-a20-adb4006.dts | 137 ++++++++++++++++++
>>>  arch/arm/boot/dts/sun7i-a20-icnova-a20.dtsi   |  63 ++++++++
>>>  4 files changed, 207 insertions(+)
>>>  create mode 100644 arch/arm/boot/dts/sun7i-a20-icnova-a20-adb4006.dts
>>>  create mode 100644 arch/arm/boot/dts/sun7i-a20-icnova-a20.dtsi
>>>
>>> diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
>>> index 013821f4a7b8..12f0c236f17b 100644
>>> --- a/Documentation/devicetree/bindings/arm/sunxi.yaml
>>> +++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
>>> @@ -305,6 +305,12 @@ properties:
>>>            - const: allwinner,i12-tvbox
>>>            - const: allwinner,sun7i-a20
>>>  
>>> +      - description: ICNova A20 ADB4006
>>> +        items:
>>> +          - const: incircuit,icnova-a20-adb4006
>>> +          - const: incircuit,icnova-a20
>>> +          - const: allwinner,sun7i-a20
>>> +
>>>        - description: ICNova A20 SWAC
>>>          items:
>>>            - const: incircuit,icnova-a20-swac
>>> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
>>> index 3cc32722c394..b6b408417261 100644
>>> --- a/arch/arm/boot/dts/Makefile
>>> +++ b/arch/arm/boot/dts/Makefile
>>> @@ -1321,6 +1321,7 @@ dtb-$(CONFIG_MACH_SUN7I) += \
>>>  	sun7i-a20-hummingbird.dtb \
>>>  	sun7i-a20-itead-ibox.dtb \
>>>  	sun7i-a20-i12-tvbox.dtb \
>>> +	sun7i-a20-icnova-a20-adb4006.dtb \
>>>  	sun7i-a20-icnova-swac.dtb \
>>>  	sun7i-a20-lamobo-r1.dtb \
>>>  	sun7i-a20-linutronix-testbox-v2.dtb \
>>> diff --git a/arch/arm/boot/dts/sun7i-a20-icnova-a20-adb4006.dts b/arch/arm/boot/dts/sun7i-a20-icnova-a20-adb4006.dts
>>> new file mode 100644
>>> index 000000000000..c1606c085e4e
>>> --- /dev/null
>>> +++ b/arch/arm/boot/dts/sun7i-a20-icnova-a20-adb4006.dts
>>> @@ -0,0 +1,137 @@
>>> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)  
>>
>> Unusual license. Are you sure you are ok with GPLv5.0?
> 
> Is it really unusual? This is literally the most commonly used dual license
> for DTs, grep counts 252 users in arm and 573 users in arm64.
> 

No, the most commonly used is GPL-2.0 (optionally OR MIT/BSD). GPLv3 and
later appear, but it is actually weird to use it for kernel DTS where in
general we said no to GPLv3.

And my question is not the only one... just grep from responses from
other maintainers.

Best regards,
Krzysztof


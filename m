Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0494404
	for <linux-sunxi@lists.linux.dev>; Wed, 17 Aug 2022 13:46:15 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id v2so19065897lfi.6
        for <linux-sunxi@lists.linux.dev>; Wed, 17 Aug 2022 06:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=gQ9ZdHAonv1+cNCneY42f+VkcN8uTabWejW5IY05OD4=;
        b=KTjTHibusJ3Q5B6hEEPhteJ85Ffv8KvOEn3uUw/xQVRdL6Zo1CkYrEOL7ZAC1Tw1Ou
         uU5RufF2Tdvu2+nmf2C0KTfR7A2Igxvxw8T/eUeKx52INZGiEKRka7WEIwxCR2CZ+ZSJ
         e/vQmpHliCd7Cqy1Zy50sfUCIIZLixaPjkqOK/7InUSjMIC23bUaIt6Mck1XWtEetmMJ
         xqdxUZuSJKJ3/glf0Mj/ekPD8QxDCZ/UHom2kzqDSWgHHwSlRbzFsqaKV29BqFV401mW
         L7PQ51pKmSprJ5+3vGlxrNT1VYAzmVYMxSR7p0A1IxGR+jY3AsB4EmseuYJKfMqe6EzN
         W1KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=gQ9ZdHAonv1+cNCneY42f+VkcN8uTabWejW5IY05OD4=;
        b=ex5ftPsf/1kFDBBFPX7shuFdQfsC5XtvmgdnZVnDcnoMnmPZolQWx+dGbQc2H/cW5i
         9seEYskK4laPspQ0RRx9Y87d6aBb1R57eNCoXRM/79ZrYfcekpA5jHHjeqb0v3aAW26+
         13WRdDtQsckT70s2Pkiau1Kiq8jl2uc75zIFF6N2OOpFZKtCC8jv1GYjDePxqktOmyw2
         uYO9UVrB4TgSu68tT7jQk+PFvcZO2L4TZ6D8QS1nZeBwYe9alo+LF4TT3ilPP0Sp3u7o
         jOezfUJZJHysmhmrujpLwzEM44rhKpWdSnh8//TnD0nDioSkiCX4GWkcvCRCSkzN4dpe
         AF8Q==
X-Gm-Message-State: ACgBeo3mp+jRfy1+dgmwle4/Gi2Mruo0XQJQ8g29jSZHlegTlLvyr+sM
	qohx+q8onJzSpkrppMC+xELqCg==
X-Google-Smtp-Source: AA6agR4vOLQVaDpNaTlrgQpr6MQJs6T1zj+svIXXP/Rtynk4ey8sYo2c1ptChOUd++TTtrnFyrV1cw==
X-Received: by 2002:a19:6b0b:0:b0:48a:e7de:d34c with SMTP id d11-20020a196b0b000000b0048ae7ded34cmr8780224lfa.454.1660743973563;
        Wed, 17 Aug 2022 06:46:13 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ae:539c:1b1c:14b7:109b:ed76? (d15l54h48cw7vbh-qr4-4.rev.dnainternet.fi. [2001:14bb:ae:539c:1b1c:14b7:109b:ed76])
        by smtp.gmail.com with ESMTPSA id b10-20020a05651c032a00b0025d5eb5dde7sm2151655ljp.104.2022.08.17.06.46.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Aug 2022 06:46:13 -0700 (PDT)
Message-ID: <64913eef-8b4f-7617-578b-53ddc22bd06e@linaro.org>
Date: Wed, 17 Aug 2022 16:46:11 +0300
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v3 1/4] regulator: dt-bindings: Add Allwinner D1 LDOs
Content-Language: en-US
To: Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev
References: <20220815043436.20170-1-samuel@sholland.org>
 <20220815043436.20170-2-samuel@sholland.org>
 <c4ec080a-b8b1-e3a9-c9d7-063e138c9bb8@linaro.org>
 <03de0f7b-9251-a5c0-91a1-5f2b5d41d8a0@sholland.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <03de0f7b-9251-a5c0-91a1-5f2b5d41d8a0@sholland.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/08/2022 11:15, Samuel Holland wrote:
>>> +    audio-codec@2030000 {
>>> +        compatible = "simple-mfd", "syscon";
>>
>> This cannot be on its own. Both require device specific compatible.
> 
> Again, the device-specific compatible does not exist, because the binding for
> the audio codec has not been written (and it will be quite nontrivial).
> 
> So I can:
>   1) Leave the example as-is until the audio codec binding gets written,
>      and fill in the specific compatible at that time.
>   2) Remove the example, with the reasoning that the example really
>      belongs with the MFD parent (like for the other regulator). Then
>      there will be no example until the audio codec binding is written.
>   3) Drop the analog LDOs from this series entirely, and some parts
>      of the SoC (like thermal monitoring) cannot be added to the DTSI
>      until the audio codec binding is written.
> 
> What do you think?
> 
> The same question applies for the D1 SoC DTSI, where I use this same construct.
> 
> (And technically this does validate with the current schema.)

BTW, it validates only because of limitation in DT schema. Such
combination is not allowed and I wonder if we can make the schema
stricter...

Best regards,
Krzysztof

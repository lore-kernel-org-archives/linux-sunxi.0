Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373A4881E
	for <linux-sunxi@lists.linux.dev>; Tue, 16 May 2023 16:35:16 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-51090206721so985029a12.0
        for <linux-sunxi@lists.linux.dev>; Tue, 16 May 2023 09:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684254914; x=1686846914;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GsGWeD4bI6dpV1BC9oCizIGh+Gcd6Inx+UCID/pRmsk=;
        b=dfiVEmtSSIKaB7rJeBv884PukYvSUTfyMMwWoIIKdMOM0iAPfLRtOtJa/4kQ5+YFFA
         6YPkUed/OWY60aJ0TG6pd4aRB9FInSovR0caYysrSi5Q1vo6CIExqKgRsIe1fVMbXY2r
         baUi/6pWfmh4tkNtaUHdOiuGf8FQcATt+o94oQASoE2UWCTEbw8ieIKs0HrmoqqVK3bc
         rkckI0YgAh0euncxLqxucB8nyrb1AiyxCRJXSRA/C3R5z4Nu+zl23NUFbBm4jp7dhw5R
         h1ZHbtFJWV7Z/YBhTzla4bsuuQzko4ww4rUzsjxZsL1J1gg8SvJ6RhHKYp+9LF8tbzKA
         dp+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684254914; x=1686846914;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GsGWeD4bI6dpV1BC9oCizIGh+Gcd6Inx+UCID/pRmsk=;
        b=Dhq5gZfH+njaTemnDwwja2aQIx/RKGsfSkAyxaM6FK4vddv936lRL4MBh32J0uTXgi
         CnytLuyeF1TJ/x9SRaqI64H0ro7Lg2nyoNpHyB2vBc0mZnEqGRhVlQI/PG9VPlP244NT
         /gqpjFMe2WSiwzsRvhkFYonxkmKP+shVxux7sjhn9p8ach6Ju1hyHNqQso6tpHIsDrt8
         J4sQJALBvyKXTB5zdghkB+alEA0aU/X9I3a3F0O/ogzhUN8QdLVNH6PnonefmIfQFt8g
         9yZKR1ppIjJ7+JQ9Yqrkjq00/jqFSgMLFVutMtyBSgmJsWUqV1hSwx9i/X74bIJwtrCj
         ahkg==
X-Gm-Message-State: AC+VfDz09Z6SetcPFuRPh87yiiGbhkm6Ewl9oNNFWyXlpUdI5p0MLamL
	Hz5wwcuBTQN938Zjxkfukqm7sQ==
X-Google-Smtp-Source: ACHHUZ7Efc971yqkR23m0IOPewDkI6jDvdPI/r84BYakaawfR2EO4wENe/0gUyH8nOi54NY6Q63aog==
X-Received: by 2002:a50:eb03:0:b0:510:8f8d:967e with SMTP id y3-20020a50eb03000000b005108f8d967emr1241142edp.5.1684254914398;
        Tue, 16 May 2023 09:35:14 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:77d1:16a1:abe1:84fc? ([2a02:810d:15c0:828:77d1:16a1:abe1:84fc])
        by smtp.gmail.com with ESMTPSA id j10-20020aa7ca4a000000b005066cadcc54sm8203680edt.43.2023.05.16.09.35.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 May 2023 09:35:14 -0700 (PDT)
Message-ID: <d1cd8378-132a-189f-5654-efa4de56a576@linaro.org>
Date: Tue, 16 May 2023 18:35:12 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] arm64: dts: allwinner: a64: add missing cache properties
Content-Language: en-US
To: =?UTF-8?Q?Jernej_=c5=a0krabec?= <jernej.skrabec@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20230421223137.115015-1-krzysztof.kozlowski@linaro.org>
 <2676764.mvXUDI8C0e@jernej-laptop>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <2676764.mvXUDI8C0e@jernej-laptop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24/04/2023 21:59, Jernej Škrabec wrote:
> Dne sobota, 22. april 2023 ob 00:31:37 CEST je Krzysztof Kozlowski napisal(a):
>> As all level 2 and level 3 caches are unified, add required
>> cache-unified property to fix warnings like:
>>
>>   sun50i-a64-pine64-lts.dtb: l2-cache: 'cache-unified' is a required
>> property
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> ---
> 
> Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

So this ack means I should grab it? Ok

Best regards,
Krzysztof


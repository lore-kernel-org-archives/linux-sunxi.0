Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8C036F
	for <linux-sunxi@lists.linux.dev>; Fri, 13 Jan 2023 08:33:36 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id v6so7597042ejg.6
        for <linux-sunxi@lists.linux.dev>; Fri, 13 Jan 2023 00:33:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=69vPfjdndDvs8QEdWRfbzSSvuuOt62gz3qB9+kdUnVA=;
        b=G0yy8cPfoiavoMyPQc3/K7FUfmxncwLLWeYLWTYO7Eh5k23/uG7jZmmlXAU3i+2m5u
         T+4X9VzZxFiLZoEf0+m1uc3vT7FIYF3QS+8pUFkgqjMDrHwpuir72UVHlU7pmG+wzh3d
         qTTgJ2qHORnGEzxoCQtk/C/gVDmiDZF8yfSukEJPxDQs1+JJuKVHhrzuPsvYWvnOdLaa
         Tw84jFKE34wPD5VnjHCMf/2swGQlwXzn/k1FP6xV2KWTBcsxzHeV9O9lZV5dd+lOMXzH
         BEBSkqPa8beFeQwqw/NarHzFP/8Mq19qyWTFQZ2roV9WU5I7QDf82+VcOg+qvEg/jm3Z
         YhPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=69vPfjdndDvs8QEdWRfbzSSvuuOt62gz3qB9+kdUnVA=;
        b=XDzWaUBd3Hw/CNox1YSy7Q4HOCdZBgEjBv+5mZhwzsFUFYQtBPROZkHb+cLj5O7O+2
         rOLzIvXth0WkVdIHZmTtGzYLkjTHRTdiAZvpx/3sk/R001DSmcVla5rAEZqu3YL0EIAb
         SNrrDqSnEI/5NnufvQ9kZwQx6ORVXKNfdamNcgHd+4BIRizH084TtHSZ4mbL5x0W5BEj
         5nDOB3FUTR2Hl53vnmYrrsSrkvpsazaYQfHn2wadsX/buKVR8j0qT9w5bkR73kP0DKDr
         C6yeb8cOxTvJlHVhxSIufuo0a3zLYbPmxM/9q9RvRS+76MbsTVPmUh8gKy6cWXkHmphm
         NcMg==
X-Gm-Message-State: AFqh2kogurgE/EZw0f0saZZSD0YzBK09QlD30q+B8QWW8X2sP03g8q5k
	dtsAEKflofTQAoLOE00LisYKoA==
X-Google-Smtp-Source: AMrXdXs2ZJAqttVWYRXGxoX3QUG9Uarxkn9ckYoeRGcdElRtpW1qBalWUSAxDqAu65QxD49NUMt6mQ==
X-Received: by 2002:a17:907:cbc6:b0:7c0:8371:97aa with SMTP id vk6-20020a170907cbc600b007c0837197aamr71708773ejc.28.1673598814566;
        Fri, 13 Jan 2023 00:33:34 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id sb25-20020a1709076d9900b007b2a58e31dasm8336587ejc.145.2023.01.13.00.33.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jan 2023 00:33:34 -0800 (PST)
Message-ID: <20651db4-b0e8-ee3e-a752-c1d4ff14b53f@linaro.org>
Date: Fri, 13 Jan 2023 09:33:32 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 1/3] dt-bindings: crypto: sun8i-ce: Add compatible for
 D1
Content-Language: en-US
To: Herbert Xu <herbert@gondor.apana.org.au>,
 Samuel Holland <samuel@sholland.org>
Cc: Corentin Labbe <clabbe.montjoie@gmail.com>,
 "David S . Miller" <davem@davemloft.net>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-sunxi@lists.linux.dev
References: <20221231220146.646-1-samuel@sholland.org>
 <20221231220146.646-2-samuel@sholland.org>
 <Y8DVPvnfShdhlVHh@gondor.apana.org.au>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Y8DVPvnfShdhlVHh@gondor.apana.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/01/2023 04:51, Herbert Xu wrote:
> On Sat, Dec 31, 2022 at 04:01:43PM -0600, Samuel Holland wrote:
>> D1 has a crypto engine similar to the one in other Allwinner SoCs.
>> Like H6, it has a separate MBUS clock gate.
>>
>> It also requires the internal RC oscillator to be enabled for the TRNG
>> to return data, presumably because noise from the oscillator is used as
>> an entropy source. This is likely the case for earlier variants as well,
>> but it really only matters for H616 and newer SoCs, as H6 provides no
>> way to disable the internal oscillator.
>>
>> Signed-off-by: Samuel Holland <samuel@sholland.org>
>> ---
>> I noticed that the vendor driver has code to explicitly enable IOSC when
>> using the TRNG on A83T (search SS_TRNG_OSC_ADDR), but that is covered by
>> a different binding/driver in mainline.
>>
>> Changes in v2:
>>  - Add TRNG clock
>>
>>  .../bindings/crypto/allwinner,sun8i-ce.yaml   | 33 ++++++++++++++-----
>>  1 file changed, 25 insertions(+), 8 deletions(-)
> 
> This doesn't have an ack from Rob Herring.  Would you like me
> to apply just the crypto patch by itself?

But it has my Reviewed-by, which is equivalent. Please take it via
crypto with the driver change.

Best regards,
Krzysztof


Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691F84C89
	for <linux-sunxi@lists.linux.dev>; Fri,  2 Dec 2022 16:59:44 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id q7so6043767ljp.9
        for <linux-sunxi@lists.linux.dev>; Fri, 02 Dec 2022 08:59:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p5AjNgRxYvWSo311L8Fi4s9BaU+vEEAJHGgsgNjup4c=;
        b=LiuLpp6NWIYpx8WnrXcmJnrtRC6AZtTj+sx0kDPAakQeZGn7DrsuRuEWUYYBl5Oieg
         lf2c2JQctnaj6IVKiYAtNdlr14SHxlF1Yw2OTyY2+MHow3ElvvYcmMebVMc3zMmvF4GI
         F5WiumLtHBUB4RnnQL2kYgPKvweSzxn4dTCgPYWceNSjEEt/ntrMLxdoBB89JeXUp0e1
         l6TtZHeUlGWJV4JuJOww7x5/ueQOo1P+ccLhrVCZkeU9GaUFsyl/MF8V9+dm2k6dZ4Ma
         36lX4LNXI3GYqtpBkEDcAum37gHaLj71GU/iuf0EuuZrXYEK3nVRlIXhVxOqqIXakIAd
         vhiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p5AjNgRxYvWSo311L8Fi4s9BaU+vEEAJHGgsgNjup4c=;
        b=36qTUMtbUZBhfWY/+AewYCXsKWdQ08XxJL6JVh8U7FxEPU/HtQ5oYotBRcK1G/M/PI
         hbCJVyH9z4MEGP+j/u4wGigJXN9MEj1uGoob6jG1cRiSA0yqm8euCVK/lrqzxzP2KvY8
         O1Z6YFmQltXuY6xOR5B0itgR88oKFjK5o26dNMKy52hRgd9POXZcXBuO7mLhboWE12ic
         hl1SRf0aA1aXSH2wckPNavcvulAMwiQInLA6maw5uFR+6TbuaTPJSHau6DJgyqI/4Yuq
         erDAsiUDRuE2FreKuXnSP/pRhoVRbU7MgR1YFrBvyrLKXu0OwpCkJ5NYL80GoPpvkfD2
         HW2w==
X-Gm-Message-State: ANoB5pkn8hLeyEyNeW63RlOF8CVsWrCwBzGiBsWs6zipW81nRsK9sag5
	1IAYSeQMZbje4dyjHLn3ZtrP1Q==
X-Google-Smtp-Source: AA0mqf7tBivANnXLrt8YurPNNcPk/uUa+ztwsqUGeaOFl+uqqBuSjIc5H16gudiUuNxpcPgZ+0WWxw==
X-Received: by 2002:a2e:b90a:0:b0:278:ec8b:4783 with SMTP id b10-20020a2eb90a000000b00278ec8b4783mr18166032ljb.91.1670000382408;
        Fri, 02 Dec 2022 08:59:42 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id z22-20020a2e3516000000b00278a21bb7b9sm143991ljz.100.2022.12.02.08.59.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Dec 2022 08:59:41 -0800 (PST)
Message-ID: <feb6d0d3-706f-b726-dd13-9ed665a52f9d@linaro.org>
Date: Fri, 2 Dec 2022 17:59:38 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 2/6] dt-bindings: usb: Add binding for Genesys Logic
 GL850G hub controller
Content-Language: en-US
To: Icenowy Zheng <uwu@icenowy.me>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Kaehlcke <mka@chromium.org>, Andre Przywara <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20221202081647.3183870-1-uwu@icenowy.me>
 <20221202081647.3183870-3-uwu@icenowy.me>
 <b4ddf139-5604-bd04-e309-d7bc15e9d23b@linaro.org>
 <2f0f31551d361cf23abdd2c4117f2feb84e2b1a8.camel@icenowy.me>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <2f0f31551d361cf23abdd2c4117f2feb84e2b1a8.camel@icenowy.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02/12/2022 17:54, Icenowy Zheng wrote:
> 在 2022-12-02星期五的 10:02 +0100，Krzysztof Kozlowski写道：
>> On 02/12/2022 09:16, Icenowy Zheng wrote:
>>> The Genesys Logic GL850G is a USB 2.0 Single TT hub controller that
>>> features 4 downstream ports, an internal 5V-to-3.3V LDO regulator
>>> (can
>>> be bypassed) and an external reset pin.
>>>
>>> Add a device tree binding for its USB protocol part. The internal
>>> LDO is
>>> not covered by this and can just be modelled as a fixed regulator.
>>>
>>> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
>>> ---
>>> Changes in v2:
>>> - Misc fixes suggested by Krzysztof, including property
>>> descriptions,
>>>   single-item "items" and fixing the example's gpio property.
>>> - Fixed $id.
>>>
>> (...)
>>
>>> +
>>> +examples:
>>> +  - |
>>> +    usb {
>>> +        dr_mode = "host";
>>> +        #address-cells = <1>;
>>> +        #size-cells = <0>;
>>> +
>>> +        hub: hub@1 {
>>> +            compatible = "usb5e3,608";
>>> +            reg = <1>;
>>> +            reset-gpios = <&pio 7 2>;
>>
>> Use GPIO flags. What did you fix in the example?
> 
> It used to be here, but using it needs another include, which I don't
> think it necessary here.

The header is necessary for the flags...

> 
> Maybe I should just drop this line in the example?

It's useful. The example should be rather complete, not just compatible
and reg.

Different problem - you miss maxItems for the GPIOs.

Best regards,
Krzysztof


Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB8486AFA
	for <linux-sunxi@lists.linux.dev>; Mon, 19 Aug 2024 15:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724082181; cv=none; b=S5LayRwRvpWRIv3sd4c/uxMQr2nGxRhMDZQwMvdc9HcZzWlKnFHGbAb+YOTMnbBELdej9B8ibIdw8DiwdkP5IcHOFswpccXxQmJOoN4E/sHQbIPzJhHTbylKf7zE9/3PZsJVQMjnGcfJhw4UsoqgXbrshyJmC0Qx9aKhXytS8FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724082181; c=relaxed/simple;
	bh=zmzsNl1CKRvbAP7kq0XYWihvHYmcMTKkau+kfl0mG5g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sMZJCMfC6wEo3oB2xnO3tyDkBHthul82ygcWLD/+b+0O+9k9+CCfGqYvps8xZxHRULn1NP/aRico863iYpc04EILDyzW1R+jaY/FEl16xU5vsZo1acgL8+hWf8ORJ1JL8jFdlLywF1+87CITAFrydwujBKK1pCmdoAHpt3cEcNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n7+czhhl; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n7+czhhl"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-428243f928fso49470395e9.0
        for <linux-sunxi@lists.linux.dev>; Mon, 19 Aug 2024 08:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724082177; x=1724686977; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gO69uPrFX7SxSwhRAEbHMbAStn61hT4Mqe62DPelLVo=;
        b=n7+czhhl1jToO9PAkhrnlfBcO2yC+2ZYe97njs9dCFhyUutrqkhZfHK2jcexHvfaEP
         YWmF07zZBCjGxLwudmUGDqB2Ty8a8s8789LeijWchOrqmLGv2dInUd0nfIX32skD+QrB
         PMrRxZ/8RpVmDvZJ08kZaHlH+PHSc3aUNFunVgG6VRYqH5hgwaMhG+2PIuTQMGR9Uq30
         wogTolREpoRnB2VZcMK49QQGBRMFG7HTFRiwrS/MK99UusqrdvMhuAQQN0ZL6bJDprYf
         Be0G/Hu6odm/PVMh26S6p8TJ11nj2SwstCwPZJCamCQ1CqNyRAGR27EFnRdyPiiQD5vc
         sSIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724082177; x=1724686977;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gO69uPrFX7SxSwhRAEbHMbAStn61hT4Mqe62DPelLVo=;
        b=aLX4vDJF0IG0Kk7xdnxkIZBjNn/U4oh1pEQuyH9cddOU+0Pb4N0YMYhWgG2ZrW2EMW
         jMwAv3oC4qdWAIpuj5aUgErrHpIIfZdxBBP3FaE6Z8qFJAF5CQmfjMfQ+kiXkw00M80h
         PAt/uIYfBdyeaIEJmcnTPvEMr+CjVn8jxmOvpGjdDS5Ygih2ywmVZOF5P98ujOpss7AB
         sPXACBKMSQ9SVMzRDAO5whgJluPi5kdEmV1ww2jaPyS33VBmNw5OUoCGh9p4RUbROAd9
         /8eOnkw4gUzAZeVC8V8f1a1CDmwkYdquk4VQZkIh1QTErxVXEw9mhSHyl/nLk4hxsmEN
         +7QA==
X-Gm-Message-State: AOJu0YzczBuyMDGsWzodD/mPywbhFKusZn19QOqsrk8E7MSpzU9zZW3S
	FplMl+J2yI1hrk6g7qrLRGgcMjhSOLAmrPn2Hp6oUlFyJ6ZQmzdVGEYApEviqCg=
X-Google-Smtp-Source: AGHT+IEt5AicZKRyLAB3JYF/tkWJFFBfEZZOOF9ZnXbr92VtaB3C33L0aJ5vcoHGWMaodq2HvRfXVg==
X-Received: by 2002:a5d:44ce:0:b0:371:93d1:428b with SMTP id ffacd0b85a97d-371946af1famr7769524f8f.58.1724082176897;
        Mon, 19 Aug 2024 08:42:56 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-37189896c50sm10828491f8f.85.2024.08.19.08.42.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Aug 2024 08:42:56 -0700 (PDT)
Message-ID: <d8584ac7-5576-4f26-8bc8-1ecbb4bd4611@linaro.org>
Date: Mon, 19 Aug 2024 17:42:55 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: allwinner: Add GPU thermal trips to the SoC
 dtsi for A64
To: Dragan Simic <dsimic@manjaro.org>, Icenowy Zheng <uwu@icenowy.me>
Cc: linux-sunxi@lists.linux.dev, wens@csie.org, jernej.skrabec@gmail.com,
 samuel@sholland.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-kernel@vger.kernel.org, wenst@chromium.org,
 broonie@kernel.org
References: <a17e0df64c5b976b47f19c5a29c02759cd9e5b8c.1723427375.git.dsimic@manjaro.org>
 <24406e36f6facd93e798113303e22925b0a2dcc1.camel@icenowy.me>
 <25b65e9ef1cae59a8366532cc8db576b@manjaro.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <25b65e9ef1cae59a8366532cc8db576b@manjaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/08/2024 04:46, Dragan Simic wrote:
> Hello Icenowy,
> 
> On 2024-08-12 04:40, Icenowy Zheng wrote:
>> 在 2024-08-12星期一的 04:00 +0200，Dragan Simic写道：
>>> Add thermal trips for the two GPU thermal sensors found in the
>>> Allwinner A64.
>>> There's only one GPU OPP defined since the commit 1428f0c19f9c
>>> ("arm64: dts:
>>> allwinner: a64: Run GPU at 432 MHz"), so defining only the critical
>>> thermal
>>> trips makes sense for the A64's two GPU thermal zones.
>>>
>>> Having these critical thermal trips defined ensures that no hot spots
>>> develop
>>> inside the SoC die that exceed the maximum junction temperature.
>>> That might
>>> have been possible before, although quite unlikely, because the CPU
>>> and GPU
>>> portions of the SoC are packed closely inside the SoC, so the
>>> overheating GPU
>>> would inevitably result in the heat soaking into the CPU portion of
>>> the SoC,
>>> causing the CPU thermal sensor to return high readings and trigger
>>> the CPU
>>> critical thermal trips.  However, it's better not to rely on the heat
>>> soak
>>> and have the critical GPU thermal trips properly defined instead.
>>>
>>> While there, remove a few spotted comments that are rather redundant,
>>> because
>>> it's pretty much obvious what units are used in those places.
>>
>> This should be another individual patch, I think.
> 
> Perhaps, which I already thought about, but it might also be best
> to simply drop the removal of those redundant comments entirely.
> Let's also see what will other people say.
> 
>>> Signed-off-by: Dragan Simic <dsimic@manjaro.org>
>>> ---
>>>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 22 ++++++++++++++---
>>> -- 
>>>  1 file changed, 16 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
>>> b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
>>> index e868ca5ae753..bc5d3a2e6c98 100644
>>> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
>>> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
>>> @@ -212,7 +212,6 @@ timer {
>>>
>>>         thermal-zones {
>>>                 cpu_thermal: cpu0-thermal {
>>> -                       /* milliseconds */
>>
>> The unit of a 0 isn't not so obvious I think, so I suggest to keep
>> this.
> 
> Quite frankly, I think it should be obvious to anyone tackling
> the thermal zones and trips.

You can remove also polling-delay-passive and  polling-passive when they 
are equal to zero. If they are absent they will be set to zero by default.

That said, I take the opportunity to spot some inconsistency in this DT 
not related to this change.

1. There is a passive trip point and one cooling device mapped to it. 
With a polling-delay-passive=0, the mitigation will fail

2. There is a second mapping for the hot trip point. That does not make 
sense, it is not possible because there is no mitigation for 'hot' and 
'critical' trip points.


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A064A54903
	for <linux-sunxi@lists.linux.dev>; Thu, 22 Feb 2024 18:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708627457; cv=none; b=QPuM2BA+RQzj14SJESUPX7rNAceqoZXienVAhHEa/owSg3I7S8RltNmQfaKjFOc3n+GW/MndVeGe8lybJOEBZamLmVxYuBjOJH4ETHd2ghfeG2B7VrDsensAo2hxg43kgsbDv0MfNH7bDo2GtR0r3W3bZHhIi7I7BAu4PrFpnuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708627457; c=relaxed/simple;
	bh=1Tw8s+DClYHUogHJhbrGvBp/2kXGIQUYNPE/2LdOkdE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mUwohnEx/aS1OyOigk/oLPP5ZuuStf4GGzLcjYBi523AzoAIUY3cpCf5UqQVWmHSSL89I14roDtl1KAV0IePX1IUuZbnGWZfugpDv2vORSwd6IfqDHbLPxrfHRnl5oeTuCcvOs7dhVS5WBh8NxP5vAOWUUe41JznOI8TDoqPoKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eU/NV5s7; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eU/NV5s7"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-33d6fe64a9bso40271f8f.0
        for <linux-sunxi@lists.linux.dev>; Thu, 22 Feb 2024 10:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708627454; x=1709232254; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pBKdIE0MqGxWNqgnCMzfW9UY12c2Cp9wReUt3CTynV8=;
        b=eU/NV5s7d91WlVjU8NbMhY0sjLgGcvWhHwV203xDlU9VRrIMhL3hyqeLkpmhzpyC8S
         SAwmaExDRT7vZ9OyZa2198y7qXcTswKVEMgEoTzL7feyLLYKti9zJ0QHt7daFkLZIhnp
         IO6pqChNiJXeuaOakXRjnAcZQAG3c268gCG1Fp+0QywHyWsPlAS4wKMR/LlICkRRXfdj
         8cU/WsUP5aEeH6FHJ0+x+kV23PoEu+bA4bs8ZbNtNyERapTnDa0ZaEThYevXseZYwc1m
         LsEAe0IyuctIUuGs0OCz2oG9iIXruegqD7Qq9cSRV9MpnZJpvRLfWw1/dCPwQqdP5b3m
         OB4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708627454; x=1709232254;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pBKdIE0MqGxWNqgnCMzfW9UY12c2Cp9wReUt3CTynV8=;
        b=c7HQ0BGA9ehJ99XN5xbwCvYvKpkK5jBuC+81LZqTwmRsYnPoJhxHM3D92zWBHhyqrl
         V3/xyCWW831hGVSgkZ9lsknIiP1JNc80zE3lzTt1X0AqCijowPPcSWhIvVI+CGYGDJAS
         M7cr7Lw/lLQ7OKApdviiQ6IheFigu1qRuyRWeBu9pPm2qconlSvMxoNka9MRxx2wXUZ1
         diKTCNznM4IAz2POYVGZJQZhQw9ushKv/93hlw8sK0lXYTHrz2HdRCHJ9YWlCx4i9EY4
         LUAUUa4T6H0V0bFI/+yF2PhYCjmt8HaG7l5XYvnR7aLxmGfIyP675pOEB2mcFmUaQsaC
         Fc3A==
X-Forwarded-Encrypted: i=1; AJvYcCVvGq900ZWHUSyZdelkiETZuXM/vzuAj0RevlTk1RH7J+N83RuKRmfGJKswkXZB7Up8t/pBbPE+OLQgEd89OatXY/omFnIkinImNAk=
X-Gm-Message-State: AOJu0Yys+VyXaoLLINqOWvYUVKEKRpNakVEYqU9vs+vFlwsKeMb4xmXt
	hh0dliG9+71s9q/Sj7XcutGb9bY11vE0SsD1r/YAa3gWJ2ixsNNwh8hCnyM3EZw=
X-Google-Smtp-Source: AGHT+IGFxuTSliDPqku8YICfE8X0xSWjseqmFo4felniOL36LbKB9BcJX2RKD9QRRp8hCWOrEoiodQ==
X-Received: by 2002:a5d:448f:0:b0:33d:35ef:ac2e with SMTP id j15-20020a5d448f000000b0033d35efac2emr15938wrq.17.1708627454014;
        Thu, 22 Feb 2024 10:44:14 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id k3-20020a056000004300b0033b79d385f6sm21179398wrx.47.2024.02.22.10.44.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Feb 2024 10:44:13 -0800 (PST)
Message-ID: <dcd115fd-dc38-4f48-8485-9e4d64f53b4a@linaro.org>
Date: Thu, 22 Feb 2024 19:44:12 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/7] soc: sunxi: sram: export register 0 for THS on
 H616
Content-Language: en-US
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Andre Przywara <andre.przywara@arm.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Zhang Rui
 <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Martin Botka <martin.botka@somainline.org>,
 Maksim Kiselev <bigunclemax@gmail.com>, Bob McChesney
 <bob@electricworry.net>, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
References: <20240219153639.179814-1-andre.przywara@arm.com>
 <20240219153639.179814-2-andre.przywara@arm.com>
 <2717467.mvXUDI8C0e@jernej-laptop>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <2717467.mvXUDI8C0e@jernej-laptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 22/02/2024 19:26, Jernej Škrabec wrote:
> Dne ponedeljek, 19. februar 2024 ob 16:36:33 CET je Andre Przywara napisal(a):
>> The Allwinner H616 SoC contains a mysterious bit at register offset 0x0
>> in the SRAM control block. If bit 16 is set (the reset value), the
>> temperature readings of the THS are way off, leading to reports about
>> 200C, at normal ambient temperatures. Clearing this bits brings the
>> reported values down to the expected values.
>> The BSP code clears this bit in firmware (U-Boot), and has an explicit
>> comment about this, but offers no real explanation.
>>
>> Experiments in U-Boot show that register 0x0 has no effect on the SRAM C
>> visibility: all tested bit settings still allow full read and write
>> access by the CPU to the whole of SRAM C. Only bit 24 of the register at
>> offset 0x4 makes all of SRAM C inaccessible by the CPU. So modelling
>> the THS switch functionality as an SRAM region would not reflect reality.
>>
>> Since we should not rely on firmware settings, allow other code (the THS
>> driver) to access this register, by exporting it through the already
>> existing regmap. This mimics what we already do for the LDO control and
>> the EMAC register.
>>
>> To avoid concurrent accesses to the same register at the same time, by
>> the SRAM switch code and the regmap code, use the same lock to protect
>> the access. The regmap subsystem allows to use an existing lock, so we
>> just need to hook in there.
>>
>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> 
> Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> 
> I guess this one goes through sunxi tree, right?

I'll pick this patch along with the patch 2-6, so through the thermal 
tree. The patch 7/7 will go indeed via the sunxi tree


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


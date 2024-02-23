Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A7914B805
	for <linux-sunxi@lists.linux.dev>; Fri, 23 Feb 2024 17:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708707656; cv=none; b=Uj1H4iqaBzqGKW3nFmi/Mj5ggTugLwiWQ1stuR5FXc1Fy6RijQs6e2iXb7UcCgul2YmZ28qBqEvTLtaJrKG0OLk2O8v5Rw8pMR3lT/I+vyjpV/DQhxojXTkJ2pgS9t9renZpkZbRJG7E3PsiBgq/w8OnA9EKvcLPdDK1vhRBrNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708707656; c=relaxed/simple;
	bh=WN2bG3nCVqeM1eDrPKPQX194fXUESkJ6B0Mpu+5XvvY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rvww3407hDikizvYw9b4YXLZkfbYdIGhzfknlL0GrEpcNtMMz4+fuug0KKM2dSFI1fayqNKj03kn48UQdwU24AYudmmjWejXDJu2xrIGmgTuBG490vHFFg4P0gGmFItJCTNN2+DCd03tVRaPkAwYvt04t8HbfyvmxGwT0nbuCjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FuVKtv7p; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FuVKtv7p"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2d23d301452so13938831fa.1
        for <linux-sunxi@lists.linux.dev>; Fri, 23 Feb 2024 09:00:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708707653; x=1709312453; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DY7UmmEc7sXW1EbKMuMMWf03j2XNSqh0LujDND7ixMg=;
        b=FuVKtv7pYtxHzSu7ZbgVfx/evi9qOgRLoEt09bWk8QOPSvaZ6a9lWJLHfz0hiFLrnY
         CeAysPNH44NY7vfWvxZjHpT5nsVRFVKKiq9EZj0EEvNwFsCRZ46/f+qp94xTbA/pnbaW
         hmvipMJRfV37OuqWmiC7mxjdL7LbjqwEM9MMvZf5Ra/MzT94vJLK1w6rE97/xhu3z6n9
         oFY8EFQbugyV3cSDmMY5AWv1bmgcxX3k/Mqfvrus3TpUnJ+ymg0v4mEXuzyhyZVMFPsD
         HeX4UQi+SivjdPfHB9Fpduq7yXcUUn81HSru5eFB9CHfE0wGC9Bk74PzWtIhsgEq54vL
         3L+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708707653; x=1709312453;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DY7UmmEc7sXW1EbKMuMMWf03j2XNSqh0LujDND7ixMg=;
        b=Pb1oqtxbqkCxk3uYXS5gsdyRrFZ2BqrFDX1RnNbP1BxWM511PyLF/TvrAaoSiEderU
         LYkfWTkLzKGPw7+Td43EnVjq2V74pn8PP47G8ZIm2cbYnDtJ3iLOF/MCeJ/cxNTJ4JSq
         G4HvCb8LR+2okt7p9BTs/eVGSsOhb0Ttfdri2qrhRr3BM1oHo2sIkvBHpxAbH3CYtxFu
         7pYT6Qx/VihmdTHCgGTC+JP5ztt2QSITNPU+sZCGKZgACldPL7zy5ENYxMWfo5wReoJa
         S0/oc3nCAimi4l5vCu+Ry4ZBNSefWwr3nHNfkXG78NWeMlhNEkGeHjSRorjisGBvH6Ao
         OVBg==
X-Forwarded-Encrypted: i=1; AJvYcCUJDbyWeRocUdSwZHQ7H6ac64KdqwMGatS6E/nvyviwxqoKIn1TLJkiOM3Bcjyb+0m/mndQhpe7BQgeMJdcOsT2JmFKby72BFaaXCU=
X-Gm-Message-State: AOJu0YzdyG3B2kPC8n+hc7HqG3S/iDOwemkm1CmwfaQE+ubekVaDJ5Wx
	rWMC6vkmeHuQX6vc7zfI6+5WIj8ATVPOIP3ILO+Dzf5KFj3w7mTG5D5x0YrAKIk=
X-Google-Smtp-Source: AGHT+IG98CKY2od5QUSFteoFRsrEzwNRuiDKKRZ2JlQaoFHA61/03NUiaEBVjfZ0IGkZ8M2ZJlMkRQ==
X-Received: by 2002:a2e:9e05:0:b0:2d2:3a89:b97b with SMTP id e5-20020a2e9e05000000b002d23a89b97bmr254947ljk.24.1708707652635;
        Fri, 23 Feb 2024 09:00:52 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id bp4-20020a5d5a84000000b0033d47c6073esm4002922wrb.12.2024.02.23.09.00.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Feb 2024 09:00:51 -0800 (PST)
Message-ID: <469e83f3-57ef-492b-8f27-5a052b064106@linaro.org>
Date: Fri, 23 Feb 2024 18:00:51 +0100
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
To: Andre Przywara <andre.przywara@arm.com>
Cc: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh+dt@kernel.org>,
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
 <dcd115fd-dc38-4f48-8485-9e4d64f53b4a@linaro.org>
 <20240223160258.504a1577@donnerap.manchester.arm.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20240223160258.504a1577@donnerap.manchester.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 23/02/2024 17:02, Andre Przywara wrote:
> On Thu, 22 Feb 2024 19:44:12 +0100
> Daniel Lezcano <daniel.lezcano@linaro.org> wrote:
> 
> Hi Daniel,
> 
>> On 22/02/2024 19:26, Jernej Škrabec wrote:
>>> Dne ponedeljek, 19. februar 2024 ob 16:36:33 CET je Andre Przywara napisal(a):
>>>> The Allwinner H616 SoC contains a mysterious bit at register offset 0x0
>>>> in the SRAM control block. If bit 16 is set (the reset value), the
>>>> temperature readings of the THS are way off, leading to reports about
>>>> 200C, at normal ambient temperatures. Clearing this bits brings the
>>>> reported values down to the expected values.
>>>> The BSP code clears this bit in firmware (U-Boot), and has an explicit
>>>> comment about this, but offers no real explanation.
>>>>
>>>> Experiments in U-Boot show that register 0x0 has no effect on the SRAM C
>>>> visibility: all tested bit settings still allow full read and write
>>>> access by the CPU to the whole of SRAM C. Only bit 24 of the register at
>>>> offset 0x4 makes all of SRAM C inaccessible by the CPU. So modelling
>>>> the THS switch functionality as an SRAM region would not reflect reality.
>>>>
>>>> Since we should not rely on firmware settings, allow other code (the THS
>>>> driver) to access this register, by exporting it through the already
>>>> existing regmap. This mimics what we already do for the LDO control and
>>>> the EMAC register.
>>>>
>>>> To avoid concurrent accesses to the same register at the same time, by
>>>> the SRAM switch code and the regmap code, use the same lock to protect
>>>> the access. The regmap subsystem allows to use an existing lock, so we
>>>> just need to hook in there.
>>>>
>>>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>>>
>>> Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
>>>
>>> I guess this one goes through sunxi tree, right?
>>
>> I'll pick this patch along with the patch 2-6, so through the thermal
>> tree. The patch 7/7 will go indeed via the sunxi tree
> 
> many thanks for picking those up! I see them in your bleeding-edge branch,
> but are they on route for 6.9, so will you put them in -next soon? Or are
> you waiting for more ACKs?

I've enough ack. The bleeding-edge is merged with the linux-pm tree. If 
everything is going well, I will move it to the linux-next branch 
probably today or Monday



-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


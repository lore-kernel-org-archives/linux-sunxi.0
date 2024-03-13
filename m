Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3E240870
	for <linux-sunxi@lists.linux.dev>; Wed, 13 Mar 2024 11:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710328303; cv=none; b=N2J9mVVRUBomDDulbQFgno49qWHAcyYQw0DzrD8MMYEqaBsop1lVSej0W54SAhas/x+pvbJORKRlp6P781eBOKau4hdp8+QaEqE3YwpsSH4tXdfcrwNguc4ze1T2/st0Auuj/aIomrKHFbTPN3oCVV6A86GfgpJajTDLWTOW8xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710328303; c=relaxed/simple;
	bh=rtHbVnZI/W6fBvspmtIKRsDzeKbatS6a8EbiYUIrurM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=idsJ/qG03diUh0aJcqRX6bKDYJ4J/YRNFXDkQKiKVtedQoWqmlRl9Ec6HzJo4lXxtN5K0jgooMlJYQYEaZxFiLe2sZ4PeOIUj13h4vvXc4Wk65Y/auXckKLwGdsVLEctOkdwzk0TlghYaDi3wtObSK5LBv2qzXXa+FKOkIE6Qeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xhip0ebq; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xhip0ebq"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-33e17342ea7so3032950f8f.2
        for <linux-sunxi@lists.linux.dev>; Wed, 13 Mar 2024 04:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710328300; x=1710933100; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iGu108ok/BlzqaUsJF63tRhDYVja7ZGknjz9bScPQ20=;
        b=xhip0ebqo6zpcuANXJDlFq3/AtMNBRvXW5JLnOUui78kr+QQHcNDFIBUyWBscOh4m1
         FbjCVj2fVtlOSXQfxSbvkrW7vZVL9ZesLCxpvZAN+HCpYrFLV/UsCWJ+uOunz6cK1Dwp
         +zSFItqrwMz41MfXb0ex93sYZLDx/ez/6hp1T6GPJOhZrxirsgBMHVT2dXD6wvv/1esI
         +Y4Fntrt7s/JEEu8FsB16NuMkWDZxg68acjcJ1yqPk/hkLPgMa6PNpPfJtOx15Pk4+G3
         guLVr1i9Azg6Xvl/kiwRjS/79TuJcBwsx6Qj1a1s2UO61pxOjR0Ub3I63Sj0TqtoYZai
         fVWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710328300; x=1710933100;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iGu108ok/BlzqaUsJF63tRhDYVja7ZGknjz9bScPQ20=;
        b=GyJnntBxcW1PWh+eIx3UjeZy0aYyjoq0Xv42xEKI57rbGsxeCqRqmnv0VjIRiaQbcn
         EzvnHlN9bTvc3FWyxflMPI4qY6p7sfdskDWqekhYN/+aBd3kWiVwzBatTLW/VwRzRX8T
         mJRFG3jOAEWuxlCwPcHjqCIrbe/+UBB3T3/I9j2oKl/hGHZRBuTu6DisnQKjHoz8r6hA
         zBVf3SL44/x56dHnUN/YYpdRcjn27wSSUGKHq08kgR3ybCqAAdaLUn/yWPfcf6bc+has
         kg207OLwkSexBwrQUKNmWv25U/HVgPelc1AmfkcFd5PSpi7/joQKKinTACxMvRNlnaCh
         FBmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwd1QlCZLMGXEpKqKkT0iQkUXAOaORx6ImbN/R578xXEz8zBIeyuom/w/c9zLb08NRj59TpdSbXpbRZAid545MaNcZup0Qx9g0e34=
X-Gm-Message-State: AOJu0YwKsVy/GdSNf89/s7G4rn/vKnv8Yf19gR/rMvDNFex0xcSgyuwX
	DYWCTRZCVI5jDjmZFRfW7RTV8VDy97y8XtPFUanpedHaO+I3R27pIZnj4k25ZkA=
X-Google-Smtp-Source: AGHT+IF4G9WZUEvlQlxg4UeXBzioTEl5qAud9Gps6pFQCLKtagQAg4Fwxva6RxmsZhVomOPQZ0+pUg==
X-Received: by 2002:a5d:408a:0:b0:33e:9311:5fda with SMTP id o10-20020a5d408a000000b0033e93115fdamr1338958wrp.29.1710328300192;
        Wed, 13 Mar 2024 04:11:40 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id q11-20020adff94b000000b0033e95bf4796sm7905988wrr.27.2024.03.13.04.11.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Mar 2024 04:11:39 -0700 (PDT)
Message-ID: <932168cb-b1a5-43f7-a138-90ec8552c577@linaro.org>
Date: Wed, 13 Mar 2024 12:11:39 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clocksource/drivers/timer-sun4i: Partially convert to a
 platform driver
Content-Language: en-US
To: Samuel Holland <samuel.holland@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>
Cc: Anup Patel <apatel@ventanamicro.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Samuel Holland <samuel@sholland.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-sunxi@lists.linux.dev
References: <20240312192519.1602493-1-samuel.holland@sifive.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20240312192519.1602493-1-samuel.holland@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/03/2024 20:25, Samuel Holland wrote:
> Commit 8ec99b033147 ("irqchip/sifive-plic: Convert PLIC driver into a
> platform driver") broke the MMIO timer on the Allwinner D1 SoC because
> the IRQ domain is no longer available when timer_probe() is called:
> 
>    [    0.000000] irq: no irq domain found for interrupt-controller@10000000 !
>    [    0.000000] Failed to map interrupt for /soc/timer@2050000
>    [    0.000000] Failed to initialize '/soc/timer@2050000': -22
> 
> Fix this by wrapping the timer initialization in a platform driver.
> builtin_platform_driver_probe() must be used because the driver uses
> timer_of_init(), which is marked as __init. Only convert the sun8i
> variants of the hardware, because some older SoCs still need the timer
> probed early for sched_clock().
> 
> Fixes: 8ec99b033147 ("irqchip/sifive-plic: Convert PLIC driver into a platform driver")
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---

Applied, thanks

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


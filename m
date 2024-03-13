Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E31746447
	for <linux-sunxi@lists.linux.dev>; Wed, 13 Mar 2024 15:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710343780; cv=none; b=Lgfm7yfDs7oVUOoqN+tLI7RAs0DPiQt0Y6S1YIUYMg/1uxgczdCop5i9OGdeaxnESoAaC9SNw4pXxwPOTIysgQGrGHrqttwxqcu5o7xV+5HF6/Qsvy4B2/WJ+BUCyISl9R+riJQ14yKko6e2Gt4h/DrSA4jP9EYNIXUVZ17+OpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710343780; c=relaxed/simple;
	bh=xDnkHtgwr9H5DPFYdG9cIZiaD3ZNEtYgxwS8tw1QMLk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fkU1hG+6uAdZKJQ9Zih9mvcNY7kA52gXRgbFnf6795Alpdn4Sj/n2FH5TbyAGGAWZuyjDZm5I3ZO3KGf7QZ5RUTkDXJGv71Ny1URooe6wlhQ20izSoBNIZsEdkOHeqKvUSbe6NYyIc5h6wqjcL8ufvVYE6jcBqRsUpTZffTHC+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YiAe+m9G; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YiAe+m9G"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-33e99915809so2943286f8f.3
        for <linux-sunxi@lists.linux.dev>; Wed, 13 Mar 2024 08:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710343777; x=1710948577; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tvt8Qtm+W+Qck4IJaiB7iim8R4TtzqabulZr702KWPU=;
        b=YiAe+m9GHToaPasnWKdfkLyuKeAwImrqTjpZ4NhH95q/lwwIkSMlmH/58tarEIxde7
         pAZmtYKp0DMi8//ncYYKsoLdbw8s89+7SsmAvr8knftcJa1630ExLYqbh7mBjamz9QWF
         WeCEYXHbF8ESojInoZvIzJ7GceDt538ULOYH1P1hCpvHng69cmJGm3/21f+BIAUhK5QM
         78qLsBDu6ff/dUvRQUr/R8XUTvLtdbFKHNrXZuds2uiee7HdACxovf3WcEnTyl+6FG5T
         eX7zhZgf+W4KQeU57ILCFK/rmQlr/Ny5KuuW4tBKqvn7KXhbR5OqJ8gTah7anj8d74DA
         84Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710343777; x=1710948577;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tvt8Qtm+W+Qck4IJaiB7iim8R4TtzqabulZr702KWPU=;
        b=W+Ve6LpjvO/UmoRzqhOr2cLzeiJ/HYiL9OwR5PeEiuwNt8UIqWo8zH3sE5pxgRQXES
         tpVWVmb6rIG0l2+AuHdrMo3n6G9WYVbFwPzkBm9TltpSp9IxKmcgRuEurqXGGxZPAYoe
         EYTdBVDAtTQGKyUmqK47LjnYixCp09oypXt4QARUVeWa1gOxVI7YQxMqYR3T2RY8Fnhf
         ZDaxOb9L8APqwMarIGniyMTGfYbmXRJiKfh/VXcEoNglREeIrcTW/ZW94areNHcpXMBb
         2TiEHfOLUKhRhC2AYEKDsllvoaN4aUhOG199qC45UChcx8EbxFHbAYhQXY885PWDIGcP
         rJ/w==
X-Forwarded-Encrypted: i=1; AJvYcCVycKtBEmqWjFjdkaQR1+byved2Cy89N1IN//PPUbuAF5ExcxtnmTfi5umXGMuROWfuHYW/93B9bJk/ChN4Iw+BqC+XxfVGUG+1Ba4=
X-Gm-Message-State: AOJu0YwDD/iobFO2bZtYmAwG1BdADRXKfJjgfzo7Xh7RLhiIc6pyiP6Z
	VJvvH4rPbA+ocNA64uGKSo8ccK+Uh6g1VMfQPaCWjbSFs0dZMd38fPX8F1ycnng=
X-Google-Smtp-Source: AGHT+IEEiVfKvNxscpnVHMHh0ahECnASeCS3XrSK48Rwfx2u07RKlZ51HTb0HbzQXu+wFEvnKf6Q5Q==
X-Received: by 2002:adf:f242:0:b0:33e:7564:ceb with SMTP id b2-20020adff242000000b0033e75640cebmr2133308wrp.52.1710343777378;
        Wed, 13 Mar 2024 08:29:37 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id z2-20020a5d6402000000b0033dedd63382sm11866029wru.101.2024.03.13.08.29.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Mar 2024 08:29:37 -0700 (PDT)
Message-ID: <d68fd8a7-8889-472e-86db-b62855eebfba@linaro.org>
Date: Wed, 13 Mar 2024 16:29:36 +0100
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

Why EPROBE_DEFER in thermal-of can not fix the issue?

I mean can't we check if of_irq_get_byname() returns EPROBE_DEFER and 
then return this value?

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


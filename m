Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14FC514CAA1
	for <linux-sunxi@lists.linux.dev>; Fri, 23 Feb 2024 22:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708727265; cv=none; b=X4ml4p+a2spjlnWNt1I6dKtofGgYC5IDFlcW+CB7xOi/TLKystK3svwZB0A8SWB5xFXw7I/x+9yw4KQOaZ9Z4ulaogWgdC5IUKr+tACUl+G7aCrrSQm2ufzL09H6eopGvND04Cz931eIBPbLct5UQhNZL6ZHz/8/RCIHvCv+ZlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708727265; c=relaxed/simple;
	bh=C09P/fYLTlcYhPEKEzo0c+Q8OizrnciIo0/Ml29193w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IXtRHHBN3/PI60nKuj7CPbl9OiefVm1QqpYBCtqbE6w7PLG6oj7gbt80BH+5vOcx7oToj67efGPSwJTVlXsfIdM4IyezSGAfqohGH9kYeIxxDIO132w2kLPXXUoYe8JO4vg511H4pwepcvyQR3c5hGZZb2XxkRbgGgM1H2Gkg4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dwrjcsFA; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dwrjcsFA"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4127700a384so5969085e9.3
        for <linux-sunxi@lists.linux.dev>; Fri, 23 Feb 2024 14:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708727262; x=1709332062; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HppqBtas3L0GcMMoGYXdcb8iGGz9VbwRhKoehMa5r/A=;
        b=dwrjcsFA12KySrPs6Axh2gsvVISoZAz7F8CEqTwKl9QDYqTqQ73kLbPjtszACtRuXe
         m08uzf3of9ow2EmkZeJ9WEKhhdObyJ0wm6r9KUZVPXM+Y1xOTtCfK3XL28GG/0BAX3XL
         vAo5YZx8hzB8+Yk/EMoYbpo7Iy+M1Ntp2/Wr2GObUZMMZL7psLLn0Pc667lpfNFh5Fsz
         VksbedZDEi0Yud/4yYDgHKd8IIt4bOKsf9iPi8dAKE/7bge/LTxGwT08p/wPKELWj7h1
         XK25v3s+HQ29e9e2qQddZw2lJ+tQ3URqeo1mA3zprwGNa05v90MjVkp7Fm2mInC2+ktM
         sHLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708727262; x=1709332062;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HppqBtas3L0GcMMoGYXdcb8iGGz9VbwRhKoehMa5r/A=;
        b=ZE7a9r6nJsmjzbfKb/ab7jArbfj5xUCItNt4ZEtNb9NpoZMrDgmijtWtCFuuc3p95X
         7/14deftoRT9IbbeAstKmco9wZna5ZI/BpwfiUAoZzNhXNf8z1az7GFTrUgtrUn9hRsc
         sDKtHmqSOoI34vq4d9Lh2o4XLkj1CU38SYa9A1Ltu98CXGshe7Y48Nailc8OSFifmDAt
         P5S0VHrlSHumxPZzH6TflehE9mnOI31KV9Fm9lEL3gE7tbD5JW/ChgaVc/PJS/h9QZ5Y
         aEzzsxeRtcWqUCGUFEPC2ycJ9VQY0YdKU+DfGG9HPuWmaWpDOrg7BA2OghN+JxcNK/xr
         u+Ig==
X-Forwarded-Encrypted: i=1; AJvYcCWnCaxiLX6+PrUMRTJP55lU/zLR8Tx1AahwUkX0rKPigwYfBLPgsqLHoyNvawTalRLboycdxVZPJ7zT7Zd1hooFvp8bv2sJlVpJMe8=
X-Gm-Message-State: AOJu0YxWEALBEiZHyxPpdQYKVBUbz5bPihrOH0SVWF0pkkVgoWl2B0LU
	n+IYt9WR5qYG4qn/ML3kX8uNlsd1HQijYzrguUMSXUy8iOv+CBYoZ3HiRKqAoR8=
X-Google-Smtp-Source: AGHT+IGMPQ9dJIjGP5P9kCYlzJvqtkW8nMIE5M35DaKFRXMNDeLKnqDZqpvxZpfruPGst+gPon/EuA==
X-Received: by 2002:a05:600c:4e8c:b0:410:8d28:800f with SMTP id f12-20020a05600c4e8c00b004108d28800fmr782327wmq.9.1708727262323;
        Fri, 23 Feb 2024 14:27:42 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id bp4-20020a5d5a84000000b0033d47c6073esm4959045wrb.12.2024.02.23.14.27.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Feb 2024 14:27:41 -0800 (PST)
Message-ID: <c93b9ec4-2447-4be1-b316-3395d35eb8f5@linaro.org>
Date: Fri, 23 Feb 2024 23:27:41 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] thermal/drivers/sun8i: Don't fail probe due to zone
 registration failure
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>, Vasily Khoruzhick <anarsoul@gmail.com>,
 Yangtao Li <tiny.windzz@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: Hugh Dickins <hughd@google.com>, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20240123-thermal-sun8i-registration-v3-1-3e5771b1bbdd@kernel.org>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20240123-thermal-sun8i-registration-v3-1-3e5771b1bbdd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 24/01/2024 00:33, Mark Brown wrote:
> Currently the sun8i thermal driver will fail to probe if any of the
> thermal zones it is registering fails to register with the thermal core.
> Since we currently do not define any trip points for the GPU thermal
> zones on at least A64 or H5 this means that we have no thermal support
> on these platforms:
> 
> [    1.698703] thermal_sys: Failed to find 'trips' node
> [    1.698707] thermal_sys: Failed to find trip points for thermal-sensor id=1
> 
> even though the main CPU thermal zone on both SoCs is fully configured.
> This does not seem ideal, while we may not be able to use all the zones
> it seems better to have those zones which are usable be operational.
> Instead just carry on registering zones if we get any non-deferral
> error, allowing use of those zones which are usable.
> 
> This means that we also need to update the interrupt handler to not
> attempt to notify the core for events on zones which we have not
> registered, I didn't see an ability to mask individual interrupts and
> I would expect that interrupts would still be indicated in the ISR even
> if they were masked.
> 
> Reviewed-by: Vasily Khoruzhick <anarsoul@gmail.com>
> Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---

Applied, thanks

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


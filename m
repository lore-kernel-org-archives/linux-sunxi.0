Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F911E7C11
	for <linux-sunxi@lists.linux.dev>; Tue,  3 Jun 2025 17:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748973321; cv=none; b=V72KtYHAvIsFE8ayP/NLqQJb2OoUMbWEI6BsGDaaa6IzXq5gkHeBh1I6Q7BnYLjs33qJshYdv30f2hRYEr+WZ29FJKqz0gpUOvPH6HTILVrGF4QNcP2Fq6PPYdrQUfNUGCEPMzIS2mXvOMWAvmq2zl8odElInHXoA3OkrGhC60k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748973321; c=relaxed/simple;
	bh=Zynt2xYe4yLXyl+ZNUkX5fnAcUYRdDyO5jFQWOfl0z4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IB2xEoii5XEsvlD5U18BkoM2kNk1i5EWBRe1SeUNRLEkBz55xD8NxwaXETf2aF2/LZwSHCgn/xkg8xajFcKTtHN0RWAPr1KDZHKcYhcIF8MzaJq7xv/UfEqrhPz4jXU4KEmz51prZ9mSwuPnXpRsjJ8XsER9RR7lMclFbUA9SAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AHvbCXY6; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AHvbCXY6"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-234fcadde3eso70818075ad.0
        for <linux-sunxi@lists.linux.dev>; Tue, 03 Jun 2025 10:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748973319; x=1749578119; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wmWUl9C985EL5CPivjVUp+r9x59BJAZUaKZ7PmzbsT0=;
        b=AHvbCXY6G0FCVkFV2Js57OSjq/ZxA0fc6qD9eWEpxpc3cPP+1OgQNSVRYZXzn/ZilD
         AveCXYQaLtYI2wJl9qLm1Q0SmI5fg8u7e4nOasJtxBlqoM15x6xeZqrDF8NPmsysA/WV
         sI5F4EdF9osT5pp1ob7B1pAqL5bjSYR2UduSpXd/2kSimI90U2ejZuyQT6+yeQCmdLmw
         zQvFjdJMdjwa+szou9syj73UdfaYjQgmi82AuyFRAjmeqZlCVatZsyrb0yggQnVdEyj8
         IIUQ8yZdZmHZop+XfCCkgDP/+PaK9rdl8Sb5QaXpLmQoTfHDrUxIdyLlRSN0acHfd0Z+
         dL9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748973319; x=1749578119;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wmWUl9C985EL5CPivjVUp+r9x59BJAZUaKZ7PmzbsT0=;
        b=XaQ6IVUGzh67TJ66vO0hSacBjrO7UGeA2JkJCRIhfDXvXMRnoQmpNeS7XMUGOZYUDV
         hk3IPNYFP+v/TOAbNLcdPie94drapC8lTTHqbwRI1kVZ0vnIf2u78MJbOQoe3HmyveLf
         Ck5ZEbC6wX5T9Fg4Fb+d3xrirPghfPWWzTnD74KhHJQj71KA0RXBxlQg3LqNGO0Lwkgd
         XfJB6C7/SoiVCSDAb/mJenc7dTQ7sVo0vBCLi6p1jBrfedMmJUAb2+hG+wFiG2lcUT2R
         ELD5MWNQdPyt2+Wq/NCcKF7wSsw0U0GN2UNV+qcUyPdetJ6QQt/tx6bItBsrxFx6/c1Z
         gl2g==
X-Forwarded-Encrypted: i=1; AJvYcCUD37qB22a1HR/vqRj297b068Od9O7Vf6liX1U/xAYetUeeENW/qobM+leJyv9OUmtiN2irmbq2h5Jkpg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwR0pRcobGovSp1ugJ6ipMDRk60Z1RVvYzIyaPoGEMXIhnNnnx3
	xVLl5PNeO/rV5r7oDZ1yiBZACcEAdEH/Emq3Z9Lk9KFiEyZTqtB2114753bqTFSE4A==
X-Gm-Gg: ASbGncvoDBkdETtVU2L7CCgzN/J5PmOoZ+KiXzDcpCEXzH1EOnvZvd5Hxw/qo3Jz2Pk
	n9/ZMb61j758OU1BPXCjyHH04Ec/r3WGQDHMa+pLz9AK/6a6BQc9II4DE9WtOEEWbEo/rbAN0PI
	/XmybG/JgNq1vc6nTngDY7qOi7yrD9ueOvKGXWve6yCbYaIkrkw0sOxFwxS0HdOhpoZLzhT96Lx
	ZRbm6i4uD/UG2Vexf7mip7NFizkcOc7fJNrcF5atW5hBXeCbaGvKiOvzGpPX/HwAh5AhW/MtrES
	s9cC9vChK1oK/UhtnkQI8pPwf6opPI7tLMvWsZZor+voV9FV4jk49iiR7ciIgmER1uJgIqDr4bs
	A+3sYC86aM4QYpY89CiIfrbcZRc8=
X-Google-Smtp-Source: AGHT+IEL8qWQXsZH17HCYlbbIw9UGPDhlEkxpYMP6+pX9reecYXFMezlkTqgJADRlqe4EFkksHLW1w==
X-Received: by 2002:a17:903:b50:b0:235:779:ede3 with SMTP id d9443c01a7336-2355f9ef557mr237428345ad.41.1748973318650;
        Tue, 03 Jun 2025 10:55:18 -0700 (PDT)
Received: from google.com (128.65.83.34.bc.googleusercontent.com. [34.83.65.128])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506d14bcfsm90207425ad.236.2025.06.03.10.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 10:55:18 -0700 (PDT)
Date: Tue, 3 Jun 2025 10:55:14 -0700
From: William McVicker <willmcvicker@google.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: tglx@linutronix.de, Jim Cromie <jim.cromie@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Marco Elver <elver@google.com>, Nam Cao <namcao@linutronix.de>,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org, John Stulz <jstultz@google.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Saravan Kanna <saravanak@google.com>
Subject: Re: [PATCH v1 3/7] clocksource/drivers/sun5i: Add module owner
Message-ID: <aD83ArjAx463xOx2@google.com>
References: <20250602151853.1942521-1-daniel.lezcano@linaro.org>
 <20250602151853.1942521-4-daniel.lezcano@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602151853.1942521-4-daniel.lezcano@linaro.org>

On 06/02/2025, Daniel Lezcano wrote:
> The conversion to modules requires a correct handling of the module
> refcount in order to prevent to unload it if it is in use. That is
> especially true with the clockevents where there is no function to
> unregister them.
> 
> The core time framework correctly handles the module refcount with the
> different clocksource and clockevents if the module owner is set.
> 
> Add the module owner to make sure the core framework will prevent
> stupid things happening when the driver will be converted into a
> module.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>

Reviewed-by: Will McVicker <willmcvicker@google.com>

Thanks,
Will

> ---
>  drivers/clocksource/timer-sun5i.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/clocksource/timer-sun5i.c b/drivers/clocksource/timer-sun5i.c
> index 6b48a9006444..f827d3f98f60 100644
> --- a/drivers/clocksource/timer-sun5i.c
> +++ b/drivers/clocksource/timer-sun5i.c
> @@ -185,6 +185,7 @@ static int sun5i_setup_clocksource(struct platform_device *pdev,
>  	cs->clksrc.read = sun5i_clksrc_read;
>  	cs->clksrc.mask = CLOCKSOURCE_MASK(32);
>  	cs->clksrc.flags = CLOCK_SOURCE_IS_CONTINUOUS;
> +	cs->clksrc.owner = THIS_MODULE;
>  
>  	ret = clocksource_register_hz(&cs->clksrc, rate);
>  	if (ret) {
> @@ -214,6 +215,7 @@ static int sun5i_setup_clockevent(struct platform_device *pdev,
>  	ce->clkevt.rating = 340;
>  	ce->clkevt.irq = irq;
>  	ce->clkevt.cpumask = cpu_possible_mask;
> +	ce->clkevt.owner = THIS_MODULE;
>  
>  	/* Enable timer0 interrupt */
>  	val = readl(base + TIMER_IRQ_EN_REG);
> -- 
> 2.43.0
> 

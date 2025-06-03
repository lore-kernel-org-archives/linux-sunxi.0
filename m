Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F6A1E5B97
	for <linux-sunxi@lists.linux.dev>; Tue,  3 Jun 2025 17:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748973597; cv=none; b=hCivXIJoUbLUI8Zm7FsSCgBFvpGyrc/y+QAFaTBwjkxrf17eyV40YKasPNAqdkFWt9lEcwruXbBY7VdMCemOl1xvRDt3xVD59hZGaFQ7hXqJuVQGdlQa7ghTKqkSy4hvbkTvHGYchnJrr/qFHI7obYVtAzUPhwBe3S7rSpv0olg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748973597; c=relaxed/simple;
	bh=efXABUpEg2jTeK0lauA4E9OmQhJ6Xv++DX39jwcjhcc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DrNxGYyR8aMJS2Uq2O5IMtyaVZOyvoLxrgiagh1fgoXFWoCKT9yz3vskxpvPAT1tzwAh7CIyP1JqI2f1TU1N+ANIDDJGRaT8J2a6lMOG2253lb33C04k+OoB18/qbp9p01+flGQhgcTqbqM8rY+X9EpwSyXIOUK+dbAgKSTtrzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iMxFzyt2; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iMxFzyt2"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-747abb3cd0bso116035b3a.1
        for <linux-sunxi@lists.linux.dev>; Tue, 03 Jun 2025 10:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748973595; x=1749578395; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dYr/06bN4QHJZrZIiya8DeP2xQp31cjUuHO8BvFHhkA=;
        b=iMxFzyt26BEXvBwEzhNUbLSbAMDEeQn4F9loTJvgxSIkiXSzIYT1nk9L4SwkHYZSCt
         2pn8cjk6WcOoVJML3LBFXb0J1bRLN9j6tm2tUtcUXj0SuYELoCPocMRBfSZ3SNHmUDhI
         iF0p3U/3+FMK1Ge1+0WBzQ6lwt93PQJ6XqQwPU1aLGXZpma/wMaGtwRG/UEW3xZ3jCIr
         k6ZhD4NznyqNFMhc5/qYFC4K0VPhgytgdxzYEdMkfAUDX2OmPnWGfUQXIU1HDCWWAjCg
         Ftw/qyWvSEPDHdSBvLtMNubXiRah0bpVuZ6chGSQwnivj+FpcRK8p1sJUwWPgp+noIai
         OxqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748973595; x=1749578395;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dYr/06bN4QHJZrZIiya8DeP2xQp31cjUuHO8BvFHhkA=;
        b=l/DipL83m6pjSA0PhmKyzJiTm1fHwc6R0xATlbdQ7I+877Ih0tsF4ifcTFLa7dbFa2
         3JA57n1G3sSuzBAAh3F/v0B8hPicK7u1RdqE3x/VmDCUZ8qcjHGx625SiRcHX2Ne9V/p
         Ewqt2vq/2sEyTOY6c63Zr+91cVrhvRuyFXf25yo84OR1ZeTqWbisk+O04ahOHpkDkXkB
         XlvC8apvtjHO0uxejkr6qadtLal0UaQWulriM5pUCZ45PYYho18jM2SVL6Mey+Ci+Ojz
         Tr4q2GQ+siuLj0qzwwJN8AxaCR81/b6fMdBvuCCBFKpSSTgxYa5h7TNuvVX1rYAfyjEP
         EpuA==
X-Forwarded-Encrypted: i=1; AJvYcCWajngKVm9Ohof9gYnkMZN3hW43Js+mWcDB7PvB0J7rbcPz+5m10oj8sl8lrrrXdJQeMAtPX6a8GsCE6g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzcm3NzXNH3tQ2GmoU6dTFv57/X7bqCqlE1LJj3u+upcOwjTfwl
	NDkzWysdByLFu4xI7R3jgKoA32SKLwRKu84FU23PAuoKl7MyRPH5pYxf/8JR0e/WIg==
X-Gm-Gg: ASbGnctcTgQp2eeK+u303gV+5D3PXDSAkGAO/e61h+fNbhtQ86zzZuJqy4jVPFcrlir
	61PeYABhbzZ+zT0CQANDtYK17zmCa269e11n1WzOgPSREhsDIHwChqTcLX9DwG24ghq7/9yl/ZM
	LiYQVVRJ3pyTk7HZvECRB2wB2W/knXPi2J9zELeieBVbdupbg6G82apla6oXjNWGJTxg0tEOCGJ
	SPeMDj3aES3Fqd0EJma6ilv8me8lcsd5qLAShmBgsDkuVrzcwrftfMiMbx/fk0lsl2m/qoExXaZ
	JWU4MLYbcJoRGve/exNLrqOsuaBvUZmuMHCag4LUhEFb8Dvmlc3WSHPvImaJoi+dnzSLD+rAZhh
	z2vOXvzQRcDXajj4vGSfwTUVtN7M=
X-Google-Smtp-Source: AGHT+IGjgStLfRgl5mcLbCo1SeqO3sImaOglz5V740eKF1RoVh4hQTng1HI7HfjGR1PadljmDx9/GQ==
X-Received: by 2002:a05:6a00:ccf:b0:736:4d05:2e35 with SMTP id d2e1a72fcca58-747fe24f7dfmr4701490b3a.3.1748973594522;
        Tue, 03 Jun 2025 10:59:54 -0700 (PDT)
Received: from google.com (128.65.83.34.bc.googleusercontent.com. [34.83.65.128])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747affcf703sm9619170b3a.129.2025.06.03.10.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 10:59:54 -0700 (PDT)
Date: Tue, 3 Jun 2025 10:59:49 -0700
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
Subject: Re: [PATCH v1 5/7] clocksource/drivers/stm: Add module owner
Message-ID: <aD84FVFtggGP-FF2@google.com>
References: <20250602151853.1942521-1-daniel.lezcano@linaro.org>
 <20250602151853.1942521-6-daniel.lezcano@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602151853.1942521-6-daniel.lezcano@linaro.org>

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
>  drivers/clocksource/timer-nxp-stm.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/clocksource/timer-nxp-stm.c b/drivers/clocksource/timer-nxp-stm.c
> index d7ccf9001729..bbc40623728f 100644
> --- a/drivers/clocksource/timer-nxp-stm.c
> +++ b/drivers/clocksource/timer-nxp-stm.c
> @@ -201,6 +201,7 @@ static int __init nxp_stm_clocksource_init(struct device *dev, struct stm_timer
>  	stm_timer->cs.resume = nxp_stm_clocksource_resume;
>  	stm_timer->cs.mask = CLOCKSOURCE_MASK(32);
>  	stm_timer->cs.flags = CLOCK_SOURCE_IS_CONTINUOUS;
> +	stm_timer->cs.owner = THIS_MODULE;
>  
>  	ret = clocksource_register_hz(&stm_timer->cs, stm_timer->rate);
>  	if (ret)
> @@ -314,6 +315,7 @@ static int __init nxp_stm_clockevent_per_cpu_init(struct device *dev, struct stm
>  	stm_timer->ced.cpumask = cpumask_of(cpu);
>  	stm_timer->ced.rating = 460;
>  	stm_timer->ced.irq = irq;
> +	stm_timer->ced.owner = THIS_MODULE;
>  
>  	per_cpu(stm_timers, cpu) = stm_timer;
>  
> -- 
> 2.43.0
> 

Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D2EA1E5B97
	for <linux-sunxi@lists.linux.dev>; Tue,  3 Jun 2025 17:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748973428; cv=none; b=ZisQ1tS4f9fU9n9rTCWoNKgerqTZfdTVMsT1J/BItEJJ/IMPeoDBLWRk6uMcpyXItXWWcl7rtH6jVASBlwHxXRCNHvUta9FTuIWxtKrmWS0m4TMIzKnBIain3shbQMcG7YO2MX7nPNxDkznvgI1FsPMy8HDAxTamLRO/KkVer1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748973428; c=relaxed/simple;
	bh=QN5rbcRHWNYvmqhVhRD9FgtoDgxlmTfU7H2bsy6rsYA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pePnsSeNq75eB7AjV9oZ5VF2Fh/kKWr3L8vC7akKRPA5O78k7mP/xxBKR3aoMJQHFhl5R7qihacYer9PVT0m9n+mDhkhH3udCwYzGA3VJjS+3okmU3X9d+w6eAqiBRlv5ezNM4qTHphh+zjDjJhcVbKmGOT+tVR4KZtVgMK05K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=y/T9DLRb; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="y/T9DLRb"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-742c9907967so5911493b3a.1
        for <linux-sunxi@lists.linux.dev>; Tue, 03 Jun 2025 10:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748973426; x=1749578226; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QOHtIjIllleG5NXeGwEB/iZNkovTPGk/XQvSsFwTJgY=;
        b=y/T9DLRbcNju6DKVX2GNR4WG1I0vx32t3EsHTMlrSkK7kxcxhjIok78vyYd/U7od7j
         HMafjisPNM1FN2+wUQYbn/1WpXQfl/8gTpM5UJCMmf62uySGUT+52Ike8ZZ3VDGAhl3i
         FZloavZdZgKIOhKnKeBdKkflN1J3/3jCtw7YnfcxGfElTn3+b8r8/ikUvBK8jxWpcIhQ
         m5fVm2ntJqKFdDrWhheag357JVDwNeMXk+tlwXaOepLyyDenPK5842SU9A1KqAo/fk9Q
         UaMRY32B6Q8eZyUyWXyfZvRSJMwQ+fKv/ior6TqaBusnRW1torReX842yTGvsKUb2aL7
         w78w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748973426; x=1749578226;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QOHtIjIllleG5NXeGwEB/iZNkovTPGk/XQvSsFwTJgY=;
        b=lYphX2CX6IYZS1bOf95uCyV2UngrGSnLC5Nqd+6n5raBwCX7L7gmLXad1HCi/D8OAD
         w5i+uBVi7hw4lzew16ZZLnRP0HrfWyE32y+6eISGl4hx62Mk30L/O0KOFFZnH6uxuZq1
         x9YF2/K4F5obIvZzp5hTeP1DdUgW1bJZKvXUU6p/FUhUedZLbTIPcfmybX2XkcHZO6XL
         um8EiXEOhnCBVOa0wsopo9QhNflZk51tIh2AflCKtgLIHbTnLQuanDoc/AZ/ydVSUdWu
         Nqgcuyyh/M8422qMdmtrj8yzNmt5Xc7Mi+9v0LnC3kdJ+gScmfB2qv73y+voboGUr3Re
         mEFg==
X-Forwarded-Encrypted: i=1; AJvYcCW8WxDfIjc557LgXT2lIanrTS+ImzkcAQqVtQvnCbhN+vc6TmUwHzwJafmmV2DzqeStKw2kzrK6wp8TUQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzDX1DpVDpXalHDmqyZPU/eZMt5yCnL5k19QpFj3CUBssevofvL
	b7Rw105rZN8fMMcuTOFLEKk2IQ/Ka3cvLxR48+fPJXSJ1avmJS6iPn6q+hI9YRlpLg==
X-Gm-Gg: ASbGncvl+932/BFEE1J7Joek7mBYEMOzsRf7ON+NAaXaSIsCcKoSVcbzvDdBiXMI3f+
	+y87dIN5PBfI5OI34HjqMsvOBWgrX21zD/jMOwLrjabz1f8+OFxW82vheSd6tqf9mrTeH0kezrQ
	sfSLUnLPifwHmd5spl5tSsUgNWAs0kUfDMhw2Km8qXKl/qWFqbzknc6mC+b9mHfsnj05AlMoE5t
	kSGKY2n41CoqXwBIGXXjRBeYVq0AGouS/awuSbEVqm8e4CYN68wpxQt6shirwHEqN5S4JYK8yRy
	vsEeFZcaeTFc5bDnF5jLfFN/if8YCv9tqSXcRZUOAbHaBahXPOdCwqgcZqqHRsH/S9SBSuAWyOi
	/91hWUwZqaV8wKqh+rRACwMHBwbE=
X-Google-Smtp-Source: AGHT+IFJjRiNTfrHUGA38dJeGT2+lFGgu3T7p+sKAbadh5LPG+wdrTfumVyLbKsTRptWC4Rroj128g==
X-Received: by 2002:a05:6a00:3d12:b0:737:678d:fb66 with SMTP id d2e1a72fcca58-7480b1f3b1amr53928b3a.5.1748973426129;
        Tue, 03 Jun 2025 10:57:06 -0700 (PDT)
Received: from google.com (128.65.83.34.bc.googleusercontent.com. [34.83.65.128])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afeab4acsm9633273b3a.43.2025.06.03.10.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 10:57:05 -0700 (PDT)
Date: Tue, 3 Jun 2025 10:57:01 -0700
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
Subject: Re: [PATCH v1 4/7] clocksource/drivers/tegra186: Add module owner
Message-ID: <aD83bbyEPKSDXv_T@google.com>
References: <20250602151853.1942521-1-daniel.lezcano@linaro.org>
 <20250602151853.1942521-5-daniel.lezcano@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602151853.1942521-5-daniel.lezcano@linaro.org>

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
>  drivers/clocksource/timer-tegra186.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/clocksource/timer-tegra186.c b/drivers/clocksource/timer-tegra186.c
> index e5394f98a02e..56a5342bcf78 100644
> --- a/drivers/clocksource/timer-tegra186.c
> +++ b/drivers/clocksource/timer-tegra186.c
> @@ -373,6 +373,7 @@ static int tegra186_timer_tsc_init(struct tegra186_timer *tegra)
>  	tegra->tsc.read = tegra186_timer_tsc_read;
>  	tegra->tsc.mask = CLOCKSOURCE_MASK(56);
>  	tegra->tsc.flags = CLOCK_SOURCE_IS_CONTINUOUS;
> +	tegra->tsc.owner = THIS_MODULE;
>  
>  	return clocksource_register_hz(&tegra->tsc, 31250000);
>  }
> @@ -392,6 +393,7 @@ static int tegra186_timer_osc_init(struct tegra186_timer *tegra)
>  	tegra->osc.read = tegra186_timer_osc_read;
>  	tegra->osc.mask = CLOCKSOURCE_MASK(32);
>  	tegra->osc.flags = CLOCK_SOURCE_IS_CONTINUOUS;
> +	tegra->osc.owner = THIS_MODULE;
>  
>  	return clocksource_register_hz(&tegra->osc, 38400000);
>  }
> @@ -411,6 +413,7 @@ static int tegra186_timer_usec_init(struct tegra186_timer *tegra)
>  	tegra->usec.read = tegra186_timer_usec_read;
>  	tegra->usec.mask = CLOCKSOURCE_MASK(32);
>  	tegra->usec.flags = CLOCK_SOURCE_IS_CONTINUOUS;
> +	tegra->usec.owner = THIS_MODULE;
>  
>  	return clocksource_register_hz(&tegra->usec, USEC_PER_SEC);
>  }
> -- 
> 2.43.0
> 

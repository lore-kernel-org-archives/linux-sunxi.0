Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73391E5B9A
	for <linux-sunxi@lists.linux.dev>; Tue,  3 Jun 2025 17:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748973282; cv=none; b=PbnbQwiW4fP/G+knouo73CWxIdqU9CqbJe8245GDGgyrEd91C78c9Wy8si7c9U4wPw4aMnikJ3SH+BMTUEoLMFS8JgHCJgctBsMPtm+U8Gi4T5bYKqJ4D9gKCsCfIW8SdJiUihqLM+BhyNDbvhaXAA+czFtEA5UD8et6SVTAOlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748973282; c=relaxed/simple;
	bh=ldRV3yiK3frofPHpemDZRG/9dNoJTR40n01/P/4BPbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VL1G7MwZBnoFJvIKq9q66Oh5v0yPGoGh3xH6RAGyfOb2VggjsmOcOaC0XZPViNve2uEnFdvqOWB86ZBH26EABDkD2wExY/oedKl3sqeBCsvnJY/7ojzxAgj+jjSc38ig04H9qUdBZ5LJDw3zT2E00M/RxII7mVyJJVyZF2Dsmkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mjvf62YM; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mjvf62YM"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-306b6ae4fb2so5187710a91.3
        for <linux-sunxi@lists.linux.dev>; Tue, 03 Jun 2025 10:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748973279; x=1749578079; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R/7/m0D4YkX+17TK5YiYf5mx7eZJqJi8ta4T/kaVg1c=;
        b=mjvf62YMJXrU7fhEHt4sVpjEiO6bLpubvyKz1Hvkyfn/hpOat2H2H02q9061JTQZYn
         REbXnI0S0LsZP93jd/asDUW4s4AYUgqNPCIIWKK+d5W7R8bJ6Jp7U/j1pxiKdYVtj9Hw
         EkYjgJV7pCQgHAWjN6arvcAbbf4o2/UPIZD+MwzjHdrj6yCiBav8+m7ptfcQJczoxglp
         nbKgJcPv0zbXk3n+aZp6lxAfpK1ZySj/FBahlJNndik8D3eC/gmFGGIa+FMnUB8qFytq
         qOMru3dx7Li0Ldf5tQqiUKfhrUUGxPI/yvvDr+XQPq0IXKet5GEvJUKDmenACCdkALHU
         Fkhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748973279; x=1749578079;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R/7/m0D4YkX+17TK5YiYf5mx7eZJqJi8ta4T/kaVg1c=;
        b=O0TcBV4JJkmhRX4+hl4ppFaa5JG1zujyJJdLawp/XAAKnJTnkcASK3rF0X6OhAAwDy
         X6bp2U+yUSCoU7GnoES7JY9Mnv/JFntyYEuXqOBAvO8mWeLgwYu/eJmw1NTxzw3g2VX/
         L8Mz9OnjHNyqU0g3OkuIWyq3qj2vjZu25w/FY+ReyZLOLkoAc9/fxGL7lbIHRryNWAdj
         9SIpkIpShq/G7tShHwyP8U0TRtR0BCgM963cAZZAIY6OZWkkai9lJYTv6vtyxdD49Ud2
         2oTwisz4u7NYSWQldxQMtr7TdfNWyRGie1nVOQv6OZQd9KmO6c0ZPn7zJZwGzB6JHKmO
         2Fvw==
X-Forwarded-Encrypted: i=1; AJvYcCU5WSKXIRyd49qZ8/QUj1n52KWtTp9y6uRyw8LQgyeQw6HmNaEF+zzt3+WR6EuOLJkMKWZbQFPF0BPLtg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyVxSyceTajYYrbClUYQ3UdfSDZroxeekHJxHMcl5hxDfjo+GOl
	Ye28mbRFH3bqz6D/JQY4TXnEYesttP4CR+J2bMmgbxNhoJe7NdQk+FD339fNM+lrXQ==
X-Gm-Gg: ASbGnctn4zpYV3RcUQiqmpNh07aQ20bhswtqAIbP1N2TDxW5hYossMuSnlTrTJfMZ52
	rTuNOVssTKb72Ze4uK4SA/B0/70TtITqYBqyhtJBBPRW0YjPdtFVI4pfiJY6vKRBiOIHg5f7GS1
	6kWjc26JMSebKuu3EV3kkLE3TglJE8EPAvoU+81fFPbQEs+xDDfRsY5doYtxIvzJsUH9ZC6gP66
	jG312oAdFxYikZVIJUCBXvJWPb4eMqCMbMG1rwVc4WNY4tJhMf5olpoFdq+ocAZkn6qTNfeg+u6
	7ZViu8B9jc9LMTFYJPNoUMNcNSGupA5Vyrs6zmlCc2UVNgbd3LM4xmYsVixRGwx2ETV5yyKNgV1
	VKR4a80KVxmGCAN6iE2kQAcOM2DY=
X-Google-Smtp-Source: AGHT+IFTvlmrdVshd5QxHXcEQ6MKKQjAV8TvJ2nBjRVCK5/HXrreUCJZBUa7P7G7vUU+2pvwwgQ3Ww==
X-Received: by 2002:a17:90b:55cf:b0:311:df4b:4b8a with SMTP id 98e67ed59e1d1-3130ccf69ffmr22034a91.3.1748973278786;
        Tue, 03 Jun 2025 10:54:38 -0700 (PDT)
Received: from google.com (128.65.83.34.bc.googleusercontent.com. [34.83.65.128])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e2e9474sm7517618a91.29.2025.06.03.10.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 10:54:38 -0700 (PDT)
Date: Tue, 3 Jun 2025 10:54:34 -0700
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
Subject: Re: [PATCH v1 2/7] clocksource/drivers/stm32-lp: Add module owner
Message-ID: <aD822umlHEamq_bA@google.com>
References: <20250602151853.1942521-1-daniel.lezcano@linaro.org>
 <20250602151853.1942521-3-daniel.lezcano@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602151853.1942521-3-daniel.lezcano@linaro.org>

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
>  drivers/clocksource/timer-stm32-lp.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clocksource/timer-stm32-lp.c b/drivers/clocksource/timer-stm32-lp.c
> index 928da2f6de69..cf1423ca00d0 100644
> --- a/drivers/clocksource/timer-stm32-lp.c
> +++ b/drivers/clocksource/timer-stm32-lp.c
> @@ -159,6 +159,7 @@ static void stm32_clkevent_lp_init(struct stm32_lp_private *priv,
>  	priv->clkevt.rating = STM32_LP_RATING;
>  	priv->clkevt.suspend = stm32_clkevent_lp_suspend;
>  	priv->clkevt.resume = stm32_clkevent_lp_resume;
> +	priv->clkevt.owner = THIS_MODULE;
>  
>  	clockevents_config_and_register(&priv->clkevt, rate, 0x1,
>  					STM32_LPTIM_MAX_ARR);
> -- 
> 2.43.0
> 

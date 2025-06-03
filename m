Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5138816F8E5
	for <linux-sunxi@lists.linux.dev>; Tue,  3 Jun 2025 18:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748973693; cv=none; b=V6nsNaDWkUtnEcgprdXhPCHCh3J8PJ3SSExKaJq5euDDh9Af873Dksc90HGj7UA5h9NbsgTOANpaTjZ2IPp4DkmWUob81zfV91ryWk7baVrK0cjVjTRekBf16DWPn768Bj+i5d9d00PUSfQu07s0dQ3wy3ZX88osiwYCqURuPb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748973693; c=relaxed/simple;
	bh=2dyMbRz1h7s7edNrWCTXDbYuBWjwzW91GnsgeY0rtXI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FQtMYZ8zg1rVUYgdbK9ELsmkfvfLkh0K+hj37nmy/+50b1N80Azeo+33LReQfpq03IV1ZWELY+UcuIssZ+lVePoAYLO++H17jJ+sgy00h7HnGZfFXwstrJBRrL0gYO1ZzhnC0Px9T2skSkh+x3L61FcXT5jFtsk0Zr9kb4NG9qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=n3tTmryz; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="n3tTmryz"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-234d2d914bcso42116245ad.0
        for <linux-sunxi@lists.linux.dev>; Tue, 03 Jun 2025 11:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748973691; x=1749578491; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Oio5+oLisctncuh+HzW9YUjFC1egO1KiH1XNbWO+K7k=;
        b=n3tTmryzWY9nwFXOkPCXnITEmnrJ9tQYb8+VOpIjF48EiuBGIU6EA+X6WhwjJ1DTJs
         CQF0VImZiLGJiEpWqeWJyk7WdOOFaY7P5OYs8LEBk5bPemNNDor5jAouwohHaQ7smnXD
         pMhXi+Nv/WDQ1YE90ARiBzqs5llnI25uTFkp7zdKv6nYyTQwjVvFbXhYY1OxSjmza9uR
         EYMri7/Z1SlwSFm7cKReooPJs7i3pyn4+1geRiftyJB147b+rnPp1X6+DGbU5IgmdDGh
         uGqC316XOBV92WD5SnI5y6Snu/HOzrovOFAf4z6HJ/Tes/7e8gPpcSy5+bEeBzLoH58e
         ffCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748973691; x=1749578491;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oio5+oLisctncuh+HzW9YUjFC1egO1KiH1XNbWO+K7k=;
        b=AlBfm/d+sI8eso88FLXhzJv7Es7wHGRsJXqGn9jlI3HN12ZwvnyOkzfbG5FQoo9p+f
         mbZImhq1c+m6KlxP3TAUPvEgvlwCV4Jv1d6TYJXkQxRAIjFkbTsSqs0O80ONyqRfP9ep
         PRCW5bGITwMx9Z35laUosgW6A08LxD+shuOjEoENNmQ3AEukRW/Qx8xcL45HlnMasUAZ
         9z7Rx1NjpicEHpaAYrqzZShctdo/kYQaneh2rYB8h8zrneqTbFocwpeLTW7/dY23LLZ5
         UuyZDQ6NxjatO4IWHRGCqO/VdiQQaG0iQDf/4Lp9pynGXQlhY1gUTTO1xKdqI8oMbAet
         gfFw==
X-Forwarded-Encrypted: i=1; AJvYcCVTLc1FmyIsfqZsGifFN6eoB7UFVb6uDfjt7Bu3hVXN6/9tlb18ZGmIJnz0oVFG7dF36Um8u4U2XKr4rw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyZq83o0nrydXWtWC9k/TOa36M1xa97cBZYe+O3uUVoE+ZVdMgL
	3vdOwROAEx46ab7cADA1YTrCXoAW/zDtFd406f2O6YBYL58mchsXrtGn7Q4fTGxSbQ==
X-Gm-Gg: ASbGncv75jzi3HIBkSrSijZNxjV1iPSaxLA8/LZsqPj/DQ2J5ic446TTa6xu6HLzTfD
	NhRQ4mVpP1SZ+pNsukkcvdSJtQSUAYaDRSUtRpsrjh0i3e0d6LW1pVtk724xXcSRXZPM3KjbbgC
	8GM2wDCL5XaDajZubkeicKm1XRA6sjfkVnzFkRO+MLQl7RTAoexuSMR+RM/z2qghXdZkgTncEjW
	ucGDnGHEHP39RLlYvKaDFfVi6qiCneaVTtIf7epUMlPZ6aYiRv3vdPyt99uzMHcum+vJ2vZy5BH
	Gh6tfyzfdYz3KnVropDDji9QT6Z4ETDl6pimvJ5jetsHyGR6WppuxiK7b4qK9ptcKeMsJ21WjAA
	Km9gy/FWLbvAropQ3ei6sLvp6htA=
X-Google-Smtp-Source: AGHT+IGJVe96mQDhzEhZqYJnC27O9vMFUAoTp1xS/H2NANso8WpCr6YJ9fd9Q8qaZg1NI2W+7g1xJw==
X-Received: by 2002:a17:90b:3f10:b0:312:f263:954a with SMTP id 98e67ed59e1d1-3130ccaa125mr73097a91.5.1748973691331;
        Tue, 03 Jun 2025 11:01:31 -0700 (PDT)
Received: from google.com (128.65.83.34.bc.googleusercontent.com. [34.83.65.128])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e29f899sm7572695a91.6.2025.06.03.11.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 11:01:30 -0700 (PDT)
Date: Tue, 3 Jun 2025 11:01:27 -0700
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
Subject: Re: [PATCH v1 7/7] time: Export symbol for sched_clock register
 function
Message-ID: <aD84d4WArf_terBP@google.com>
References: <20250602151853.1942521-1-daniel.lezcano@linaro.org>
 <20250602151853.1942521-8-daniel.lezcano@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602151853.1942521-8-daniel.lezcano@linaro.org>

On 06/02/2025, Daniel Lezcano wrote:
> The timer drivers could be converted into modules. The different
> functions to register the clocksource or the clockevent are already
> exporting their symbols for modules but the sched_clock_register()
> function is missing.
> 
> Export the symbols so the drivers using this function can be converted
> into modules.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>

Reviewed-by: Will McVicker <willmcvicker@google.com>

Thanks,
Will

> ---
>  kernel/time/sched_clock.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/time/sched_clock.c b/kernel/time/sched_clock.c
> index cc15fe293719..cc1afec306b3 100644
> --- a/kernel/time/sched_clock.c
> +++ b/kernel/time/sched_clock.c
> @@ -174,8 +174,7 @@ static enum hrtimer_restart sched_clock_poll(struct hrtimer *hrt)
>  	return HRTIMER_RESTART;
>  }
>  
> -void __init
> -sched_clock_register(u64 (*read)(void), int bits, unsigned long rate)
> +void sched_clock_register(u64 (*read)(void), int bits, unsigned long rate)
>  {
>  	u64 res, wrap, new_mask, new_epoch, cyc, ns;
>  	u32 new_mult, new_shift;
> @@ -247,6 +246,7 @@ sched_clock_register(u64 (*read)(void), int bits, unsigned long rate)
>  
>  	pr_debug("Registered %pS as sched_clock source\n", read);
>  }
> +EXPORT_SYMBOL_GPL(sched_clock_register);
>  
>  void __init generic_sched_clock_init(void)
>  {
> -- 
> 2.43.0
> 

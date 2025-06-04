Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D114C22A4E8
	for <linux-sunxi@lists.linux.dev>; Wed,  4 Jun 2025 03:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749008609; cv=none; b=Ojok7mN8H9xQMej4/ERwvqab4jkZEY333/Nu1dZOYmncBtGE1T+7ixrHoN4mxej6WqCwdWO36TRN61Oc63UC9xwBYHHGlTBUIGn06njp+0cVIoj7RItvoPHREKQhBDyXWEAJlCJvOSolYoUBlsECcBPMwLHIYKJD6nEdld15pu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749008609; c=relaxed/simple;
	bh=Sf/4+POn7BVTFHEDrs6asZumcOeQmLNTI7IjWHUUShg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ljuI+q7efcUlI0BrvZJz/jxPEcGy8AwjDXau/zMzcHrT8MEcfQjhE0R85lj6FcQzsni9klHpmembY/SsdB04cpiSfVVHwH8K+sbf8C/DjaZtyZZTwlneiLHhIg3oVHRqem93bG5ZbhcNH13r082989qvDhMc4Pm8Xd5MmrQRe/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UKelB92b; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UKelB92b"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-55329bd977aso547769e87.1
        for <linux-sunxi@lists.linux.dev>; Tue, 03 Jun 2025 20:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749008606; x=1749613406; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sf/4+POn7BVTFHEDrs6asZumcOeQmLNTI7IjWHUUShg=;
        b=UKelB92b8T+BDaT8ID10D894JUkArF7wsTjkCM1BsLtAhrRSpiuBqjiHaz5OoQLib4
         OozzECgMuEz5haTM4hKZcDPsYlf+6arLS5bdshCss60+Rsdkw8izS4tsyTR7GJu0JDsB
         KI3A7Nj3AvaPUVtTANKbNf5sKmklfQw33vI9jepBe3lYKsNMTVw12FbMWHEUaPMoACOw
         E7ZWxC1ZHPkCgBwplegTaiSSoe01lQvzNQxW4tx0TP3AsGaBasPF04XjBtaGOqSHLm3E
         FO6gcpkFoFGNoESB8EheXcn3iuXGdf75CsRHMk9bb775H0z5I97ObyCpmSbmjWiJGxvG
         o8CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749008606; x=1749613406;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sf/4+POn7BVTFHEDrs6asZumcOeQmLNTI7IjWHUUShg=;
        b=ON5URsps1oxiENyQLv/rTWdaimwtlnoj4ITJJFNVbNkRJbM3MMnTljhSdhM9QdI6bO
         /JMnmH6jZxyw7QlPfQgWskYyH4epBQlNU1C+HDGoL0d2aZY67ac2kJMPkYYzCFjKChW0
         pFY3lIZ8PR6JPTnf1RZ1wouzdksTRbBnWbWlQv+q4p3rnN9aLMO2bQwWqIIiYWuQ9HC7
         jnqR/szvnLKOAAcvmuLiYxEnWo3RALTXlqWzkCMXF2ixyfjatsAt/qW03z4TK1JnhCRu
         WNXfF7ahGtZd4aOaaZNBPO4Lp3oBb9Jp9d8DPRtRe3rANN444UHSJA1KZpEsuaNB30zD
         riiw==
X-Forwarded-Encrypted: i=1; AJvYcCWWnH86bInRTuPfb181HkVtcXgGEqo8w4VNeN4O3rxWHdySUq4AYwhIneSEgRId4JT6W7zbeZV4C0yfuQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7ygWtOcnBjNaUkI5C3nO+tvboegJNwN5cXeKHg6WNeDcfhdfa
	FYJzK29M8EbyKrsIB5+RgaW062a6nGWE48OwJAf/ve97Ba4TwJecH5iAqJ1BFnlfzACqaXqeTxC
	qcHcpNYX3kAyjdwn+GbN1kACC+qMaX2rMEdQ0wlM=
X-Gm-Gg: ASbGncsIFpAF3AfDUQAFnVgujX52P+5gl23T3PLfBquNe2b11vzg/ntY4krlaFLWjZG
	9fSemIaHmSGbyoC6Mu7ampWgRiX2Bh8MDTD9eiWsKn9R6O+bkEHbqdex2iPCmTNJ5Bye5HuA4/V
	wUaj6L+Rww/Ey4SHwgEDmyur9CWhe5qYNygTCFCz2DjFf1wrtbhQfLIFwyuzfHKs0KyexV/T0/
X-Google-Smtp-Source: AGHT+IH8ZR09cOwjQWxlzzIIzvv/qRTFHJMY8a37VDJ4S/kE7pfdaVMCEhiK2Gv1YMR2kEbER3eXRAurwmgsUUQyZRY=
X-Received: by 2002:a05:6512:1110:b0:549:8c0c:ea15 with SMTP id
 2adb3069b0e04-553530e6bddmr1432974e87.0.1749008605694; Tue, 03 Jun 2025
 20:43:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250602151853.1942521-1-daniel.lezcano@linaro.org> <20250602151853.1942521-8-daniel.lezcano@linaro.org>
In-Reply-To: <20250602151853.1942521-8-daniel.lezcano@linaro.org>
From: John Stultz <jstultz@google.com>
Date: Tue, 3 Jun 2025 20:43:12 -0700
X-Gm-Features: AX0GCFvc7MVw8hFnvp1SKu5kFSFas_79C7UyjmOU1fxABMnJcu53irlnUJ9Jiw0
Message-ID: <CANDhNCpngvSEC1bXP_djk2957n-_LF1CUXNgZ-eEQ8vcCsizMw@mail.gmail.com>
Subject: Re: [PATCH v1 7/7] time: Export symbol for sched_clock register function
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: tglx@linutronix.de, Jim Cromie <jim.cromie@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, 
	Marco Elver <elver@google.com>, Nam Cao <namcao@linutronix.de>, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, Will McVicker <willmcvicker@google.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Saravan Kanna <saravanak@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 2, 2025 at 8:19=E2=80=AFAM Daniel Lezcano <daniel.lezcano@linar=
o.org> wrote:
>
> The timer drivers could be converted into modules. The different
> functions to register the clocksource or the clockevent are already
> exporting their symbols for modules but the sched_clock_register()
> function is missing.
>
> Export the symbols so the drivers using this function can be converted
> into modules.

Thanks for chasing down all the details around this issue Daniel!

Acked-by: John Stultz <jstultz@google.com>

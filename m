Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C7E1F150A
	for <linux-sunxi@lists.linux.dev>; Wed, 13 Aug 2025 13:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755090046; cv=none; b=CZXC0oXBh6UMw1bbkPce+hpuRo+EcKTodxi+OlCRPDqmVCwM1Lez8UJ4CKg7wEKxtO4COZduqX5McdFC4CKxT4btJpO2BZIPx4qZwRzmnYvfi1TDHSFYy3cPjGV5z2y8U6dHHrLCwLJktt9/6l5krUXvfLDVnz9wpgWrHLk5Qko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755090046; c=relaxed/simple;
	bh=Eacqepwje0vml54GTJE6PC8bZ+Y6sjD1UPdztT0uh8o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CQ59mLPdZ2Mz/pmdJAIdZvGbY9NoESGxIAuXAfQh1+F+lrN8lgw4FAWpePFR2tnFEKg2VaAWHXJ3k4sAgo76DfdT4AZfy0ESqiNoJVe2zs09CcR1ACpn4CSPo4JPSbNZo8dSah6vKxX2OnuWcsWFP68vwbsdSn6eGrbEO35yRlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nQN3wN8k; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nQN3wN8k"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3b79bdc9a7dso4004930f8f.1
        for <linux-sunxi@lists.linux.dev>; Wed, 13 Aug 2025 06:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755090043; x=1755694843; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PeR748Kqcp8Ecn+7OwBivcVoxs7eFxEnihqMB/P4pQo=;
        b=nQN3wN8kSlRw4eflQHYlUK7fTZouAZF9Dcvns7i3cjvt21sTJfzY8vGosH5LT+L9Xa
         HF2HDpP7oky4rK4Eun8Y5iykpgFpHvL/1IghYgaIfXwWeOU00d/17g42zjUy9g9e0FRb
         lSzpaiyWvAkHigmktUjgeOxj+fCWPPYNmZ9QL8Pjjapir8n2CVW1/mJekgys7huLQdB8
         LP6NhKynS2rCevKnTz6NsLDT75SJuCuQFim6uMXZJ2dF4/JmcUXfiK87dzOvkIoQx61m
         PJ5Sao2WVHYd5fhn84aYTjk8YRip1MG0+5bvfcqN/HNx2exAwdATZwC7vhjRTFRmwDss
         oVcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755090043; x=1755694843;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PeR748Kqcp8Ecn+7OwBivcVoxs7eFxEnihqMB/P4pQo=;
        b=Z848vv3tW/CVdHm9taK3dZztbuGio7t1fXURIs8ShUNYK1unbrP0rbTVrLNny3rdkV
         grI2Tn7xL8U9cJp2xCnoDuKOtMJcrcfjYvPl3SKt++z5LkW0XJ/G1eE5QI7I29I7x7UV
         JJguCjM0J1Gl64NhlmlKYwE4NF5K84ZUygZ74A1DvCt6Q/qd835ju8wmlM25b3U8Ac1c
         nKXnYtDM72nUA0Sh4BZIlUzTNJ60T+V2bDaQSPC4el4qG5+SiQWVar/IXE74WZwDVF+F
         9uPpGP/WQXmv3s25zYFwp6EOiKS4Se7YGuceDY+jL1cYQFsEwSA73egAzlgItnFNIsrY
         OEKw==
X-Forwarded-Encrypted: i=1; AJvYcCW36LM/TCGI7MxcB/dHNPVT199V+S9AU3NeGhfF4Tc9MKjSn4RswiRU5rpMxytDFs9jV+T6FL+utG1LWQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9TPhGonek53u38m8XvSSI3BplcdKHl5Z4zXNefPrLQpVMhlHA
	WfD7/qgWE3hYp6Hm9ZRIUb9mJKJysMiBmzW2AI0b+waNdwdZlu2co0iEWWnMubsL2AI=
X-Gm-Gg: ASbGncuS9+5U0NgbvpPEn3yMMW6tG3Km/ilSLBNkBkMJpfwHWKs2CWPqKimLvohhWkI
	k0ExIEkfEunNVyRrFSYSajrNjQRf70C8mqb8VF6ghRcjkUlXqP1x/RLff5BGHwMQsA4dJWHYXbk
	llLnMIF7Srdo6621zR8mwFjFO1GTcijjaHIaRp1ErKNkKWRbVqF6W0RT4rXcqRHrAkYeQ2zamLi
	7Bv/X9zd12mFyBx37Q5AMjpc6NKe6CAgajgwMORoiiiQId4UannAN29OoGnv9yw53UFjZ9ueBMQ
	EbLw5oPgWL0x6c90vT3fFvgtAbrCQ+B8lm9HRdyN5QGCi/enUilmCj9Nw5fvS+8r80seEAQs+HX
	5kqjJ0pc1EeRXagdzGjwoAE4CLW7j3cNskz9TwhvF96hReaBDzQOcvqAbZ+86KA==
X-Google-Smtp-Source: AGHT+IGVgvf1Uge8sHIDUuFP1oPvQwNSsudB+wr24LhPfVIfTvW2P80/tIqYbrFHm8v3paEcs2k0Bw==
X-Received: by 2002:a5d:5f95:0:b0:3b7:8dd7:55ad with SMTP id ffacd0b85a97d-3b917f14804mr2270522f8f.39.1755090042622;
        Wed, 13 Aug 2025 06:00:42 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3b79c3abed3sm47465915f8f.10.2025.08.13.06.00.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 06:00:42 -0700 (PDT)
Message-ID: <5a4e8480-a291-409d-acc3-f053d4e99981@linaro.org>
Date: Wed, 13 Aug 2025 15:00:40 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/7] Setting the scene to convert the timers into
 modules
To: tglx@linutronix.de
Cc: Jim Cromie <jim.cromie@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Marco Elver <elver@google.com>, Nam Cao <namcao@linutronix.de>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, John Stulz <jstultz@google.com>,
 Will McVicker <willmcvicker@google.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Saravan Kanna <saravanak@google.com>
References: <20250602151853.1942521-1-daniel.lezcano@linaro.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20250602151853.1942521-1-daniel.lezcano@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Hi Thomas,

was this series dropped ?

I'm not able to find it in v6.17-rc1 but it is in the master branch of 
the tip tree (v6.16-rc7)


On 02/06/2025 17:18, Daniel Lezcano wrote:
> The timer drivers are all compiled-in. The initial pre-requisite is to
> have them available as soon as possible in the boot process. While
> this statement made sense a long time ago, the platforms have today
> multiple timers for different purposes along with architected timers
> which are initialized very early. For example, a timer can be used as
> a backup timer when the local timers are belonging to a power domain
> which is shutted down, or used a watchdog timer when the counter are
> shared, or also as a pulse width modulation counter. Another use case
> is the platform user may want to switch to a timer different from the
> architected timers because they have interesting characteristics in
> the context of a dedicated platform (eg. automotive).
> 
> In some existing drivers, there is already the code to load and unload
> a timer driver even if the Kconfig does not allow that. It means, the
> need is there but partially upstream.
> 
> There were multiple attempts to configure the timer drivers into
> modules but it faced the fact that we were unsure if it is correctly
> supported by the time framework.
> 
> After investigating deeper in the core code it appears we have
> everything set for the modularization of the timer drivers.
> 
>   - When a clocksource is registered with a better rating, the current
>     clocksource is swapped with the new one. The userspace allows to
>     change the current clocksource via sysfs
> 
>   - A clocksource can be unregistered
> 
>   - When a clockevent is registered with a better rating, it becomes
>     the active one
> 
>   - A clockevent can not be unregistered
> 
> A timer driver can be loaded later because of all the supported
> above. However unloading is unsupported because a clockevent can not
> be unregistered and that will lead to a crash.
> 
> But if the timer driver has the module owner set, the core framework
> will handle the refcount correctly and will prevent to unload the
> module if a clockevent is registered. All the refcounting is working
> in different use cases.
> 
>   - A clocksource is the current clocksource, the refcount is held
> 
>   - A current clocksource is switched to another one, the refcount is
>     released
> 
>   - A broadcast timer is registered, the refcount is held
> 
>   - A local timer is registered, the refcount is held
> 
> Consequently, it is possible to unload a module which is only used as
> a clocksource. As soon as a clockevent is registered, the refcount is
> held and can not be released thus preventing the module to be
> unloaded.
> 
> That mechanism ensure it is safe to convert the different timer
> drivers into modules.
> 
> This series adds the module owner in the different driver which are
> initialized with the module_platform_driver() function and export the
> symbols for the sched_clock_register() function.
> 
> Cc: Jim Cromie <jim.cromie@gmail.com>
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Samuel Holland <samuel@sholland.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: "Peter Zijlstra (Intel)" <peterz@infradead.org>
> Cc: Marco Elver <elver@google.com>
> Cc: Nam Cao <namcao@linutronix.de>
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-sunxi@lists.linux.dev
> Cc: linux-tegra@vger.kernel.org
> Cc: John Stulz <jstultz@google.com>
> Cc: Will McVicker <willmcvicker@google.com>
> Cc: Peter Griffin <peter.griffin@linaro.org>
> Cc: Saravan Kanna <saravanak@google.com>
> 
> 
> Daniel Lezcano (7):
>    clocksource/drivers/scx200: Add module owner
>    clocksource/drivers/stm32-lp: Add module owner
>    clocksource/drivers/sun5i: Add module owner
>    clocksource/drivers/tegra186: Add module owner
>    clocksource/drivers/stm: Add module owner
>    clocksource/drivers/cs5535: Add module owner
>    time: Export symbol for sched_clock register function
> 
>   drivers/clocksource/scx200_hrt.c     | 1 +
>   drivers/clocksource/timer-cs5535.c   | 1 +
>   drivers/clocksource/timer-nxp-stm.c  | 2 ++
>   drivers/clocksource/timer-stm32-lp.c | 1 +
>   drivers/clocksource/timer-sun5i.c    | 2 ++
>   drivers/clocksource/timer-tegra186.c | 3 +++
>   kernel/time/sched_clock.c            | 4 ++--
>   7 files changed, 12 insertions(+), 2 deletions(-)
> 


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

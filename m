Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66EB9230BD4
	for <linux-sunxi@lists.linux.dev>; Mon,  2 Jun 2025 15:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748877559; cv=none; b=msYzCDFSa2/cDFsEYKR2ewFDG6ruqfi+vG4aaKsRzINV4SvEjnQ+wrL21/Dca8j2gYNlQhNzGmj+GHuS0+qJ43sHn3lirOMm5PlLNuK/I7xW3kZ8EcDXGSS/5ZqI2dnAWBV6GRfwxsN+U/MD8cuMp8N3E41Uf6Fk/Wi8wA3dLOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748877559; c=relaxed/simple;
	bh=qXg36nIEaSbraDl3K9/tt/qe1tR1XHyEOkFR1xkoAXI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a5BwxriJ+8cNSx5cCQXe7yGSDFwc9I19Nfo90B9W3yEFL1eqUlj8wWRQYSR+aInVEHkQ61g+vHLPXgsq91psVPxPCevmtb9rRmRgyczAqVB151M7BeMszra9v8gNuV0FV4683sEX4LmzUzJBcAWoa8tGh6egQTvDHpaLs4LUy0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SmNi9BzG; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SmNi9BzG"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54acc0cd458so5607902e87.0
        for <linux-sunxi@lists.linux.dev>; Mon, 02 Jun 2025 08:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748877554; x=1749482354; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S7FRnrLBkBYHmFUuH4KGx1nHshhZCeSgrXIZ5dzYfvU=;
        b=SmNi9BzGGhR4UUY97EvrAro/R6zfXhjl+tfv9maI03JP8mRTIW1LXrmAkA0eqL8HOM
         zupDlEpDp9D2Uofl8lLXqv9VV5ufiYQ3mSAhHVUTqAUDotuki19tgSBRBDk+INNxjz3j
         2SpU4SsVOvEoiuH37X64cmZmhPlyxyTlmwX26ZmfquuXz7IR7sMfgGi+1HcIggI7YWBS
         60+pc3TCcdcq/zH9xpmNW9YTtuppSo9rO7FP46aCQJI5MR4sVdjKVfyYcNEcTVHwmki2
         HOpt4fD//cWRYNowaAB7Lgqw7VRbmFrasoko3V6Gw2RM2/WB4Lgmbv69/mASX2q13IyH
         RYRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748877554; x=1749482354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S7FRnrLBkBYHmFUuH4KGx1nHshhZCeSgrXIZ5dzYfvU=;
        b=W5P6PUV1s1mwcOMlqdaUGhB3he7XINTsRpaylsSrCqmTSjIBlZpfU9gqsOgDX2dO3e
         y1ULyBS9TRfxR0eVtpXEy5XuzPhgy/ZsNkQBOwFvLvJiwDuSYZl/+DMU1+ABIkHiuESO
         dEOx3Wmak3uGnv42sjGAAcxvu30AToTjP5SK0L/L/Gn0/o6ictVinhY2XiLMj/6HusVe
         usNqWfAm4lKB+8RqP/mSbIILppw9iCuDox35cO9s493asX+z0awsiRxwI+kIy3y5E5C4
         QKW/NBL+56lhg1ZB7vFFLSscc9Cmv29ut6BdEut06oiWxVpJHoISPd+HRq8iUN96A7XW
         gVvA==
X-Forwarded-Encrypted: i=1; AJvYcCWMbbcGmck1V5vRuqxpxGFLPP5mfakkB69EnHKfjvyC6rdX9gtZc/u529N2yi8fJFShW0ES8tVqv3m9AQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YylVmwv6S4C+68f6tVt66EBwiqC5FV7gzePYbzoqEm6g3A81oNF
	eXP/aAICAVOryGDEplx8D7XV8i6U7vTXIopFGbgJKucxfhqOPY6KA2YSuimKQx3d2QZ6Jejz2tr
	3DEB5/wU=
X-Gm-Gg: ASbGnct1Ay1nTLSaJezhtrQLBZpioxDNEUUAgqRKLjjZfSjWAHCaYE6+4TkeXRsfSqh
	SYpXWPkqOtZiLtTEMDXWi0ks9W5xu4ynvvwerGv7mXg1KaxZE4JznJ2SycVnIkAgAi4cqzDeF+W
	GsyjyBikG8ANbaeI465+G4C7ZXTWz4JYt41le+J7Dq/ft1JHT6Jkyscr7pnPn0TYdKSnW8UhYko
	jDXE2JswqbVVzePszqsT0u5Ephjno4IHhwswmCbvxuz/sDe3d441hfiMLFKTxq81/4BnNtAhr8j
	DyfAtvZ6aEGPrSCxRjnqSImXH7Rh/d1cWNHp7ySqW90HYPLt/oTC2jxdJwD7Izy0Y8XLTy0JKoe
	cSpxlwtMr4GT9
X-Google-Smtp-Source: AGHT+IE+SpRjISuBJ+0qyPRe6UZcsVpz/N5qpzBFRSza5rkSFVM1NCoj9ElY/SVHO3bb6cTtRiaJ4w==
X-Received: by 2002:a05:6000:26ca:b0:3a4:f787:9b58 with SMTP id ffacd0b85a97d-3a4f7ab515fmr11075338f8f.58.1748877543609;
        Mon, 02 Jun 2025 08:19:03 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe74111sm15619844f8f.56.2025.06.02.08.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 08:19:03 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: daniel.lezcano@linaro.org,
	tglx@linutronix.de
Cc: Jim Cromie <jim.cromie@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Marco Elver <elver@google.com>,
	Nam Cao <namcao@linutronix.de>,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	John Stulz <jstultz@google.com>,
	Will McVicker <willmcvicker@google.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Saravan Kanna <saravanak@google.com>
Subject: [PATCH v1 5/7] clocksource/drivers/stm: Add module owner
Date: Mon,  2 Jun 2025 17:18:49 +0200
Message-ID: <20250602151853.1942521-6-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250602151853.1942521-1-daniel.lezcano@linaro.org>
References: <20250602151853.1942521-1-daniel.lezcano@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The conversion to modules requires a correct handling of the module
refcount in order to prevent to unload it if it is in use. That is
especially true with the clockevents where there is no function to
unregister them.

The core time framework correctly handles the module refcount with the
different clocksource and clockevents if the module owner is set.

Add the module owner to make sure the core framework will prevent
stupid things happening when the driver will be converted into a
module.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/clocksource/timer-nxp-stm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clocksource/timer-nxp-stm.c b/drivers/clocksource/timer-nxp-stm.c
index d7ccf9001729..bbc40623728f 100644
--- a/drivers/clocksource/timer-nxp-stm.c
+++ b/drivers/clocksource/timer-nxp-stm.c
@@ -201,6 +201,7 @@ static int __init nxp_stm_clocksource_init(struct device *dev, struct stm_timer
 	stm_timer->cs.resume = nxp_stm_clocksource_resume;
 	stm_timer->cs.mask = CLOCKSOURCE_MASK(32);
 	stm_timer->cs.flags = CLOCK_SOURCE_IS_CONTINUOUS;
+	stm_timer->cs.owner = THIS_MODULE;
 
 	ret = clocksource_register_hz(&stm_timer->cs, stm_timer->rate);
 	if (ret)
@@ -314,6 +315,7 @@ static int __init nxp_stm_clockevent_per_cpu_init(struct device *dev, struct stm
 	stm_timer->ced.cpumask = cpumask_of(cpu);
 	stm_timer->ced.rating = 460;
 	stm_timer->ced.irq = irq;
+	stm_timer->ced.owner = THIS_MODULE;
 
 	per_cpu(stm_timers, cpu) = stm_timer;
 
-- 
2.43.0


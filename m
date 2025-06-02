Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B27922D9EA
	for <linux-sunxi@lists.linux.dev>; Mon,  2 Jun 2025 15:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748877544; cv=none; b=PDtFdxlkskCofjdMFeMqqjYai/nM4Ts/yTpZeWyZH7SWA8tS9l5S/2jon0DalreZDKGHXCpvfyX494WsuBHG436PGtafHuqoORQg+WbR0RyGGPBLQYVqDmYBrkiMhwq8n2d9Hmyqf70Vi/N04H0ZpQJIc5am/PGdiIeYAZOSgI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748877544; c=relaxed/simple;
	bh=fAaZ3L9vEbtazUSHdMUtxxloxioTW1ggL5LaUshczj8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B8bwZPtjgwwTrttj3uCcaop6zbrai4VNVy2dy+hMXls8e7qNm/ReXYVGqANnqonnK5kPOgiRduqqQt+6XUddLMFV7TLrWBbJUEKhskD7c9UjIsvM+eMVXYKxGYdZizXpn/4jSbpgarLvdr1gIYvxHjMCtA12wMdEj/7vIyouRVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GGmNufES; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GGmNufES"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a361b8a66cso2721154f8f.2
        for <linux-sunxi@lists.linux.dev>; Mon, 02 Jun 2025 08:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748877541; x=1749482341; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j2bXZElBrRwneMKewEI3S9wHUbgph+s2MD8uEMc202U=;
        b=GGmNufESKoGOz64bcv7rCZUeHVpuKAN93Qg/MAcFXKUSf2Adx5Y9jr4KsHnZF1aLxR
         knGPp6GiZj87+qbqS2hn6t42bIM6FZNs6FBnNTf32+OaXU4cjLaJ5H4M7/WMdcPQfDC0
         ozEan+iXCyHlq52BY2MAZpBOOPat2c2wtHbfGqbwEtsVVMBvSc/MgyFuCYS7PGMtz6Ph
         I/DBDYYf0BOnqQxjxqoTH36QC3HOe8rTkBrN+fF/N/YM7MlYTYGSs23FelIdLutBj7fq
         Y4zNUIK5o7iLx3PH5iTwWWbPZqsOIB/IiFQtZCL10WhVy8kDJWELUp7FhvNQla6njKqk
         1DZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748877541; x=1749482341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j2bXZElBrRwneMKewEI3S9wHUbgph+s2MD8uEMc202U=;
        b=SKqrdBf5nylTr8oos3X98HQzU7bjqxteWJK783eSID2d9boB1g74DIXFnlYFE1+sS0
         38NE3evo+ZngaBORGZRleFFgj5nH1+3W2BFRq9u3COmietVQt5LK9Ipvg533lb3QrnJO
         Ivwhs34Y1+E2cg1JbqFVVjltIM2wTxXvLTo8gosSee0Qqlp+/miWtWEcbUAi3RaNBVzX
         g5ATZesNznPUO+LKaNeFZD5jaYHSmPUuFGEXTpfaycRMlVUtsLHSQVBwZT1Huz5HXa8l
         xrNGTTxf1KY/Y1i3/INSwNzeP4R/+/ppolQsDUKCk4A0JJTkVd/4ldx3xOlqW1yaRV/T
         3T+g==
X-Forwarded-Encrypted: i=1; AJvYcCVekjQQzihnAHcgBznpIMQXxVYByGnZHKGSyehZz6+0APwbTAa1bGrRt0ad9Rqr8JKgBRShEFqUQxfqpg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyn16ShS0a3zaP6Ne4P7qvUVFWLze1BxP4ARgBSsrW4zOOwhboX
	MhuQxsKHV8ChFjDgzS78eRSlimmmhi2Uz6Z2z5t9R23PX2EDIA2Yo9/JWXA1ytG46gs=
X-Gm-Gg: ASbGncs/2Umjqj+huGEOES2x7jPFhNfagzOrwiwm1eICd1mumQyCs9cdyVaMIUVuSSo
	1dq5ArybJizGLpxvhl3VX9qfEx6xNL3hqMBka6LkmQmpJz5qr+90RwfFutK0bkX6z29LempSH7U
	vtPW4n2csX5BD2ZcWaALWHb46q5LEwfAPvNAS+ImtjSf+PV/7e73csXGbuuEKdibFYtH6IqVl/0
	anf6mz7eGc8ZskCEBxYuLDi70xSN7uAXgTN056MARs4R4EBolKzlSupxXgJ0ahqWYOi2hNhVag5
	2HFJSrL+P8FtQO61OyvYWOKvmDoSFGerqtfMwDO/JaMAElaresjr/WpBdczvXqXWRt3ZyDPa8rS
	KP7bp9YX18evi
X-Google-Smtp-Source: AGHT+IGm8o6nqRRjiZlM8OEtcH7Giz5iqVqvOKIqNhMfKW6+DVKKTld7vkKIltD7iNqNITzYzwGGxA==
X-Received: by 2002:a5d:5c84:0:b0:3a3:7ba5:960e with SMTP id ffacd0b85a97d-3a4fe3a8214mr6931603f8f.59.1748877541180;
        Mon, 02 Jun 2025 08:19:01 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe74111sm15619844f8f.56.2025.06.02.08.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 08:19:00 -0700 (PDT)
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
Subject: [PATCH v1 3/7] clocksource/drivers/sun5i: Add module owner
Date: Mon,  2 Jun 2025 17:18:47 +0200
Message-ID: <20250602151853.1942521-4-daniel.lezcano@linaro.org>
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
 drivers/clocksource/timer-sun5i.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clocksource/timer-sun5i.c b/drivers/clocksource/timer-sun5i.c
index 6b48a9006444..f827d3f98f60 100644
--- a/drivers/clocksource/timer-sun5i.c
+++ b/drivers/clocksource/timer-sun5i.c
@@ -185,6 +185,7 @@ static int sun5i_setup_clocksource(struct platform_device *pdev,
 	cs->clksrc.read = sun5i_clksrc_read;
 	cs->clksrc.mask = CLOCKSOURCE_MASK(32);
 	cs->clksrc.flags = CLOCK_SOURCE_IS_CONTINUOUS;
+	cs->clksrc.owner = THIS_MODULE;
 
 	ret = clocksource_register_hz(&cs->clksrc, rate);
 	if (ret) {
@@ -214,6 +215,7 @@ static int sun5i_setup_clockevent(struct platform_device *pdev,
 	ce->clkevt.rating = 340;
 	ce->clkevt.irq = irq;
 	ce->clkevt.cpumask = cpu_possible_mask;
+	ce->clkevt.owner = THIS_MODULE;
 
 	/* Enable timer0 interrupt */
 	val = readl(base + TIMER_IRQ_EN_REG);
-- 
2.43.0


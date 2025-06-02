Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E342397B0
	for <linux-sunxi@lists.linux.dev>; Mon,  2 Jun 2025 15:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748877550; cv=none; b=V8L/H6SJ5/IAS+M5B7prw03mLUMYrwI+9kPW6cqYnMp9S6JpvvWwLdtHNqCXfz+hqEeHTipVuaXZxACUwwuPMj+1E/Vm2dkw1/GdSytuDVmc28ZXSp1l2+bxMUoaf9LDJWD7ryznt+hb2vvU8K+oiRUNCkb/RHFY6dq84nldbE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748877550; c=relaxed/simple;
	bh=GxbSdL0PyZ8UlejUoxlDIdlFpATxnSdyF2KX6oHR03A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aCybeJryPzWkwXZf+ivc8XOrj6QJhVfFy5NHeEQ1yLdd0DIYq05w+96nxPQftS8omsBgPL2MDQw2TJQZynQPcGNiKMSR1PqbHu2daYyGgpcp4FogCIdRihRB1UUl+rpq326KXJtRadY9Bf+lIkDUW0tcoV4PwXG3AWZQv976yyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fKqGqx54; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fKqGqx54"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a3771c0f8cso2775909f8f.3
        for <linux-sunxi@lists.linux.dev>; Mon, 02 Jun 2025 08:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748877546; x=1749482346; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h4kATdXtYuRJowbluuoUfq4iaqlYfYT07dwMRu/eijw=;
        b=fKqGqx540mMFOUAuTK7ZMX0Jvlp3c4I+6EhEF7JwGdflHZAfd97KPS3NGiujrAugKB
         Ddmgh6hyeGYISfvADa1oPCc4XHorINfq2CaA3Np+kRnD7ydSB1sPBGgEV3V0iw72VyUU
         ghLeSBU/0bs34sQAWGOPDCpd7Pe5HBN0ruW3X7JK4Yhgx3Fn4u2F6rZ5n8i4gm4kHBkf
         uMTGFKG9kVI3iCEzoQURNEikK0B9ZdB9zmrh9Gs1WVl+RVVlowuQdnL1dXtCEYLSQven
         WuWi6k7uB3vDRMoiYpXEvGWn/ZixsksGGS7bIiARnoedx5R/mJM1GXT5JDY3O+MJnGtv
         FUrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748877546; x=1749482346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h4kATdXtYuRJowbluuoUfq4iaqlYfYT07dwMRu/eijw=;
        b=I0/2Kw4DpsTwaAAj6RhN3CoqpFxK6Xp4qCr7IuoYkhJvoW2PIbgLac1v73sfRjpXY8
         HliXqzyuDqxkIDxex6Xs2GbIq7JIbxULyaa08gr8bChN7Db5AF4pgTFnHT/Qxb8NhOp3
         cKRFq4UM1j74+PEbjDaeaNbr8beTFoNrhsS5bsVcYuhTmb4GdPFGqqrQmMM3AFTba5F/
         PiLbqW5SN84K3V+YaYuWpTdbz2Ci+V3NySYws4NjXiKc92Dv7j61yJOyzOan5RdYV8D+
         FY20zOfVxTJTOrVP0nO7ZEmnXnM40tgqjPLEVgn8BsQimm9OYU6twAL8he3Sv8xQc3Kp
         eKOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYfIjiB8OsIQkTszaP4MjqgB2A2HexeAdlWYnMej0z9Ib/bpSEQza+Wp7h9drsrk5IChxUc24IClwo+Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YzUXeZ1jM+z/FlR05xGsn5aiJYMODHfpTJGVbBndFdtVU/mmRBK
	AIVReEdyVMXlIicaWuN32n3dJS7zrSA41ozDg11D85G4Xy2IUTMM2xrd937K/et/XNM=
X-Gm-Gg: ASbGncsqio6xA8GdY47nyFEzLVo7N/03T5tB8a6n5G3jjY91FaYO/2EZMjmp6jlQB6q
	C5jGqdm+/p029KchNkm70OMfsFj84KDA5HHs26M2EUrdPQfwr+z2aHOX1qEtTQ2PySdip387Svk
	k8QhAuOXn0f0PsAIuuf77PPWtmytFVbSUoAKvPe94tynbAwJxL+KkX1BCV6yhZj/b71eija5k7Q
	EtwYshj2eP+jly3runBxBuhw74FW21f6QAgZ5P0p8ZR5IRKJaxQ0b4Qkh+YgL98T7oB6QVbUu9E
	qIifleI/A1hmJWjWpjJXoq07oPR9K4YapqgbIWUjEqjGOSHufIJdF0qjCGNdeB/oaMHNRfwE/fG
	ZXQ==
X-Google-Smtp-Source: AGHT+IGo3+b4mB4bJZk3jsrIr83JxAnU/93JoVte/2RVs9090BDS0xWFY0i+YN16EfaKcepr/Do0FQ==
X-Received: by 2002:a5d:588f:0:b0:3a4:de13:2a25 with SMTP id ffacd0b85a97d-3a4f89dcb7cmr10264360f8f.45.1748877546552;
        Mon, 02 Jun 2025 08:19:06 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe74111sm15619844f8f.56.2025.06.02.08.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 08:19:06 -0700 (PDT)
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
Subject: [PATCH v1 7/7] time: Export symbol for sched_clock register function
Date: Mon,  2 Jun 2025 17:18:51 +0200
Message-ID: <20250602151853.1942521-8-daniel.lezcano@linaro.org>
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

The timer drivers could be converted into modules. The different
functions to register the clocksource or the clockevent are already
exporting their symbols for modules but the sched_clock_register()
function is missing.

Export the symbols so the drivers using this function can be converted
into modules.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 kernel/time/sched_clock.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/time/sched_clock.c b/kernel/time/sched_clock.c
index cc15fe293719..cc1afec306b3 100644
--- a/kernel/time/sched_clock.c
+++ b/kernel/time/sched_clock.c
@@ -174,8 +174,7 @@ static enum hrtimer_restart sched_clock_poll(struct hrtimer *hrt)
 	return HRTIMER_RESTART;
 }
 
-void __init
-sched_clock_register(u64 (*read)(void), int bits, unsigned long rate)
+void sched_clock_register(u64 (*read)(void), int bits, unsigned long rate)
 {
 	u64 res, wrap, new_mask, new_epoch, cyc, ns;
 	u32 new_mult, new_shift;
@@ -247,6 +246,7 @@ sched_clock_register(u64 (*read)(void), int bits, unsigned long rate)
 
 	pr_debug("Registered %pS as sched_clock source\n", read);
 }
+EXPORT_SYMBOL_GPL(sched_clock_register);
 
 void __init generic_sched_clock_init(void)
 {
-- 
2.43.0


Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE1422259F
	for <linux-sunxi@lists.linux.dev>; Mon,  2 Jun 2025 15:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748877541; cv=none; b=dm5y5T1ubND5LA/3/xHCtL9x1qlf1KzltunmJicKzq8Z2HQg1RacG6zbIpYX+WZnHo2G3mn8fAZuOFuUlk831iwP6ctFV3iv9fVAcQpH/GNIcsCp9EF0a4nA77epvFcBUGK8Kcu10AOcfZxW0uC1e5GDbulSuch2yLI/7xCA+Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748877541; c=relaxed/simple;
	bh=oFAT+NNKGnh5VXgaLf8krwrz5XSrHjhFetyALYSIt7M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mQvPLJqoPknh3dKFzrpodszsmYI6RKtntL0I/V5XlG1/nCDWl6ufMEsFOGhd5yJC8E8xuGp2k86JjS/34yx/M1qGz/5tRcb3jxIcNgm5xVhegU83Bx/PzFnuXv6u8ChaVA0YspeW1PnAVPMkLUukuBJBpCyIoe1D82DGuXtHKK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yy4tqr0M; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yy4tqr0M"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-450cfb79177so23853185e9.0
        for <linux-sunxi@lists.linux.dev>; Mon, 02 Jun 2025 08:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748877538; x=1749482338; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IUg1jDrh7o13xIeD5Z16HH35vSn20OCOm1MqSRrAi94=;
        b=yy4tqr0MdQ1bHgurqC537AmNwVaQEVbCnrzqdUPIQuRxJioEGKvtIKiG/mbz3W4auY
         mirIz3Zjkw2eCzV8mwSbKaH+kYFMUjWD+YAmVlCK3VlSIgboL1m2f+CvMp3I3cB3j6I9
         +pDzdBmHY5odnE7sTRAFclpZq5rsp1QFwAzp2A0qWASssoc/owuOrRhloPXM+5Sb+eYG
         4iLNeJLffE38hoO6Gebx92HTVzahXU/7LmGoiwRJSzXmvNeUwwh59Rt487Nv6Tu9QVjR
         jnU1Hu0k9nC+REMquAeNP2Zq4iznAmYCrDjxtGPYZtV6UHNr7F6bByKbHoPSsCdYGCKZ
         SBvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748877538; x=1749482338;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IUg1jDrh7o13xIeD5Z16HH35vSn20OCOm1MqSRrAi94=;
        b=TatTDIYYYTuPvm4xn52/zOfGp3o0GL2tf++B4h9RuCFee1/OC5Atl058qr4ZxSxq4V
         O5YlHChmJNr1IcFAcmSwqqzg9C7LwWS8kDbUrpUelL0tJ3OA9iuRjcNdB3FrJgGDkdVz
         8KDLU4TXhJCbPjWMeI6RBXflq2soIQxP+zbUCIRCKUIPoc8/Kka7tVY+MfF5AO0zpi2J
         KLBu78uBnLLSzxPBm7DXDenHuaVeudEMcIUkxXzpIe9HigC3hHIqKMZqps98v38h1v+D
         VD17O1YzetSzSpPkDuy8H9pXrtw7ZfMfKql6RAn30LSRMiI6BGC9FnD+CzfMuFsy9rNb
         xjOg==
X-Forwarded-Encrypted: i=1; AJvYcCWJNFEYqZjB0vzwtXeocT2arGsAVyIZPKHnS6MGdWUJeYttxkoruc0CfVqhKfpvryf9Nik4ounKqBYikg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9wBi7WHTgF3zlTkJfBpxnLyW2mmTGLCvZL++Jt7jtEa1QK3Ny
	i6L8h+Qy89Yd8RhWLCEdQ523KePHBtiYbQz00T6+ueXtQHPXOtdaMh6fNsadJHyl/hE=
X-Gm-Gg: ASbGncsgYsU5QbE39J5k5bjB8IS1YGngfxJVCWfL8pOyhOqJ5yVd4HfCiIeS7VJiVsa
	TiRDmSYel10B56Ua6rOR9Y0w9Fy6PY1Q/FjS4jZjkFpI8ktlYJWNuGCjBZtWvcXWFQtP/vSnW/2
	uU/IdUwE3bCeKUlkeJbMAfKh61mk59eU8nHVBsOmTPmn7BhSvB4QQ/wqvMMwQ75lqfzoAsD7CnL
	e92BFRgNTu5QdocB3x9kIqsrQp7HDCv/3QI2dfYzN1SqJajlT8mgnAz25hBOt2YBMvrHJqXKT30
	F8/nUGI0c6s5XGBP4gz+0OkChypa3mb/8i6IxN6fJdUticNhLsPklZxaiV/mLe2Dn9jb0j4V8rI
	qsxjJqBcT9iSz
X-Google-Smtp-Source: AGHT+IGd9hG5YHfH76nGmto9bsoX9DJOOYs0jiBYnyQonK2UIDx2uNqiKNlTaeCJzRAT0d46DtaI3w==
X-Received: by 2002:a05:600c:4fce:b0:450:d367:c385 with SMTP id 5b1f17b1804b1-450d886f21bmr129966005e9.16.1748877537630;
        Mon, 02 Jun 2025 08:18:57 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe74111sm15619844f8f.56.2025.06.02.08.18.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 08:18:57 -0700 (PDT)
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
Subject: [PATCH v1 0/7] Setting the scene to convert the timers into modules
Date: Mon,  2 Jun 2025 17:18:44 +0200
Message-ID: <20250602151853.1942521-1-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The timer drivers are all compiled-in. The initial pre-requisite is to
have them available as soon as possible in the boot process. While
this statement made sense a long time ago, the platforms have today
multiple timers for different purposes along with architected timers
which are initialized very early. For example, a timer can be used as
a backup timer when the local timers are belonging to a power domain
which is shutted down, or used a watchdog timer when the counter are
shared, or also as a pulse width modulation counter. Another use case
is the platform user may want to switch to a timer different from the
architected timers because they have interesting characteristics in
the context of a dedicated platform (eg. automotive).

In some existing drivers, there is already the code to load and unload
a timer driver even if the Kconfig does not allow that. It means, the
need is there but partially upstream.

There were multiple attempts to configure the timer drivers into
modules but it faced the fact that we were unsure if it is correctly
supported by the time framework.

After investigating deeper in the core code it appears we have
everything set for the modularization of the timer drivers.

 - When a clocksource is registered with a better rating, the current
   clocksource is swapped with the new one. The userspace allows to
   change the current clocksource via sysfs

 - A clocksource can be unregistered

 - When a clockevent is registered with a better rating, it becomes
   the active one

 - A clockevent can not be unregistered

A timer driver can be loaded later because of all the supported
above. However unloading is unsupported because a clockevent can not
be unregistered and that will lead to a crash.

But if the timer driver has the module owner set, the core framework
will handle the refcount correctly and will prevent to unload the
module if a clockevent is registered. All the refcounting is working
in different use cases.

 - A clocksource is the current clocksource, the refcount is held

 - A current clocksource is switched to another one, the refcount is
   released

 - A broadcast timer is registered, the refcount is held

 - A local timer is registered, the refcount is held

Consequently, it is possible to unload a module which is only used as
a clocksource. As soon as a clockevent is registered, the refcount is
held and can not be released thus preventing the module to be
unloaded.

That mechanism ensure it is safe to convert the different timer
drivers into modules.

This series adds the module owner in the different driver which are
initialized with the module_platform_driver() function and export the
symbols for the sched_clock_register() function.

Cc: Jim Cromie <jim.cromie@gmail.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Samuel Holland <samuel@sholland.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: "Peter Zijlstra (Intel)" <peterz@infradead.org>
Cc: Marco Elver <elver@google.com>
Cc: Nam Cao <namcao@linutronix.de>
Cc: linux-kernel@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-sunxi@lists.linux.dev
Cc: linux-tegra@vger.kernel.org
Cc: John Stulz <jstultz@google.com>
Cc: Will McVicker <willmcvicker@google.com>
Cc: Peter Griffin <peter.griffin@linaro.org>
Cc: Saravan Kanna <saravanak@google.com>


Daniel Lezcano (7):
  clocksource/drivers/scx200: Add module owner
  clocksource/drivers/stm32-lp: Add module owner
  clocksource/drivers/sun5i: Add module owner
  clocksource/drivers/tegra186: Add module owner
  clocksource/drivers/stm: Add module owner
  clocksource/drivers/cs5535: Add module owner
  time: Export symbol for sched_clock register function

 drivers/clocksource/scx200_hrt.c     | 1 +
 drivers/clocksource/timer-cs5535.c   | 1 +
 drivers/clocksource/timer-nxp-stm.c  | 2 ++
 drivers/clocksource/timer-stm32-lp.c | 1 +
 drivers/clocksource/timer-sun5i.c    | 2 ++
 drivers/clocksource/timer-tegra186.c | 3 +++
 kernel/time/sched_clock.c            | 4 ++--
 7 files changed, 12 insertions(+), 2 deletions(-)

-- 
2.43.0


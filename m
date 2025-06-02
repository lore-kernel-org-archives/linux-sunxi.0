Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C718622259F
	for <linux-sunxi@lists.linux.dev>; Mon,  2 Jun 2025 15:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748877545; cv=none; b=JszzIEBb9LglNXIiskOtPsKM6XK/IlzGcDcvWtjvylxCkupmXcxE6H1UZPbWcnGCLJsRMgFRDzGntzn+VBIsnHFX3v1piBWenPbf3HMsXBaub7/maFOg3UiQE/iq+cc6gY1WKDGL2kusANdwWqm3UMKLgqED3vLzVcJmUA2sPfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748877545; c=relaxed/simple;
	bh=2hHPT0ZatQTm44Z1t6wExkfhxFsepGpoQ7pDrN0NhyE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gOx69Uw7NDXBDTM8M2oTZDjYBOeCBMiMFgOATveBKyyyDgJ0F1SmHNYCXhz0WQGDnHTS/8566Pk2DqwvhdcHGpbQAgrZmpopm6lSyYL0f27CF0CD5xmDZUu1fy04iwJa8rzGuCZtuwOswonJkI7BJYMGlFEmjZjSPHGs7Z79gEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F9hIZxIx; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F9hIZxIx"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-450cfb790f7so33345635e9.0
        for <linux-sunxi@lists.linux.dev>; Mon, 02 Jun 2025 08:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748877540; x=1749482340; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4yhV1VS1sZnr/B/j9eDazI/vJTndFmPooDhpyVC7xA4=;
        b=F9hIZxIxU0lyhMGEi7izzdEQWq5g6m9O4SLE95o9xMR9m/G2SrCWKEjoy5iqNAfef4
         GLwLPmccNHQc/k7stKax3jUVaO2fwFgKotR8cr9PZ+MFoqOpoJXlykPbSzYsPSWc7+ix
         on7YYsh8jXso/bMoa6pH9/n6dHpzbkEnw+4gsLZs0vNdSNchwmqxBcAFwo1dHZzXp9md
         2wx6UbseAkkbeeJrjdS1ZJbT+9EnFLe6d6dpqsjGWB03vjuHkjZj3RDO1QstHdiD3cUx
         6mFNg74kw4GQuJh94G013+4wzi9b0Uv1PykpY96p/WgMzV1MhSwFSWfX0o9eftke9sKG
         K3iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748877540; x=1749482340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4yhV1VS1sZnr/B/j9eDazI/vJTndFmPooDhpyVC7xA4=;
        b=a+g6sEHtWiCsIl/REbmT8ARUtGS4PT3GNkq+1xXT5zRaJy74I/KELke/rhuSUsodv5
         Gc6EqOxg7luiovCzqt1NULg5c5ex+c3slehFxO3NFMdHWkhdgN1Eki4DzrmxkcDnc5iy
         PZ/i7mc9H9ezZ0FhjazSMELmM6/QvLGMzrrV8d9I7zWPpL8qKBATqJ1s+q4J8gHreHQz
         lXbTTE4yX8h5zqkeMz4+KKXBopE6RQ+v6aEYNxrzLEK00YkYylpP7q1XV8E1dSDTNPgs
         3mKT4e5/VHe4IhEdzd6ILy5TQnKK+nWRxZTjzogl0kH997YHmsgIZQKDVUoM/d80n6Ns
         O1BA==
X-Forwarded-Encrypted: i=1; AJvYcCX3VKopCDwRWrzEPoMomgDdqAzkGkxwwHsBljAZgXdAPuo9keM7tVuxtRhPSPzkx51C3OlWOmOQHJSlWw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwYPYSTFnT+p/SV3VJ7Uql2gXAgN3AAFBnRHGZu4EXNLZjN7AP6
	9+OnykBBlXcpGll4UkEgBwkTf4WcyKYB3jCUl1BSmXg8B3OPgmCp0/+/ALPWsAsW7A8=
X-Gm-Gg: ASbGncsOvuv2LneJSYcyq4zNb5OhUyWz+lhaVrqJfWS3/Da3b2kqTYkN6pw6sdmzwPK
	kmJGoz+ZmjJaPCEUpXQT74czSySSM6Jl8Kz3pfHjLbkLZ/zyQR066nch2geReygiHNOTO5mQQyn
	uFRpwAJ7mTjsDAxtVVAsiFTVaHXQgmjZ+/mVBJf1Jr9zmmB/tQyV1I30x2ZLjFezXgRcNgv9Oma
	mAXvCCqQMQBBzoavDK+CY/lIDS2qH+fbG87PdqJuQ4qmCMU3+ftQb17R/+tnbKGgEwU6RrYOV/E
	BsIoZRlyCS9FAe37vzI8Hx3oZFC3+K2miYHcqVaPb1TzSLh/ktk3PiqVeKrlldZLqW3Jid2t28T
	86I+9w2hiwJzW
X-Google-Smtp-Source: AGHT+IFyISAqwMHhCGLRj9aCfOACSARamwm5CChRIpOs6jPFxpI1R1pUgcUMERHo5kjL0SIXDlP4UA==
X-Received: by 2002:a05:6000:18ab:b0:3a4:fb33:85ce with SMTP id ffacd0b85a97d-3a4fb3388bbmr9485326f8f.46.1748877540038;
        Mon, 02 Jun 2025 08:19:00 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe74111sm15619844f8f.56.2025.06.02.08.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 08:18:59 -0700 (PDT)
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
Subject: [PATCH v1 2/7] clocksource/drivers/stm32-lp: Add module owner
Date: Mon,  2 Jun 2025 17:18:46 +0200
Message-ID: <20250602151853.1942521-3-daniel.lezcano@linaro.org>
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
 drivers/clocksource/timer-stm32-lp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clocksource/timer-stm32-lp.c b/drivers/clocksource/timer-stm32-lp.c
index 928da2f6de69..cf1423ca00d0 100644
--- a/drivers/clocksource/timer-stm32-lp.c
+++ b/drivers/clocksource/timer-stm32-lp.c
@@ -159,6 +159,7 @@ static void stm32_clkevent_lp_init(struct stm32_lp_private *priv,
 	priv->clkevt.rating = STM32_LP_RATING;
 	priv->clkevt.suspend = stm32_clkevent_lp_suspend;
 	priv->clkevt.resume = stm32_clkevent_lp_resume;
+	priv->clkevt.owner = THIS_MODULE;
 
 	clockevents_config_and_register(&priv->clkevt, rate, 0x1,
 					STM32_LPTIM_MAX_ARR);
-- 
2.43.0


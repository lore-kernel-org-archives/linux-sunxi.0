Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2D01D8DFB
	for <linux-sunxi@lists.linux.dev>; Mon,  2 Jun 2025 15:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748877546; cv=none; b=Imhz34AmjpY2h2eu8QqCLEn3xjWTbNK/sC1zkKhGwhsim7KDjJ7c38kipbXZo7XcaOPiaHxGctylBgq9P+oqQQlHZMubFaHLqlEINii4AEx+AQkxxKcvbhaToR9gZyD5ZoqOpDaUR8gwSchLJ4UDe6Uf5k8UUOcDZUMCdcxt8M8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748877546; c=relaxed/simple;
	bh=06sqAxtbKKs7o6LiAk2AbUdTVmELzxncQQECi88QF6U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fugm5+U1KHG3B/sgsLo8POiMAYlADv69164CXISP/SWLVrMd6tcUau4VkJcAssJliZZZinA7rk6ui7mnBVybDR3mo1QEKKLmitodlRNBHjxLrc11ga4VOOUdrnMoSVlE5kgJn52VRQO7h/o5XZ9pcDXj5cmEjoJxBt+5EZfTwSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bIMo4uue; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bIMo4uue"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-450d37d4699so20543255e9.0
        for <linux-sunxi@lists.linux.dev>; Mon, 02 Jun 2025 08:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748877542; x=1749482342; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c3ov+Lh/6++7opN5JtzuefcSmMhE81eYS7f93OD6TWo=;
        b=bIMo4uueHo+jgUW0tuMY+jnbrYPXSs08ZDSUO2aHa64vmFLIu43dUXT1iu38U2TfDo
         posjto4kKV43KhdDXX+YHhdasXCu139pkhmZgnSriT7AEfXiquuGCQDxbP9su+MKpfHc
         v8RvQWZ3AI3/e1ep5JomWIwuDiGVVrRcchLluC1+i4e45ZEje/N3BT94EaYh2WvVtChd
         Xmqv/bg2fNNV2aa8rrECMQj9veLhGKKS2yb0vKtFw5USE9egXIuDjS8Meljzg2sSQTep
         Wx1zahyXQ7ZH4Bh5WBL+vgZO+TmB+K2B2lnbMloKfvyfxHA4bBPNguaYAP5RQGNIPVR4
         zNDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748877542; x=1749482342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c3ov+Lh/6++7opN5JtzuefcSmMhE81eYS7f93OD6TWo=;
        b=vrAooWO33sv2LutIEzEmpZR2zdKqk2mlpYwkzK7vj8VSh3uC5gmuIcWI+Po4LCQv1y
         AxnlaSDl0ubQGQ1dimBuA/N+0UITKMNcGmR/yctd8tYwlIm5DMhEByRp0fQfQ0iQoXiH
         dlln1vnGEkT5vSGOhJPU7oZAFkQLwlpMdC+hQwuZEUMCW/H+cXSWVv37Otx8yX1FwtWu
         USVkMl4gsrfExkwnfgM48vPFjOVou8k2G+WfbXe92904aHZWaPZzCHzYi7KTgrTFH6+L
         lkpnODRKlvlXC/2UhZY+lbZAqtSKtn9FuyD6rKgB8eO4KGFA20GidHv+r/gbRJdgdduw
         dNlg==
X-Forwarded-Encrypted: i=1; AJvYcCUSTrZ4M2JznmJA6BR5L5sBFX/mPsYBnubfwgkDRmw2JiMDx9z9ooM/vO70dPIRuwlELIg8SddcJVNT0w==@lists.linux.dev
X-Gm-Message-State: AOJu0YxeYWTENxVTfX+ySjByWzyxpdEkbEw5eN+XBBlom+sZrcCEkXG7
	f/MxACOHf1plmdvcnn+hvz/HfKYaw7fNrybPepnZc163DgEIn00auLJcgXrLjpKnX28=
X-Gm-Gg: ASbGnctYeORw5rYzYBummyB7EMJuWv3DHAT7Fn2mAKiQrngmNKenSdDMVwCV+tyCSGx
	dzjchgWSO/vHb6B6nQjnCGw8EP66/yzxu7k9PvO+ko29axHsUVjbuzwGiw8QSShcWA12GhX1IlF
	m2zclfYdJeGGpUOyVQI2MA7+oqCeO/GH/6IVsNQBHKzepYDNMw4+VWoqRlzZ8yTfFFwoEKNa/C9
	1TjISLrK7PmpBXSdYxLnXp0wWuUR+u4ZiPHx5MW/s2/W3al4PgleQnMO1ex5dMfUDoarno/Ky7k
	vSqvQpSSBxUvvQtop8UmewKK0k+VwvmE3jVgVXRekWrkhG6w0hXdw4A/YP34EWHE6ZkHusUg2uJ
	octI2kFDkrtqH2LnSJ/mt6Y0=
X-Google-Smtp-Source: AGHT+IHj81bY8BwahqqDfoqRAaq8f0rnARhmXR6p0QX+Wj5JW6k3OiLTjugCeEjr1Ne+gZ4EEgbmkg==
X-Received: by 2002:a05:6000:2906:b0:3a4:e2f4:a86b with SMTP id ffacd0b85a97d-3a4f7a6d22emr10375633f8f.37.1748877542385;
        Mon, 02 Jun 2025 08:19:02 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe74111sm15619844f8f.56.2025.06.02.08.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 08:19:02 -0700 (PDT)
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
Subject: [PATCH v1 4/7] clocksource/drivers/tegra186: Add module owner
Date: Mon,  2 Jun 2025 17:18:48 +0200
Message-ID: <20250602151853.1942521-5-daniel.lezcano@linaro.org>
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
 drivers/clocksource/timer-tegra186.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clocksource/timer-tegra186.c b/drivers/clocksource/timer-tegra186.c
index e5394f98a02e..56a5342bcf78 100644
--- a/drivers/clocksource/timer-tegra186.c
+++ b/drivers/clocksource/timer-tegra186.c
@@ -373,6 +373,7 @@ static int tegra186_timer_tsc_init(struct tegra186_timer *tegra)
 	tegra->tsc.read = tegra186_timer_tsc_read;
 	tegra->tsc.mask = CLOCKSOURCE_MASK(56);
 	tegra->tsc.flags = CLOCK_SOURCE_IS_CONTINUOUS;
+	tegra->tsc.owner = THIS_MODULE;
 
 	return clocksource_register_hz(&tegra->tsc, 31250000);
 }
@@ -392,6 +393,7 @@ static int tegra186_timer_osc_init(struct tegra186_timer *tegra)
 	tegra->osc.read = tegra186_timer_osc_read;
 	tegra->osc.mask = CLOCKSOURCE_MASK(32);
 	tegra->osc.flags = CLOCK_SOURCE_IS_CONTINUOUS;
+	tegra->osc.owner = THIS_MODULE;
 
 	return clocksource_register_hz(&tegra->osc, 38400000);
 }
@@ -411,6 +413,7 @@ static int tegra186_timer_usec_init(struct tegra186_timer *tegra)
 	tegra->usec.read = tegra186_timer_usec_read;
 	tegra->usec.mask = CLOCKSOURCE_MASK(32);
 	tegra->usec.flags = CLOCK_SOURCE_IS_CONTINUOUS;
+	tegra->usec.owner = THIS_MODULE;
 
 	return clocksource_register_hz(&tegra->usec, USEC_PER_SEC);
 }
-- 
2.43.0


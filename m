Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2573238D49
	for <linux-sunxi@lists.linux.dev>; Mon,  2 Jun 2025 15:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748877548; cv=none; b=ULSzRcSrd/V5derBBSega9La1YgOw/INUWmXBgXMhvwkQIwgHNFvo1NpMlp++9fuX5SxWBN7q9GyNfEMXA1DDMdhziezP0X/Au05/hvy4lFc5ej1CorTVEVzxJO6FUyWYwQfeeRhMKbni2ZhkTpSg2lATxHfNyRb1issm/aeycQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748877548; c=relaxed/simple;
	bh=hUv0mIWbDZHw2AgsshB1b4pGaBwY9mA7lDi8KBrhZs8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t0oDcotIXL+dUeYHFjhFEqidrlM0DSWBTxoe/KUVEOqFgpVqt//t2zX7QflMEDf5T10VrzSGXIQUZF7KqRsYH9rklCUid+Isne+vyWYV02kHbAVXSXJIXY+iUF5Tg2UJFnunzQEF4iOgFbC2qDdP2BmrPX3SBFmt9knpiji4pag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KsOxDfYc; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KsOxDfYc"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-442ea341570so31275415e9.1
        for <linux-sunxi@lists.linux.dev>; Mon, 02 Jun 2025 08:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748877545; x=1749482345; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tl3s+9qrNZSInC+4si9W3B7aYz8t+YyXNiXQyckQzoI=;
        b=KsOxDfYcc5FchR2m2BUjCBEoxYQV5Zwc+M8PLSSJt+RgJh/RC1TsCogYQ1lGekbZBT
         4CUDrZoUcd++pjz6oZ5HJqHdqNytOBZPBMKFC6mdGk8hyW7KylN4zqGkgfStbo5PcQXM
         mwUg7m3gAMChTWkKgcKU5GlixGIZWee57etlfQi93D01iDIx9ulVog4AhEfev1czobbe
         nEdH0D4vTaF5lCYuexqSXmBE9HDr6c0Tl2vUnczkBi1NWNBE48Y6tfTdDRgkLD4nRnM5
         l0Bhq6oZMLWxAiRvDEiaOjo86gSox5tkGQmExENIOk63U0cwLqLa60sU5A3nGzTnTZiw
         hvvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748877545; x=1749482345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tl3s+9qrNZSInC+4si9W3B7aYz8t+YyXNiXQyckQzoI=;
        b=tJB3IsxS+aG3POwm+rRedJQPMf+BBzyPPuIm5bvO0v+FbnX9SKVDVYD/zFVVb/Un9H
         ONUPeGZiHtohgQC4drmYBsweExmSZkOdY8R37NftF4KtcLf4MtFVNUYKl9Ogd7bekwAg
         xhiZY5x8kjzARuBQERyLSodAEGb+df2er1fH6M2WczoFrW/TDUnb/BWotAvk5/ueF0xi
         yB/iRsPb4ZOumdzMh980GKjRzZvqKhwumOwl0vVwZbyuEWynfwudFJEUp7moRt3JsNau
         SM3dXqNdAp3+2n8p5yh0lsa7E9FmBF6RtYFnyUME19bI6p2DOd3OcU+Qd06+8hmnpmV+
         vGHg==
X-Forwarded-Encrypted: i=1; AJvYcCUTA6TSVrsFkbU/T51fA64QnX+nv36DtSc/AjvOfA+fWndV2uNVxIYhBLfv5TGBQ0nQlVGdqk3EFO6jJw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzjAlKhmUQvbUaHYehNWpNdVkW0nIPtWFnLvU9LprJLAp1/76sy
	/4+HYc3BXR6KzsFTWAXGc5a2bsr1t65XHcOOKRpqSyTbtlmC/ut/Btt9e3GSSs7jTG4=
X-Gm-Gg: ASbGnctiIFnxVYSi/CLxTzvnPFMPfZk3tEbpldJuoXGNE5FDFFu4YnpHFh7gmUKUoSy
	DSnI8k3yr6DaZ0Vy8HbdBInQUgxRiIT+LHuDzyJcLUr2ZsUE4q3BlpvvpPoKP+RFKPFAMl5u3RM
	xw92iSqmUgtjzYIgPnJ/aRKYNwWe8TALw0zKhVmPfgBJmTK/xAeQxsGOPUnLcFnUcagthH6nKK4
	yoTwqlNwwP6D3qgbu92EjK1n8dUr3lKg/jhKq7J284U3tTL+jqh3Dj6KT37u0EZU6F29qdU/MQB
	SFfDrLd6MOMGlMNGObfgcajr3ITLIJkOzvJuifUTPteraN8sj7oqjZwCTov8BjsRCV4MUKws3TA
	TIZi24HAr3Qvd
X-Google-Smtp-Source: AGHT+IGtDDtI7FhuuIjfq30FaLggo6siUgKsnVHXy0In7YrLSlYbl67D9UVPet7StdoKw8HT/BY3WA==
X-Received: by 2002:a05:600c:3e06:b0:43d:b3:f95 with SMTP id 5b1f17b1804b1-450d888b0femr83074465e9.28.1748877544845;
        Mon, 02 Jun 2025 08:19:04 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe74111sm15619844f8f.56.2025.06.02.08.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 08:19:04 -0700 (PDT)
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
Subject: [PATCH v1 6/7] clocksource/drivers/cs5535: Add module owner
Date: Mon,  2 Jun 2025 17:18:50 +0200
Message-ID: <20250602151853.1942521-7-daniel.lezcano@linaro.org>
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
 drivers/clocksource/timer-cs5535.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clocksource/timer-cs5535.c b/drivers/clocksource/timer-cs5535.c
index d47acfe848ae..8af666c39890 100644
--- a/drivers/clocksource/timer-cs5535.c
+++ b/drivers/clocksource/timer-cs5535.c
@@ -101,6 +101,7 @@ static struct clock_event_device cs5535_clockevent = {
 	.tick_resume = mfgpt_shutdown,
 	.set_next_event = mfgpt_next_event,
 	.rating = 250,
+	.owner = THIS_MODULE,
 };
 
 static irqreturn_t mfgpt_tick(int irq, void *dev_id)
-- 
2.43.0


Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8578422D4DC
	for <linux-sunxi@lists.linux.dev>; Mon,  2 Jun 2025 15:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748877542; cv=none; b=PNFgZFVjfz4R3T3OWcc6+unOZYz8x9wexDLuPuZqhSAUoxULQyBioZEjXT1cDrdU1J3bz7gG5WR9XokLCdvPTKmeirSrAHu6pzOh/lW/T+o/jz79bwvl2zfP0a4F0ph7FyxxDi5v0ZaHTdLNcZYVEXyoDzLb867uiwqv5U3WDSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748877542; c=relaxed/simple;
	bh=e1Jb8L4233LQhQU2TG7JzzCgR61N68NgK8m31ehsPJk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FOVjMyFHh0yqb9D4bC4uqLZR4u1KcZgmoxcSv0J8VSR0rU/uJTs+9UC1TILVEfLbMh8VY3SdtyE9Ko4ZJGfyZe4XoYbnd2yfSx5nZiSGGF94gVbfxU2ykIR3YyvrG4LyLC5B97ZR+pOo4MGbzDejK2EQXMyrbEoZNVmTc/kKO3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=maAbWibD; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="maAbWibD"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a4f379662cso3506713f8f.0
        for <linux-sunxi@lists.linux.dev>; Mon, 02 Jun 2025 08:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748877539; x=1749482339; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yYI0Df/Q5zXhStAf9TQ+dtCVBtZRyAW6V2IwV5wSjV8=;
        b=maAbWibDxQfW8utHjfdP5WuszymGad/yNwMqOb7PF9b29znvKn0oocwpGcQkYwI9X7
         zHd3BBPTPlBotz0Nm3wk9B3XwEbqIn4djMmIVcTmxRbAlsbWJBcUfK2ZlEPyxDwP0tUV
         63fep1XDIFkIsbSn1PVf6zDtVl+UMgQ5M6k3IPB7TBt2vl/e9WgTGI7qubViN57AgAzz
         NB3uV7YxiCkb3+RDVGQbiDqaBgDsg45n/U0pmwT9670THXRko6/puUmXgI/kUkahpPLO
         L1fFtPiw7Adyy/F+eUxS+s1b2gPvReL0MRVzUO+chhL5kq+ByXANjrMl8e0vAf4KL/Gw
         ++hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748877539; x=1749482339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yYI0Df/Q5zXhStAf9TQ+dtCVBtZRyAW6V2IwV5wSjV8=;
        b=XIXBdtOUO3h3J6ChVaRkQgrBeeQ3cTeKePSkeWG3k+aKHn4Km+RAbPy/FH/jORElRF
         nBys92l6UMM7oxzfGnmm/rfME+okpfWF0w2ndHqmOmcpd6ANzDwG7zzjkpaaNTeZIj+6
         KGAY6X4g/FOBdDAI/4vsU4qmynqptHNRqLslsNr9K3A4y8W3KI71g+bLB74Am8PAPZ3I
         Yp1uBPYsSLMLDCquj8gN4VCnznQ9oyDi9VeOfXmpTKAhIpcdnhzx2Fgby0EZL32Ra87U
         9x7uFHpS7XSBCSz/5K+KX33vBci9ir0Jo5/fyYQDEpYhCRhrEqwWQPZnHQ73q+hnSvH+
         tNlQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6ZZZsLNlekETDz4BpN4kPieM6IE4GKmcebPz8KM07sfQnRwjjOkZ+ktLvtW9+jhBN8lySyyZCUluprg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxB+xu1hH7sNr8DIx58stT2scTewg8RtvGsfK+ZyX/4sqcvsa0O
	0FDqRQSIVrAYZtvbsMMg2WA5FKgEsEVkVYWOOJOc8NRHj5PBb/VMLBrq+5E5BSixHg8=
X-Gm-Gg: ASbGncs/omeRSAqnw+YsEkG+IqTUTPRJC8N8nVk+5NZQr8jOOwTXNCN6FZI4prR10Oj
	/x9GPnlmWrm4jvsRg+Ag12Hk8RKBBT5LigJa6Qi9bLsu08nR2DCs0OBaK1g0hXhS2SU4PMV4VXw
	cg8eKBUWmgT6dB+C4UTlCM3t40/du4kETzmlI8DX0P4YdQc0YQKF4CwVhfuL8bx+p0rb9bHGEVP
	MQBFOtDVtVLqBcJewWxnq1jqJV3Mh8mC02bSfsWO9NZD/DjCUYvwnDGNfefr5sxtvRz4eWuSh8i
	1e+Z7mkdjCQWZo5YK/+6CJRuxOjJHiRMC8JqZE+ZNeGBoN0/1LPAF2Kmg8/fYWXpN6BWQWY/Fuh
	k6AocvRG8WPQx
X-Google-Smtp-Source: AGHT+IG1GHyy8b8GYVbfzlnN8+J2RSq7hqEKi6/Yl/QaRXVbKZmvYaubZ7QAl5jOTOJVDXQoWBizUA==
X-Received: by 2002:a05:6000:381:b0:3a4:f893:3eff with SMTP id ffacd0b85a97d-3a4fe39a982mr7159013f8f.57.1748877538797;
        Mon, 02 Jun 2025 08:18:58 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe74111sm15619844f8f.56.2025.06.02.08.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 08:18:58 -0700 (PDT)
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
Subject: [PATCH v1 1/7] clocksource/drivers/scx200: Add module owner
Date: Mon,  2 Jun 2025 17:18:45 +0200
Message-ID: <20250602151853.1942521-2-daniel.lezcano@linaro.org>
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
 drivers/clocksource/scx200_hrt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clocksource/scx200_hrt.c b/drivers/clocksource/scx200_hrt.c
index c3536fffbe9a..5a99801a1657 100644
--- a/drivers/clocksource/scx200_hrt.c
+++ b/drivers/clocksource/scx200_hrt.c
@@ -52,6 +52,7 @@ static struct clocksource cs_hrt = {
 	.mask		= CLOCKSOURCE_MASK(32),
 	.flags		= CLOCK_SOURCE_IS_CONTINUOUS,
 	/* mult, shift are set based on mhz27 flag */
+	.owner		= THIS_MODULE,
 };
 
 static int __init init_hrt_clocksource(void)
-- 
2.43.0


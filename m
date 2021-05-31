Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3B36D0E
	for <linux-sunxi@lists.linux.dev>; Mon, 31 May 2021 04:46:19 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id dg27so2218998edb.12
        for <linux-sunxi@lists.linux.dev>; Sun, 30 May 2021 21:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=prusa3d-cz.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZZgT3an2EYN+ktsS5FyP/IHOGumhn4A6v5jkyh2PmDY=;
        b=wpY9kpNjSEvT08pGSQrDGw0X81R1U+ELe4rSYN4gAc5EiLySzHZ2+gyidq33uOfqz1
         VcwJCkB6Iq4yi+7JOpOk/ANqsTFZKZYvBI0NDRYCYzfE5M1pO2s9DE78P5oQrymB70zG
         YOjCCdoyci1c+1mvnfRyG5Pyl3SkV48swzf/S8mEDsiLa9Jj+Z0S9lzytTOCC9zhN6Ci
         vCBWuypX9sjpAGtu3+KiSaui4cV8fdg5AW70nm38du+SLf/UvdZ9d+Mu17S88yGRKiyt
         V2fnMzLUxwSGPeh5HnnZx0oopltic8yOpy3s31Ml81pX1igjtEGQIVK5qXUED8nYXfwL
         i/BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZZgT3an2EYN+ktsS5FyP/IHOGumhn4A6v5jkyh2PmDY=;
        b=mko3FGDp2KZtObFBuTHb+O7sIACH5ZvLh5IKM8rDfdAdkIXFY/HubQ8IruQo2dAABA
         X83aTObvsDh5FFgIWAQ2Lu4rxfLXs/3/nfh73dnyml0rv6Pv15Atip5TRYWE8zy2nOlK
         OistjdHsQ2IaToUmU8Ye16dwf7ZMTvGkYEe2U/nO9crBqSV0qMgvu5jaSHP39Ao/Wkmg
         gzgRsLQYa0ReOMXxDurloG4vKzDPq+cMRvkFb8PbsHra0fgvFK+5J7Cw4+oITRt4TN7C
         7kkVhyuG9vt78Hr1D6D8TqqubjHFFNA/DaXKcMtkeGQJiG/s4uyDlymRnkwFzZnO83oi
         mLoA==
X-Gm-Message-State: AOAM532gZQZJldRVwdjlJ3HCJ5U0Ia9GlG0u8M/yJi61ETxpZyg5n1lW
	Bsj+IJh/tUUMYlr6eQae5ebnhg==
X-Google-Smtp-Source: ABdhPJy1X788ZAmo8YDlVmNC0s+UtsAcz2syqXiIwPHdlqPt5f2EkG6qg8LD7Aa9c5iMnmc0Jwxc+w==
X-Received: by 2002:a05:6402:3587:: with SMTP id y7mr22761532edc.360.1622436378450;
        Sun, 30 May 2021 21:46:18 -0700 (PDT)
Received: from zen.local (ip-89-103-215-157.net.upcbroadband.cz. [89.103.215.157])
        by smtp.gmail.com with ESMTPSA id h9sm6238376edt.18.2021.05.30.21.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 May 2021 21:46:18 -0700 (PDT)
From: Roman Beranek <roman.beranek@prusa3d.cz>
X-Google-Original-From: Roman Beranek <roman.beranek@prusa3d.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Emil Lenngren <emil.lenngren@gmail.com>,
	Pascal Roeleven <dev@pascalroeleven.nl>,
	Lee Jones <lee.jones@linaro.org>,
	Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	linux-pwm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-sunxi@googlegroups.com
Subject: [PATCH 1/6] pwm: sun4i: enable clk prior to getting its rate
Date: Mon, 31 May 2021 06:46:03 +0200
Message-Id: <20210531044608.1006024-2-roman.beranek@prusa3d.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210531044608.1006024-1-roman.beranek@prusa3d.com>
References: <20210531044608.1006024-1-roman.beranek@prusa3d.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ensure the PWM clock is enabled prior to retrieving its rate, as is
already being done in sun4i_pwm_apply.

Signed-off-by: Roman Beranek <roman.beranek@prusa3d.com>
---
 drivers/pwm/pwm-sun4i.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/pwm/pwm-sun4i.c b/drivers/pwm/pwm-sun4i.c
index e01becd102c0..3721b9894cf6 100644
--- a/drivers/pwm/pwm-sun4i.c
+++ b/drivers/pwm/pwm-sun4i.c
@@ -117,8 +117,15 @@ static void sun4i_pwm_get_state(struct pwm_chip *chip,
 	u64 clk_rate, tmp;
 	u32 val;
 	unsigned int prescaler;
+	int ret;
 
+	ret = clk_prepare_enable(sun4i_pwm->clk);
+	if (ret) {
+		dev_err(chip->dev, "failed to enable PWM clock\n");
+		return;
+	}
 	clk_rate = clk_get_rate(sun4i_pwm->clk);
+	clk_disable_unprepare(sun4i_pwm->clk);
 
 	val = sun4i_pwm_readl(sun4i_pwm, PWM_CTRL_REG);
 
-- 
2.31.1


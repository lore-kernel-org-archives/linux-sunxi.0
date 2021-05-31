Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B6A6D17
	for <linux-sunxi@lists.linux.dev>; Mon, 31 May 2021 04:46:21 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id j9so11954107edt.6
        for <linux-sunxi@lists.linux.dev>; Sun, 30 May 2021 21:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=prusa3d-cz.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=c9TPrVvwOJU1vM2zQOe9sLDjTnXNJ7tTt34i6paI9+g=;
        b=FKpLtB8Wsq0qoax8vN+Zo33QxMyFfLGW7aozw1rqXPYArZRJ9fsszF5dVm4xQ8jaWf
         GqUYeTXPzQh63TrU2ZwSVR65vr9YHKc2lKpT8BuQCAJcalmJOdSS3PT1SJ9otVwTHumD
         86y7jvp/eNLgNYvxwx/yDk8YfCOth38e1fJ0qJhoAgI+yr+7qnIhc4zjK6JGoTxg22YM
         Ld+4w0wt3ODRnwbseM8TlIebb7K2hVrtviYoNnnAsGywZu8ObvnwRosoOui+sSDNIEJB
         9TA77sPZBDTu7agUuUHMMFINRUSwBnhtjnjyGacDABPQE/GmJVX58TB/FpIDBzn+PUB7
         GQ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=c9TPrVvwOJU1vM2zQOe9sLDjTnXNJ7tTt34i6paI9+g=;
        b=oOl/xaNw36QL2hPwySYb7QSEjwKMB4tJYVT9yYg/+aoHZiYoAXI8e6kIzToSiHA2U7
         3kQ0f1H57VbJkhb7+U0tCmfoOENjc0Z/hTroKzkBx+qPbFzGw3OpdioFy0lOyJev3Uf+
         dSNFzilvaa7qJj3/23xAN85oedh8JUD2J9BNuVwcPY8uFRjGLPseEhqKBjgR4bOQ0NFV
         YBGXZJ8ebxHAGmIc9VnTYPFEWSazGYHpY43CwurMds2N/JMl81H5gCKIFSENUQ8JSlGw
         pra5ln88+A+bIsWvh4ED8J45ih6SADwhW7c6vKMjUZA9PK2BjA0ncXlKcGbtbWWS7J9M
         eMPA==
X-Gm-Message-State: AOAM533teXfS3xU+vUQ/pUBOVgjtFzmkW4sgS1OIK5zOtV5mvq3j2yOS
	gwUyCTaVK/cAbA4M+YEct6CGVg==
X-Google-Smtp-Source: ABdhPJwm2wapTm/meH0HsCh6lRt8OuethMrV45J+Fj/R8rSSjGe+Cr0iZp+gMcfd3kIV8vbuPdV9tA==
X-Received: by 2002:a05:6402:152:: with SMTP id s18mr22918277edu.221.1622436380394;
        Sun, 30 May 2021 21:46:20 -0700 (PDT)
Received: from zen.local (ip-89-103-215-157.net.upcbroadband.cz. [89.103.215.157])
        by smtp.gmail.com with ESMTPSA id h9sm6238376edt.18.2021.05.30.21.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 May 2021 21:46:20 -0700 (PDT)
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
Subject: [PATCH 3/6] pwm: sun4i: replace spinlock with a mutex
Date: Mon, 31 May 2021 06:46:05 +0200
Message-Id: <20210531044608.1006024-4-roman.beranek@prusa3d.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210531044608.1006024-1-roman.beranek@prusa3d.com>
References: <20210531044608.1006024-1-roman.beranek@prusa3d.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Releasing ctrl_lock for the duration of the delay is not desirable as it
allows re-enabling the PWM before the delay is over. Instead, substitute
the spinlock with a mutex so that we can sleep while holding it.

Signed-off-by: Roman Beranek <roman.beranek@prusa3d.com>
---
 drivers/pwm/pwm-sun4i.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/pwm/pwm-sun4i.c b/drivers/pwm/pwm-sun4i.c
index 2777abe66f79..b3ec59a83d00 100644
--- a/drivers/pwm/pwm-sun4i.c
+++ b/drivers/pwm/pwm-sun4i.c
@@ -16,13 +16,13 @@
 #include <linux/io.h>
 #include <linux/jiffies.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/pwm.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
-#include <linux/spinlock.h>
 #include <linux/time.h>
 
 #define PWM_CTRL_REG		0x0
@@ -87,7 +87,7 @@ struct sun4i_pwm_chip {
 	struct clk *clk;
 	struct reset_control *rst;
 	void __iomem *base;
-	spinlock_t ctrl_lock;
+	struct mutex ctrl_lock;
 	const struct sun4i_pwm_data *data;
 	unsigned long next_period[2];
 };
@@ -265,7 +265,7 @@ static int sun4i_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 		return ret;
 	}
 
-	spin_lock(&sun4i_pwm->ctrl_lock);
+	mutex_lock(&sun4i_pwm->ctrl_lock);
 	ctrl = sun4i_pwm_readl(sun4i_pwm, PWM_CTRL_REG);
 
 	if (sun4i_pwm->data->has_direct_mod_clk_output) {
@@ -273,7 +273,7 @@ static int sun4i_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 			ctrl |= BIT_CH(PWM_BYPASS, pwm->hwpwm);
 			/* We can skip other parameter */
 			sun4i_pwm_writel(sun4i_pwm, ctrl, PWM_CTRL_REG);
-			spin_unlock(&sun4i_pwm->ctrl_lock);
+			mutex_unlock(&sun4i_pwm->ctrl_lock);
 			return 0;
 		}
 
@@ -308,10 +308,10 @@ static int sun4i_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 
 	sun4i_pwm_writel(sun4i_pwm, ctrl, PWM_CTRL_REG);
 
-	spin_unlock(&sun4i_pwm->ctrl_lock);
-
-	if (state->enabled)
+	if (state->enabled) {
+		mutex_unlock(&sun4i_pwm->ctrl_lock);
 		return 0;
+	}
 
 	/* We need a full period to elapse before disabling the channel. */
 	now = jiffies;
@@ -324,11 +324,9 @@ static int sun4i_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 			usleep_range(delay_us, delay_us * 2);
 	}
 
-	spin_lock(&sun4i_pwm->ctrl_lock);
-	ctrl = sun4i_pwm_readl(sun4i_pwm, PWM_CTRL_REG);
 	ctrl &= ~BIT_CH(PWM_CLK_GATING, pwm->hwpwm);
 	sun4i_pwm_writel(sun4i_pwm, ctrl, PWM_CTRL_REG);
-	spin_unlock(&sun4i_pwm->ctrl_lock);
+	mutex_unlock(&sun4i_pwm->ctrl_lock);
 
 	clk_disable_unprepare(sun4i_pwm->clk);
 
@@ -471,7 +469,7 @@ static int sun4i_pwm_probe(struct platform_device *pdev)
 	pwm->chip.of_xlate = of_pwm_xlate_with_flags;
 	pwm->chip.of_pwm_n_cells = 3;
 
-	spin_lock_init(&pwm->ctrl_lock);
+	mutex_init(&pwm->ctrl_lock);
 
 	ret = pwmchip_add(&pwm->chip);
 	if (ret < 0) {
-- 
2.31.1


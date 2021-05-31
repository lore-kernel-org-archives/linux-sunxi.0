Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA566D14
	for <linux-sunxi@lists.linux.dev>; Mon, 31 May 2021 04:46:20 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id cb9so66370edb.1
        for <linux-sunxi@lists.linux.dev>; Sun, 30 May 2021 21:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=prusa3d-cz.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0wwG/Rn9um6zlw9r9jL8V2Q6hYDd1uPy7KH4n241Hsg=;
        b=S5EbIKVLC9/WQtCT+GNBCYreMNg/ZC4D22aFdQse1Mj4FeXxIr7Sq6ZwK2pF+ZJ9Bg
         GMpya0ctg+rtWwz6rYL5bFz4Q5KvxFtJS9t4aNhle/lGYi5NJTTdRTBWr7r+kjMSZxM5
         tnIgQxuWzg++m+kQc6X/6jYjSxxqlLIQOIe0qEQNDI2SLFVvRXiNu6CYquzMTfDa9LAt
         8QFh9mYUiYVwuyO2Elc6hpIgQy1T92vDiSG2RGztAc3lKjE7luG4s/G2Xbwbmtc2pfdJ
         JJdBuUKDQHEMs3gNtDM5ndlPnLbkbpho3X2Xgrgwqhi14jv9DUM7kGJSwDbuzH/Q8JqQ
         HPsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0wwG/Rn9um6zlw9r9jL8V2Q6hYDd1uPy7KH4n241Hsg=;
        b=Q3GX4k36qG6bRcbglkpIBLtTzMouwm+IzhsByGy8uMd65zG019OOUWo6JQvqVKqDRx
         mRMQfh0FHp3BDMXOoHHZL94R1AOAV+CWpxg4YFTAlEf4K+tgRYkFiU7tUP4dDPfgiGM0
         cjj+eW0ttJq6sKsWrrR6+671JoG77iAV79BwJirCcHre2qjqGrn/recHDzGpf2Mou03v
         V50pxmaL0oonueBg13ZzqkcoeCsAAkLEz/9b6zeQO0ckZEPRv8XWyrxTncoWGVLPgCkj
         dsKpnWmt5/cywaBvaVqrvo/GzBcX1xiwtr9fPjYYCpf1XRkTywvp4jY1iG7QzVWSKhva
         9KYg==
X-Gm-Message-State: AOAM531jE4eGKqXTvW6nXR9Ikehru2Fhv3/tmIB3cfhyTZmz/Aoh8Hzb
	I9ZUP9+P9BKSC/sQ/KGm+ZhE5g==
X-Google-Smtp-Source: ABdhPJx1t3/XMRBY9LSzuPp4oCSFKs8ZpLoo0r7Idrq6tIlRFlYlZponr9ZqTFdRcuMqNtwVLlXEiA==
X-Received: by 2002:a50:ee02:: with SMTP id g2mr7732330eds.333.1622436379476;
        Sun, 30 May 2021 21:46:19 -0700 (PDT)
Received: from zen.local (ip-89-103-215-157.net.upcbroadband.cz. [89.103.215.157])
        by smtp.gmail.com with ESMTPSA id h9sm6238376edt.18.2021.05.30.21.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 May 2021 21:46:19 -0700 (PDT)
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
Subject: [PATCH 2/6] pwm: sun4i: disable EN bit prior to the delay
Date: Mon, 31 May 2021 06:46:04 +0200
Message-Id: <20210531044608.1006024-3-roman.beranek@prusa3d.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210531044608.1006024-1-roman.beranek@prusa3d.com>
References: <20210531044608.1006024-1-roman.beranek@prusa3d.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The reason why we wait before gating the clock is to allow for the PWM
to finish its cycle and stop. But it won't stop unless the EN bit is
disabled.

Signed-off-by: Roman Beranek <roman.beranek@prusa3d.com>
---
 drivers/pwm/pwm-sun4i.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pwm/pwm-sun4i.c b/drivers/pwm/pwm-sun4i.c
index 3721b9894cf6..2777abe66f79 100644
--- a/drivers/pwm/pwm-sun4i.c
+++ b/drivers/pwm/pwm-sun4i.c
@@ -303,6 +303,8 @@ static int sun4i_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 
 	if (state->enabled)
 		ctrl |= BIT_CH(PWM_EN, pwm->hwpwm);
+	else
+		ctrl &= ~BIT_CH(PWM_EN, pwm->hwpwm);
 
 	sun4i_pwm_writel(sun4i_pwm, ctrl, PWM_CTRL_REG);
 
@@ -325,7 +327,6 @@ static int sun4i_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	spin_lock(&sun4i_pwm->ctrl_lock);
 	ctrl = sun4i_pwm_readl(sun4i_pwm, PWM_CTRL_REG);
 	ctrl &= ~BIT_CH(PWM_CLK_GATING, pwm->hwpwm);
-	ctrl &= ~BIT_CH(PWM_EN, pwm->hwpwm);
 	sun4i_pwm_writel(sun4i_pwm, ctrl, PWM_CTRL_REG);
 	spin_unlock(&sun4i_pwm->ctrl_lock);
 
-- 
2.31.1


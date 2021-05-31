Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8383C6D0E
	for <linux-sunxi@lists.linux.dev>; Mon, 31 May 2021 04:46:24 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id j9so11954190edt.6
        for <linux-sunxi@lists.linux.dev>; Sun, 30 May 2021 21:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=prusa3d-cz.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QVg7Hdl4/ZVFOwC3zdm+BtLAL/F8bdjWGF9QT4YTdO4=;
        b=OD5S65QZS3iZyC4Zwlx2TkaDHQa6IzCi9DD8krUyi0osNRlwD/CF+7Q22MY+oOnnJa
         lvo3pxndm9A+HqC/jvsLwMOrRpROf7oKOXPOzzcmmbdUG0asCnUy9LRmZXj+W3vcreqM
         fqERsSCercBb8Dk0Y3aU/PfdrqFGpLFWS/VHgzV+IrcZGrDXL0YpQnPw2+kN2gTYRuPK
         IAjoRdliJBA64SgjMWpXknEfJZ5nkL4Mw3h1pxIhAyc8jRYY3cHnzh8HccH7csXR543C
         RseTB3a3ChOqipdWlv40xL5tFgkjznFX+XTnqDeELDLrqNmzKpN2C0zXeuSnAbRoeScb
         /JMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QVg7Hdl4/ZVFOwC3zdm+BtLAL/F8bdjWGF9QT4YTdO4=;
        b=np/KBTe9c47BtcP62I13TNPK1zLhesBi8Gnv69Ft5AVZiYiOoUSEY2rVKFekLd6j2X
         vUAvlUf9rOP0nzqw5ypBEeF/rd01li+WrHtwwvSKZwlrkkCIc8xpnIUh2aWfZ2GmXayD
         rnTj+/mqjYyfWgGRnGiXy2tt5OELbfoBGa6Iu8yf6f1taK9EuFXjr1ud851gEJ8mAmJp
         OvVPh6N8lwNOzUPWkVWJ1MsncHOFbd4mGkyBUE+rkOvEnYKbVhlgBesip3J9AT45F9gN
         loJ/H2ErEqRlRbvwT6xxooq2xo/KfpQ+YEdHUjA9jpv5Wnsit9jY764O2sq3FJ5cEvgk
         oNQA==
X-Gm-Message-State: AOAM532SsP5tzubTfsEXaq/yYDphNuhQAzbESsfg1v/42eGShrKjoWY5
	XOFADJNgUXz46jEyDHAxrVgQsuPoAUHY3Q==
X-Google-Smtp-Source: ABdhPJxsQ+/nHjpVQtyAxvH1LPlS/MyEUURoxZBF/XAqcXhXjL3TGweCjrGnBsD78Gk8GZai/gBaIg==
X-Received: by 2002:a05:6402:b8c:: with SMTP id cf12mr23173772edb.61.1622436383155;
        Sun, 30 May 2021 21:46:23 -0700 (PDT)
Received: from zen.local (ip-89-103-215-157.net.upcbroadband.cz. [89.103.215.157])
        by smtp.gmail.com with ESMTPSA id h9sm6238376edt.18.2021.05.30.21.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 May 2021 21:46:22 -0700 (PDT)
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
Subject: [PATCH 6/6] pwm: sun4i: don't delay if the PWM is already off
Date: Mon, 31 May 2021 06:46:08 +0200
Message-Id: <20210531044608.1006024-7-roman.beranek@prusa3d.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210531044608.1006024-1-roman.beranek@prusa3d.com>
References: <20210531044608.1006024-1-roman.beranek@prusa3d.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Roman Beranek <roman.beranek@prusa3d.com>
---
 drivers/pwm/pwm-sun4i.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pwm/pwm-sun4i.c b/drivers/pwm/pwm-sun4i.c
index 6ab06b9749d0..88bd90498d1f 100644
--- a/drivers/pwm/pwm-sun4i.c
+++ b/drivers/pwm/pwm-sun4i.c
@@ -304,7 +304,7 @@ static int sun4i_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 
 	sun4i_pwm_writel(sun4i_pwm, ctrl, PWM_CTRL_REG);
 
-	if (state->enabled) {
+	if (state->enabled || !cstate.enabled) {
 		mutex_unlock(&sun4i_pwm->ctrl_lock);
 		return 0;
 	}
-- 
2.31.1


Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC7097E4
	for <linux-sunxi@lists.linux.dev>; Sun, 16 Oct 2022 04:46:19 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id x31-20020a17090a38a200b0020d2afec803so8261618pjb.2
        for <linux-sunxi@lists.linux.dev>; Sat, 15 Oct 2022 21:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gOPGjdkUUwBD33Ljs14iPONiNzANh82bKNKcOAVpv2U=;
        b=ig6Dy5kUHX/xCi/qhfXtOSmXyx21TOvJnI+Qe0WYy+CrzaePjxltimPIbm/E/bz4b0
         Thq1g4ovro3P/B4Pwzu2sbOQuw9JJ4CvxNedhA80rlTJcVgvMeUPAxVGRH2KYByPLfe/
         1RtuE2vyn1ARWx3ulPnABCPzy/EN3bXPyTcUYUcsq8oAvuIogH6oszJV8ymX2h/Y14Wo
         /PJNTVd/8mzaKDQyvwYbQQuMOjN7S48l3S8H603mRUAwkTWiSdR4gZuhD+KEJDUXHVrg
         fQdjrKnaCKiIqEtn9b8tpLq/Fe2+Zf0lP0aeI6z1eYMqy6d8ldiYOn7B5fyVGwY1HsUv
         BKeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gOPGjdkUUwBD33Ljs14iPONiNzANh82bKNKcOAVpv2U=;
        b=YXKRhJa9vawAVEzTYgX73S75dwohb8JMdw83W8BMHIuunzHSGlR+SqqtLfUwH8k1cV
         u5cUfEIeI+syH+hZTlT7p/oI0fiZx7pPAi+rjywhJ490EHMX9sbzetTjg7JHYJxgkEaS
         j7GdrS//ct8S6QooheHRzdtobOej7/zlEo7hyU4YQpVR7XlcAppyKgjOiA+e5dLFMYkY
         xhrvCI5sWyMH/txUurze3ep6SkvO0x4BkGfzBEP2rHdkrmFWLw13/boimvi25UvyYr9L
         doJPDq4genIvoZwAl2WLsu0aWjV3L2YshxYZrlc9TWQ4dBdbVPPwLkVM0RJdQUw7M2y5
         hJ4g==
X-Gm-Message-State: ACrzQf29FisfQqa/DSWAQPyxg0JOI2UiUPOoGCLlbgAAiTGLNArbWDjO
	SLVdKHuTZYPscTViJ3ME/g==
X-Google-Smtp-Source: AMsMyM63j0z/1xvhysZgEbmP6pbY1z3+XW9PpVel3uuw8eOMbfB7ujM/Qo5QvMY8PkoBbfj2qSylXw==
X-Received: by 2002:a17:902:c7c3:b0:182:7a62:4fa with SMTP id r3-20020a170902c7c300b001827a6204famr5855511pla.122.1665895579262;
        Sat, 15 Oct 2022 21:46:19 -0700 (PDT)
Received: from localhost.localdomain ([113.110.232.129])
        by smtp.gmail.com with ESMTPSA id z14-20020aa79e4e000000b005631a40a00bsm4308555pfq.139.2022.10.15.21.46.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 15 Oct 2022 21:46:18 -0700 (PDT)
From: Ban Tao <fengzheng923@gmail.com>
To: fengzheng923@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	wens@csie.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org
Cc: alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: sun50i-dmic: avoid unused variable warning for sun50i_dmic_of_match
Date: Sat, 15 Oct 2022 21:45:24 -0700
Message-Id: <1665895524-122458-1-git-send-email-fengzheng923@gmail.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

In configurations with CONFIG_OF=n, we get a harmless build warning:

sound/soc/sunxi/sun50i-dmic.c:268:34: warning: unused variable
'sun50i_dmic_of_match' [-Wunused-const-variable]

Signed-off-by: Ban Tao <fengzheng923@gmail.com>
Reported-by: kernel test robot <lkp@intel.com>
---
 sound/soc/sunxi/sun50i-dmic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sunxi/sun50i-dmic.c b/sound/soc/sunxi/sun50i-dmic.c
index 86cff5a..62509cb 100644
--- a/sound/soc/sunxi/sun50i-dmic.c
+++ b/sound/soc/sunxi/sun50i-dmic.c
@@ -391,7 +391,7 @@ static const struct dev_pm_ops sun50i_dmic_pm = {
 static struct platform_driver sun50i_dmic_driver = {
 	.driver         = {
 		.name   = "sun50i-dmic",
-		.of_match_table = of_match_ptr(sun50i_dmic_of_match),
+		.of_match_table = sun50i_dmic_of_match,
 		.pm     = &sun50i_dmic_pm,
 	},
 	.probe          = sun50i_dmic_probe,
-- 
2.7.4


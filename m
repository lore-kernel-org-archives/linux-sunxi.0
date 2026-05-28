Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F5C3B6C1D
	for <linux-sunxi@lists.linux.dev>; Thu, 28 May 2026 10:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779963421; cv=none; b=FUThtAwApSS9NEBycCSx01viYe5G1Pd4LIRCaMEi5WxLOh4bSIouNogepjyeeGArC0MeDjdItApX5Vq9MlxOdMkgBsgJSEPj8MWEfH84PUo4NmdnazIbc2Y8H2JglvT3atemuLD2eGAVo+GUatjpm+C4MXikONjA4nFNYjSqdtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779963421; c=relaxed/simple;
	bh=x4stweEjQxppyPVctumRNhEzYCy0dzoef5jpr4KI7/o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YNP3r5MPdx4bEX6uxHCRdpoegKGhuv+dE2uHZZ1HrXz8AGRFeCZzAKSMks4QvIvvBg3VEtckApH6SKCHjH7jjDk7rxRD92Cc1+yRfkAd286LLKBkCetfHl1O+dz5p+lzn4dSlscgnFkPJQUEyBIRskgA7IhNZTZ+6LHTTMOhzKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=PqG0VYYq; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="PqG0VYYq"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-44e1ebb3122so7688349f8f.2
        for <linux-sunxi@lists.linux.dev>; Thu, 28 May 2026 03:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779963416; x=1780568216; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1DoSbZfG7H4Ei1TfdvUW7X/sPaGi5bqrJwAmd5q/gRM=;
        b=PqG0VYYqsGGvcy/Ob4WlQDe+z4UcJlHzoGymA4+VIu04xP+q5YJIj5OeEeLiv4il7/
         re02rpvChNg5LJQric9PJJyCgrqNNDkpdy9ftuAPdly0AqMwhXO/35aVQwokucQl6/cz
         oYflCHZIk0BNWiUnVhoCocFmW41rVkslAvn+rBldDnMO7wyaf8LhPhcDUYaj4PXa+YHZ
         SoMF4+Z3VrAQJtDPc8KgJmQMMRM3IZu/qwA2acQLhMzheCH9C4hFTDh4w8iASTmW5wz/
         aUPi2bGYm1OmIjf2UtanhtQaQ5eVAMpioDowYUoXQLbMA1vrlrRhR6fLKYrshhplCNaG
         /xGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779963416; x=1780568216;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1DoSbZfG7H4Ei1TfdvUW7X/sPaGi5bqrJwAmd5q/gRM=;
        b=ID+XsqZgYDhcLIvj27BTRHgBHPN8Z/jPirEdUpnacB9xaYq0Fs9csSyMgspkAWMuKx
         Au0/fOPM9MmEkoaxtuJdg1El7XSrYSyWLvNqLKmha4mLQos0ZNh48acCzUkS83Kj6PEg
         mYB1lCyOgzFANVxQkCSO1dlPeOLG5CoO1qxtbCT/HSTia4VTLsld4dVDJ2Z4EtAx2Bh+
         WUvdxdMGVxU2zQCJxSdhAQq0j8Qo/F69fCMjhctaqc2Nfb1gYxdvoQpPsE91LOckO5fQ
         NOq+TNnWe3trbTCxiBU/jAaJdO4RTLN/VjkdziDyw+lyK+Aa1o6Eo6+RTG0ygoRnNmps
         ckEw==
X-Forwarded-Encrypted: i=1; AFNElJ8o98aRyR6QCZO5LP46xp6T8CjjBuEPoQjK6YoKAQzvg7DRZuoWFJT6vR552UvTa7py8EOGIkq9JYMQbg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyAt+HF+2YQfgTf55PPbfMAZ8RnX2Iq8GT7WrDrbpjwuVOGf0WM
	00+RjF/Q0FknkuKu1zMNR+9s6OuYu4O4OWvkHEmIWfx660ns29h1sxQwN4RqSTh45Cc=
X-Gm-Gg: Acq92OHvEhBEvXOuVFfmH8w2x1qIVgMAnz4Z2fkDNZDK0a2eWxxXdggUi6hKhBxTNJe
	recVE+kE1jaPxfNPb16PTqld+AFNyucAXW5ixnvjKh9aPJri6XIkH1JU4wlw8do8BhPpz0NQDTX
	WVgtTm0AlR80XPN9y152OXCbIww8//tm4Mu9athlk5Pt4LMtujFxrZDv3lZe75F4cGwTTFPjjL7
	v7SfWOF1KHk9vjw6YhbqcqWre6bxpxZF3ZYwIQyDAhI5Jp1celc4sd2+uOeSgRs3rtDUENvElZC
	iE9z0wjFhx4fnt26+ncp8D7f4wSHafmMt7GNUzDMcoj5Mvx7oyvzuHcY5cyrShBoiHc+oAhHCqE
	29qospU0DmzEWezMr0IR9Esf925OSgae0+wVOIShOggNSSULviROZpfOejKBpDgPygCc5VHDy9c
	Wsw+c3BQ3PJIP/Nq43f0wBkGRKNl9xY1/pXpek+Qi5pJtFIXb2sAU6q+oAOB3kpkk8RFUwNz6Ic
	F4Rei+Fa4k1UGM6WzW4BgBHMuAUhTZG8ZVp
X-Received: by 2002:a05:600c:3106:b0:490:6889:1ff with SMTP id 5b1f17b1804b1-4906889025dmr231608125e9.28.1779963415894;
        Thu, 28 May 2026 03:16:55 -0700 (PDT)
Received: from localhost (p200300f65f47db04e95e43453a0d1648.dip0.t-ipconnect.de. [2003:f6:5f47:db04:e95e:4345:3a0d:1648])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4908d80952asm20830595e9.1.2026.05.28.03.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 03:16:55 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>
Cc: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>,
	David Lechner <dlechner@baylibre.com>,
	=?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v1] iio: Use named initializers for platform_device_id arrays
Date: Thu, 28 May 2026 12:16:49 +0200
Message-ID:  <1a45a4aade700448d7b1c702210ff147aaf21f90.1779962510.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2568; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=x4stweEjQxppyPVctumRNhEzYCy0dzoef5jpr4KI7/o=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqGBYRW94t166W07+K+D6+FcH6eSGvxuhaoJ2PR jJmgidiFGqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCahgWEQAKCRCPgPtYfRL+ TgmuB/952mpqmszKxSoYMJ8I4cWrjlwjrB7qfIwSgQaQkvnSUjb6aWlmZNN8GZo1gMcb5kwBg6K CIr/lBH/Pbw7F/J1tbO6DzhopmzjPfaU7tNxCBVzI8AhjcWIoVRQr74VA05XBWypHMwdWAfZBq8 7Bv3NpBGkBlfF9k46ASmTqbJi/Xli3p98O7afScfz6+LCv8Y4I4NiiG0uZxbPdAx4uo9/U0IEtk mOK9grOwXEJ3pNU23HedR7bDSjgo25VwZJ6FZmDNBCTeZxyuHQE0ZbYeii642Fc8Qmt9v+xKtDE 3Z4RPVUP1LmbsrUEu2CtnUGG+22YwlA/HIGTnhJ5x82D0AIO
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Named initializers are better readable and more robust to changes of the
struct definition. This robustness is relevant for a planned change to
struct platform_device_id replacing .driver_data by an anonymous union.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
Hello,

I recently sent a similar patch for i2c_device_id arrays. This is the
respective change for platform_device_ids.

Best regards
Uwe

 drivers/iio/adc/88pm886-gpadc.c   | 2 +-
 drivers/iio/adc/max77541-adc.c    | 2 +-
 drivers/iio/adc/sun4i-gpadc-iio.c | 6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/adc/88pm886-gpadc.c b/drivers/iio/adc/88pm886-gpadc.c
index cffe35136685..4435f3d5e2b8 100644
--- a/drivers/iio/adc/88pm886-gpadc.c
+++ b/drivers/iio/adc/88pm886-gpadc.c
@@ -373,7 +373,7 @@ static DEFINE_RUNTIME_DEV_PM_OPS(pm886_gpadc_pm_ops,
 				 pm886_gpadc_runtime_resume, NULL);
 
 static const struct platform_device_id pm886_gpadc_id[] = {
-	{ "88pm886-gpadc" },
+	{ .name = "88pm886-gpadc" },
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, pm886_gpadc_id);
diff --git a/drivers/iio/adc/max77541-adc.c b/drivers/iio/adc/max77541-adc.c
index 0aa04d143ad4..013da014bccd 100644
--- a/drivers/iio/adc/max77541-adc.c
+++ b/drivers/iio/adc/max77541-adc.c
@@ -175,7 +175,7 @@ static int max77541_adc_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id max77541_adc_platform_id[] = {
-	{ "max77541-adc" },
+	{ .name = "max77541-adc" },
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, max77541_adc_platform_id);
diff --git a/drivers/iio/adc/sun4i-gpadc-iio.c b/drivers/iio/adc/sun4i-gpadc-iio.c
index 479115ea50bf..203459ca9907 100644
--- a/drivers/iio/adc/sun4i-gpadc-iio.c
+++ b/drivers/iio/adc/sun4i-gpadc-iio.c
@@ -679,9 +679,9 @@ static void sun4i_gpadc_remove(struct platform_device *pdev)
 }
 
 static const struct platform_device_id sun4i_gpadc_id[] = {
-	{ "sun4i-a10-gpadc-iio", (kernel_ulong_t)&sun4i_gpadc_data },
-	{ "sun5i-a13-gpadc-iio", (kernel_ulong_t)&sun5i_gpadc_data },
-	{ "sun6i-a31-gpadc-iio", (kernel_ulong_t)&sun6i_gpadc_data },
+	{ .name = "sun4i-a10-gpadc-iio", .driver_data = (kernel_ulong_t)&sun4i_gpadc_data },
+	{ .name = "sun5i-a13-gpadc-iio", .driver_data = (kernel_ulong_t)&sun5i_gpadc_data },
+	{ .name = "sun6i-a31-gpadc-iio", .driver_data = (kernel_ulong_t)&sun6i_gpadc_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, sun4i_gpadc_id);

base-commit: e7d700e14934e68f86338c5610cf2ae76798b663
-- 
2.47.3


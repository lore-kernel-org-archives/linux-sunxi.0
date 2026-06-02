Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA8B3DDDCB
	for <linux-sunxi@lists.linux.dev>; Tue,  2 Jun 2026 11:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780400720; cv=none; b=qVTfjCssAVHqoVNhMFHqvGQqZX+2dROo+u8NP0ZTy3gTuBeMDYWU8ydpeTbJaVbmewVNMdNI7Oxv9gLgFLbJkDSI8mnltpZ//zDBI62R+8zMISXLc1xJ6Lu8lFsnIeM/fHVea5oWMIKupdsXDlCVGdh5+lTPPZCyMicnI+cQ7QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780400720; c=relaxed/simple;
	bh=g8eArW1TvBopeg2TBOy3CcQKAvBFhzMIU2WVF3Mqh/I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rpF8lUvvvIVJXwC7tWEhhmzmKJVUxVeUp76MNtastW8VnpT5sTRsWWhL2PlVhmv99SVq/mNijKFENIIsfmnj2MXRv1XffrNk/qgF67B0emSj1qUXisXXJwJgrXh0Cwic+kX4H0tna2BBYF/Y7e/qkgu/h2oBcNgKYuhAvU1RUKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gJWEMzw9; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gJWEMzw9"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8422f148dfcso1316723b3a.3
        for <linux-sunxi@lists.linux.dev>; Tue, 02 Jun 2026 04:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780400710; x=1781005510; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CFWD1rv/Hg1YLyvj0G8HeVU1rR/ze4TuYTUo6+4aG1k=;
        b=gJWEMzw9WHxZ9Gk3xEnQeb8yHVv6/Ep/YhDR9OvQtS9FGGmzVCKtPHmCb/yiGfe2SM
         01cGCAJu+zyCUIqRbw8tMeTCsysSY8yh4Om7oDcCocCM4knrMScTNVIQMnrnh9bBrGGE
         dXdf3Ro1wUAKpTani6hmzA0ccTknO/rWSTfet6imol7q179STUAbYgE/4hlebDWCOruE
         j5COz/9kCL4zw5g6wvyjMtw5aBa1pscktuo6EBqHqO/QNxifqfL0JkRkUIfFM+9m3u/n
         y9DUWTDowZXcFcGnZ9OUJU9inn8Xc0iuarP+Tn/pt7L8LT19IVxmR8rp1GQ/Z0wLDmwC
         l4aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780400710; x=1781005510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CFWD1rv/Hg1YLyvj0G8HeVU1rR/ze4TuYTUo6+4aG1k=;
        b=P1YcS2ccHWBdAPJ2wZ0+1wS+ZfrVa/c80w33pWVwcbXHfxRhX5k1mhKb9bxNW4wIKT
         y1X4yQueO+zrCQ7h9VwCf1xgiJQOLwdiDFG3g2OIQkS8wH1I6nuiJuy8rQV5k+DC/Fr2
         sHstODAJhaHs4AkYJhxkjmVkmuE+3kB8tsZORrT0JR0DPWjWPGzKbeNzyJFZmEBdMH7N
         9bE1fUanZ1KX3UA42rNy3EheyrIPvoaIJWkOB58AvJVadqJ1kbv89IdPV67Lf2lB5Khj
         iHPU8xANO9gwgGT/KNsqTudAbvgjKi3N1z8z8BoFzXwshGyBOTo/qsd1wHl+tjxzcyr2
         jgAA==
X-Forwarded-Encrypted: i=1; AFNElJ/cwrRjHtIjSgj97Pm+5qo/cVeajXmjRhthwXSIRZMR4SUGlF5KAr4EefO/j4WwFhOBL1/7g/NEQFkFRA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwPvxg7GZOEAMX8fv6j2JHezzDr5CAwBDtLaelg4xoJWcE2b9n+
	ozxVjb0qqF9GrjgwwEYBjFosorRumG1Djpjask29d5Njainw3rzG0gfp
X-Gm-Gg: Acq92OFHlTe1FT+oZJyw7z3K2zncDD8WfuaHuL0gtu3B1xSiQJlYRpCq4/k7Lx4Y4Su
	+jcoespbilZMFWtNkgog28bV9SOjLl5LJMIz6yauePkBA5qX15HrJhJ3AHTUlbUOciiicq6jwfp
	dhCK+heXLDKzqYDKEqxBtMb0eLPThj3gAiapppqoxO6oLbVAgolkj5Da12u0Ohc8PSPnrQxzP0I
	Hj1rAdOHDEovc6vKzeqQZuvuH9qPbA3LfeNaVoTUGBAjDtAXkJfVUffJ69UdeYC/EuVyglMAbTj
	zfLlabHCzGg6QEWzgNuPx42mZapc34kG/iaVEyBKL6BNGJVwHZfeHqHj0/HyemxgZa/iYpqZkHA
	7lhthB/ELDS53Ut5tNHKOx4ZalVmPTf2c2+SY+bw/SUkifj/44wyVckC5zfJzwshouguGozvItz
	Hy71LQ8IpmCqp9vtORMZfW3qwPTSpU9cvUsWNAwnX6u8FSJsentTJcZ5dPhWmguK+vCHVi
X-Received: by 2002:a05:6a00:2d09:b0:842:6004:3fd9 with SMTP id d2e1a72fcca58-842600445ccmr6078561b3a.29.1780400709999;
        Tue, 02 Jun 2026 04:45:09 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842263539a3sm12025224b3a.44.2026.06.02.04.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 04:45:09 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Chen-Yu Tsai <wens@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 3/3] ASoC: sunxi: sun4i-spdif: Reorder clock enable sequence
Date: Tue,  2 Jun 2026 18:44:37 +0700
Message-ID: <20260602114437.50324-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260602114437.50324-1-phucduc.bui@gmail.com>
References: <20260602114437.50324-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Reorder the runtime resume clock enable sequence to match the hardware
dependency and ensure symmetry with the suspend path.
The APB bus clock drives the register interface and must be enabled before
the functional module clock. This aligns the resume sequence to be the
exact reverse of the suspend sequence.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

NOTE: This patch is compile-tested only.
Changes in v3:
  - Clarify in the commit message that the resume sequence becomes the
    reverse of the suspend sequence.

 sound/soc/sunxi/sun4i-spdif.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-spdif.c b/sound/soc/sunxi/sun4i-spdif.c
index f54eb14c9ed8..102db1a2afbb 100644
--- a/sound/soc/sunxi/sun4i-spdif.c
+++ b/sound/soc/sunxi/sun4i-spdif.c
@@ -643,15 +643,15 @@ static int sun4i_spdif_runtime_suspend(struct device *dev)
 
 static int sun4i_spdif_runtime_resume(struct device *dev)
 {
-	struct sun4i_spdif_dev *host  = dev_get_drvdata(dev);
+	struct sun4i_spdif_dev *host = dev_get_drvdata(dev);
 	int ret;
 
-	ret = clk_prepare_enable(host->spdif_clk);
+	ret = clk_prepare_enable(host->apb_clk);
 	if (ret)
 		return ret;
-	ret = clk_prepare_enable(host->apb_clk);
+	ret = clk_prepare_enable(host->spdif_clk);
 	if (ret)
-		clk_disable_unprepare(host->spdif_clk);
+		clk_disable_unprepare(host->apb_clk);
 
 	return ret;
 }
-- 
2.43.0


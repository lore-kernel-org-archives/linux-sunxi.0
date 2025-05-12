Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FBFD257433
	for <linux-sunxi@lists.linux.dev>; Mon, 12 May 2025 08:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747038591; cv=none; b=ZkQEJ2qoYpVcYQrNhKZppRs06B+xSl993QzCeRDxJDpxXiTKrbx0dpMAx/w3iYVayvrpKsaUAfOMINNTqRWj713Nm2ebs+1o1Fsmq5HCKZN7bQVegjrjazG+qHNyQhVHontYGbPP6ybhuy2zZ5Ox0bAayz8lBvWYl5CP0cUSivk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747038591; c=relaxed/simple;
	bh=nsQ1fQPsHSZmJleoO7Mt48MPFFf+ROc5x7XavMNRl9c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Hyw7MkfMAKtRB4ek1YLnLfSM8SWd/1SyPsV9itjl8cbsLMgwF6vADfwW/jT4lVD2CrnaRQFBBqwuzACbObGtqS8Wz5ifZDiBej+af3ZQiS5zhh4U7HUjdskwy6F38xmu5W5/Zk2RURQtok2hARgsWHFKoUStRNe0+Zgvo5wzsaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=WOc+6tut; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="WOc+6tut"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a0b9e2d640so3803214f8f.2
        for <linux-sunxi@lists.linux.dev>; Mon, 12 May 2025 01:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747038585; x=1747643385; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oKf9j4izYTToqxyJBnoPFJwtfX8Vyf7TI0IyG8+OfBo=;
        b=WOc+6tutyPrvCi1cF3D0adZk0FAsKIcjJ6xiPLw8ymzEr1qpjpqARYBzYym789+FK4
         3oWfVL5WLuohCd4uCNojYyuiBdYsVPe90lphBj0eeq+mMN4q7OUMRiwBMuFMSKH+R+7q
         XqGDO/TUu71+Y5hrT4bjo3zpLkMNpG3KiOHvoWyEqBK3rTDzqiRovRxJ+zFgXjKLqzBh
         HeakT9SaNH33YLxkT4Q5VqV4zvK9LnqGBWmuET5/Tjv44lxXrxuoca4XmvbVEsgKzJww
         lZGOln97kob/xrUrKDKy4nF+6QFORtF7Vc7bUO7PV8hds9timV5OZ8y0NpMdxHfywv4Q
         WcwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747038585; x=1747643385;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oKf9j4izYTToqxyJBnoPFJwtfX8Vyf7TI0IyG8+OfBo=;
        b=HUeQIp1YVKq2Iu2Q+YvOLuUdR+qUWBPazOvjaZFEqJHAVSXjBYE+4/o3jc0091tGZP
         lGG6QdJLxPSl0QV+SbFMWb/POWtWLIGEJ+Ne5yUMQywvvY4yOJax8+K3R1wO0xIN1YUn
         tXOLp2xz8UzdPSqOT/QiL/TOxvAGsAr+ntkAu4ItN+TRm49gVyWeMAMBoHxsb0xL0Qmk
         O3nroYA63/0W1PesLBL6EPccMEGqIA1Fa0T44yljtcckEYsxiu6OE7wPQwnVxrbBZcPQ
         sQXyNljR74H1eChVr3JCyLI00PAdRgOmZFDJp4FEfKgBC5h588w6307T4T30/StU6yz5
         R1pg==
X-Forwarded-Encrypted: i=1; AJvYcCW2lJmIdGxI7m4px+WJAmGH4YF09x1LD4w4aqV8kwPGdHJt/8m31sdrye31QPnC3LUpPylxV/ySxl+ckw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxYI41cNl9E+xx33Tt+rRwQ49i3dwkaLS1hyeTKj4Azj7FPrCsS
	W1qYrBDYONpAGsqoSelTcR1BKY1TCKEqzymfyitxEm9uQ/b+3IhYzZ7fkzTuH7I=
X-Gm-Gg: ASbGncvEytW0YMFg3AR0A/pDfolAGrceJVSvkvkT/UL99y7WThiVT151G5oqHywSxND
	1LhetfYelC9xGGVjZmTau1E255XJ6NI1UYZKZq5CQla45dgjGmu9pgkW465HWNwLL2A1CxzjkdS
	XdmVRTBHkvpjI5Lx45b0zSI49GiFuTXIBqgdr4x3HjP3br8MlvKIk3x9xwzx66MRi6MM7ocIwno
	EOPF708iScj8iFKUfbVpXSdQpwoZSgyZKHIN1pGrj26CqTzlhn5hhJSY80jrxNbMv8C/FhJkn6V
	7I76IZ7Gc07DvBDWjUlJBU+cNztpCdFZBkVvgzxldftUkoJeOfJ+Tb1CMCLZvIHMa+INR3kH28R
	HOoxUas4jmp/agr/B5w==
X-Google-Smtp-Source: AGHT+IGjXf4Unrsm51GneUC4EPZLhzeiZxLlsfKl0xT/3O5OvpeiW/E4y6GXvGgQgbxcg2NnnSkTSw==
X-Received: by 2002:a05:6000:2dc4:b0:3a0:7b07:157 with SMTP id ffacd0b85a97d-3a1f643a5b4mr9645069f8f.9.1747038584869;
        Mon, 12 May 2025 01:29:44 -0700 (PDT)
Received: from localhost (p200300f65f00780800000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f00:7808::1b9])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a1f5a4c78fsm11763007f8f.97.2025.05.12.01.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 01:29:44 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] PM / devfreq: sun8i-a33-mbus: Fix misconversion to devm_clk_rate_exclusive_get()
Date: Mon, 12 May 2025 10:29:37 +0200
Message-ID: <20250512082938.97110-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1235; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=nsQ1fQPsHSZmJleoO7Mt48MPFFf+ROc5x7XavMNRl9c=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBoIbFyhHzB+aUSUSLbeEfCi7zZNiGMzqylXq1y6 BZtbx09WSaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaCGxcgAKCRCPgPtYfRL+ TjvxCACXb0Ra2nxVT2aRbH4y33njLOk77dLGEOKSuZuC6RvYPXBRJaYPERDFCcN8ThbkctuNlcB 8MzqXk64dU729rhg9d3XRtlK8VVh979WSWXCBdoOQDvYkql6JPq+kvKedRHNWQdqBQ5l+9ZTWGO rqLBa/EzAjtJmrqVKUyiwRgZXCeQapTIvA3sBZh9pDq9WPZKdohivdRkiJ9572ecLjtOAKpnunI feKUi0eYyknRJf/pSh7PMO5sablBeN0xTRGlHaFJwIK2Gb6PpyCjuGQTxIfzcx294uLUdyAopWr NinBeJr4sSRu6NxXB7DatG/3cZGftmm94Nn5KjdyGAIQw12T
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The patch converting the driver to make more use of devm functions got
one conversion wrong making the driver not compilable any more. I have
no excuse, mea culpa!

Fix this by adding the needed device parameter.

Reported-by: kernel test robot <lkp@intel.com>
Link: https://lore.kernel.org/all/202412070231.MzXdNrLv-lkp@intel.com
Fixes: bc253b28a365 ("PM / devfreq: sun8i-a33-mbus: Simplify by using more devm functions")
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/devfreq/sun8i-a33-mbus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/devfreq/sun8i-a33-mbus.c b/drivers/devfreq/sun8i-a33-mbus.c
index f99af530211d..4bd5657558d6 100644
--- a/drivers/devfreq/sun8i-a33-mbus.c
+++ b/drivers/devfreq/sun8i-a33-mbus.c
@@ -381,7 +381,7 @@ static int sun8i_a33_mbus_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, ret, "failed to lock dram clock rate\n");
 
 	/* Lock the MBUS clock rate to keep MBUS_TMR_PERIOD in sync. */
-	ret = devm_clk_rate_exclusive_get(priv->clk_mbus);
+	ret = devm_clk_rate_exclusive_get(dev, priv->clk_mbus);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to lock mbus clock rate\n");
 
-- 
2.47.2


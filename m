Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B781E2D9792
	for <linux-sunxi@lists.linux.dev>; Sat,  8 Aug 2026 06:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786170046; cv=none; b=KA4rtYz0HxDGR46jC96xHqoLRkqoIxULM2sBW0JNidRepTPMIaWPodWUgq+2ABd2Fj35BLTNUjv9dLG0oatMNwpd+f3A1i3/6DxqGFXCfvS74suM8QYm5qup3rfCtU+4sjtI4N0VPQ6SoiRPnpUJGiTOTsf88TH6dGMp/PmPF0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786170046; c=relaxed/simple;
	bh=NFa9GnuhwXPiI5dsbr0iH6GqeKKs5mM+DrvDRZs6m+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sy5jDsMW668Y1WXZkdE/CI6hx3f3T3nAZSH73ljwdDa8vGtPgC5GapD4XuLN9ZX9Bhhr+8XnT9w0RaYiXLcLIAAMoQV2tIIjWVQKFr4WeD+RTy5kikxOao0gyiT5V/GzPXMfBsooERQ1JwtQ5EulmsVsEt25l5ILMVAywRdHa18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NRuP4r2f; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NRuP4r2f"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38125cebfdaso299420a91.1
        for <linux-sunxi@lists.linux.dev>; Fri, 07 Aug 2026 23:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786170045; x=1786774845; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wKhyMQrWu8wbOkY8L+PT3L5GzBtcKEJdYmE407RmSq8=;
        b=NRuP4r2fQfNWIyNDoY2N0AD/lK3N9q66dPN7DH3rA5EbCuP+dEXod5eFxE+ztXRaT2
         HwZbb5kvDLMX1DJP4HKC+2ibR2IUQxKesp8JBcg/8vgeCs2aoo2nq/Tq4cOOxoExepae
         c9DvmssZErupD0hDJhH+fKCsaZZ5bytLERSbeGwKGJcKxkGoeA+MTFBO4TtZiFUtvFL6
         klcm37fo+F3D9N4J3TI1PA0JkMEDDw0FjYBmdRjjE6dKTaj3OdJ6FhsRfGJpuxp506LF
         p+Bn9ZmmV9nxwhIq8/DG5rwV/wR1U4/MCw8m0LV0n/tpvR7mwQ4Y1951+s+JM/swG5E2
         DKSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786170045; x=1786774845;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wKhyMQrWu8wbOkY8L+PT3L5GzBtcKEJdYmE407RmSq8=;
        b=HfcNQMc+OOgMvz2M1QTfghvmDwYg6wAAOHy+b7V9dWH91dmmEtIBII/tZHqU2HN+cx
         ATWVyHNdLZi6ytPT8k7r8Tm9nCc79IgbXGWvCt9T8GbLR9pNtdo96hiSaxuotDgbuCPB
         70N+ejxPr1cvLBVwXlc3sTsmIg5QicqXpIck+vgxYxWpX19kxB78ar8KX9JseF4josYh
         7KAkylRzBn+qCnGLfWKkNHfgkFeqUNCD+JCjVXh101pNXMbf8BteEwGWPQn69gDteh2+
         drAihINeEfDmyPlZQ2zPc0S2YHA/2mssCQzUehM0JLWajeiaJVfWExwhN4cnq/Dqbv3x
         5ULw==
X-Forwarded-Encrypted: i=1; AHgh+RphEGiPc3F9z6E8Ats31w4muh57IEHC8mjTGjwTKt4xwPHWNprcRo8hwl9aazS/LojQUD25POJYeayqhg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwhFBj0DdrEt604rMlqbjWfZwGtd1ThT0EFyYXNopJWoXUOSJRB
	x48aw2yXnGcSYVIXJwBTW09vyVfWRuPV8hJojO2yZ8qHWfFEnINwZFYW
X-Gm-Gg: AR+sD10dbsx7B/dh+Nwbip71MgmislzcjpFcBhnIl0KQWA9KFrwqhP5It5RWJg3zofX
	PY6KHPZNV6n9j+AsgaTOUsi2EHn8vFg0QFOa4R2BImj6UfDRbEhROL7Hv3UuQaHIAWCly9+Cv70
	t06Fi9ANeXiQExIn4IW+yyDfdVj/Mc80KGAu1KdC0k/yujNTqQKiJPYXkWeXHmyRo+ZtudBNrMW
	BbJSgGRxI7q9tesIogPsaHQPKAp5rQEoFP83Y89ofBT/U4MKHf1UBNN8++AOAS1G31viYXhyTmL
	0Nwa/xi0s0m7MmAtzrhcIi3tQ9ZwNiapzoMMK8o2BFJLkvrycpea6+uBt286yO/3oGuaEl7NEQV
	GpW7Nhpcxk87DEGLyuHJiWN1+fQnE4TWeC4dTHp3nuVQLoX1Y7QRe9TjoMcje3Xx2xhx2QT6cSp
	f3RcktexRSFj1xTW66fqKBdqlhNn+FH6Bc3Qk1X+vU7kEIPtIh7to=
X-Received: by 2002:a17:90b:3a10:b0:38e:70d5:b12d with SMTP id 98e67ed59e1d1-39261fbc353mr9787630a91.6.1786170044921;
        Fri, 07 Aug 2026 23:20:44 -0700 (PDT)
Received: from lgs.. ([152.32.133.247])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3925fc6dab4sm4996353a91.3.2026.08.07.23.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 23:20:44 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Andrey Skvortsov <andrej.skvortzov@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kees Cook <kees@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH] bus: sunxi-rsb: fix usage_count leak when autosuspend_delay is negative
Date: Sat,  8 Aug 2026 14:20:29 +0800
Message-ID: <20260808062029.2597581-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sunxi_rsb_probe() calls pm_runtime_use_autosuspend(), but
sunxi_rsb_remove() does not call the matching
pm_runtime_dont_use_autosuspend() before disabling runtime PM.

If the autosuspend delay is set to a negative value while autosuspend
is enabled, the runtime PM core increments usage_count to prevent
runtime suspend. Without calling pm_runtime_dont_use_autosuspend()
during driver teardown, this reference is not dropped and usage_count
remains unbalanced.

Add the missing pm_runtime_dont_use_autosuspend() call before disabling
runtime PM.

This issue was found by manual code inspection.

Fixes: 4a0dbc12e618 ("bus: sunxi-rsb: Implement runtime power management")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/bus/sunxi-rsb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/bus/sunxi-rsb.c b/drivers/bus/sunxi-rsb.c
index daf0ea563e47..cd4c857756cf 100644
--- a/drivers/bus/sunxi-rsb.c
+++ b/drivers/bus/sunxi-rsb.c
@@ -815,6 +815,7 @@ static void sunxi_rsb_remove(struct platform_device *pdev)
 	struct sunxi_rsb *rsb = platform_get_drvdata(pdev);
 
 	device_for_each_child(rsb->dev, NULL, sunxi_rsb_remove_devices);
+	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 	sunxi_rsb_hw_exit(rsb);
 }
-- 
2.43.0


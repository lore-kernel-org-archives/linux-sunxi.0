Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB7938B130
	for <linux-sunxi@lists.linux.dev>; Wed, 13 May 2026 07:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778656285; cv=none; b=hV/KsNiQrTmcnMGWqQMwH7R3yHvolj81jkS9eHQ9IrkxwSCM93muTt3cHkcJ26UuCy1xCMdfrZqom3fd2TZxGSngicqdfP27rS+xACQaaqsqZfiG9JJLENy3xSBHgxUHrewcPwV9cV8ju+T4yxKCoJmSCiM0/Df2KSjf8aT8riE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778656285; c=relaxed/simple;
	bh=h207wMrvvV1Ldhg9nEqnfEuJuI1hYIKUwGDHp11u7W0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Td4IpEUbF5XzU+gzNjT3xJLiXWM1SalLSjOTz1GYHtZqePHFlpy+CvzivLUWJrgEVbSoUElrqdZ2Y7OOFJmKmykFjnwOhEnlaUn4XBQAM7IJDlVsZJhupFSHJaID5mG+XQjw9HZ9kIsNdUBlJJ3titir4O8og9fPTJaapw9JPNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o77jdzrU; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o77jdzrU"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2baca4df358so39330805ad.2
        for <linux-sunxi@lists.linux.dev>; Wed, 13 May 2026 00:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778656283; x=1779261083; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MAUm05/737IqhRNlo9FHhqv1K5HUvIKv2GcQLIvOcf0=;
        b=o77jdzrUTAE7OPCVkfiypKJLnJ9Wmc9TA20oeVatOmqQrh8Ru4F7q5Td/zf+lwxAV+
         Il9j2YhftdPlJrBrmpqByTQaTMgpQB9ouUuas0glYvlOKff2rIVIhgu5W1MqCTLcyAAU
         nw/LPfBflKMRYbpDdUa63FWv6y7RKYshbXz7L9IytDwoHwMcJNj2ekiBz8xn0ozDLkmM
         1P6wDqZOqtsw+wl3rwe84vSbAnklzJarBEjiNcM0hkkbRH719AoWLkVf0z/zTyHyFZ8H
         Uu1unFpjhUBxVF36fJhkLURPF+JYxFNQasQczeepHz9hGJ45NMGHLjBN0xsHXS2/sA9B
         T6WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778656283; x=1779261083;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MAUm05/737IqhRNlo9FHhqv1K5HUvIKv2GcQLIvOcf0=;
        b=Y7wmCj7ZOhQtfodsdBSBzK9g5gPUi2ULpi4b04QlpPmNLdoGZv9A+IdPNALNuvpnQ7
         5w6IYLp7aEWDgfWMJuP/wE0znX7pDA4CBJfeeMgGHuf7Gg/T6om2In1XZz8TJHwBlX9Q
         eGv5TVZHcFUq2OSdYHm+JzBJ3J0qTzswN5rz0Z/Msc+B2+wWjzjYk7V07bh7UZ99AW4n
         maw3W3FPXINT7jQqNPEZ59koEdlK+W8OYmnoTJR1o+sKdf9UUQvT6iE0giZzORTYWD3d
         oKsAENrqzNIpYWX7tWwmP8fepC30kS8NlUUY6iz9WYH/uGiI5e0CZmpN/gxDci7PocJO
         5jzw==
X-Forwarded-Encrypted: i=1; AFNElJ/jtXeC8Gd//lYSWTA6bnbeT71Cq71G2lDZq5BqBb0nehXQYJskBFeLs5OrWBkzLclsW3imr4+MMd3sSQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5X7JnTndYzlclJVAJ2htx+hLcRq1rBgPOdN6YWxlX1cbIxYFS
	YNV/9D6FfY1JMkFcjK1BJ7Fj83I1wgw7CH9AkjO4BceDz8n/ppKy+js=
X-Gm-Gg: Acq92OHoTQMO4mIxX/OhmKis+5c8AIWpu1hWS994CmDTQEggOHkrndvRZkTdzaPOPLC
	7RDnrTP5HAHwoP7EX/Mb5zAZ8NSbew2lB9Tl/aM3DO320+qqe1o3uX0OR8ZAUBvDdvOxnDB+2uk
	B/cLYknNSFaXV7eCIGbfdd7N7P4je3yGYXDdODKg80nT/Is+mW/n9gcd5RLF21kOy+dNgBtQmvy
	kvrja5a4Qu2uSmX6+RTXrx/QgFSJTrRfB6/R7YaqZKUPYVLvyL0HPzwB8eMS3LkwjlCB0yHM5XB
	ttKuDJIikWnGvvH44GSgNWu6HrCZmBzHJAgJMKj5+nrzeeImFdA2+tCkomjC08wUnPNMjjCHuJV
	kaXmOX/hkf5BqC4EkHZlN696S/LqeE2AFzBb+yzwTgikuxkMzqZr+CR3o+6i6mlkK24xsRAXNDK
	w7Pl6qyQz0nKsJi7h6CEu2R4xUr3gBXOPYPBMIAgiWaWhXfKhuPBAg6+ui/8bkVPVfltsbGsXO7
	wYQhXi6Q4f8TPL0D6pVY6fxJfQssdOnTsFbgSU=
X-Received: by 2002:a17:903:1448:b0:2bd:2458:50d4 with SMTP id d9443c01a7336-2bd27706be2mr20525425ad.41.1778656282606;
        Wed, 13 May 2026 00:11:22 -0700 (PDT)
Received: from localhost.localdomain ([211.198.234.66])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d405efsm165677855ad.23.2026.05.13.00.11.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 13 May 2026 00:11:22 -0700 (PDT)
From: "=?UTF-8?q?=EB=B0=95=EB=AA=85=ED=9B=88?=" <mhun512@gmail.com>
X-Google-Original-From: =?UTF-8?q?=EB=B0=95=EB=AA=85=ED=9B=88?= <pakmyeonghun@bagmyeonghun-ui-MacBookPro.local>
To: Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Myeonghun Pak <mhun512@gmail.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] media: rc: sunxi-cir: unregister rc device on probe failure
Date: Wed, 13 May 2026 16:11:03 +0900
Message-ID: <20260424000000.558-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Myeonghun Pak <mhun512@gmail.com>

After rc_register_device() succeeds, later probe failures must undo the
registration with rc_unregister_device(). The current error path jumps to
the allocation cleanup label and only calls rc_free_device(), leaving the
rc device registration and resources created by rc_register_device()
behind.

Add a registered-device unwind label for the IRQ lookup, IRQ request, and
hardware initialization failure paths. Keep rc_free_device() for failures
before rc_register_device() succeeds.

Fixes: b4e3e59fb59c ("[media] rc: add sunxi-ir driver")
Cc: stable@vger.kernel.org
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/media/rc/sunxi-cir.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/media/rc/sunxi-cir.c b/drivers/media/rc/sunxi-cir.c
index 92ef4e7c6f..cc64a68dfe 100644
--- a/drivers/media/rc/sunxi-cir.c
+++ b/drivers/media/rc/sunxi-cir.c
@@ -344,22 +344,26 @@ static int sunxi_ir_probe(struct platform_device *pdev)
 	ir->irq = platform_get_irq(pdev, 0);
 	if (ir->irq < 0) {
 		ret = ir->irq;
-		goto exit_free_dev;
+		goto exit_unregister_dev;
 	}
 
 	ret = devm_request_irq(dev, ir->irq, sunxi_ir_irq, 0, SUNXI_IR_DEV, ir);
 	if (ret) {
 		dev_err(dev, "failed request irq\n");
-		goto exit_free_dev;
+		goto exit_unregister_dev;
 	}
 
 	ret = sunxi_ir_hw_init(dev);
 	if (ret)
-		goto exit_free_dev;
+		goto exit_unregister_dev;
 
 	dev_info(dev, "initialized sunXi IR driver\n");
 	return 0;
 
+exit_unregister_dev:
+	rc_unregister_device(ir->rc);
+	return ret;
+
 exit_free_dev:
 	rc_free_device(ir->rc);
 
-- 
2.50.1

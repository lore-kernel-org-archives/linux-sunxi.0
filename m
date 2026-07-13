Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51373624DB
	for <linux-sunxi@lists.linux.dev>; Mon, 13 Jul 2026 21:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.243.27.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783978295; cv=none; b=AMAHMm+tA1bucB61jWM+tEE35Sok3W3XZRUgXxHwxW1YuXlZyTprIWRJBvOdDLoOrvlGmW/vVe59u9EOVlbr8jKfMlW0xAK9dcqD2Y8xmQXN8eLo+0SbWYG3QJc8iHGzHCa1jtIUhqPmTJ0gV9sFihz305QX/kt65MYCz+qpNZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783978295; c=relaxed/simple;
	bh=PFYYQhVg4NRarAQ81g5gFeRQ3Pkd+XUXZYeUxj9P9Kk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R5DpzjUCXdp2eWZstGmWPSnGHFeiob3X9hy5lvk39jJOfRHPq6YOnUWzc818I5WKrwbEAhtLVRfb/Uhpj0tqzqG0f5QCx4CNBANRZGR6hxOmHob4jw7OF5gDoK3h9aFalWsEpd/rye9thRya379hSLLTUhIRJdAQgSsnnrAG8Lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=tk+Uuiz7; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=tk+Uuiz7; arc=none smtp.client-ip=92.243.27.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="tk+Uuiz7";
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="tk+Uuiz7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1783978284; bh=PFYYQhVg4NRarAQ81g5gFeRQ3Pkd+XUXZYeUxj9P9Kk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tk+Uuiz7dx6b0K76rO+IqBr7UYSiJuIM3z/Nm1TLA1YJECFKTxPulnLmu6f3PWM98
	 d38LYkaWefQXGkU15JYrHREz1+XE2OJYiqVzitLuI8qMJfvjxVsjK2+pPYAdbUTEFv
	 oPSeMjTTtMUUs+xCkBRuQyAHP3d2gkuB/7/FWJPWxVmwyXX7qQf/XuZZjH7KW12ekS
	 DXPghBtGhMJEPhtdp1xfU4nSaitT5urfWLpvwrLFB0F5ooN+aELeVveuJT29CdlLcn
	 YOHuMYcSP/7L7ox8/ZAe4FVPJDpqae82Lgc+LzekMTunD0O33RAdYuBxGmep8cw3Jg
	 W7VfVBwzgYrpA==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id E7AF141E9D; Mon, 13 Jul 2026 22:31:24 +0100 (BST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1783978284; bh=PFYYQhVg4NRarAQ81g5gFeRQ3Pkd+XUXZYeUxj9P9Kk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tk+Uuiz7dx6b0K76rO+IqBr7UYSiJuIM3z/Nm1TLA1YJECFKTxPulnLmu6f3PWM98
	 d38LYkaWefQXGkU15JYrHREz1+XE2OJYiqVzitLuI8qMJfvjxVsjK2+pPYAdbUTEFv
	 oPSeMjTTtMUUs+xCkBRuQyAHP3d2gkuB/7/FWJPWxVmwyXX7qQf/XuZZjH7KW12ekS
	 DXPghBtGhMJEPhtdp1xfU4nSaitT5urfWLpvwrLFB0F5ooN+aELeVveuJT29CdlLcn
	 YOHuMYcSP/7L7ox8/ZAe4FVPJDpqae82Lgc+LzekMTunD0O33RAdYuBxGmep8cw3Jg
	 W7VfVBwzgYrpA==
Received: from maru.home (host86-148-148-68.range86-148.btcentralplus.com [86.148.148.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id D531040155;
	Mon, 13 Jul 2026 22:31:23 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 06/11] media: sunxi-cir: Ensure no more interrupts can occur before free
Date: Mon, 13 Jul 2026 22:31:00 +0100
Message-ID: <397628f5644f6488f111a3a3ee07d00ce01a13b0.1783977550.git.sean@mess.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1783977550.git.sean@mess.org>
References: <cover.1783977550.git.sean@mess.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Only call rc_free_device() once the hardware has been stopped.

Fixes: dccc0c3ddf8f ("media: rc: fix race between unregister and urb/irq callbacks")
Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/sunxi-cir.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/rc/sunxi-cir.c b/drivers/media/rc/sunxi-cir.c
index 28e840a7e5b8..af1ee08ffdbe 100644
--- a/drivers/media/rc/sunxi-cir.c
+++ b/drivers/media/rc/sunxi-cir.c
@@ -374,8 +374,8 @@ static void sunxi_ir_remove(struct platform_device *pdev)
 	struct sunxi_ir *ir = platform_get_drvdata(pdev);
 
 	rc_unregister_device(ir->rc);
-	rc_free_device(ir->rc);
 	sunxi_ir_hw_exit(&pdev->dev);
+	rc_free_device(ir->rc);
 }
 
 static void sunxi_ir_shutdown(struct platform_device *pdev)
-- 
2.55.0


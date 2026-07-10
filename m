Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4D23C8C43
	for <linux-sunxi@lists.linux.dev>; Fri, 10 Jul 2026 08:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.243.27.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783673640; cv=none; b=ijmbmde4VhUvePvkVEtUCCt+vYYtsUklFcHPIm4M9infzgdNGRHJoaeoCoGRFcU8D552RMzPtQDjO8hGAGFOwJdjjIXL3hriGTgoU0w+pd5g6kU9HGAxU5BKtMlK9cF1WdEfVrYU6hVVJYWdpJwUseodSW4wp+Bk4LBaUQqJr2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783673640; c=relaxed/simple;
	bh=PFYYQhVg4NRarAQ81g5gFeRQ3Pkd+XUXZYeUxj9P9Kk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lvgdxHRNvGMAVbkw01qMqMPp0riHjQCn4Ys90grTRTEDXJmhNhZb0TTprZMnUne13tAb7FaWDaTUMOuGqoWA27ichEEDHYvNGInitburxsb9PJ8LNvH3DHwX9iyVn1ci1z2xSFzZzwN6efSoevlQgtPnKqV3YfZ6Z5ZxWsT2wTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=UT4zSjal; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=Q7tS2vmA; arc=none smtp.client-ip=92.243.27.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="UT4zSjal";
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="Q7tS2vmA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1783673631; bh=PFYYQhVg4NRarAQ81g5gFeRQ3Pkd+XUXZYeUxj9P9Kk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UT4zSjalRJqXyQhA/FSCEtu4h11D7ROz/3tcubYOueYKd4fy1BE6vBGljRiGu5dR7
	 DyYiH+aCgVnl15gpEKIdzavkb98YvIBA0xDNT7MGqg8vCve6ZQnvAeRCRONkdrcNvc
	 SxSMr6xrOze/6EomAamObvaS1asgJ1wJ7GZZ/SbYkGw++N+hCU6LMeK5jaDY1EDUML
	 tm3hl8pNOXDop1WTfLI74QnHQ3V/yBlFNr9PmBAnQ9I2IlA0Q9xjFoJ9OJJwKF1pHp
	 LP4NCPAfOHmFwYCIHS2RqJLNGrHmCS4ScflCXkgo8UUP9W9s+SmWZELJGmJ/yP470N
	 592JPHiCEnxZw==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id BF25C40194; Fri, 10 Jul 2026 09:53:51 +0100 (BST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1783673629; bh=PFYYQhVg4NRarAQ81g5gFeRQ3Pkd+XUXZYeUxj9P9Kk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q7tS2vmA86o248eMBvJZbYEhyUISrTe2nv47HVo3EBB7Wxrw/q2cjF2Q/s1a683pj
	 BoBwF+MTN5v6MmQc7WN1g5SAoqY0NzP9lX+ggsZPVjvkpArpwCtP34JWz2KigVZg4e
	 6L0xbtr9uexxKL+seFkxe6wfL9blzBpwgYSgfoEFoYy6gvzgZ3t9n0FXXuHercC8Gb
	 ArHomzEUtOdrVqrjnuDjawTYJZawhFr+ZEK3GKuww4egj8dYWc46AUqlVpofx+Ap1z
	 aJPjdLb7TV96CXOc2nFahvHojnRrNmcHsgaXzd50an5BycQdq1m405O6IWFL8/cCJK
	 Z4M3GggQWecXA==
Received: from maru.local (unknown [62.232.99.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id B556540B4C;
	Fri, 10 Jul 2026 09:53:49 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/7] media: sunxi-cir: Ensure no more interrupts can occur before free
Date: Fri, 10 Jul 2026 09:53:32 +0100
Message-ID: <e74a0caf91aaefaf98476a191e6489c606632bf1.1783673420.git.sean@mess.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1783673420.git.sean@mess.org>
References: <cover.1783673420.git.sean@mess.org>
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


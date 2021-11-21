Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504402C81
	for <linux-sunxi@lists.linux.dev>; Sun, 21 Nov 2021 08:35:41 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id j140-20020a1c2392000000b003399ae48f58so6179984wmj.5
        for <linux-sunxi@lists.linux.dev>; Sun, 21 Nov 2021 00:35:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=h1W02faQu+Szravq8WQw5MogG6/ITT6EryqDefYAc60=;
        b=prsKTRolTZAn/eLp8jy5tA8v6BeaTxkby23xqeYZ6awHFSgKsVm13oLN/jcEZ9SyIl
         I1Ywe/CZ+wOhuip2GCVpBVBa0K7XjExRe5HJsIs/Nlligz8qyTuaIlBV9GuoGuw1Jcgk
         CQ0B/F7MnQObw0ZX5G50GwOpx8FMOVYLcag09isovlJct6uD6A45u2VOXNC0HCcN78x0
         yvxOcfI9/llc+5+ebilSShkZ9jfbd1LdHUY5KdaP7i3AayQOGN43XDAPlhJdhATs2BnB
         8o8I97bJ07mxVenWWUkjDrXe23PDh6FqOharpfFWFfoSKH47Blo0BFBEIRRkRDuRmpmP
         626w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=h1W02faQu+Szravq8WQw5MogG6/ITT6EryqDefYAc60=;
        b=GAlWqkbTfF/hi/b6nqGxQO6/a3XnjKAOX2ZM8iMLlBkQEOxD15dAFMjXJ2/U3Npf0n
         htNB9Mw8r99KU8dDdcfJEfJRFkM0TLWpWFnwKpF+lA+NhbT59G7B3Bh/m3H4x+ro7zk5
         gJ9ig4usbzIuxWk/X+CsQz886FKoXfy4yrfRAWeW4VjAhSNk7mV+zFImIinDExhoRA/t
         OzuJCDsx+Jk1iz3FLAU/zFNsImUJbbZ0+oPBHBKS8xHCt4DKbD7u505scZNNgjepwGcF
         L+dfvIYKQRT7l+MFqD62bOZSBDFli1FIUoLr15bDMK4csn92pM35kpayEIXuTlLho6/a
         NdXQ==
X-Gm-Message-State: AOAM533s9ylL5UQHh/c4lUepQ1BILi1d0hJlJVhcijQzcE4odCSDaiOH
	kp3zyItqXXj6UtQR7ig8rTI=
X-Google-Smtp-Source: ABdhPJzCdBRcE5NpSYEOCmOLME4QneazaEDFzZrCDOhWB2wRMzb3iKPwCltWj7nYRNphcWEq9/+RwQ==
X-Received: by 2002:a05:600c:358a:: with SMTP id p10mr17212213wmq.180.1637483739638;
        Sun, 21 Nov 2021 00:35:39 -0800 (PST)
Received: from kista.localdomain (cpe-86-58-29-253.static.triera.net. [86.58.29.253])
        by smtp.gmail.com with ESMTPSA id o1sm5100456wrn.63.2021.11.21.00.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Nov 2021 00:35:39 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	wens@csie.org
Cc: samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH] bus: sunxi-rsb: Fix shutdown
Date: Sun, 21 Nov 2021 09:35:37 +0100
Message-Id: <20211121083537.612473-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.34.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function sunxi_rsb_hw_exit() is sometimes called with pm runtime
disabled, so in such cases pm_runtime_resume() will fail with -EACCES.

Instead of doing whole dance of enabling pm runtime and thus clock just
to disable it again immediately, just check if disabling clock is
needed. That way calling pm_runtime_resume() is not needed at all.

Fixes: 4a0dbc12e618 ("bus: sunxi-rsb: Implement runtime power management")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/bus/sunxi-rsb.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/bus/sunxi-rsb.c b/drivers/bus/sunxi-rsb.c
index 6f225dddc74f..4566e730ef2b 100644
--- a/drivers/bus/sunxi-rsb.c
+++ b/drivers/bus/sunxi-rsb.c
@@ -687,11 +687,11 @@ static int sunxi_rsb_hw_init(struct sunxi_rsb *rsb)
 
 static void sunxi_rsb_hw_exit(struct sunxi_rsb *rsb)
 {
-	/* Keep the clock and PM reference counts consistent. */
-	if (pm_runtime_status_suspended(rsb->dev))
-		pm_runtime_resume(rsb->dev);
 	reset_control_assert(rsb->rstc);
-	clk_disable_unprepare(rsb->clk);
+
+	/* Keep the clock and PM reference counts consistent. */
+	if (!pm_runtime_status_suspended(rsb->dev))
+		clk_disable_unprepare(rsb->clk);
 }
 
 static int __maybe_unused sunxi_rsb_runtime_suspend(struct device *dev)
-- 
2.34.0


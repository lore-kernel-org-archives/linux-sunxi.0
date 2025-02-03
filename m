Received: from mail-gw01.astralinux.ru (mail-gw01.astralinux.ru [37.230.196.243])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628EA1FECA5
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Feb 2025 11:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.230.196.243
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738582225; cv=none; b=F3n4T0RYAp3CX05CEhIpRd6Mgs6XSZcl2Z1clly9SQyor1GY/4+c+q4J7Wd/s246YgVC//B3N7ukuTBNXuZQLM/058/yUO0lCj2NsIz+JitZN/WfAEPjbVBsRKsqKmfxCqF50MSvl/YiG/3OU4lb8+cgQyLyD7Y+InAIShYS54s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738582225; c=relaxed/simple;
	bh=baN8Og7egUm0YAgH+MLV7CddHfdSlD1CiAUJq8ntw68=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kp/f91pLOo2gG6h/geDlasQ0v6p8x+FstpdVSZmzjYv6gSn2hmYkdi4/6IbNEWlOs4AGBFYtkz5ahxO20Lyp1oejVR8vET02+3dG8n6V2lO9lEwZp+kJYKEOjZvHeLFRC4As7d5s0vOAWO2pU2FDVJnCt1mDVMrbPNoBkY1o8K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=astralinux.ru; spf=pass smtp.mailfrom=astralinux.ru; arc=none smtp.client-ip=37.230.196.243
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=astralinux.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=astralinux.ru
Received: from gca-sc-a-srv-ksmg01.astralinux.ru (localhost [127.0.0.1])
	by mail-gw01.astralinux.ru (Postfix) with ESMTP id 630DD24D3A;
	Mon,  3 Feb 2025 14:30:12 +0300 (MSK)
Received: from new-mail.astralinux.ru (gca-yc-ruca-srv-mail04.astralinux.ru [10.177.185.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-gw01.astralinux.ru (Postfix) with ESMTPS;
	Mon,  3 Feb 2025 14:30:05 +0300 (MSK)
Received: from localhost.localdomain (unknown [10.198.57.103])
	by new-mail.astralinux.ru (Postfix) with ESMTPA id 4Ymkn30cV8zkWyl;
	Mon,  3 Feb 2025 14:29:58 +0300 (MSK)
From: Anastasia Belova <abelova@astralinux.ru>
To: =?UTF-8?q?Emilio=20L=C3=B3pez?= <emilio@elopez.com.ar>,
	David Laight <david.laight.linux@gmail.com>
Cc: Anastasia Belova <abelova@astralinux.ru>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH] clk: sunxi: clean up rate counting
Date: Mon,  3 Feb 2025 14:29:28 +0300
Message-ID: <20250203112930.650813-1-abelova@astralinux.ru>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-KSMG-AntiPhishing: NotDetected
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Envelope-From: abelova@astralinux.ru
X-KSMG-AntiSpam-Info: LuaCore: 50 0.3.50 df4aeb250ed63fd3baa80a493fa6caee5dd9e10f, {Tracking_from_domain_doesnt_match_to}, astralinux.ru:7.1.1;new-mail.astralinux.ru:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2, FromAlignment: s
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiSpam-Lua-Profiles: 190748 [Feb 03 2025]
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Version: 6.1.1.7
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.1.0.7854, bases: 2025/02/03 07:33:00 #27201296
X-KSMG-AntiVirus-Status: NotDetected, skipped
X-KSMG-LinksScanning: NotDetected
X-KSMG-Message-Action: skipped
X-KSMG-Rule-ID: 1

If n = 255, the result of multiplication of n and 24000000
may not fit int type. Swap division and shift with multiplication.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 6424e0aeebc4 ("clk: sunxi: rewrite sun9i_a80_get_pll4_factors()")
Signed-off-by: Anastasia Belova <abelova@astralinux.ru>
---
 drivers/clk/sunxi/clk-sun9i-core.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/sunxi/clk-sun9i-core.c b/drivers/clk/sunxi/clk-sun9i-core.c
index d93c7a53c6c0..639c83ed63b8 100644
--- a/drivers/clk/sunxi/clk-sun9i-core.c
+++ b/drivers/clk/sunxi/clk-sun9i-core.c
@@ -25,12 +25,12 @@
 
 static void sun9i_a80_get_pll4_factors(struct factors_request *req)
 {
-	int n;
-	int m = 1;
-	int p = 1;
+	unsigned int n;
+	unsigned int m = 1;
+	unsigned int p = 1;
 
 	/* Normalize value to a 6 MHz multiple (24 MHz / 4) */
-	n = DIV_ROUND_UP(req->rate, 6000000);
+	n = DIV_ROUND_UP(req->rate, 6000000ul);
 
 	/* If n is too large switch to steps of 12 MHz */
 	if (n > 255) {
@@ -50,7 +50,11 @@ static void sun9i_a80_get_pll4_factors(struct factors_request *req)
 	else if (n < 12)
 		n = 12;
 
-	req->rate = ((24000000 * n) >> p) / (m + 1);
+	/* Division and shift should be done before multiplication to
+	 * avoid overflow. The result will be correct because '>> p' and
+	 * '/ (m + 1)' are both just conditional 'divide by 2'
+	 */
+	req->rate = ((24000000ul >> p) / (m + 1)) * n;
 	req->n = n;
 	req->m = m;
 	req->p = p;
-- 
2.43.0


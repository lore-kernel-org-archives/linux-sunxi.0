Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE284D52D
	for <linux-sunxi@lists.linux.dev>; Mon,  7 Aug 2023 12:44:26 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4RKGGv3BnLz9sW7;
	Mon,  7 Aug 2023 14:44:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oltmanns.dev;
	s=MBO0001; t=1691412263;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eujE6oPZv+zmJCFxuwNd5VPBn5IlE6vd2cc/1IpSkXc=;
	b=Y1z6Z9dbD+y1cpjLhNyi5Zd1auL26Zaea26L4auYxOnb7gY/t1T63Qn1SspKzzzaWFymKv
	K/bqQXnYbTDFmS9MHm38d14vse6oAdAWh/UxdZthEgZVkCuI25ovn+rQdU9Z+kjuQz2RoD
	pbohH+fLmF7Td9avv8QkGczZJOsGczso5j6KWRfr35yVS38LfgyI5ROYLZRoIdl0zjGsvx
	xsCAiwrsQV0cbPY2imTw9jpLz0oZUWqhhZAmVeoGZpb2CiLyTZ9HwTddNEFTRP4A6LaftN
	dSiqazAAqdEzi55CxIDcX/9jaSWqM/LYHvvaMiNDOrx0zEp5Uz0I23arZ+fUpg==
From: Frank Oltmanns <frank@oltmanns.dev>
Date: Mon, 07 Aug 2023 14:43:44 +0200
Subject: [PATCH v6 11/11] clk: sunxi-ng: nkm: Prefer current parent rate
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230807-pll-mipi_set_rate_parent-v6-11-f173239a4b59@oltmanns.dev>
References: <20230807-pll-mipi_set_rate_parent-v6-0-f173239a4b59@oltmanns.dev>
In-Reply-To: <20230807-pll-mipi_set_rate_parent-v6-0-f173239a4b59@oltmanns.dev>
To: Maxime Ripard <mripard@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>, Roman Beranek <me@crly.cz>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Frank Oltmanns <frank@oltmanns.dev>
X-Developer-Signature: v=1; a=openpgp-sha256; l=975; i=frank@oltmanns.dev;
 h=from:subject:message-id; bh=nX7O6HIGcIL6L1G1S3ONo9eulQgwHWxaNoxqcrZCmdE=;
 b=owEB7QES/pANAwAIAZppogiUStPHAcsmYgBk0OcLfaRyp447JpXrEZFmI4EHjbwF9UWfiLNWq
 QOaFHIRNpmJAbMEAAEIAB0WIQQC/SV7f5DmuaVET5aaaaIIlErTxwUCZNDnCwAKCRCaaaIIlErT
 x60gC/9o+RMltX9ZY6ftQCMuJXLFJlqfRCHw9zBPZWmougN1+w6ltG1Tp0m/y2ITx6pTgi25D6+
 KD9Ipv4gUg0pfpZxgUbIibzgzLktFCj8nsWuwP6RoczbZf2cz5EC6uJPCppRY8n8VoCYJ3MQXCj
 AkFvx/V/K+DxWpCdqbaBhBXC04tGPbx/UehIXdK/1dgtg17uq4t3lM+2tCN9i413FTp9mbpR/1X
 a2Yb9ESG+SVVTmTUy1VkBBofGvCCN0Mymk/vGv2ofXjuAuo2xZ5Wy47wkKIvy+XV9VG+u6IY3Bi
 ltLW6QAHXbhdtcCFk4YCSakotisQcD7kTSmJc31x0LZq0LwzbJ3bfWVyLWkEwlNDxkA9SPQPOEE
 IXQ56SwHsSRbtoC5ovgn13hmyRv0o9W6nerBobz1bNYtciMCLURFL74OfvCueBeHym+XjUYp5fS
 KPWPeR89A3oydQ4e4zuHAgXaEELjn8CvW2H96XYViGCxkQZuBFiSMCAQWS1Y/BA+/ZY/Q=
X-Developer-Key: i=frank@oltmanns.dev; a=openpgp;
 fpr=02FD257B7F90E6B9A5444F969A69A208944AD3C7
X-Rspamd-Queue-Id: 4RKGGv3BnLz9sW7

Similar to ccu_mp, if the current parent rate allows getting the ideal
rate, prefer to not change the parent clock's rate.

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>
---
 drivers/clk/sunxi-ng/ccu_nkm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi-ng/ccu_nkm.c b/drivers/clk/sunxi-ng/ccu_nkm.c
index a714dcf0dfc1..eed64547ad42 100644
--- a/drivers/clk/sunxi-ng/ccu_nkm.c
+++ b/drivers/clk/sunxi-ng/ccu_nkm.c
@@ -34,7 +34,8 @@ static unsigned long ccu_nkm_find_best_with_parent_adj(struct ccu_common *common
 
 				tmp_rate = tmp_parent * _n * _k / _m;
 
-				if (ccu_is_better_rate(common, rate, tmp_rate, best_rate)) {
+				if (ccu_is_better_rate(common, rate, tmp_rate, best_rate) ||
+				    (tmp_parent == *parent && tmp_rate == best_rate)) {
 					best_rate = tmp_rate;
 					best_parent_rate = tmp_parent;
 					best_n = _n;

-- 
2.41.0


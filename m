Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF27B1714B8
	for <linux-sunxi@lists.linux.dev>; Sun,  6 Oct 2024 22:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728253353; cv=none; b=LzcKNn5sD+tHml15Fhj6ynbYmdxYjzenCLuZgZib2ZUmyLf79KlRDbLPklzTm5Dqk16UvStziK+3MsyC3VJw+G1nWQo24FO30rLsmCu5TBBRCoYCN5UZF9wVs8Eeoh4zbVre/88jqk9KAPnWML2lliB1j3YrltPNARwGJFBGnos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728253353; c=relaxed/simple;
	bh=/m9R/lVY6qC5/eileNAsBFBPO7QHTV8yl80dwlwYZuQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Dp1F1fkaF0JbIiFdDuy+InhD4PNSdTKVziD/0FvbTvlQ9WsBixj/Zx0lvSb3+uwy3CgftF/B0S8wF3TnBEnyXRVlazCpG9dGQ3uslyQRkTrdMtHD6XAQdVtZTvSWvYd5jjh7tuw5BeJTS2uGW+9zDoQDrMREzCJ3y0LeO5Ln0B8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 024E8FEC;
	Sun,  6 Oct 2024 15:22:59 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 543933F73F;
	Sun,  6 Oct 2024 15:22:28 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Lukasz Majewski <lukma@denx.de>,
	Sean Anderson <seanga2@gmail.com>,
	Tom Rini <trini@konsulko.com>,
	u-boot@lists.denx.de,
	Chen-Yu Tsai <wens@csie.org>,
	linux-sunxi@lists.linux.dev
Subject: [PATCH] clk: sunxi: a80: Fix reset description
Date: Sun,  6 Oct 2024 23:21:48 +0100
Message-ID: <20241006222148.16456-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.2
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clock gates and reset lines share a common structure in the sunxi clock
driver descriptions, but use different flags to tell them apart.

The description of the Allwinner A80 MMC clock reset lines was
erroneously using the "GATE" macro, which made the reset driver ignore
that entry, complaining with:
sunxi_set_reset: (RST-reset:#0) unhandled

Change that to the correct "RESET" macro, to make the reset driver
happy.

Fixes e0c7ce7e52b7 ("sunxi: clk: A80: add MMC clock support")
Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/clk/sunxi/clk_a80.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/sunxi/clk_a80.c b/drivers/clk/sunxi/clk_a80.c
index e26d42a5e71..4e37fa39986 100644
--- a/drivers/clk/sunxi/clk_a80.c
+++ b/drivers/clk/sunxi/clk_a80.c
@@ -77,10 +77,10 @@ static const struct ccu_clk_gate a80_mmc_gates[] = {
 };
 
 static const struct ccu_reset a80_mmc_resets[] = {
-	[0]			= GATE(0x0, BIT(18)),
-	[1]			= GATE(0x4, BIT(18)),
-	[2]			= GATE(0x8, BIT(18)),
-	[3]			= GATE(0xc, BIT(18)),
+	[0]			= RESET(0x0, BIT(18)),
+	[1]			= RESET(0x4, BIT(18)),
+	[2]			= RESET(0x8, BIT(18)),
+	[3]			= RESET(0xc, BIT(18)),
 };
 
 static const struct ccu_clk_gate a80_usb_gates[] = {
-- 
2.46.2


Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63197EAF1
	for <linux-sunxi@lists.linux.dev>; Fri,  1 Aug 2025 23:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754092308; cv=none; b=t7CeZNNPS973kCRmSxDUeLhqbfo3CwbaPzj+YZCBQyZiK25t24oBjGSkd5cXY1OvLO9djLXopvHXPUMjvyhv2xXQcQlB/t9jKFLxIPivBm7sUuQiyfWRuOMiu1uopM7VkPm80SGREXNWcTs2b7pEJq74t0U+ycsAsQT3d3PFuuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754092308; c=relaxed/simple;
	bh=oYy5tomYRmgdnR6L9W5bBuc2BokkVazmSHhJ4DbLmtY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dVWoSq9eURJSfTZuM9GZTjXldsWqEcFRj79LNEi9tw1oKecgiwl2TmDB9gebAtilOuXrV3Sb/X1VvtQXy+766gCxt2W5qdUGxZDy//nt2hSg8xwIZmaQAw/QtkGj0mN6pYTD3/Mkr4d4HftdJkqUR9M8fmlBS00MJcr12VSfxsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ABC62237B;
	Fri,  1 Aug 2025 16:51:36 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C9ABF3F673;
	Fri,  1 Aug 2025 16:51:43 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: u-boot@lists.denx.de
Cc: Tom Rini <trini@konsulko.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Cody Eksal <masterr3c0rd@epochal.quest>,
	Chris Morgan <macromorgan@hotmail.com>,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 2/3] sunxi: spl: initialise timer before clocks
Date: Sat,  2 Aug 2025 00:49:17 +0100
Message-ID: <20250801234918.19176-3-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
In-Reply-To: <20250801234918.19176-1-andre.przywara@arm.com>
References: <20250801234918.19176-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Recent changes in the H6 clock code added delay() calls into the SPL clock
setup routine, which requires the timers to work. When compiling for
AArch64, we are always using the Arm Generic Timer (aka. arch timer),
which does not require further setup, hence having an empty timer_init()
routine.
However for 32-bit SoCs we use the Allwinner timers, which require some
setup routine, and hence we need timer_init() to be called before
clock_init().

Swap the order of the two calls, to be more robust when compiling the H6
clock code for AArch32 or when using the Allwinner timers for whatever
reason.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm/mach-sunxi/board.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-sunxi/board.c b/arch/arm/mach-sunxi/board.c
index fb4837c2082..432b1c10f92 100644
--- a/arch/arm/mach-sunxi/board.c
+++ b/arch/arm/mach-sunxi/board.c
@@ -476,8 +476,8 @@ void board_init_f(ulong dummy)
 	/* Enable non-secure access to some peripherals */
 	tzpc_init();
 
-	clock_init();
 	timer_init();
+	clock_init();
 	gpio_init();
 
 	spl_init();
-- 
2.46.3


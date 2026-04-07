Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F1BA3859D0
	for <linux-sunxi@lists.linux.dev>; Tue,  7 Apr 2026 22:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775601302; cv=none; b=IUOjsSPOSKVQ715rAq1uaBrX51dFdQxIIaH3GFd53Wd1LXpHHxHoIs8NlfClbWoSJkD9FrUu/IXj03uS+cJ4ADYY4KQk7e5SJ0HpkNWurtfhtgrLl0HYb5pUaci/NS5nqjCh3LpR2uY1BJ6uUp0dwuUJzpv81d1mO2YP3t/mB2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775601302; c=relaxed/simple;
	bh=c9zy5O2WPAHs1EpAo/D3JPndFAwUuQbakGizB9QGLl4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n13o4yPxnYcufclWGTVT1rtZ2fW4RpuA4B9Tmo8iu3PSq9IYbQmvSTbeNLuJumyQHr4M3i3LW1FmxMXBq2eCcLQPuUcaacEvxyfeO6KvUltYDdzxHqTCooploB1sWJyYNml1KiyXmiHX0hRwsCrKYzFJ0buGFHg359GBT36YdRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=krm/eiVa; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="krm/eiVa"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 44E0A3549;
	Tue,  7 Apr 2026 15:34:54 -0700 (PDT)
Received: from ryzen.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C5D8C3F632;
	Tue,  7 Apr 2026 15:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775601300; bh=c9zy5O2WPAHs1EpAo/D3JPndFAwUuQbakGizB9QGLl4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=krm/eiVarYpXPye+fKTVhe5K0LKbcMAqZ76HQNoQV1YUQFZBfBdp/Wvx1vPzEILLE
	 Sf0scpcN0RRR6qx8NCdDCZyideKe/+CPBXEvansDZdwMSj7sWCdV6HBfMnuvR0aj+V
	 r3MfmLe85rZs/MTzPOuvZ/GiQ8KMTrcn39Ljhshg=
From: Andre Przywara <andre.przywara@arm.com>
To: u-boot@lists.denx.de
Cc: Tom Rini <trini@konsulko.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Paul Kocialkowski <contact@paulk.fr>,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 1/3] sunxi: spl: fix SPL_SUNXI_LED active low configuration
Date: Wed,  8 Apr 2026 00:34:45 +0200
Message-ID: <20260407223447.4956-2-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.4
In-Reply-To: <20260407223447.4956-1-andre.przywara@arm.com>
References: <20260407223447.4956-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The newly introduced Allwinner SPL LED "framework" defined a
SPL_SUNXI_LED_STATUS_STATE Kconfig symbol, that was supposed to denote
the active-low vs. active-high polarity of the LED. However this is
a bool symbol, so it will simply vanish if not defined, and we cannot use
it directly inside a C statement.

Filter the symbol through the IS_ENABLED() macro, which will return 0 if
the symbol is not defined, which is the intended value here.

This fixes configuring LEDs with active-low polarity.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 board/sunxi/board.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/sunxi/board.c b/board/sunxi/board.c
index d7722d1858a..80dcae9c1a4 100644
--- a/board/sunxi/board.c
+++ b/board/sunxi/board.c
@@ -563,7 +563,7 @@ static void sunxi_spl_store_dram_size(phys_addr_t dram_size)
 static void status_led_init(void)
 {
 #if CONFIG_IS_ENABLED(SUNXI_LED_STATUS)
-	unsigned int state = CONFIG_SPL_SUNXI_LED_STATUS_STATE;
+	unsigned int state = IS_ENABLED(CONFIG_SPL_SUNXI_LED_STATUS_STATE);
 	unsigned int gpio = CONFIG_SPL_SUNXI_LED_STATUS_BIT;
 
 	gpio_request(gpio, "gpio_led");
-- 
2.46.4


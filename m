Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BF64BA34
	for <linux-sunxi@lists.linux.dev>; Thu, 17 Apr 2025 00:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744848401; cv=none; b=gwJMHO8MLmhjaC+MTsi+BD8U8ZM5rhB+w4BNxXu17aIh3rKvtKMZo3whmHCQxsEXud5vG4j/CQaBD40mq40ShQEil5kiuo37wi0lDH6KiVh2ll+Qz86phl1eKHklzAoM+0pjsCv4OHCWv8xFG3CEEV28bOblbF9cEsYUNqzdI9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744848401; c=relaxed/simple;
	bh=x7VVaSZpbp0xEvnGUTjsclDs6sRhLbwB5Sb487OXmws=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=muYNhfq+toiufuuMj1TOCjKqL1POFMczkBK3mI1BaaICk5g4g2OyQhyMHi4Q8+YmbR3B8PlzNRGEY9WI80VEvxjiiduC3oo2RIuXby9wgWYbe+934LTgO7dL9IQZdn7gFn0TKiNDIU7LA4SQ1Gy1I+U1Nr21q4A6KiVCcR6ewdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A2C81764;
	Wed, 16 Apr 2025 17:06:36 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3C9D13F66E;
	Wed, 16 Apr 2025 17:06:37 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>,
	u-boot@lists.denx.de
Cc: Yixun Lan <dlan@gentoo.org>,
	Tom Rini <trini@konsulko.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 3/3] sunxi: x96_mate: Add "fake" FEL key definition
Date: Thu, 17 Apr 2025 01:05:39 +0100
Message-ID: <20250417000539.3709-4-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
In-Reply-To: <20250417000539.3709-1-andre.przywara@arm.com>
References: <20250417000539.3709-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The X96 Mate TV box features a hidden button behind the earphone jack,
which can be reached with a non-conductive tools like a toothpick. On
the vendor firmware, holding this button during reset or power on
triggers the BootROM FEL mode, though it's not an hardware FEL button,
but a feature of Allwinner's "boot0" firmware.

Mimic this behaviour by specifying the GPIO name (PH9) for our "fake"
FEL button feature in the board's defconfig file, which actually enters
FEL mode much faster than the vendor firmware.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 configs/x96_mate_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/x96_mate_defconfig b/configs/x96_mate_defconfig
index bd9b611d6f5..b54d0bb5608 100644
--- a/configs/x96_mate_defconfig
+++ b/configs/x96_mate_defconfig
@@ -11,6 +11,7 @@ CONFIG_DRAM_SUNXI_TPR11=0xffffdddd
 CONFIG_DRAM_SUNXI_TPR12=0xfedf7557
 CONFIG_MACH_SUN50I_H616=y
 CONFIG_SUNXI_DRAM_H616_DDR3_1333=y
+CONFIG_SUNXI_FAKE_FEL_PIN="PH9"
 CONFIG_R_I2C_ENABLE=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
 CONFIG_SPL_I2C=y
-- 
2.46.3


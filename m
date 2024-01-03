Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBC5B7E
	for <linux-sunxi@lists.linux.dev>; Wed,  3 Jan 2024 00:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 35524C15;
	Tue,  2 Jan 2024 16:14:21 -0800 (PST)
Received: from localhost.localdomain (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4AA833F5A1;
	Tue,  2 Jan 2024 16:13:34 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Samuel Holland <samuel@sholland.org>,
	linux-sunxi@lists.linux.dev,
	u-boot@lists.denx.de
Subject: [PATCH 05/19] sunxi: move #ifdef guards around tzpc_init() to header file
Date: Wed,  3 Jan 2024 00:12:25 +0000
Message-Id: <20240103001239.17482-6-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.8
In-Reply-To: <20240103001239.17482-1-andre.przywara@arm.com>
References: <20240103001239.17482-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some later 32-bit SoCs require some setup of the Secure Peripherals
Controller, which is handled in tzpc_init().
At the moment this is guarded in board.c by some #ifdefs selecting the
SoCs that need it.

Move those #ifdef guards into the header file, providing an empty stub
function for all other SoCs, so that the #ifdefs can be removed from the
.c file, to improve readability.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm/include/asm/arch-sunxi/tzpc.h | 6 ++++++
 arch/arm/mach-sunxi/board.c            | 2 --
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm/include/asm/arch-sunxi/tzpc.h b/arch/arm/include/asm/arch-sunxi/tzpc.h
index 7a6fcaebdb5..92696088a39 100644
--- a/arch/arm/include/asm/arch-sunxi/tzpc.h
+++ b/arch/arm/include/asm/arch-sunxi/tzpc.h
@@ -28,6 +28,12 @@ struct sunxi_tzpc {
 #define SUN8I_H3_TZPC_DECPORT1_ALL  0xff
 #define SUN8I_H3_TZPC_DECPORT2_ALL  0x7f
 
+#if defined CONFIG_MACH_SUN6I || defined CONFIG_MACH_SUN8I_H3
 void tzpc_init(void);
+#else
+static inline void tzpc_init(void)
+{
+}
+#endif
 
 #endif /* _SUNXI_TZPC_H */
diff --git a/arch/arm/mach-sunxi/board.c b/arch/arm/mach-sunxi/board.c
index 11a49418225..d998149e375 100644
--- a/arch/arm/mach-sunxi/board.c
+++ b/arch/arm/mach-sunxi/board.c
@@ -459,10 +459,8 @@ void board_init_f(ulong dummy)
 {
 	sunxi_sram_init();
 
-#if defined CONFIG_MACH_SUN6I || defined CONFIG_MACH_SUN8I_H3
 	/* Enable non-secure access to some peripherals */
 	tzpc_init();
-#endif
 
 	clock_init();
 	timer_init();
-- 
2.35.8


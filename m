Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5B4B4681
	for <linux-sunxi@lists.linux.dev>; Wed, 13 Jul 2022 15:28:07 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9CA141C0A;
	Wed, 13 Jul 2022 08:28:07 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.cambridge.arm.com [10.1.197.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5047E3F73D;
	Wed, 13 Jul 2022 08:28:06 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-sunxi@lists.linux.dev,
	u-boot@lists.denx.de
Subject: [PATCH 2/3] sunxi: h616: lower SPL stack address to avoid BROM data
Date: Wed, 13 Jul 2022 16:27:57 +0100
Message-Id: <20220713152758.56929-3-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220713152758.56929-1-andre.przywara@arm.com>
References: <20220713152758.56929-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When using the USB OTG FEL mode on the Allwinner H616, the BootROM
stores some data at the end of SRAM C. This is also the location where
we place the initial SPL stack, so it will overwrite this data.
We still need the BROM code after running the SPL, so should leave that
area alone.
Interestingly this does not seem to have an adverse effect, I guess on
the "way out" (when we return to FEL after the SPL has run), this data
is not needed by the BROM, for just the trailing end of the USB operation.
However this is still wrong, and we should not clobber BROM data.

Lower the SPL stack address to be situated right below the swap buffers
we use in sunxi-fel: that should be out of the way of everyone else.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 include/configs/sunxi-common.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/configs/sunxi-common.h b/include/configs/sunxi-common.h
index 0f0ef4f64b..d36b59daf7 100644
--- a/include/configs/sunxi-common.h
+++ b/include/configs/sunxi-common.h
@@ -105,7 +105,7 @@
 #endif /* !CONFIG_ARM64 */
 #elif CONFIG_SUNXI_SRAM_ADDRESS == 0x20000
 #ifdef CONFIG_MACH_SUN50I_H616
-#define LOW_LEVEL_SRAM_STACK		0x58000
+#define LOW_LEVEL_SRAM_STACK		0x52a00		/* below FEL buffers */
 #else
 /* end of SRAM A2 on H6 for now */
 #define LOW_LEVEL_SRAM_STACK		0x00118000
-- 
2.25.1


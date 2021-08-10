Received: from smtpbg587.qq.com (smtpbg126.qq.com [106.55.201.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC24529D6
	for <linux-sunxi@lists.linux.dev>; Tue, 10 Aug 2021 13:33:50 +0000 (UTC)
X-QQ-mid: bizesmtp31t1628602205tp4e8e80
Received: from localhost.localdomain (unknown [171.223.97.227])
	by esmtp6.qq.com (ESMTP) with 
	id ; Tue, 10 Aug 2021 21:30:04 +0800 (CST)
X-QQ-SSF: 01000000004000B0C000B00A0000000
X-QQ-FEAT: E35I0CyQR8MJpMBU3VbmZoT3ziQa0XRVzitwoGttQXjghkzbAC/i9Krx/J53M
	hFQ+Pv+1TuG0T/WC9qOff4cFNBiI6Ueu5fISDAwlHAXp8JdL5aIZOy4Paoptc2op2or8XQG
	exdlrE6lJ/pj3VGlVgmP5QY5NkZJ+AtutamNI0oGlwCUCOZXVJgWoCK6N6UOFSPpqig1HDw
	YcmLlxz96gHzqa0P0ZvEdZC4qg3HA3bHHJpB2uV6H2hd6V5jLUc0BoFcOGKEDDhocBD7aSA
	wbouTGQIoR41g+NyQQMvAhmBpE4c5dAGZMeMdYfMOrwbN9j9Zx0TLkW3lZlzffYD1TyTTRW
	JsGr3cN7bh8+3ShMEY/Z+6w6Hmfqg==
X-QQ-GoodBg: 0
From: Jason Wang <wangborong@cdjrlc.com>
To: wens@csie.org
Cc: mripard@kernel.org,
	linux@armlinux.org.uk,
	jernej.skrabec@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jason Wang <wangborong@cdjrlc.com>
Subject: [PATCH] ARM: sunxi: Add a missing SPDX license header
Date: Tue, 10 Aug 2021 21:29:54 +0800
Message-Id: <20210810132954.107518-1-wangborong@cdjrlc.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybgspam:qybgspam2

Add the missing SPDX license header to arch/arm/mach-sunxi/sunxi.c.

Signed-off-by: Jason Wang <wangborong@cdjrlc.com>
---
 arch/arm/mach-sunxi/sunxi.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm/mach-sunxi/sunxi.c b/arch/arm/mach-sunxi/sunxi.c
index 19635721013d..e1b7945aac99 100644
--- a/arch/arm/mach-sunxi/sunxi.c
+++ b/arch/arm/mach-sunxi/sunxi.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Device Tree support for Allwinner A1X SoCs
  *
@@ -5,9 +6,6 @@
  *
  * Maxime Ripard <maxime.ripard@free-electrons.com>
  *
- * This file is licensed under the terms of the GNU General Public
- * License version 2.  This program is licensed "as is" without any
- * warranty of any kind, whether express or implied.
  */
 
 #include <linux/clocksource.h>
-- 
2.32.0


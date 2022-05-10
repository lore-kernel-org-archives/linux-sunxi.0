Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C1A2912
	for <linux-sunxi@lists.linux.dev>; Tue, 10 May 2022 17:24:57 +0000 (UTC)
Message-ID: <20220510171254.908144392@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1652203490;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=unPNkyGvWMidy4JaC2kQtqwHz1fQ+NhrzjFEsiK6uMA=;
	b=aDeCDqJTp9TKruJapXQm3Kus5xptIAWTCv3zAl4N15uObZfUi8AZ6yjmz37YpPzh/k6SCw
	MNDv5adW9J0IdsOTVmG1EF7rM1tFnwBQGSIBV+bhzbBEmCqKCoeprWTFz8ELcRAvn8S5/v
	0KTT5MHWX9Dmsm111idR28DwESWPivI9uzKxYGFDOqCQKsPa/kfzMrWYg0G75r/EFZYSGB
	UaSgpWtXx2dePJw8Yj4tnOKMcK5aE6FjVRiBztsKLSm0k59j/vQ5bW1tVjQy+aTtmPX1Fz
	MpWGcgpNAk5H3ypgznGAY1wUYa729c4zjU4w4Vq77QZoOFE8foC0skNeKwWUDg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1652203490;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=unPNkyGvWMidy4JaC2kQtqwHz1fQ+NhrzjFEsiK6uMA=;
	b=ecJA8YEBST6T511ekgAkMzvCtNzIjltlSVmFxiDWvX2nFjXads6yau/G7WxGftNnW+Ss70
	dkWY9JLRYPYsImAg==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: linux-spdx@vger.kernel.org,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 linux-sunxi@lists.linux.dev
Subject:
 [patch 09/10] clocksource/drivers/timer-sun4i: Convert to SPDX identifier
References: <20220510171003.952873904@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 May 2022 19:24:49 +0200 (CEST)

The license information clearly states GPL version 2 only. The extra text
which excludes warranties is an excerpt of the corresponding GPLv2 clause
11.

So the SPDX identifier covers it completely.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Samuel Holland <samuel@sholland.org>
Cc: linux-sunxi@lists.linux.dev
---
 drivers/clocksource/timer-sun4i.c |    5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

--- a/drivers/clocksource/timer-sun4i.c
+++ b/drivers/clocksource/timer-sun4i.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Allwinner A1X SoCs timer handling.
  *
@@ -8,10 +9,6 @@
  * Based on code from
  * Allwinner Technology Co., Ltd. <www.allwinnertech.com>
  * Benn Huang <benn@allwinnertech.com>
- *
- * This file is licensed under the terms of the GNU General Public
- * License version 2.  This program is licensed "as is" without any
- * warranty of any kind, whether express or implied.
  */
 
 #include <linux/clk.h>


Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F921852
	for <linux-sunxi@lists.linux.dev>; Fri, 27 May 2022 08:36:00 +0000 (UTC)
Date: Fri, 27 May 2022 08:35:51 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1653640552;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j9UwhItOW1f+bm6uyCNG1GIXZP9/17Q39hpRNlbSwlI=;
	b=Hl4Do7ONhgq5qcHfnjNvoZwrf1ceNbXVBS9B5ZtxSOH8XdJkrq9wL0eROaAWBgcBkcLBI5
	wTws2nzX69lNLv1TasDcW9wgL7GVrwUnO7AsLWwKIB4YrLOXw+tSUyN2NPyvZ77Eraqk6f
	sMZlDKV6knvlsarR7RTbZgzjAJNT1Xk2zyvFaQdSoy2QLNL5eK2TOjKANjuywgSlmmf8s7
	KX0Q/fBNn08DYs8iZqQhbCuQ5DY0AMpHkXigap6qV/R8zbwpNI3hRkqmRJ5sDl4rJp/FUw
	8uMgGA4ZFmzlTFtxRslH0FHepIRHdy9DZL5j8J+UQwh3kWRJsqlUsv9ActTUFQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1653640552;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j9UwhItOW1f+bm6uyCNG1GIXZP9/17Q39hpRNlbSwlI=;
	b=rITc2mfakyOxlaJGNiVc9zlIQ1eOnOn5P2rRibgD5FImLc5IsToYFQmHSpoKAibW7+brMR
	nHJsJ5KijlB4OUCw==
From: "tip-bot2 for Thomas Gleixner" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: timers/core] clocksource/drivers/timer-sun4i: Convert to SPDX
 identifier
Cc: Thomas Gleixner <tglx@linutronix.de>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, "Chen-Yu Tsai" <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20220510171254.908144392@linutronix.de>
References: <20220510171254.908144392@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-ID: <165364055121.4207.9026465604431403890.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@linutronix.de> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

The following commit has been merged into the timers/core branch of tip:

Commit-ID:     60bff9f8ef4bdd1eb24769deb66084dcfd3888d2
Gitweb:        https://git.kernel.org/tip/60bff9f8ef4bdd1eb24769deb66084dcfd3888d2
Author:        Thomas Gleixner <tglx@linutronix.de>
AuthorDate:    Tue, 10 May 2022 19:24:49 +02:00
Committer:     Daniel Lezcano <daniel.lezcano@linaro.org>
CommitterDate: Wed, 18 May 2022 11:08:59 +02:00

clocksource/drivers/timer-sun4i: Convert to SPDX identifier

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
Link: https://lore.kernel.org/r/20220510171254.908144392@linutronix.de
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/clocksource/timer-sun4i.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/clocksource/timer-sun4i.c b/drivers/clocksource/timer-sun4i.c
index 0ba8155..bb6ea6c 100644
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

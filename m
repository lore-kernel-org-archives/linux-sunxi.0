Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DDC7254B1B
	for <linux-sunxi@lists.linux.dev>; Thu,  2 Oct 2025 22:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759444127; cv=none; b=Wxmj3y+gHWbuAbf/ZsKQxNW74CJxZPwDVlQYWElxXOV4yTE3IgDE+uEL6TeejL7XgyGH5s2GaMRtlRHfuQVZ04GEJyj5WPPoU6Kzd5YAzGuFqYuZYwqe8PeI1b5iYIWlJIN/PvIUbqMEyenFMs3Sxaa8hRNHx0FYCI2gwuVmo70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759444127; c=relaxed/simple;
	bh=6yIWmQVBkdeo4k9A/ET9hcLPkqL9LMtgmxAzQSDoUHE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kwJtf+wMMFy9tA7FCivKlLpzezy2pNyrP1zPPtKqA/wWTk6YheeCqABs8HFC9vBLSDJRTEnu3Zi+pF6TK5AE0SaL9mZbc9EeON3b0IkZ7QfspvlAm6cMEGKcB/hICsob6PetYJs6VBeZiv2SY+LnyfWmyoRxbbXjf5aGt5u1MFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7C7841655;
	Thu,  2 Oct 2025 15:28:36 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8B6DC3F5A1;
	Thu,  2 Oct 2025 15:28:43 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] reset: core: reset-gpio: Suppress registration error for optional resets
Date: Thu,  2 Oct 2025 23:28:26 +0100
Message-ID: <20251002222826.16516-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.4
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For reset controllers that are marked as optional, we should skip errors
during probing and return NULL, to avoid unnecessary failures. The
reset-gpio controller does this mostly, but returns the true error in
case the __reset_add_reset_gpio_device() call fails. Treat this call the
same as the other registration errors, and consider the optional flag.

One could argue that at this point it's a proper error that should not
be ignored anymore, but in case of the reset-gpio controller this is not
entirely true, since the code at the moment does not support GPIO
controllers with three #gpio-cells - there is a TODO comment about this
in that said function. So to avoid unnecessary probe fails for devices
using reset-gpios (it's an optional reset after all), let's treat an
error as still optional at this point.

This fixes operation of WiFi chips on Allwinner boards, where some use
reset-gpios, and which currently fail because all Allwinner SoCs use
GPIO controllers with 3 cells.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/reset/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/reset/core.c b/drivers/reset/core.c
index 22f67fc77ae53..c2ccd08fb36e1 100644
--- a/drivers/reset/core.c
+++ b/drivers/reset/core.c
@@ -1044,7 +1044,7 @@ __of_reset_control_get(struct device_node *node, const char *id, int index,
 
 		ret = __reset_add_reset_gpio_device(&args);
 		if (ret) {
-			rstc = ERR_PTR(ret);
+			rstc = optional ? NULL : ERR_PTR(ret);
 			goto out_put;
 		}
 	}
-- 
2.46.4


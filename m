Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A8178836
	for <linux-sunxi@lists.linux.dev>; Fri,  1 Aug 2025 00:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754008196; cv=none; b=g9j+RvMa0s55dpHZ+HWI8Ktb+EfZgd/WmdvIijonFG6RhEdaswYfgX/iYFx+6C6eCAYpRtpK9uYueLJcGi510gTSv9ypEAq8l8ALZK2QrB57MRQOW+nLXKAZfCuKb1TMyRIbaUUUPddzCH/XRq4UhcRSGjdcb50wYlQ4uLgeti8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754008196; c=relaxed/simple;
	bh=fUPPfcjAnFuCOHQ9bRnd4lkNt6/lZn4EHBBkuI8Pc2I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BzzOAp7+dzbClg2aTN00QoHAL0qnb2pOZfD3XCWpFehCHXvc53OW2i9pdOnyOOrr7DyFDAEiA8Y4xlkdSAxT9YR5Nkev1RIUQKaJKUO9j6iNpXr8VAUTBBaspBCy0sTcJ3OM3CpfiWncKazMsn89ceddJLyfIhw+C8AcXfG8sQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D569B19F0;
	Thu, 31 Jul 2025 17:29:45 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D86253F5A1;
	Thu, 31 Jul 2025 17:29:52 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: u-boot@lists.denx.de
Cc: Tom Rini <trini@konsulko.com>,
	linux-sunxi@lists.linux.dev,
	Mikhail Kalashnikov <iuncuim@gmail.com>,
	Yixun Lan <dlan@gentoo.org>,
	Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH 1/2] pinctrl: sunxi: a523: change Ethernet pin function name
Date: Fri,  1 Aug 2025 01:27:25 +0100
Message-ID: <20250801002726.8924-2-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
In-Reply-To: <20250801002726.8924-1-andre.przywara@arm.com>
References: <20250801002726.8924-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The name of the pin function was changed last minute in the DT, from
emac0 to gmac0.
Adjust the name we use in the pinctrl driver accordingly.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index 03cfe23aaf8..fd357ab0d4e 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -760,7 +760,7 @@ static const struct sunxi_pinctrl_desc __maybe_unused sun50i_h616_pinctrl_desc =
 };
 
 static const struct sunxi_pinctrl_function sun55i_a523_pinctrl_functions[] = {
-	{ "emac0",	5 },	/* PI0-PI16 */
+	{ "gmac0",	5 },	/* PI0-PI16 */
 	{ "gpio_in",	0 },
 	{ "gpio_out",	1 },
 	{ "mmc0",	2 },	/* PF0-PF5 */
-- 
2.46.3


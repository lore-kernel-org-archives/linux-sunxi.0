Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9061A2581
	for <linux-sunxi@lists.linux.dev>; Fri,  1 Aug 2025 00:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754008195; cv=none; b=JSFr7T7if9DvL0vH6P2N08+BQnusL8N3OxrBJRPCtp8k9oGTT0S/6kVXM1hf3UjZmx82jZTMwTCivlJBE+ILh1kqchC3e5aakMMZE2x9P1pQg3h8Onom/kOrrA+B+f8jS3qMXAstTmPggCFORy4vwIgro93XaKfTiB7tADQIAV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754008195; c=relaxed/simple;
	bh=TK7E6IsVtcJ26v/c4xqeCSir+Q0njyq5r1D443v02ao=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gRwqIJ7oVWZQVhNmVzWRUKmy7NiQfVk4q7HY4clDOUJA0OwUQ4yYKQYMtqzWtZzTRkcer/JVK5q7OWgrp2/E/sP9MBsNy67r5+mpLqf7mLEjfivc5jnU2ZOl/8sjHQu74SSQwUmRVtfKNWH+3FOnWGWCsrCDg2msCngP8HV70v4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9F7571764;
	Thu, 31 Jul 2025 17:29:44 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9D1CA3F5A1;
	Thu, 31 Jul 2025 17:29:51 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: u-boot@lists.denx.de
Cc: Tom Rini <trini@konsulko.com>,
	linux-sunxi@lists.linux.dev,
	Mikhail Kalashnikov <iuncuim@gmail.com>,
	Yixun Lan <dlan@gentoo.org>,
	Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH 0/2] sunxi: a523: enable Ethernet
Date: Fri,  1 Aug 2025 01:27:24 +0100
Message-ID: <20250801002726.8924-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The first of the two Ethernet controllers in the Allwinner A527/T527
SoCs is compatible to the IP used in the A64 SoC, which our MAC driver
already supports. Since the recent DT update brought us the DT
description of the network interface, enable the driver and thus
Ethernet functionality on the two boards that work.
Patch 1/2 fixes the function name for the RGMII pins in the pinctrl
driver, while patch 2/2 just enables building the sun8i-emac driver.

Please have a look and test!

Cheers,
Andre

Andre Przywara (2):
  pinctrl: sunxi: a523: change Ethernet pin function name
  sunxi: a527: radxa/avaota: enable Ethernet

 configs/avaota-a1_defconfig           | 2 ++
 configs/radxa-cubie-a5e_defconfig     | 2 ++
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 2 +-
 3 files changed, 5 insertions(+), 1 deletion(-)

-- 
2.46.3


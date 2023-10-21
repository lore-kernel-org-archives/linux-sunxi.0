Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A768655
	for <linux-sunxi@lists.linux.dev>; Sat, 21 Oct 2023 01:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4DEBF153B;
	Fri, 20 Oct 2023 18:12:14 -0700 (PDT)
Received: from localhost.localdomain (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6E9973F64C;
	Fri, 20 Oct 2023 18:11:32 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Gunjan Gupta <viraniac@gmail.com>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 1/4] sunxi: DRAM: H6: add barrier after finishing DRAM setup
Date: Sat, 21 Oct 2023 02:10:22 +0100
Message-Id: <20231021011025.568-2-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.8
In-Reply-To: <20231021011025.568-1-andre.przywara@arm.com>
References: <20231021011025.568-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gunjan Gupta <viraniac@gmail.com>

During the DRAM controller setup, we program its registers for certain
configurations (multiple times), then try to access the DRAM array, to
detect the number of rows and columns in the used DRAM chips.
This requires that all MMIO writes have reached the DRAM controller,
before we actually access the DRAM.
Add a DSB instruction at the end of the controller init function, that
ensures that outstanding stores have been completed.

That hopefully fixes occasional DRAM init failures on some H6 boards
like the Orange Pi 3 LTS, where this leads to the erroneous detection of
4GB instead of the actual 2GB.

Signed-off-by: Gunjan Gupta <viraniac@gmail.com>
[Andre: move DSB, add comment]
Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm/mach-sunxi/dram_sun50i_h6.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/mach-sunxi/dram_sun50i_h6.c b/arch/arm/mach-sunxi/dram_sun50i_h6.c
index bff2e42513c..43a2d19f084 100644
--- a/arch/arm/mach-sunxi/dram_sun50i_h6.c
+++ b/arch/arm/mach-sunxi/dram_sun50i_h6.c
@@ -554,6 +554,12 @@ static bool mctl_channel_init(struct dram_para *para)
 	writel(0x7ff, &mctl_com->maer1);
 	writel(0xffff, &mctl_com->maer2);
 
+	/*
+	 * Make sure all MMIO writes are committed to the DRAM controller,
+	 * so that accesses to the DRAM array adhere to the above programming.
+	 */
+	dsb();
+
 	return true;
 }
 
-- 
2.35.8


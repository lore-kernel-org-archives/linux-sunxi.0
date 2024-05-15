Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB67841A88
	for <linux-sunxi@lists.linux.dev>; Wed, 15 May 2024 23:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715816980; cv=none; b=jfROQOtm6YJFJnJUq80eZ2/ljZs73f3taSF8TjSYQlFFKnCHS6k54iSu8Gc+SW+rNFj6bwjSExWoQJHlgPp8daR4I5Hd5Sc6APYlKbOHFPIAI/hgF1dVH850Cs4zprIyMzg0cvvmHgnu5+QKJUpPwZCLAGvy/79G/iBpmP+h+wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715816980; c=relaxed/simple;
	bh=3CrkzLXOpujodehImn8ZQbTyMwXfMyM6XCLSq51CnXI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=K3yfAkvCutlsFcv3IksiTqn4sRqG8N6Wk2N3Uou0Rd7HDvpf3fKnChQdwnBbksYaBVQt2qnK7+QizkEQ5Oibk8/5eyddXQ5Wi4JOtOaajAeMIz94b4BI2IVFIbzAp4HTIJBuf7lGm1nuK0lOdo4i+YTjTjr7aGedv2acLAdApK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0F8AD1007;
	Wed, 15 May 2024 16:50:03 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3CA183F641;
	Wed, 15 May 2024 16:49:37 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Tom Rini <trini@konsulko.com>,
	Jaehoon Chung <jh80.chung@samsung.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Chris Morgan <macromorgan@hotmail.com>,
	Ryan Walklin <ryan@testtoast.com>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 6/6] power: pmic: sunxi: add AXP707 support
Date: Thu, 16 May 2024 00:48:39 +0100
Message-Id: <20240515234839.26898-7-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.8
In-Reply-To: <20240515234839.26898-1-andre.przywara@arm.com>
References: <20240515234839.26898-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The X-Powers AXP707 is a PMIC with some buck converters and a larger
number of LDOs, alongside some charging and USB circuitry.

Add the descriptions for the five DC/DC regulators that we will need,
and enable that when CONFIG_AXP707_POWER is enabled. We won't need DCDC2
till DCDC4, but by using the position in the array for the index we keep
the code cleaner.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/power/axp_spl.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/power/axp_spl.c b/drivers/power/axp_spl.c
index e38895c5c7d..8c9698612b5 100644
--- a/drivers/power/axp_spl.c
+++ b/drivers/power/axp_spl.c
@@ -62,6 +62,21 @@ static const struct axp_reg_desc_spl axp_spl_dcdc_regulators[] = {
 #define AXP_SHUTDOWN_REG	0x32
 #define AXP_SHUTDOWN_MASK	BIT(7)
 
+#elif defined(CONFIG_AXP707_POWER)				/* AXP707 */
+
+static const struct axp_reg_desc_spl axp_spl_dcdc_regulators[] = {
+        { 0x10, BIT(0), 0x20, 0x1f, 1600, 3400, 100, NA },
+        { 0x10, BIT(1), 0x21, 0x7f,  500, 1300,  10, 70 },
+        { 0x10, BIT(2), 0x22, 0x7f,  500, 1300,  10, 70 },
+        { 0x10, BIT(3), 0x23, 0x7f,  500, 1300,  10, 70 },
+        { 0x10, BIT(4), 0x24, 0x7f,  800, 1840,  10, 32 },
+};
+#define AXP_CHIP_VERSION	0x3
+#define AXP_CHIP_VERSION_MASK	0xcf
+#define AXP_CHIP_ID		0x81
+#define AXP_SHUTDOWN_REG	0x32
+#define AXP_SHUTDOWN_MASK	BIT(7)
+
 #else
 
 	#error "Please define the regulator registers in axp_spl_regulators[]."
-- 
2.35.8


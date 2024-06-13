Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0066814F9E4
	for <linux-sunxi@lists.linux.dev>; Thu, 13 Jun 2024 23:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718321558; cv=none; b=AdxZos+H/ZjsGM3f9KpJSSCzEoOgnyX0mayY15TY4LBbdUvRTIgl4lUXJDX2JVGZq4Q6NYTJc51tsWtEYWWaW7Njpv5ORKkBS4Smm+IIscmDsjvMIEZCHGCffolWIghUsKgs+1chuK/KCPId2PIiXByIgHfCrv8IuD5HyK+WsiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718321558; c=relaxed/simple;
	bh=VDxgFdcnwFPYlYn2nkDfi2MuEKRJ2YBeZsy+PPP1ND8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gNv9YQGJUOmaOkUyyg5pn0ECBqKjTd0ql4ZxHLTVVK6hZk4HOIvirivI+eMJW99pe2isKHRK2dHd0GUHGe8VAejIUQIr+nDG8SGk00SA+ItZrIiLZ03x24ymtKf/9B5AhLd+OZOawOcwYAQb2wnat3+YH+emtkGqBTiMuuQKpFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 951A1FEC;
	Thu, 13 Jun 2024 16:32:58 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C4C783F64C;
	Thu, 13 Jun 2024 16:32:32 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Lee Jones <lee@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Chris Morgan <macroalpha82@gmail.com>,
	Ryan Walklin <ryan@testtoast.com>,
	Philippe Simons <simons.philippe@gmail.com>
Subject: [PATCH v3] mfd: axp20x: AXP717: Fix missing IRQ status registers range
Date: Fri, 14 Jun 2024 00:31:04 +0100
Message-Id: <20240613233104.17529-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.39.4
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While we list the "IRQ status *and acknowledge*" registers as volatile
in the MFD description, they are missing from the writable range array,
so acknowledging any interrupts was met with an -EIO error.
This error propagates up, leading to the whole AXP717 driver failing to
probe, which is fatal to most systems using this PMIC, since most
peripherals refer one of the PMIC voltage rails.
This wasn't noticed on the initial submission, since the interrupt was
completely missing at this point, but the DTs now merged describe the
interrupt, creating the problem.

Add the five registers that hold those bits to the writable array.

This fixes the boot on the Anbernic systems using the AXP717 PMIC.

Fixes: b5bfc8ab2484 ("mfd: axp20x: Add support for AXP717 PMIC")
Reported-by: Chris Morgan <macromorgan@hotmail.com>
Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
Hi,

the patch itself is unchanged from v2 sent in April, but the commit
message was updated to give rationale for the Fixes: tag.
Please take this as a fix into v6.10.

Thanks,
Andre

 drivers/mfd/axp20x.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
index f2c0f144c0fc3..dacd3c96c9f57 100644
--- a/drivers/mfd/axp20x.c
+++ b/drivers/mfd/axp20x.c
@@ -210,6 +210,7 @@ static const struct regmap_access_table axp313a_volatile_table = {
 
 static const struct regmap_range axp717_writeable_ranges[] = {
 	regmap_reg_range(AXP717_IRQ0_EN, AXP717_IRQ4_EN),
+	regmap_reg_range(AXP717_IRQ0_STATE, AXP717_IRQ4_STATE),
 	regmap_reg_range(AXP717_DCDC_OUTPUT_CONTROL, AXP717_CPUSLDO_CONTROL),
 };
 
-- 
2.39.4


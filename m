Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A31437F739
	for <linux-sunxi@lists.linux.dev>; Mon, 11 May 2026 21:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778535483; cv=none; b=WsvuJFvhigSQ/eY6rfN2ioKsSdqv7v/KiM+PTgQEZgzVcZ1B+S1xIiiPZgu9qZYkmkoHbrhOS8/QKUosasQV4tbU4TKzbzKhteHjLdPMhoXBPtHZKb0k1FrFzj+xN+ZxQoiQ8HjVehtJjLxfsdE2F7R+plLzMWIaNDN2sThJryk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778535483; c=relaxed/simple;
	bh=huUaM+2jNsjuuFYu0LdBhE+OYXFSoWbfHGjyw/gu+ds=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r9nlrRF3VWCZ16u6HTBNSBa6MwNHRCZQglN4iMkIS/KQbx4OkKDXaAaADCYezGUi0JBj+38hD3SaNbMAamkV366cm6xvmxHyG39NOqfwCYAZb4yk3z0/qGg83fqlZaExyS9oHCYX0N8l8osPpQAeucgW1CXdAgm4HyZS+Jp7coM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=NR+2Ect3; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="NR+2Ect3"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8FEED16F2;
	Mon, 11 May 2026 14:37:55 -0700 (PDT)
Received: from ryzen.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5598A3F85F;
	Mon, 11 May 2026 14:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778535480; bh=huUaM+2jNsjuuFYu0LdBhE+OYXFSoWbfHGjyw/gu+ds=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NR+2Ect3BUvXRiWfJnijXhF8l4S93R9eVFTaysfpJ8bOL28BCdSrJjM4NJzg/KNRr
	 K7QBOOttZPC3RSTeCZskvI4142l3d+yiIlEnqv2dN0RM/dqzX2oL3bTQTRPN75E0Xo
	 nvBbcMR0HP9W9hpfoUMfYXV/Dq/ht+CkGY+EH+l8=
From: Andre Przywara <andre.przywara@arm.com>
To: u-boot@lists.denx.de
Cc: Tom Rini <trini@konsulko.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Paul Kocialkowski <contact@paulk.fr>,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 1/5] spi: sunxi: add support for A523 SPI controller
Date: Mon, 11 May 2026 23:37:09 +0200
Message-ID: <20260511213713.15943-2-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.4
In-Reply-To: <20260511213713.15943-1-andre.przywara@arm.com>
References: <20260511213713.15943-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SPI controllers in the Allwinner A523/A527/T527 SoCs is very close
to the one used in the R329 and D1 generation, definitely as far as our
driver is concerned.

Add the new compatible string, but use the existing config section from
the previous SoC generation.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/spi/spi-sunxi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/spi/spi-sunxi.c b/drivers/spi/spi-sunxi.c
index 08b603f04a2..4e91cf6b7fd 100644
--- a/drivers/spi/spi-sunxi.c
+++ b/drivers/spi/spi-sunxi.c
@@ -587,6 +587,10 @@ static const struct udevice_id sun4i_spi_ids[] = {
 	  .compatible = "allwinner,sun50i-r329-spi",
 	  .data = (ulong)&sun50i_r329_spi_variant,
 	},
+	{
+	  .compatible = "allwinner,sun55i-a523-spi",
+	  .data = (ulong)&sun50i_r329_spi_variant,
+	},
 	{ /* sentinel */ }
 };
 
-- 
2.46.4


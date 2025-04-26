Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F55B1F3FC8
	for <linux-sunxi@lists.linux.dev>; Sat, 26 Apr 2025 12:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745669430; cv=none; b=t8bVHW/w0IaZ556EPNp+E51p0Gs4xsNfqDALJFu9bgtw5W2wpVbl/guDRj82x6kz5vrRJVj/ad5ehQq+eilHwxHDtX7fWr9L0GjDyynKIf1w9kR+OF09FgfWIedeC6hyeZwGSvXMiCHKxNFTT1SDsBdOogy5NY43y3UdWKuewcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745669430; c=relaxed/simple;
	bh=HUYmCVSsWEk76tkvmZnNkwcVBM6LayQQWcmR5hD7lpg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aNoGQ3i93qVdc1NiTFbGphmkYDjozHVG8+MirdlfC0h1yian7skKCY0wLy4FjNWYd4TnTXeynyTgwZXRet1RNBZcNNrl880le0RsIF7X8eVhC1XkkKC8u66ZqlzYkdLB1V5Stqe0koEzM0nQU1c7C0nD9kX3reWko2WzodD3gP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 24E08106F;
	Sat, 26 Apr 2025 05:10:14 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D85953F66E;
	Sat, 26 Apr 2025 05:10:18 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: u-boot@lists.denx.de
Cc: Jagan Teki <jagan@amarulasolutions.com>,
	Tom Rini <trini@konsulko.com>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	linux-sunxi@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH] sunxi: enable MMU_PGPROT proper page table protection
Date: Sat, 26 Apr 2025 13:09:13 +0100
Message-ID: <20250426120913.23314-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Select the new MMU_PGPROT Kconfig symbol for all Allwinner board builds,
to use a write-protected .rodata, non-executable .data and .rodata
sections, and non-writable .text sections.

This might trigger runtime exceptions in misbehaving drivers, which
should then be fixed.
Please report on the list or on IRC if bisecting ends at this patch.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
Hi,

I am planning on merging this ASAP, to get some exposure and use the time
until the release for wider testing. If worst comes to the worst, we can
revert it still before July.

Cheers,
Andre

 arch/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 99750072e55..f22d347d5ad 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1192,6 +1192,7 @@ config ARCH_SUNXI
 	select DM_KEYBOARD
 	select DM_SERIAL
 	select DM_PMIC
+	select MMU_PGPROT if ARM64
 	select OF_BOARD_SETUP
 	select OF_CONTROL
 	select PINCTRL
-- 
2.46.3


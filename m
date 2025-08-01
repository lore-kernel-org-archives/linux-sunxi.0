Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 966FF2376FC
	for <linux-sunxi@lists.linux.dev>; Fri,  1 Aug 2025 23:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754092306; cv=none; b=h5YMQD9pjfaFnRzYp4Wfnt84R7DYf5fnsZ4iTqEpaNFIgwh/nA8cQxHPuYB7myCQ3QyileJk+6kYqmYvkb7+4WvXy+Ll1VoQ/zuo5J3a0ygh7PeEsX1paTcRugbDj0FXLIQEKeTR+Zs7CBbIOlv2u8sswAuvvATt2pxJhLwXW4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754092306; c=relaxed/simple;
	bh=SFmqGsZB/i/BzfM3ep3YLgtRtgpPF+74U4lUBL+CF+M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RH76CBiz8eqZgIi07gFMTabuxmx0KTvRN7lxeTZ4ep/8nwVQBkevxfA/LdI2buCdX0BuiO27xytrRJxricHaVoV52kZCVSmqa+3LFgzHEwmxq3azSvONNzPdm8EczpaRBrx6+FqK+epPxSSBYFY2/w5NR5gvWuZdEIC6xrPMtrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6B2E81515;
	Fri,  1 Aug 2025 16:51:34 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8A8DC3F673;
	Fri,  1 Aug 2025 16:51:41 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: u-boot@lists.denx.de
Cc: Tom Rini <trini@konsulko.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Cody Eksal <masterr3c0rd@epochal.quest>,
	Chris Morgan <macromorgan@hotmail.com>,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 0/3] sunxi: assorted fixes to DRAM and clock init
Date: Sat,  2 Aug 2025 00:49:15 +0100
Message-ID: <20250801234918.19176-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some assorted fixes for bugs I found while debugging and researching
the boot and DRAM init process on some chips.
Patch 1 and 2 fix bugs hidden by the fact that the code in question
would ever be compiled for arm64 only, but for an experiment I compiled
the A133 SPL for 32-bit, which revealed those issues.
Patch 3 fixes the mode register setup for the H616 boards with LPDDR3,
this was found when wrapping the mode register accesses into some
functions, for a later cleanup patch.

Please have a look!

Cheers,
Andre

Andre Przywara (3):
  sunxi: a133: dram: fix data type for address variable
  sunxi: spl: initialise timer before clocks
  sunxi: H616: dram: fix LPDDR3 mode register settings

 arch/arm/mach-sunxi/board.c            |  2 +-
 arch/arm/mach-sunxi/dram_sun50i_a133.c |  2 +-
 arch/arm/mach-sunxi/dram_sun50i_h616.c | 12 ++++++------
 3 files changed, 8 insertions(+), 8 deletions(-)

-- 
2.46.3


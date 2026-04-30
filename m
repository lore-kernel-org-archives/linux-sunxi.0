Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1AD042846D
	for <linux-sunxi@lists.linux.dev>; Thu, 30 Apr 2026 13:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777557526; cv=none; b=BZD69OZQNlgaLYi/+fj6Dlm8N64yEwP1ikKqqXhZ96qTqtxkJdBdMGrKRMemLL7Ilfb/+aQD0MgoD38lcAB7tXgOCPcgV9/J+CPO1dd6GFH3ImJLqRF47KHHXKtB7Z6N8MTfW8Ux3DiqkLyAvTEwA06N/h8eRxsbQcLqASfegeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777557526; c=relaxed/simple;
	bh=VrelHdDHjYhSR07EuJbbu8s53hIHs4PonJABREWW0Pw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lJHBpSBOC/m/eSu+SkxsQ1ZXT1guydLsdyc+0hwUS0fG1bzgP3kjW2lvOyeFD18sif/E2hQvKvtnnalMLSCYN2iqx3xVG4sRurpTVxsGVtLJYOGTGZA6deRIcdhL0BCpWXfI7r6lFtKLfMUi/6LRGzIkyw9uqCEzwgsZFSOByWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=egkI977j; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="egkI977j"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 755B51AED;
	Thu, 30 Apr 2026 06:58:38 -0700 (PDT)
Received: from e142021.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CFF723F7B4;
	Thu, 30 Apr 2026 06:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777557523; bh=VrelHdDHjYhSR07EuJbbu8s53hIHs4PonJABREWW0Pw=;
	h=From:To:Cc:Subject:Date:From;
	b=egkI977jUtX9Ve1IibqDYzgmHzZEJhPUecfhn5zsmtAcLcPZNJQDVF0unwSq0rVkb
	 HU7WSckZ568rQykHa+Zb8b94yaGM1Jlax/z3yoi0LdK3dzRNggbd9e2pM8zE77oG47
	 /+Tv7xAleT5OqJ3UomAmUWc/9NgX8QqgV3Vvk2lg=
From: Andre Przywara <andre.przywara@arm.com>
To: Paul Kocialkowski <paulk@sys-base.io>,
	u-boot@lists.denx.de
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 0/2] sunxi: DRAM: rework NSI priority settings
Date: Thu, 30 Apr 2026 15:58:36 +0200
Message-ID: <20260430135838.3438728-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

this is an extension of Paul's previous patch [1] to set the DRAM bus
arbitration priorities on the Allwinner A133 SoC. His patch was just
addressing the A133, but the A523 already sets up the priorities, using
apparently the same IP ("NSI") for that.

So patch 1/2 factors out that code, as suggested by Jernej, to make it
reusable by patch 2/2, which is a port of Paul's patch to that new
function.

Please note that this just tries to mimic the existing NSI setup for the
A523, there are more DRAM masters on that SoC, and the BSP code sets
them up with the lowest priorities. I guess this is also the reset
default, so I kept those masters out for now. Please let me know if we
should set them up explicitly regardless.

[1] https://lore.kernel.org/u-boot/20260128235727.1322861-1-contact@paulk.fr/#t

Cheers,
Andre

Andre Przywara (1):
  sunxi: A523: Move NSI init routine into generic function

Paul Kocialkowski (1):
  sunxi: A133: dram: Add NSI arbiter configuration support

 .../include/asm/arch-sunxi/cpu_sun50i_h6.h    |  4 ++
 .../include/asm/arch-sunxi/cpu_sunxi_ncat2.h  |  1 +
 .../include/asm/arch-sunxi/dram_sun50i_a133.h | 23 +++++++++
 .../include/asm/arch-sunxi/dram_sun55i_a523.h | 29 +++++++++++
 arch/arm/include/asm/arch-sunxi/sunxi_nsi.h   | 25 ++++++++++
 arch/arm/mach-sunxi/Makefile                  |  4 +-
 arch/arm/mach-sunxi/dram_sun50i_a133.c        | 43 +++++++++++++++-
 arch/arm/mach-sunxi/dram_sun55i_a523.c        | 49 +++++++++----------
 arch/arm/mach-sunxi/sunxi_nsi.c               | 31 ++++++++++++
 9 files changed, 180 insertions(+), 29 deletions(-)
 create mode 100644 arch/arm/include/asm/arch-sunxi/sunxi_nsi.h
 create mode 100644 arch/arm/mach-sunxi/sunxi_nsi.c

-- 
2.43.0


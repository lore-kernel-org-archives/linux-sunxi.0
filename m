Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59A3E1EA65
	for <linux-sunxi@lists.linux.dev>; Thu, 17 Apr 2025 00:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744848398; cv=none; b=PAx+vX/WnQKFNb9263uawN6L3El3W7UcaSmd5m/c3OYNpqiAYhh1qGHZvVi/JGdkES+CGXwLY917D1BZrjEV8y0ktfPGvdUfDcVyaFIuc3J1IoJzp+NPJPYoJLxYBjqgamuo6tIyWd18GCn1PK934hwfPwdTV/ld3jBrVzTH0nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744848398; c=relaxed/simple;
	bh=1SMxK6MYI636bM4UEIVqV/C8nib+SKqf45OapdDafR0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pLdOcNyS34mPxXk2p6IsgKLNVGjAKL4ZREtagWxIujv2RdkqZ8jxHXk7ju7gWcNt65gPasFfWx0EtenJXUzGiQ9k0Ow/9gvRqi4bH+QJPMh+KhHswixcVZopmt4nc+PpDyjWxRoxV28ezt/BnVmRtkeqwrKho7AvUQUyH0tiyLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 04750152B;
	Wed, 16 Apr 2025 17:06:32 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 34B0A3F66E;
	Wed, 16 Apr 2025 17:06:33 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>,
	u-boot@lists.denx.de
Cc: Yixun Lan <dlan@gentoo.org>,
	Tom Rini <trini@konsulko.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 0/3] sunxi: add "fake" FEL button feature
Date: Thu, 17 Apr 2025 01:05:36 +0100
Message-ID: <20250417000539.3709-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some boards with Allwinner SoCs feature a "FEL" key, sometimes also
labelled "uboot", which allows to easily enter the BootROM FEL mode, when
pressed upon power-on or reset. This allows to access the USB-OTG boot
protocol, for convenient access to memory and uploading code.

Add a software emulation of this functionality for boards without a button
connected to this special SoC pin, to give easy FEL access to more
boards. Any GPIO can be used, as long as the button uses active-low
logic.

This is used on the X96 Mate TV box, where the hidden "update" button is
actually just some GPIO, checked by the vendor firmware.

Please have a look!

Cheers,
Andre

Changelog v1 .. v2:
- add patch to fix return_to_fel() prototype
- document signal needs to be active-low
- activate internal pull-up resistors
- add patch to activate button on the X96 Mate TV box

Andre Przywara (3):
  sunxi: fix return_to_fel() prototype
  sunxi: add "fake" FEL pin support
  sunxi: x96_mate: Add "fake" FEL key definition

 arch/arm/include/asm/arch-sunxi/sys_proto.h |  4 +--
 arch/arm/mach-sunxi/Kconfig                 | 10 +++++++
 arch/arm/mach-sunxi/board.c                 | 31 +++++++++++++++++++++
 configs/x96_mate_defconfig                  |  1 +
 4 files changed, 44 insertions(+), 2 deletions(-)

-- 
2.46.3


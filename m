Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=119.15.109.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795396544;
	b=Ux2FfoQ5NCPnlE/bQsaLL0Ae9AKWd++aYd7Xj49nKhl+xtE6LaxeG5J+eFHGkW0VzaB0
	 Y5taYkbKYRSz8MV1LnnQzzPTu363BNeX1b8hq3h2t0y9pKik+GCrJZpgTw7wOoTA0tbaF
	 CzDZs0h0jrOmttVZtMUxo+0CVogy9Pas6Ry0kUKj33m758/NKIxiYcZ9d3ZrQAdj388sn
	 NrvN9mOnbsOEdxCuvwz8x5uHulnApuSyrRGt55o6yeSk5nOFNaVSUWhTmiFyk04GtK4XH
	 rZIXUyV7uZG9J5qOqH5OTeSfjOADVJ3KrxJePBYzVlQ3OeH5SIg+YPscEk7SHBQnwjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795396544;
	h=DMARC-Filter:Received:DKIM-Signature:X-GPT-Reason:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=WkbteLaz5AkZYE5rWlkLsnJtoGTPuZQfXqAUSmFnezM=;
	b=lpvlSg/XXMpL6NeqIi0hfJLG7WpfjBeXDdPdQEc26PFhEcuaVpdMT40wWA3hhUr0u/KP
	 IJ4HHXfTk02Qcnjr3cCDrHYakXi52zcCEZfjv4YtRI2KwurTvqOnRdhfRAKOpeaOmhdXp
	 pOxzbDiyJyhIUMpMcFBD22q+3Qgn+s7ItGD9aM8hr9jyojsWbpLOpPb8r2fNEXhqnsoMY
	 VQjdDlKY1ENhf31x8iwcUC15IM0vwEUy+v31grDJ/EFatRtYiojvE242OiBfWkDnVDLF6
	 T9i0tJMG1jiCQzE+/twvJtQ54iWftinauC8yAuEL1dH9/0IJUXxUZ7Apx8DZYvTL/hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=d-silva.org;
	spf=pass smtp.mailfrom=d-silva.org;
	dkim=pass header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b="j/uflWUF";
	arc=none smtp.remote-ip=119.15.109.137
Received: from www.nmnhosting.com (watt.d-silva.org [119.15.109.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201EC606A31D
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Nov 2026 01:15:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 201EC606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d-silva.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d-silva.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=j/uflWUF
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id 754084028E;
	Mon, 23 Nov 2026 12:15:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795396534;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WkbteLaz5AkZYE5rWlkLsnJtoGTPuZQfXqAUSmFnezM=;
	b=j/uflWUFe5QCilunt1xK/yZMGG1Lv7YfmQnZau7feyPZN3450iAEFKOnWL5PsPVr13kGY8
	3tzkVNt/3kEinAJi77HCGSwXVz7skDqCuIQtoCkmXCw8mdMoSDnS4bfkKve0/Gykgv18lt
	sNaoQxFhuo3l9FU30cluV+Z70rYXZuICokzfRr9u2vL5SBpcaaW4RNboMEA8Ubt+pB60SF
	V9xyhdgt3eF8WTaxY/2M8AIjAqGi2XkDB+++Q3vNfBHiK57c3GB+PcfFXdDy6TkW/pPFCh
	6LULL5LP/NZBytUrMePfD4gX6grUGQKI9i2vIe5YzvwnM20jPqQkj0IgPgaWmA==
X-GPT-Reason: legitimate_personal_or_technical_communication; the
	email content is a technical patch description for a Linux kernel
	driver (AXP318W PMIC) which is consistent with a developer workflow;
	the sender (alastair@d-silva.org) matches a known personal/business
	mailbox (alastair@d-silva.org) provided in the context; there are
	no phishing indicators, no links, no urgency, and the content is
	highly specific and technical rather than a broad marketing or
	scam message.
From: Alastair D'Silva <alastair@d-silva.org>
To: u-boot@lists.denx.de
Cc: Andre Przywara <andre.przywara@arm.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Jaehoon Chung <jh80.chung@samsung.com>,
	Peng Fan <peng.fan@nxp.com>,
	Tom Rini <trini@konsulko.com>,
	Yixun Lan <dlan@gentoo.org>,
	linux-sunxi@lists.linux.dev,
	Alastair D'Silva <alastair@d-silva.org>
Subject: [PATCH 0/3] power: axp: Fix AXP318W bugs and extend SPL support
Date: Mon, 23 Nov 2026 12:15:31 +1100
Message-ID: <20261123011534.1692975-1-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes two bugs in the AXP318W PMIC/regulator drivers and
extends SPL power support (needed by the Orange Pi 4 Pro):

1. Fix the ELDO1-ELDO6 voltage mask (0x1f -> 0x3f) so voltages above
   1275 mV read back and clear correctly.
2. Use register 0x55 instead of 0x32 for AXP318W sysreset poweroff.
3. Add AXP318W DCDC6/7 and ALDO/BLDO/DLDO/ELDO support in SPL, with
   read-modify-write updates and -1 OTP-default skip semantics.

Alastair D'Silva (3):
  power: regulator: axp: Fix AXP318W ELDO voltage mask
  power: pmic: axp: Fix AXP318W sysreset shutdown register
  power: axp: Extend AXP318W SPL support with DCDC6/7 and LDOs

 board/sunxi/board.c                     |  23 ++++-
 drivers/power/Kconfig                   | 110 ++++++++++++++++++----
 drivers/power/axp_spl.c                 | 119 ++++++++++++++++++++++--
 drivers/power/pmic/axp.c                |   4 +-
 drivers/power/regulator/axp_regulator.c |  12 +--
 include/axp_pmic.h                      |   5 +
 6 files changed, 240 insertions(+), 33 deletions(-)

-- 
2.53.0


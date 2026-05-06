Received: from s106b.cyber-folks.pl (s106b.cyber-folks.pl [195.78.66.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C2247CC80;
	Wed,  6 May 2026 15:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.78.66.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778080260; cv=none; b=CHbaFxcG8hrrvv9S8NlN7BUoC3QbqIeaE2CLYxjzeA2ROu4v5KaCt5dx6gKDbcj9iqZ1XGx29qdEwW3rurnH+4wAGuBXvV0vHLp10PpJpvqjsVjUq4upLZcL9hP5miFhUQo9+9CkRTpCMDYPLirM7HBSV3zV6jUoZ7RwlbiGrIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778080260; c=relaxed/simple;
	bh=uNe4YHbNe0yih5EqSi5yN6HvLD9qpae4iOn6P3ifclQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Z5AZPFP22CFSO/tnQtgT4z4s8XPvvvnLsRoeaY6tnYC7iNLYVHr/7GL+60KupxWuR2KONiWrNTMUitwU1OBZNFCfdcQQkmANOnxxm9nDS4XJw1LdlERLPeSle1MVP0IqPiGZjyJlJgluJdH4CC96xsyufiRIyqihbMsx+laPBLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mmpsystems.pl; spf=pass smtp.mailfrom=mmpsystems.pl; dkim=pass (2048-bit key) header.d=mmpsystems.pl header.i=@mmpsystems.pl header.b=UsSieEfL; arc=none smtp.client-ip=195.78.66.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mmpsystems.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mmpsystems.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mmpsystems.pl header.i=@mmpsystems.pl header.b="UsSieEfL"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mmpsystems.pl; s=x; h=Cc:To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=BrySV1GGDNC+xsZXBQb7ZXd9wQjZLt31E8wC0iR2C68=; b=UsSieEfLSXnMNIrkartExrEioU
	TR4r407Du+/cr370xNbt2a6XAYbpdgVPD0ZRAGd7MG7UOeoqJSF5jXFSSihUylVTR28wovjexzYjr
	a0PZyGUOcgxFP7NFvJYRSJY1E16R7H2VfC5IhF4yAeNdxcOYgoZQXcpz9Mhh6Rwnaq2G/Kr6wznU4
	aPRCCZVixV238llpesDyPY/pAMzgu60rOR2TRNG/6JphCEMGjgMcYPjPRJoLsmCl5qDxtfYkaVtyY
	mBm9MlIkoXUKBb8YCw3POWei2vzxagzfUOU0TGRh4Wf/HH8wnPo5Mvd/Opleb5rJ6PkWSQimN+mQg
	Q39vRbPg==;
Received: from user-188-33-36-99.play-internet.pl ([188.33.36.99] helo=localhost)
	by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <michal.piekos@mmpsystems.pl>)
	id 1wKdth-00000003arQ-2Y1c;
	Wed, 06 May 2026 17:10:49 +0200
From: Michal Piekos <michal.piekos@mmpsystems.pl>
Subject: [PATCH v4 0/4] Add hstimer support for H616 and T113-S3
Date: Wed, 06 May 2026 17:10:25 +0200
Message-Id: <20260506-h616-t113s-hstimer-v4-0-591d425863d6@mmpsystems.pl>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOFZ+2kC/23NTQqDMBCG4auUrJuSSWI0XfUepQsbxxqoP2QkV
 MS7NwoFKS7fD+aZmREGj8Sup5kFjJ5836XQ5xNzTdm9kPsqNZNCGqFB8caA4SOAIt7Q6FsM3Ei
 rrNVFbcGxdDgErP1nQ++P1I2nsQ/T9iPCuv44e8RF4IJDWecan1jnLru17UATjdjSZXizlYxyx
 0hzyMjEoMnQVk44W5VHjNozxSGjEpOjkJAXpVWI/8yyLF8rshT2RgEAAA==
X-Change-ID: 20260413-h616-t113s-hstimer-62939948f91c
To: Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: Michal Piekos <michal.piekos@mmpsystems.pl>, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Andre Przywara <andre.przywara@arm.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778080247; l=2438;
 i=michal.piekos@mmpsystems.pl; s=20260301; h=from:subject:message-id;
 bh=uNe4YHbNe0yih5EqSi5yN6HvLD9qpae4iOn6P3ifclQ=;
 b=oQ1AG4MBxvQI5uCw4WRR1azxML7awKTWm3YtQDaBEAp1UCxgGNtUzOfAlOfrIeAC8Qlm4J0V+
 Nt/nzg2+a+wCihKeIKPmcnlcPQyUOpEICSVTteT2/jlvVF9acT7JRnE
X-Developer-Key: i=michal.piekos@mmpsystems.pl; a=ed25519;
 pk=Aixyx03If7ZDamiKKN0lsa+0mtA+WjIuIf2ZQVYNBqg=
X-Authenticated-Id: michal.piekos@mmpsystems.pl

Add support for Allwinner D1 high speed timer in sun5i hstimer driver
and describe corresponding nodes in dts for H616 and T113-S3 SoC's.

D1 and H616 uses same model as existing driver except register shift
compared to older variants. 

Added register layout abstraction in the driver, extended the binding
with new compatibles and wired up dts nodes for T113-S3 and H616 which
uses D1 as fallback compatible.

Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
---
Changes in v4:
- Move T113 related dts change to d1s-t113 for D1 to benefit too.
- Link to v3: https://patch.msgid.link/20260428-h616-t113s-hstimer-v3-0-7e02178a93ee@mmpsystems.pl

Changes in v3:
- Removed left over dead code from v1
- Link to v2: https://lore.kernel.org/r/20260426-h616-t113s-hstimer-v2-0-e65e9dc0c9da@mmpsystems.pl

Changes in v2:
- Change driver handling of different offsets to using quirks
- Change from t113s to d1 as the fallback compatible string
- Fix conditional compatible matching
- Link to v1: https://lore.kernel.org/r/20260419-h616-t113s-hstimer-v1-0-1af74ebef7c5@mmpsystems.pl

To: Daniel Lezcano <daniel.lezcano@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Samuel Holland <samuel@sholland.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-sunxi@lists.linux.dev
Cc: Andre Przywara <andre.przywara@arm.com>

---
Michal Piekos (4):
      dt-bindings: timer: allwinner,sun5i-a13-hstimer: add H616 and D1
      clocksource/drivers/sun5i: add D1 hstimer support
      arm: dts: allwinner: d1s-t113: add hstimer node
      arm64: dts: allwinner: h616: add hstimer node

 .../timer/allwinner,sun5i-a13-hstimer.yaml         |  9 ++-
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi     | 10 +++
 arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi  |  9 +++
 drivers/clocksource/timer-sun5i.c                  | 84 +++++++++++++++++-----
 4 files changed, 92 insertions(+), 20 deletions(-)
---
base-commit: 74fe02ce122a6103f207d29fafc8b3a53de6abaf
change-id: 20260413-h616-t113s-hstimer-62939948f91c

Best regards,
--  
Michal Piekos <michal.piekos@mmpsystems.pl>


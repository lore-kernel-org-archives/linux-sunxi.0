Received: from s106b.cyber-folks.pl (s106b.cyber-folks.pl [195.78.66.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4232765FF;
	Tue, 28 Apr 2026 16:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.78.66.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777393774; cv=none; b=CR0C/zVlagNz1bu4DU+WT2cgU1CVXEddqSrUeVre0UV9QOLMhtrzC+QfSVbWJsBJBgVD9C3wRlBKEtTNLn8voM+eQ1FbHV5Vb3YahYJ5ahQdjpNT0w+RTdl3VJIAXuTsoeC6NW/ENpBfxb/1Kfl8/vn3mxpjRzMVwOgXRVAqLwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777393774; c=relaxed/simple;
	bh=A/z3Dpfl8QWne2AA3wu272pF/oQI3BQ4sW56WDfbAfI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dKTHmS6ihCtj68HmtY63kyJmOVwjYXxdHEz04MO9v6agFExhrPHWC/0UMzRBF/6ekJgq+93KLZzwMotCioPBSlsU2y38TNCqx+1VHLpUKnVb7KAq2EtkBGyC2tGxNn1GBP4duW+lWYoHotHZErsxPe/l9+sq1voSdlJorvL3kLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mmpsystems.pl; spf=pass smtp.mailfrom=mmpsystems.pl; dkim=pass (2048-bit key) header.d=mmpsystems.pl header.i=@mmpsystems.pl header.b=iwo9t9tb; arc=none smtp.client-ip=195.78.66.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mmpsystems.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mmpsystems.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mmpsystems.pl header.i=@mmpsystems.pl header.b="iwo9t9tb"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mmpsystems.pl; s=x; h=Cc:To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=n+gzKv8oABCibww26yHxbbHYrvpU+Axs/A9jx80GuIo=; b=iwo9t9tbfRmgklfoJ45J2GevEw
	Yra2fSUDPmfbMdCp3PFIPzLC2nMmReCNdhefU+oOWqPBIZP2pp0Qz7vIt6iTqgL0NnHiEYbGN7TFa
	ZoxxMG8EUzJiVCl2/vbsC/gVxr0+V941w0epJeEQGtWGqFhqJB4ytBk4AsxQvKl8/CanFr4tr6Zes
	tasAEKto8LuQJBpdbrIctkZB3WdnjfTRshdMRMQdQYkVtub4fl3xumFH/K5ZNXKUw8k0vFwEvTISo
	v9oqMmv6ZTXcITRhpsrgJCju37s9JWRdAuavWWpti2nV87+92qbqb/3O5HL1SN8PIXjXEUDxxRC9c
	8UtXJvBQ==;
Received: from user-188-33-36-99.play-internet.pl ([188.33.36.99] helo=localhost)
	by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <michal.piekos@mmpsystems.pl>)
	id 1wHlJO-0000000AxAL-3BSY;
	Tue, 28 Apr 2026 18:29:26 +0200
From: Michal Piekos <michal.piekos@mmpsystems.pl>
Subject: [PATCH v3 0/4] Add hstimer support for H616 and T113-S3
Date: Tue, 28 Apr 2026 18:26:57 +0200
Message-Id: <20260428-h616-t113s-hstimer-v3-0-7e02178a93ee@mmpsystems.pl>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANHf8GkC/23NTQrCMBCG4auUrI3kp02NK+8hLmo6MQFjSyYES
 +ndTQuCSJfvB/PMTBCiByTnaiYRskc/vErIQ0WM614PoL4vTQQTitVcUqe4oolzidRh8gEiVUJ
 LreuT1dyQcjhGsP69oddbaecxDXHafmS+rl9O73GZU0Z5Z9sa7mBb01xCGHHCBAGP45OsZBY/j
 FC7jCgMqAZ0b5jRfffPLMvyAQGfVwb/AAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777393718; l=2250;
 i=michal.piekos@mmpsystems.pl; s=20260301; h=from:subject:message-id;
 bh=A/z3Dpfl8QWne2AA3wu272pF/oQI3BQ4sW56WDfbAfI=;
 b=YPZWR+z30g3msHg1ulMXtaCsLN3LuFhl2eHGZpUPuq53B/zuv72jSPhP5CCpRtZc9XhzdIEMH
 c2BUsjyTrnKDL6V/szS3V7KKPrsWEIAwA8noNiNE5dAB1xGDRY+lgJy
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
      arm: dts: allwinner: t113s: add hstimer node
      arm64: dts: allwinner: h616: add hstimer node

 .../timer/allwinner,sun5i-a13-hstimer.yaml         |  9 ++-
 arch/arm/boot/dts/allwinner/sun8i-t113s.dtsi       | 11 +++
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi     | 10 +++
 drivers/clocksource/timer-sun5i.c                  | 84 +++++++++++++++++-----
 4 files changed, 94 insertions(+), 20 deletions(-)
---
base-commit: dca922e019dd758b4c1b4bec8f1d509efddeaab4
change-id: 20260413-h616-t113s-hstimer-62939948f91c

Best regards,
--  
Michal Piekos <michal.piekos@mmpsystems.pl>


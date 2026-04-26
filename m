Received: from s106b.cyber-folks.pl (s106b.cyber-folks.pl [195.78.66.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9BA42AA6;
	Sun, 26 Apr 2026 10:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.78.66.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777198581; cv=none; b=TH7gH5buKeUwye+DEX3nyVwTOzjZdnNGlDrWd+8OugB4fGdMyyqK5UGEKdL0LIY4RmOS9v+rD7lQjUZDfhjHYA8Nn+pKFwWq7GVRuyA0OD438bkLxywRdOpm9hH4mZL7pIxM2M2WN9BrDUMY3trWswQnJP/S8YJcOKQC9dgQnAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777198581; c=relaxed/simple;
	bh=JZpe5juyjekGSl3KCHZz9FQl9GVXcxrzou7nqEme28E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RjM22yfCEPG5MX4gqnt+l6sXTtbFE9myW0ZPn/PJdAyvXS998QuEFGdRp6tfKJHlKU0fB0papbPbQ8bQT/U3JSYekrmoc2MF0kMtlZjftaeMK3ClsLKEHvcmS7PfR6PsLUx1t49FrH6AFcCOusNOIIq5RKuwcOm79vjCL+2Pnow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mmpsystems.pl; spf=pass smtp.mailfrom=mmpsystems.pl; dkim=pass (2048-bit key) header.d=mmpsystems.pl header.i=@mmpsystems.pl header.b=fgTBTP5p; arc=none smtp.client-ip=195.78.66.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mmpsystems.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mmpsystems.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mmpsystems.pl header.i=@mmpsystems.pl header.b="fgTBTP5p"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mmpsystems.pl; s=x; h=Cc:To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=s7Vri4uvx6ICfdudfHf69UQj1XDimRGVCirH9YF26Z0=; b=fgTBTP5pRUAdmMHivaZCYGt8LL
	MqYDacMsHGIfuBVMt795ZH+TGKhcm/Wkh+0j5xVJ/ERnUICQztZf4xlmUEJRzEVvvPWOIhUOnvdtG
	w8W0+/Wls7CwKI54h6tnc+w6CgVB7v0hTR31PBDY+fSYtq8HlSiHS6GKZplVd83kwf8NOusD1lnwm
	BnfRLD9xAIRFB+XDOT0D8k02n4u7wcsAG4nnnI++TbK5izqW0/YWfYPe2IDbKqy5uZ1wvI5CJtvme
	iraSjMCx0787u5RPyFYVamW+FKpRgpPBRMdpjaBxkF3iEbepmMNbA0snLGrHXiddu6S0aZvHDAV5i
	zD9SebaA==;
Received: from user-188-33-36-99.play-internet.pl ([188.33.36.99] helo=localhost)
	by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <michal.piekos@mmpsystems.pl>)
	id 1wGwX6-0000000CADG-3c16;
	Sun, 26 Apr 2026 12:16:12 +0200
From: Michal Piekos <michal.piekos@mmpsystems.pl>
Subject: [PATCH v2 0/4] Add hstimer support for H616 and T113-S3
Date: Sun, 26 Apr 2026 12:15:25 +0200
Message-Id: <20260426-h616-t113s-hstimer-v2-0-e65e9dc0c9da@mmpsystems.pl>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL3l7WkC/22NQQ6CMBBFr0Jm7RimYLGuvIdhgTi1TSyQTkMkh
 LtbSdy5fC/5768gHD0LXIoVIs9e/DhkUIcCetcNT0b/yAyqVLqsqUKnSWMiqgSdJB84olamMqY
 +W0M95OEU2fr3Hr21mZ2XNMZl/5jpa3858y83E5ZInW1qvrNt+tM1hEkWSRzkOL2g3bbtAydLj
 uC4AAAA
To: Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Michal Piekos <michal.piekos@mmpsystems.pl>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777198529; l=1530;
 i=michal.piekos@mmpsystems.pl; s=20260301; h=from:subject:message-id;
 bh=JZpe5juyjekGSl3KCHZz9FQl9GVXcxrzou7nqEme28E=;
 b=aadCL9ko4VIlfT7g7cDV9EBJEIWSGLjvkbnjogOi26mShXAxUnKPKEmdzgQb/c9Hs9LbOtDSP
 6L58evY3Sj4AwRTeNqUsqZ3sQbjf+WZmiIcXY3f2Cu0Se9+CDEnVBcu
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
Changes in v2:
- Change driver handling of different offsets to using quirks
- Change from t113s to d1 as the fallback compatible string
- Fix conditional compatible matching
- Link to v1: https://lore.kernel.org/r/20260419-h616-t113s-hstimer-v1-0-1af74ebef7c5@mmpsystems.pl

---
Michal Piekos (4):
      dt-bindings: timer: allwinner,sun5i-a13-hstimer: add H616 and D1
      clocksource/drivers/sun5i: add D1 hstimer support
      arm: dts: allwinner: t113s: add hstimer node
      arm64: dts: allwinner: h616: add hstimer node

 .../timer/allwinner,sun5i-a13-hstimer.yaml         |  9 ++-
 arch/arm/boot/dts/allwinner/sun8i-t113s.dtsi       | 11 +++
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi     | 10 +++
 drivers/clocksource/timer-sun5i.c                  | 88 +++++++++++++++++-----
 4 files changed, 98 insertions(+), 20 deletions(-)
---
base-commit: 897d54018cc9aa97fd1529ca08a53b429d05a566
change-id: 20260413-h616-t113s-hstimer-62939948f91c

Best regards,
-- 
Michal Piekos <michal.piekos@mmpsystems.pl>


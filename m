Received: from s106b.cyber-folks.pl (s106b.cyber-folks.pl [195.78.66.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC375285CA7;
	Sun,  8 Mar 2026 05:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.78.66.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772947072; cv=none; b=jCWpyAZO7/2ZuquDVGJ9sq5fpZV328VULYj5y+SWIWuiHiHBEcOA5bR9exnCjuYOktxQXwhG3i4k+Bnsyaf8tN4V/tLTc04neejvbJkXNM+cq5IbE1EStPXsvFn8ISlYNDgf1uRaKi62M9qCvxdZyPKTLvrPj4XizaESea+ash0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772947072; c=relaxed/simple;
	bh=JOxuT6FVbbvVPIn4RCxjy1V493HaKJzJyXP0whAIXO0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BcmZ0Np+9SASVeBBl5jFc4LL8hdQtP+fK4bFkrTq2Kp+2bh6QOJWjbYYgB45jNinVY03TBsktpycCg+uBHqhRwSaYh/Be1vpmTGXPmc64QfRaDPCiic1ex2QGMhl99UZVgDwjrXzfAUSL5eAcwIbD/4qGUIgXxpBAv8n0qQClgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mmpsystems.pl; spf=pass smtp.mailfrom=mmpsystems.pl; dkim=pass (2048-bit key) header.d=mmpsystems.pl header.i=@mmpsystems.pl header.b=hyYLjF6w; arc=none smtp.client-ip=195.78.66.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mmpsystems.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mmpsystems.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mmpsystems.pl header.i=@mmpsystems.pl header.b="hyYLjF6w"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mmpsystems.pl; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=XXZGUlaRb0Eje5wK/KO2zNOPWcHbRREyb47Kg+nZl20=; b=hyYLjF6wgfnyH9wPSYq1laaNpT
	FkqcbaBrE/8mbOPvV+hmgGzWBJ1S9ViQN59mKoGOIpnQPO3An+jyBc0tD4Mz5TC/lHUcnMuh4byIw
	dFVWDb36RR2aCvs6pKQ2dNQuIwkmgFZQo3nrkmJVg+mrpJ5vNg3p9nBWfPXVj6aEVTVKh6/1yY0wi
	6waqNkXY2XLwJIk/POqBWYkuggCstsMBuDLSiAMwjqDgcj2acjokcmt+ldzkncEtC4HmaG2T6XiaD
	NabG1QT+FemBJkVvvoIJqmPjZ7JStzUX314RfFwPoWsbMmZpIV0NL1FA3PeVO2j7wIbKUX6VJRli+
	xr+nasKQ==;
Received: from user-5-173-16-20.play-internet.pl ([5.173.16.20] helo=localhost)
	by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <michal.piekos@mmpsystems.pl>)
	id 1vz6WR-00000007XH6-2UYt;
	Sun, 08 Mar 2026 06:17:47 +0100
From: Michal Piekos <michal.piekos@mmpsystems.pl>
Date: Sun, 08 Mar 2026 06:16:51 +0100
Subject: [PATCH 1/2] arm64: dts: allwinner: h616: declare r_pio as
 interrupt controller
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260308-rc2-boot-hang-v1-1-d792d1a78dfd@mmpsystems.pl>
References: <20260308-rc2-boot-hang-v1-0-d792d1a78dfd@mmpsystems.pl>
In-Reply-To: <20260308-rc2-boot-hang-v1-0-d792d1a78dfd@mmpsystems.pl>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Michal Piekos <michal.piekos@mmpsystems.pl>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772947022; l=1038;
 i=michal.piekos@mmpsystems.pl; s=20260301; h=from:subject:message-id;
 bh=JOxuT6FVbbvVPIn4RCxjy1V493HaKJzJyXP0whAIXO0=;
 b=GvKEovrQjw0tRC33e40KVrc9oE7hZGA2efZkp/YkAPjZ8Yjt8ZIc7pxWBOu1MD3C4cMidHD5j
 Xg1/3Vo7b16CAjfe9pV8+2KpdyVEqdmO7Ge6bPh2AAfCaY1CSXyN4mS
X-Developer-Key: i=michal.piekos@mmpsystems.pl; a=ed25519;
 pk=Aixyx03If7ZDamiKKN0lsa+0mtA+WjIuIf2ZQVYNBqg=
X-Authenticated-Id: michal.piekos@mmpsystems.pl

The R_PIO pin controller provides GPIO interrupts to the PL bank but the
device tree currently does not describe it as an interrupt controller.

Add the missing interrupt-controller and #interrupt-cells properties so
that boards using PL bank GPIO interrupts can reference it as interrupt
parrent.

Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
Tested-by: Michal Piekos <michal.piekos@mmpsystems.pl>
---
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
index 8d1110c14bad..2d714dbf1b70 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
@@ -964,6 +964,8 @@ r_pio: pinctrl@7022000 {
 			clock-names = "apb", "hosc", "losc";
 			gpio-controller;
 			#gpio-cells = <3>;
+			interrupt-controller;
+			#interrupt-cells = <3>;
 
 			/omit-if-no-ref/
 			r_i2c_pins: r-i2c-pins {

-- 
2.43.0


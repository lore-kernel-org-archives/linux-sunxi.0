Received: from s106b.cyber-folks.pl (s106b.cyber-folks.pl [195.78.66.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11D3256C70;
	Sun, 12 Apr 2026 17:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.78.66.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776015781; cv=none; b=cSEDjOtHEd4ssi4qmDb5JxovU2yUpoFxRhgeZP7jeyTaATs670dDo2OMSiqjF0UIIV9qFSAqdd1eVmqEM5K0cUIqk3goYkFNJ7191lgpne8eKBbnA1z2DmYI+hIXfSpENjh/KrADP0IEVzlF4xAk+J+/upFqWDd4ArMYBjdlHCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776015781; c=relaxed/simple;
	bh=4a5CpNLwijqEeoBxf58LElhGXYoxLZYamglg2D+v9G0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=nMRyUkrVXeQpNGOP5sB94COuZanrlZh/PmtFEMTI4HWyZhQgloFMYi590amlAJuo6jxY7/70K/MyK9swR+8Tko6xAP+Z0GPbopsi8lUpZTbCktE5WOxtO8Oy1EAZJrjHZTWgL+yDYwSh8QMxqB+kyOa3IwD31fjaB5B4Jx0g2qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mmpsystems.pl; spf=pass smtp.mailfrom=mmpsystems.pl; dkim=pass (2048-bit key) header.d=mmpsystems.pl header.i=@mmpsystems.pl header.b=fFO122tL; arc=none smtp.client-ip=195.78.66.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mmpsystems.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mmpsystems.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mmpsystems.pl header.i=@mmpsystems.pl header.b="fFO122tL"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mmpsystems.pl; s=x; h=Cc:To:Message-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=BCp70hr3uicHLXM/GL0GyVEZjJkjXaoYY9yWIBjEisA=; b=fFO122tLYz42xK+DEPSZbMUJDg
	FdxmKDgp01GpFPjt53T1Ekg/syfTdLKKA5hC/20s7nvU8KQFuoOiNRXMJNy70s/4m+xpdT97gz348
	lzY+cNWojtt4e0cmE3E+y8Y/fKxuc+iKv2EoiIXTlHUqrPNUbl3l+QtrD9FEXh8kl81FTzJh7s285
	MUB9gNlFNNGPY6UX47A/8pDR2c/p1nIkXCuFinQdUP+iUIhDH9kbYP0WTuXWIuZaSvUZEjVkb934c
	tLzgxdef+/efWIl+zaFa0Sv9Xv86imfJ6TydPZnvIj+Lv0HzpEDehQbj/D8nyppFAqTCJnBOWZpUd
	W1j5brsg==;
Received: from user-5-173-16-91.play-internet.pl ([5.173.16.91] helo=localhost)
	by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <michal.piekos@mmpsystems.pl>)
	id 1wBypj-0000000A5MM-059X;
	Sun, 12 Apr 2026 19:42:55 +0200
From: Michal Piekos <michal.piekos@mmpsystems.pl>
Date: Sun, 12 Apr 2026 19:42:10 +0200
Subject: [PATCH] arm: dts: allwinner: t113s mangopi: enable watchdog for
 reboot
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260412-t113-mangopi-reboot-hang-v1-1-5002cfa6e0cc@mmpsystems.pl>
X-B4-Tracking: v=1; b=H4sIAHHZ22kC/x2MQQ5AMBBFryKzNokOEVxFLNoazIJKKyJpendl+
 fLffxECe+EAQxHB8y1B3JFBlQXYTR8ro8yZgSpqq0YRXkrVuOfFnYKejXMXfiLaXvczLx0xGcj
 30/Miz58ep5ReK/Yrd2oAAAA=
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Michal Piekos <michal.piekos@mmpsystems.pl>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776015732; l=986;
 i=michal.piekos@mmpsystems.pl; s=20260301; h=from:subject:message-id;
 bh=4a5CpNLwijqEeoBxf58LElhGXYoxLZYamglg2D+v9G0=;
 b=2uyGbcT9UsQQiVrajLnas48wLY7waq2GcuVc54VU/0QPLzJPeNy+QgQ5FmsgNpz942CaHtYsi
 zzs9eMoYHEeCoLq3jY2nZTDZ7VSnu0ohImT9m7SIeAlRYKiPv3IATyS
X-Developer-Key: i=michal.piekos@mmpsystems.pl; a=ed25519;
 pk=Aixyx03If7ZDamiKKN0lsa+0mtA+WjIuIf2ZQVYNBqg=
X-Authenticated-Id: michal.piekos@mmpsystems.pl

Reboot hangs on MangoPi MQ-R T113s because no restart handler is
available.

Enable the SoC watchdog whose driver registers a restart handler.

Tested on MangoPi MQ-R T113s.

Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
---
 arch/arm/boot/dts/allwinner/sun8i-t113s-mangopi-mq-r-t113.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/allwinner/sun8i-t113s-mangopi-mq-r-t113.dts b/arch/arm/boot/dts/allwinner/sun8i-t113s-mangopi-mq-r-t113.dts
index 8b3a75383816..f0232a5e903b 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-t113s-mangopi-mq-r-t113.dts
+++ b/arch/arm/boot/dts/allwinner/sun8i-t113s-mangopi-mq-r-t113.dts
@@ -33,3 +33,7 @@ rtl8189ftv: wifi@1 {
 		interrupt-names = "host-wake";
 	};
 };
+
+&wdt {
+	status = "okay";
+};

---
base-commit: f5459048c38a00fc583658d6dcd0f894aff6df8f
change-id: 20260412-t113-mangopi-reboot-hang-c9a9def82e2b

Best regards,
-- 
Michal Piekos <michal.piekos@mmpsystems.pl>


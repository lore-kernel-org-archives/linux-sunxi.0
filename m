Received: from lab.riabenko.com (lab.riabenko.com [185.143.146.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969D1493631;
	Sat, 22 Aug 2026 05:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.143.146.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787376312; cv=none; b=bHE+P4VTxWiURCwTJt4T5U9Qct5mkJarNYBn4d/jhcDAGTmNU5VsIh6bX4Rmth6uuz0ds9qZJunbeyazUQVmDkDm4x49UaDxjr4+Ml6sKGOajKtX3tKdhILRQl7jSnkFURxzgzGv1z7uGhvGBq4VV2quN3uPu6UxBHIai03g4Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787376312; c=relaxed/simple;
	bh=kvycTdF/5T2MuwzUdYZ0MLY8SBTi7jlE3IA1zDcfl5A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K3CEJ0k/MAxfeNBDIB0Xhd8enDVy7TGXoTLPJp/+iJHnytCjg5ZOLJUlyhtlli1mTqdgBO2NANYG4fkiGhmchaSvZ3SjFu1sIeXRh32UJAGXyid+dyLPa7vnXY038Z7mavBZ73Zb6NDKSJp/3jnflfJ+iijGCBcxNDOkzBwCJkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=riabenko.com; spf=pass smtp.mailfrom=riabenko.com; dkim=pass (2048-bit key) header.d=riabenko.com header.i=@riabenko.com header.b=T3JuoMR9; arc=none smtp.client-ip=185.143.146.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=riabenko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riabenko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riabenko.com header.i=@riabenko.com header.b="T3JuoMR9"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=riabenko.com; s=selector; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:Subject:Date:
	Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=5WH5D0JtSfK72vdeI0nhh2PL53o2bVvJzV3Cx+3KNFU=; b=T3JuoMR9ELdbyGbSwz1h2H7w0d
	8r576PZcWwLwV9x67G5rGYNtHRfValfZ7J+GcWdPMKC/z+SOKEoruLQRsTM4P0HyFt71TYiKb/mmr
	ju5hiy2a4u4+du8GrSsvNOpjYIt+W4BVZYIUwjvyQJX4Oyq+I4AfwZktqHO/nTMCQM8QJsgF68j9r
	imfSVJYP9SYAADXdsJni6gJk4anBkdQP2h1PNwfkNjSS11AB5AQl8n70YXx1VGw5M40whcBdWXCTH
	QXJsI+ULEzMq1RrGxV0h+mGubY13r9wttE0UTLvjCfkmd4Z/hW/bbzqNKLM7QfBX3gss9f8/RC4tc
	lkW3BqWA==;
Received: from librecmc.lan ([192.168.10.1] helo=desk.lan)
	by mini.riabenko.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <roman@riabenko.com>)
	id 1wxeDt-0000000005R-1xxc;
	Sat, 22 Aug 2026 08:24:53 +0300
From: Roman Riabenko <roman@riabenko.com>
To: andrew@lunn.ch,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org
Cc: andre.przywara@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Roman Riabenko <roman@riabenko.com>
Subject: [PATCH v2] arm64: dts: allwinner: a64: olinuxino: Fix phy-mode
Date: Sat, 22 Aug 2026 08:23:53 +0300
Message-ID: <20260822052353.22881-1-roman@riabenko.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 'rgmii' mode does not appear to describe the RGMII timing in Olimex
A64-OlinuXino boards. The PCB layout shows that the clock and data
traces have roughly the same lengths for both RX and TX and, thus, do
not appear to implement the 2 ns RGMII delay or introduce any
significant delay.

According to the KSZ9031RNX datasheet, the PHY adds a typical 1.2 ns RX
delay and no TX delay by default. The 'rgmii-id' mode causes the PHY
driver to enable appropriate internal RGMII delays.

Packet loss in the downlink direction is observed with the 'rgmii' mode
and is severe enough to interfere with downloads and disrupt software
installation. No packet loss is observed with 'rgmii-id'.

Adjusting the TX delay in the DT was found to be unnecessary with
'rgmii-id'.

Signed-off-by: Roman Riabenko <roman@riabenko.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts
index fd3794678c33..8cb2381e21da 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts
@@ -102,10 +102,9 @@ &ehci1 {
 &emac {
 	pinctrl-names = "default";
 	pinctrl-0 = <&rgmii_pins>;
-	phy-mode = "rgmii";
+	phy-mode = "rgmii-id";
 	phy-handle = <&ext_rgmii_phy>;
 	phy-supply = <&reg_dcdc1>;
-	allwinner,tx-delay-ps = <600>;
 	status = "okay";
 };
 
-- 
2.54.0


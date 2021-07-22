Received: from smtpbg587.qq.com (smtpbg587.qq.com [113.96.223.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A719173
	for <linux-sunxi@lists.linux.dev>; Thu, 22 Jul 2021 06:32:59 +0000 (UTC)
X-QQ-mid: bizesmtp46t1626935423txl9xgm2
Received: from localhost.localdomain (unknown [14.154.30.9])
	by esmtp6.qq.com (ESMTP) with 
	id ; Thu, 22 Jul 2021 14:30:20 +0800 (CST)
X-QQ-SSF: 01100000002000104000B00A0000000
X-QQ-FEAT: ttxN9vkG2OTYjbmMxKd2aE9/gEXm7sE1wV7QoED5tZTJ69y2wcDMuDvvZSagt
	fa2SYifZ57H3hYSdGarllhvG9m5UnD5XSg0XCvid9/7kcu3Mabs+9sj9ZUnjPhfbZF1cLOx
	8MziyEL24R+9ieEC6xTFCIgndxP09dKOB2qDclh4beY2vxw6//3A3yb+Nad0+Di3MK9f+b6
	hC7veTf/sJQ0TsbUCvI+2U5oXNxMVl9b+tlcnhQD6KAGlgiIpwa1as4gL/W1kjqDXAXcdx7
	xT7exYlGPPagbjuHjx360n+a2mOMrl7517wOgWkW1JlCAoqihcKkaxwFVpcYszbMHDuOPz0
	yNjFD/9B4k6+pMDIJg=
X-QQ-GoodBg: 0
From: Icenowy Zheng <icenowy@sipeed.com>
To: Jagan Teki <jagan@amarulasolutions.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Jernej Skrabec <jernej.skrabec@siol.net>,
	Samuel Holland <samuel@sholland.org>
Cc: u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev,
	Icenowy Zheng <icenowy@sipeed.com>
Subject: [RFC PATCH 01/13] sunxi: decide the inclusion of SCP by SCP_ADDR existence
Date: Thu, 22 Jul 2021 14:30:03 +0800
Message-Id: <20210722063015.421923-2-icenowy@sipeed.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210722063015.421923-1-icenowy@sipeed.com>
References: <20210722063015.421923-1-icenowy@sipeed.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:sipeed.com:qybgspam:qybgspam3

There are more Allwinner SoCs that do not have a SCP now.

When there's no SCP_ADDR macro defined, we can assume there's no SCP
available.

Drop the scp part of FIT description when SCP_ADDR does not exist.

Signed-off-by: Icenowy Zheng <icenowy@sipeed.com>
---
 arch/arm/dts/sunxi-u-boot.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/dts/sunxi-u-boot.dtsi b/arch/arm/dts/sunxi-u-boot.dtsi
index 06da009fa2..4a6ed3a7dd 100644
--- a/arch/arm/dts/sunxi-u-boot.dtsi
+++ b/arch/arm/dts/sunxi-u-boot.dtsi
@@ -64,7 +64,7 @@
 					};
 				};
 
-#ifndef CONFIG_MACH_SUN50I_H616
+#ifdef SCP_ADDR
 				scp {
 					description = "SCP firmware";
 					type = "firmware";
@@ -92,7 +92,7 @@
 				@config-SEQ {
 					description = "NAME";
 					firmware = "atf";
-#ifdef CONFIG_MACH_SUN50I_H616
+#ifndef SCP_ADDR
 					loadables = "uboot";
 #else
 					loadables = "scp", "uboot";
-- 
2.30.2


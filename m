Received: from smtpbg587.qq.com (smtpbg126.qq.com [106.55.201.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49EC2FB2
	for <linux-sunxi@lists.linux.dev>; Thu, 22 Jul 2021 06:32:22 +0000 (UTC)
X-QQ-mid: bizesmtp46t1626935464ti9pyyy8
Received: from localhost.localdomain (unknown [14.154.30.9])
	by esmtp6.qq.com (ESMTP) with 
	id ; Thu, 22 Jul 2021 14:31:03 +0800 (CST)
X-QQ-SSF: 01100000002000104000B00A0000000
X-QQ-FEAT: lm51M56XDGxBaqOZc0xcOtruxJg8qdEet9VTjwDMuJ3xP/cvePQLY9i6lOH8e
	vcgbk1kxdfUMeTJ+FPaK17ubVXlztpV0c7GFtgoh1lrfUfDVfwkR6dJ2sW75k+rVuWHivVM
	pFL9zIW7cEVWdcD/c/m2Hg4Ex9iM9D7c6inia5Xl04sdFkWsIez0vnV7Uq8gV8W6pqxHdy/
	o5J1a5D1dvdT8u546FA/6FDTIQrbFjx/H1wGiRnZbcePEImHGu2cBsXiCUmllh8Kk2yNVkQ
	7jDtmvmeGsnQxkT6t5+iuWt97vsK+0vihbZrWx39tJa+94MNqLyglcGvdIslkW9inWo9BHs
	l7T5foN0K4LfZ01si8=
X-QQ-GoodBg: 0
From: Icenowy Zheng <icenowy@sipeed.com>
To: Jagan Teki <jagan@amarulasolutions.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Jernej Skrabec <jernej.skrabec@siol.net>,
	Samuel Holland <samuel@sholland.org>
Cc: u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev,
	Icenowy Zheng <icenowy@sipeed.com>
Subject: [RFC PATCH 13/13] sunxi: add support for Sipeed Maix IIA Dock board
Date: Thu, 22 Jul 2021 14:30:15 +0800
Message-Id: <20210722063015.421923-14-icenowy@sipeed.com>
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
Feedback-ID: bizesmtp:sipeed.com:qybgspam:qybgspam2

Maix IIA is a SoM by Sipeed, and a official baseboard is sold with it.

Add support for this official baseboard with Maix IIA attached.

Signed-off-by: Icenowy Zheng <icenowy@sipeed.com>
---
 board/sunxi/MAINTAINERS                | 5 +++++
 configs/sipeed_maix_iia_dock_defconfig | 8 ++++++++
 2 files changed, 13 insertions(+)
 create mode 100644 configs/sipeed_maix_iia_dock_defconfig

diff --git a/board/sunxi/MAINTAINERS b/board/sunxi/MAINTAINERS
index 4fc26077b2..ae7c6a131a 100644
--- a/board/sunxi/MAINTAINERS
+++ b/board/sunxi/MAINTAINERS
@@ -493,6 +493,11 @@ M:	VishnuPatekar <vishnupatekar0510@gmail.com>
 S:	Maintained
 F:	configs/Sinovoip_BPI_M3_defconfig
 
+SIPEED MAIX IIA DOCK BOARD
+M:	Icenowy Zheng <icenowy@sipeed.com>
+S:	Maintained
+F:	configs/sipeed_maix_iia_dock_defconfig
+
 SOPINE BOARD
 M:	Icenowy Zheng <icenowy@aosc.io>
 S:	Maintained
diff --git a/configs/sipeed_maix_iia_dock_defconfig b/configs/sipeed_maix_iia_dock_defconfig
new file mode 100644
index 0000000000..a839f65e10
--- /dev/null
+++ b/configs/sipeed_maix_iia_dock_defconfig
@@ -0,0 +1,8 @@
+CONFIG_ARM=y
+CONFIG_ARCH_SUNXI=y
+CONFIG_DEFAULT_DEVICE_TREE="sun50i-r329-maix-iia-dock"
+CONFIG_SPL=y
+CONFIG_MACH_SUN50I_R329=y
+CONFIG_MMC0_CD_PIN="PF6"
+# CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
+CONFIG_ENV_FAT_DEVICE_AND_PART="1:auto"
-- 
2.30.2


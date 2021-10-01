Received: from mail-m17638.qiye.163.com (mail-m17638.qiye.163.com [59.111.176.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70C52F80
	for <linux-sunxi@lists.linux.dev>; Fri,  1 Oct 2021 15:01:47 +0000 (UTC)
Received: from localhost.localdomain (unknown [112.48.80.210])
	by mail-m17638.qiye.163.com (Hmail) with ESMTPA id 588041C00DC;
	Fri,  1 Oct 2021 22:50:48 +0800 (CST)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Rob Herring <robh+dt@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH] arm64: dts: allwinner: NanoPi R1S H5: use the correct compatible for the eeprom
Date: Fri,  1 Oct 2021 22:50:36 +0800
Message-Id: <20211001145036.18129-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.17.1
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
	kWDxoPAgseWUFZKDYvK1lXWShZQUhPN1dZLVlBSVdZDwkaFQgSH1lBWRpJTExWTExPGkxOSUxPGU
	1JVRMBExYaEhckFA4PWVdZFhoPEhUdFFlBWVVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MRA6OBw*PD4NNzgiAkkRNipJ
	OQoKCx1VSlVKTUhIS0JCQ09CS0pJVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUpK
	SVVPQ1VDS1VJSktZV1kIAVlBSUtJTTcG
X-HM-Tid: 0a7c3c561b9cd993kuws588041c00dc
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

The 'microchip,24c02' compatible does not match the at24 driver, so
replace it with 'atmel,24c02'. In addition, because the mac address
is stored on this eeprom, set it to read-only mode.

Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
 arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-r1s-h5.dts | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-r1s-h5.dts b/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-r1s-h5.dts
index 55bcdf8d1a07..4f01c17c49e0 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-r1s-h5.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-r1s-h5.dts
@@ -142,9 +142,10 @@
 	status = "okay";
 
 	eeprom@51 {
-		compatible = "microchip,24c02";
-		reg = <0x51>;
+		compatible = "atmel,24c02";
 		pagesize = <16>;
+		reg = <0x51>;
+		read-only; /* This holds our MAC */
 	};
 };
 
-- 
2.17.1


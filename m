Received: from mail-m17638.qiye.163.com (mail-m17638.qiye.163.com [59.111.176.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454392C80
	for <linux-sunxi@lists.linux.dev>; Sun, 10 Oct 2021 13:56:46 +0000 (UTC)
Received: from amadeus-VLT-WX0.lan (unknown [58.23.36.250])
	by mail-m17638.qiye.163.com (Hmail) with ESMTPA id EAD921C0190;
	Sun, 10 Oct 2021 21:50:42 +0800 (CST)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH v2 1/1] arm64: dts: allwinner: NanoPi R1S H5: Add generic compatible string for I2C EEPROM
Date: Sun, 10 Oct 2021 21:50:17 +0800
Message-Id: <20211010135017.6855-2-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211010135017.6855-1-amadeus@jmu.edu.cn>
References: <20211010135017.6855-1-amadeus@jmu.edu.cn>
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
	kWDxoPAgseWUFZKDYvK1lXWShZQUhPN1dZLVlBSVdZDwkaFQgSH1lBWRkYGkxWShkaGh9LHxhOTU
	xJVRMBExYaEhckFA4PWVdZFhoPEhUdFFlBWVVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NBw6FAw4NT4TPzcWTgIsPw1D
	Dj4KFEJVSlVKTUhIQ0xIQ09ISExDVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWU5D
	VUlIVUhNVUlOS1lXWQgBWUFJT05ONwY+
X-HM-Tid: 0a7c6a7853ccd993kuwsead921c0190
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

The 'microchip,24c02' compatible does not match the at24 driver, so
add this generic fallback to the device node compatible string to
make the device to match the driver using the OF device ID table.

Also set this eeprom to read-only mode because it stores the mac
address of the onboard usb network card.

Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
 .../arm64/boot/dts/allwinner/sun50i-h5-nanopi-r1s-h5.dts | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-r1s-h5.dts b/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-r1s-h5.dts
index 55bcdf8d1a07..55b369534a08 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-r1s-h5.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-r1s-h5.dts
@@ -142,9 +142,16 @@
 	status = "okay";
 
 	eeprom@51 {
-		compatible = "microchip,24c02";
+		compatible = "microchip,24c02", "atmel,24c02";
 		reg = <0x51>;
 		pagesize = <16>;
+		read-only;
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		eth_mac1: mac-address@fa {
+			reg = <0xfa 0x06>;
+		};
 	};
 };
 
-- 
2.17.1


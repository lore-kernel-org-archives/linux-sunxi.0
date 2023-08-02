Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.155.65.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36953D51F
	for <linux-sunxi@lists.linux.dev>; Wed,  2 Aug 2023 22:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=biqu3d.com;
	s=tfld2305; t=1691013996;
	bh=biEvRZtAy9JobJPGeIzHyKFJl4/+oPo0y3sPVz51oy4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=niPcKmfNXbrrj6CnlySEXx2/viA1v80OjikgqxKua6Eo1iX/+R4q9hOKpOJ7KEvTd
	 x6uukCYnvDAEh1LGu6/89p/nuqTSuehcJZkZIJdqLvRVA4s3LjxmNTsM6I95NHAye5
	 7WIoeyjghtz24yHfrL4fk1J55dxLLluU5IBS1fyo=
X-QQ-mid: bizesmtp89t1691013911t5qhiqcn
Received: from TimeMachine.lan ( [178.41.211.221])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 03 Aug 2023 06:04:57 +0800 (CST)
X-QQ-SSF: 01400000008000301000B00A0000000
X-QQ-FEAT: ILHsT53NKPjBkPxVUesfz0lluzQZMjsfUmpeg7ogF8xBcSFqv4AAli17hKtgg
	2oRRAAw9ZlWlpoFqq/6/Os2nmroIVgigJI80z/bv2lQrk/DRnofaOqNr6BtP86m3WRwv84B
	13JAtfYUj1NKB1DS9wAHbtIRfO9FbBdRDcAGdNqlcDbNGddp8xgT7aFqxhCN676bDUQvHkV
	9SQNzF10moPjCqHtn5lo3/AJANAJkpHxE22TapC5iB1T+iF11Ux8EQdCh6AM5n/QbHTLGYu
	sOvWZ+yNs72KT57f7EezxKhIR+az1xLhNd1t0evt/6mbVQIRNhPFo+TbOH6KATeJjwPPXZl
	XJd7H5T2FskHLMivZr1KD2jvpGAVj88Evq1nJbLnCRw7Vgcw5no1HQHavBcmA==
X-QQ-GoodBg: 2
X-BIZMAIL-ID: 11005468934301047537
From: Martin Botka <martin@biqu3d.com>
To: 
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Jami Kettunen <jamipkettunen@somainline.org>,
	Paul Bouchara <paul.bouchara@somainline.org>,
	Martin Botka <martin.botka@somainline.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Martin Botka <martin@biqu3d.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Icenowy Zheng <uwu@icenowy.me>,
	Ludwig Kormann <ludwig.kormann@ict42.de>,
	Heiko Stuebner <heiko@sntech.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Chris Morgan <macromorgan@hotmail.com>,
	Jagan Teki <jagan@edgeble.ai>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 6/6] arm64: dts: allwinner: h616: Add BigTreeTech Pi support
Date: Thu,  3 Aug 2023 00:02:39 +0200
Message-ID: <DFE9B2F1349F69AE+20230802220309.163804-7-martin@biqu3d.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230802220309.163804-1-martin@biqu3d.com>
References: <20230802220309.163804-1-martin@biqu3d.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:biqu3d.com:qybglogicsvrgz:qybglogicsvrgz5a-1

The BigTreeTech Pi is an H616 based board based on CB1.
Just in Rpi format board.

It features the same internals as BTT CB1 but adds:
    - Fan port
    - IR receiver
    - 24V DC power supply via terminal plugs
    - USB to CAN module connector (The actual USB to CAN happens on the external module)

List of currently working things is the same as BTT CB1.

Signed-off-by: Martin Botka <martin@biqu3d.com>
---
 .../allwinner/sun50i-h616-bigtreetech-pi.dts  | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-pi.dts

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-pi.dts b/arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-pi.dts
new file mode 100644
index 000000000000..05f39b3606ba
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-pi.dts
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: (GPL-2.0+ or MIT)
+/*
+ * Copyright (C) 2023 Martin Botka <martin@biqu3d.com>.
+ */
+
+/dts-v1/;
+
+#include "sun50i-h616-bigtreetech-cb1.dtsi"
+
+/ {
+	compatible = "bigtreetech,pi", "allwinner,sun50i-h616";
+};
+
+&ehci0 {
+	status = "okay";
+};
+
+&ohci0 {
+	status = "okay";
+};
+
+&ehci1 {
+	status = "okay";
+};
+
+&ohci1 {
+	status = "okay";
+};
+
+&ehci2 {
+	status = "okay";
+};
+
+&ohci2 {
+	status = "okay";
+};
+
+&ehci3 {
+	status = "okay";
+};
+
+&ohci3 {
+	status = "okay";
+};
-- 
2.41.0


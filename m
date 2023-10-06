Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9EA20F7
	for <linux-sunxi@lists.linux.dev>; Fri,  6 Oct 2023 09:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=julian.ribbeck@gmx.de header.b="VW5WQWnC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1696582936; x=1697187736; i=julian.ribbeck@gmx.de;
 bh=qbziC+TbQMjflhlt6KwWMiaUOsFEEHNJl0dYIOw0j7A=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=VW5WQWnCoO4CzmUE3pcYJ2wpZwKUhHmM67zBtU8k+jW1c29a3vQ7+rjPNUns2IDf2oHA+qvGOmt
 2phTduG4w4jhq+hwKpk6GDURlwllYyYTOfdMjNUl7u9VeFpL7SVHApns5SRW4gnvFisNks8ijooXi
 k55+92Q23NomK1ndHRGhbXJzRJ0mOgzZpOVw3pd4z7u01PG/dih0TtE9C7fbCbcOcsmKd5mw2AWME
 gNHT6SijdPQc15eZhDFDIMpKbnk4N8yB8WoZ3oGesUKQDBUaNZ5DfZ3o0tFwNLMmAeAqwytUvciG4
 WpK4lnAHWArYC537ptDxGCDZ+5qVWfsCAGYg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([95.90.255.242]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1M5QJD-1qnJ9B00X7-001RuD; Fri, 06 Oct 2023 11:02:16 +0200
From: Julian Ribbeck <julian.ribbeck@gmx.de>
To: conor@kernel.org
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	jernej.skrabec@gmail.com,
	julian.ribbeck@gmx.de,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	robh+dt@kernel.org,
	samuel@sholland.org,
	wens@csie.org
Subject: [PATCH v4 1/2] ARM: dts: sun7i: Add Iteaduino Plus A20
Date: Fri,  6 Oct 2023 11:01:30 +0200
Message-ID: <20231006090154.9289-1-julian.ribbeck@gmx.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230929-given-making-f3fac6afb176@spud>
References: <20230929-given-making-f3fac6afb176@spud>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:TV9KKKQrrOIWGqaMf6d1BzytJ6PKBtVrww/qFlmOtk2P4M/k9Cv
 4wawCZt1DxDw4kN/lwzOAYINfKnvkyoAOlL3QSiT7dYpqN6Iin1af/cKtAPNEUiComXyhYO
 5eWUtL9iCCcgED3XSxaFx7omV2cBKQWFCL6rqY48wiKc5f8SyW9GhDdaFpHtH6xXNT6wCah
 BQ2v04V7I0lfTe8u+xJVA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:SuVfN/XrUNo=;X1HJOVDq3RNdzqQKeTcLQpbXmaE
 Z9jGNQEeOG6xhrafkCXZr0wfTjV5jJf3677Mrv2Pf7qR+FyUOO1fHG7zqkY5GSyH5Ylglyc91
 r2udbuW3O+YPUE4OyuSfhSzkDaUsER6dZn0jrDE/maSrPwy7YMFYTylDhNj835/YHHV3aHm/U
 dBe5oNdtLi0Vvl8Z4b5/TwrHcgKZHwtG1JXjpF5UCKVBmJ/gbUVUTbx8ngtf016SSOEjBwOUt
 YHgiPyP8OBlp8ZjF51lqid9vSVCOwUtBAUHqGvGD7+QpB/BgJsRDj9cLiww9pfZoCLGw7KQkh
 mKAARKJ/8zsMN9TzG/nMJbmg+KJ45evKq9YkuE8oS3p4iJEyqRd3c9kX9FFT9+8qONC3RWPXi
 Rp9sjNmeSdw5o3iV3exG1nWhKOJnDLWbm+uTy7zVLQBfT7glxkl2mvjUZXllA/RAfl9M89oEn
 FD8+Yl76aYuKSZBB2FQ+TUeJmT/02xvZ9ziWSZipxU80Sy117PHcfrQSF4bVqdYN6Z2Cj7ALM
 As3cv/8n8KC7pF5NdLJ06ldr3hEuQTNX/rpfMfPQjOvTr3zl5oP6it6XC4sBDCbs4Hs0niWoE
 uFE/C2zSokqrQ8j8DvNdNhu9sppn7wGtsbFpxdL9PMqyQNOW8aTdSbLNz86CdR25qq5VJsWI0
 v0kspCKZuqoyP1Ky3lXSnK1qeqblHBMrzBBB8WDtjXimiYLTtjVCDHn3CfT3DxTUowNhvpufG
 tgUu+JAdonel89igMTWANdOmjLNGZWsROufyRImmBSresEZGPG7ffrvUqlX7oZIL+ght/JJ3s
 W+ckFoUkkF876bZT9F7HdNFSuYWYJPw1BDbA+4Dq0fvnpYBvmaD+fZqKJR5hT1uGxc1LnKB8m
 fKJxJe+yU9GMcW6EYkymp3WRG1wi4PYVqH1SRSMIuBt4LO2/DsFHd2jaTIwg+s+ukt3wAsRP0
 bL8Gcw==

Iteaduino Plus A20 is very similar to Iteaduino Plus A10. In fact it
shares the same breakout board and the Itead Core A20 on top of it, is
only adapted to support the dual-core A20.

This commits enables the following hardware:

* HDMI Video output
* USB
* SATA (untested due to lack of hardware I could attach)
* Ethernet
* MMC storage
* UART
* USB OTG (untested, because I don't own an USB OTG cable/device)

Signed-off-by: Julian Ribbeck <julian.ribbeck@gmx.de>
=2D--
 arch/arm/boot/dts/allwinner/Makefile          |   1 +
 .../sun7i-a20-itead-iteaduino-plus.dts        | 104 ++++++++++++++++++
 2 files changed, 105 insertions(+)
 create mode 100644 arch/arm/boot/dts/allwinner/sun7i-a20-itead-iteaduino-=
plus.dts

diff --git a/arch/arm/boot/dts/allwinner/Makefile b/arch/arm/boot/dts/allw=
inner/Makefile
index eebb5a0c873a..39af5ad94590 100644
=2D-- a/arch/arm/boot/dts/allwinner/Makefile
+++ b/arch/arm/boot/dts/allwinner/Makefile
@@ -124,6 +124,7 @@ dtb-$(CONFIG_MACH_SUN7I) +=3D \
 	sun7i-a20-haoyu-marsboard.dtb \
 	sun7i-a20-hummingbird.dtb \
 	sun7i-a20-itead-ibox.dtb \
+	sun7i-a20-itead-iteaduino-plus.dts \
 	sun7i-a20-i12-tvbox.dtb \
 	sun7i-a20-icnova-a20-adb4006.dtb \
 	sun7i-a20-icnova-swac.dtb \
diff --git a/arch/arm/boot/dts/allwinner/sun7i-a20-itead-iteaduino-plus.dt=
s b/arch/arm/boot/dts/allwinner/sun7i-a20-itead-iteaduino-plus.dts
new file mode 100644
index 000000000000..c9f9b0275381
=2D-- /dev/null
+++ b/arch/arm/boot/dts/allwinner/sun7i-a20-itead-iteaduino-plus.dts
@@ -0,0 +1,104 @@
+// SPDX-License-Identifier: (GPL-2.0+ or MIT)
+
+/dts-v1/;
+#include "sun7i-a20.dtsi"
+#include "sunxi-itead-core-common.dtsi"
+
+/ {
+	model =3D "Itead Iteaduino Plus A20";
+	compatible =3D "itead,iteaduino-plus-a20", "allwinner,sun7i-a20";
+
+	hdmi-connector {
+		compatible =3D "hdmi-connector";
+		type =3D "a";
+
+		port {
+			hdmi_con_in: endpoint {
+				remote-endpoint =3D <&hdmi_out_con>;
+			};
+		};
+	};
+};
+
+&ac_power_supply {
+	status =3D "okay";
+};
+
+&ahci {
+	target-supply =3D <&reg_ahci_5v>;
+	status =3D "okay";
+};
+
+&axp209 {
+	interrupt-parent =3D <&nmi_intc>;
+	interrupts =3D <0 IRQ_TYPE_LEVEL_LOW>;
+};
+
+&battery_power_supply {
+	status =3D "okay";
+};
+
+&codec {
+	stauts =3D "okay";
+};
+
+&de {
+	status =3D "okay";
+};
+
+&emac {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&emac_pa_pins>;
+	phy-handle =3D <&phy1>;
+	status =3D "okay";
+};
+
+&emac_sram {
+	status =3D "okay";
+};
+
+&hdmi {
+	status =3D "okay";
+};
+
+&hdmi_out {
+	hdmi_out_con: endpoint {
+		remote-endpoint =3D <&hdmi_con_in>;
+	};
+};
+
+&mdio {
+	status =3D "okay";
+
+	phy1: ethernet-phy@1 {
+		reg =3D <1>;
+	};
+};
+
+&mmc0 {
+	vmmc-supply =3D <&reg_vcc3v3>;
+	bus-width =3D <4>;
+	cd-gpios =3D <&pio 7 1 GPIO_ACTIVE_LOW>; /* PH1 */
+	status =3D "okay";
+};
+
+&otg_sram {
+	status =3D "okay";
+};
+
+&reg_ahci_5v {
+	status =3D "okay";
+};
+
+&reg_usb0_vbus {
+	status =3D "okay";
+};
+
+&usb_otg {
+	status =3D "okay";
+	dr_mode =3D "host";
+};
+
+&usbphy {
+	usb0_vbus-supply =3D <&reg_usb0_vbus>;
+};
=2D-
2.42.0


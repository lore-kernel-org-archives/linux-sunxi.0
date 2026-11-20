Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795156209;
	b=uh6MIS58h2SaGNL4jkGZT9Xexm2weFIsb1KQ+H4LgWTeHKH7o1hb1lnXYi0cI1i0RLS0
	 LJX0VOjKO1vK5yeIK5cMHVeuvvjORUgb45Pf6rMLCfoKArc1+jTC3nzIZ2/Fu3etNBXBd
	 NM1AZ8UDeNirHAus4ZsY7WcFXM9zt43lbf29mUW3bOnokDaGc3Jv3afCVj2+yt6bd2/YT
	 YGU9UCQy489is8EWlX78mnr7Ek3iEnL3NweKIC5ovNQVjEJ5wQ9O3n4jK51GYDlb2vn7h
	 g+hVevFuETPF83YQGXAnTkKAmljAa9UutH1+wcYHifIg+iy442DGwB/a5oeCGfJjPOg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795156209;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=wCDtoYs9Drt1wHmB8iFY9FDelCzj7GP2TQZhEY2AxnQ=;
	b=35VLQlaIwBauOUxoeMPK/sN7JXwGso3g/DTKwj1vD7AGYAAyG7Tmuc0i6nVBR0MKPqt9
	 BHsN/pD7iU1a5sh4rwONyqX1zFmbFeNjAKSO9atnKUAiFyIRz/8JGhg/++Pwu6ehRL3iN
	 g7CKyxmbszJQVSQCmVsoe7P9G+QmWPT5wI6BJYTFDN+vblBXb9mpNRZSEBw0TZi2TQ2hs
	 53SArhzHNWYa8CkzG8Efm0m5ORMiIxXZDmUZI6k4j6SNJusTIu7DvNri4QGb2N4vXs3PD
	 byzpYnyUiaPr6QuY0BMHGFostF+rDRpqHodIyR8aHYOJ4INlxmJHUtZECnm2D3zf8Cw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DfBeh1dD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39BD5606A334;
	Fri, 20 Nov 2026 06:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DfBeh1dD
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795156209;
	b=eta30DzRYkYOb6Ug//Sw4Rehg6HEWGmT+I+7VGBp+dEQTVqpFo3rH9H4sp4eo5DD+6P/
	 G+nqz4sxoQ4+Hzc1YGKQYKZNTCJRx30nGOjla9mn/dbPomj8u5au6iHKxP1giOx4H/Nay
	 ChysZCBrKQxxVnVrJaagC9Kwhkve/O07jyNCTiQaQ7+8FkIGj7tWroObmrtmkvHe8ZJPK
	 P11ZJveG1656a3hKP+rLgDKL0TpUlW2gVqBreZqc/I+iHVJWIQGX1xDD/NlTuGlLyV7xg
	 ToZ4WhG5U8szdpwfLyOU85/T87lmF87nt0YTm096ArsmFdMvBJfwq9DdybL6ue46CRw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795156209;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=wCDtoYs9Drt1wHmB8iFY9FDelCzj7GP2TQZhEY2AxnQ=;
	b=JyVpejQXCsePLX3rxBkTbOlvtRFVf0S8XPDVeaFWJ+/Gl1MnrMyWoyOkmO0zeSoJk0WT
	 c4OXpVDuJdUY4MU98nQgOi+OhzFtEi/hnccMGdwsQ1ycSn/hgg8DvDkGN6umsF5Jghlx9
	 dMOCclQ/wVvYx1bSRMoVqwRslqmBag2fXAwZkTrddvCsT0Ocg6mZOrNyV6ymlR2603IwK
	 UKCbe3NOhgMSpIUPob3x6K82bseTv8C7oVmgXOLzua6CjcrJ+84J0PZZa9wcwjclabh+g
	 8PbKAYb5tMXfA1iuFhIM7kn79ep18QHLMBM9zhcFG2F2S5ZcyQC3epTod8mTkwyR1Ow==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4C62E1F000CA;
	Fri, 20 Nov 2026 06:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795156209;
	bh=wCDtoYs9Drt1wHmB8iFY9FDelCzj7GP2TQZhEY2AxnQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=DfBeh1dDHixTbqj8wfJ9XSuGa7/JzIl7mR7jgC8sHaFdiI7lSkmfC1zVcSxnhYY5E
	 Dv1uxt80qUkOcSWT93pzs2dn/hH2eyW0Tkl2R0bFf5Y+hOe0vlWSAKa/xhPIU5jZRF
	 0AJ7kXpzI6lSP63LsnJBqxqtlIN27IU4/NXp8i4HRW3hOWMDof+3eJ1tPWZayK5ZWh
	 F7+AH0TT865bB2HukaQdTS9SPovddpZFqAmVNV522N8EcPmmUVPa4cNzRIzyZxzlqD
	 z1IEbOt54d3IF2Hdza3zvfxBkJ6SKvCC4tb8Xl40tOh0tKkxOguWD2C238HJGbY9Sr
	 UGRpbXUsIj2HA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id CD66B496FB;
	Fri, 20 Nov 2026 06:30:07 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Fri, 20 Nov 2026 06:30:08 +0000
Subject: [PATCH v3 1/2] arm64: dts: allwinner: orangepi-zero2/zero3: Set
 the SPI NOR supply by label
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261120-zero2-spi-nor-dual-read-v3-1-1cbb0caaed91@gmail.com>
References: <20261120-zero2-spi-nor-dual-read-v3-0-1cbb0caaed91@gmail.com>
In-Reply-To: <20261120-zero2-spi-nor-dual-read-v3-0-1cbb0caaed91@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: Andre Przywara <andre.przywara@arm.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795156207; l=2431;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=/FJTmo3i66dNfZqxF9WLXYNpaf/9aeDUvFfosXiYN8E=;
 b=J2WHGsYmMyWqVDJrcMintnsJAsO4BksZ2s9MpOWF9K21/LCEC39FZpeuciqWRSzVDqDChg5g2
 klC0o2urSPiCsu/1U7ESosS/zs+q9h2p0fQYIjN4PpdZ/UC7zDOJ9J1
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

Label the flash node in the shared dtsi, so each board sets its supply
through the label. The Zero2 keeps reg_aldo1. On the Zero3 the flash VDD
is on the 3.3V rail from the AXP313A DLDO1 pin (schematic v1.2), so it
gets reg_dldo1.

Suggested-by: Andre Przywara <andre.przywara@arm.com>
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
Andre: reg_dldo1 instead of reg_aldo1 on the Zero3. Schematic v1.2
sheet 4 labels the 3.3V net "ALDO1", but it comes from AXP313A pin 12
(DLDO1, VCC33-DLDO); pin 15 (ALDO1) is the 1.8V VCC18-ALDO. The flash
VDD (U61 pin 8, net DCDCE) is on that 3.3V net. Not tested, no Zero3
here.
---
 arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi | 2 +-
 arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts | 6 ++----
 arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dts | 4 ++++
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi
index 0d3e761f6466..cd1f67ad7c2b 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi
@@ -104,7 +104,7 @@ &spi0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&spi0_pins>, <&spi0_cs0_pin>;
 
-	flash@0 {
+	spi_flash: flash@0 {
 		#address-cells = <1>;
 		#size-cells = <1>;
 		compatible = "jedec,spi-nor";
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
index 90c25e12e189..2f8a16d1c9aa 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
@@ -148,8 +148,6 @@ &pio {
 	vcc-pi-supply = <&reg_aldo1>;
 };
 
-&spi0 {
-	flash@0 {
-		vcc-supply = <&reg_aldo1>;
-	};
+&spi_flash {
+	vcc-supply = <&reg_aldo1>;
 };
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dts b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dts
index c51d4d9120de..afa753dead30 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dts
@@ -103,3 +103,7 @@ &pio {
 	vcc-ph-supply = <&reg_dldo1>;
 	vcc-pi-supply = <&reg_dldo1>;
 };
+
+&spi_flash {
+	vcc-supply = <&reg_dldo1>;
+};

-- 
2.55.0



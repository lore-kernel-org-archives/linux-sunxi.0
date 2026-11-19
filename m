Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795066175;
	b=AvRggd97dYwxdUEyU/ZsKxA+8mY4xTnugd0dhp2RZ5G8+YZg58j1o8PGRLq+dQd/Ac2X
	 FYRb1dzFAA7ARlsgM5SBgykF+B3cHubc9sxK9VcVrIzEWsNezygeXoUozg6EgkIFVdd5c
	 Rq3dptey2M7GpFF2uYlDY7uFYPlNPIMkQ0J/0rA7oqqtHdMP3Q0F6YR0GWxiYXMNksCN1
	 zFj12sX7vKHrQRhtejO7eXkX57Q1JwHtb2iANudh0KpN7wJVcGX+dVRfH0nbbl8Nc5Lpi
	 fDWEXtL5aRtr0LSzQRd/9njCcKcm3Du9QaMhb07GkGOWUlNE5M+j5IaWEsJLTYvDZ/A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795066175;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Qk/WiXag4NiAb7SQYrAI82ZXlfWM6gKQ6LP6PETB5Lk=;
	b=m8vkn8wP0Awj8eHS+JeEf6ct2DOGReL93cEIKPrpvRriu4sXMdikCy/bJW0gwFBJfNVn
	 g0MSnufQ1jdKz8n3jD91JNTQFlo9i7RSCCGc6RTnRgfe2MaotK9XBkjyZ7XY85G7i60Cr
	 BzEXzaO2ym+RLTYZBq5rNQ4K7EYo+8iMuap8uiWSq2kznV7i2rsZwijS4JZXFq5R12Yk8
	 6AU2OjlLNpSS0KGVNPMmMdPe95CkRovQ4Z5EQJg8RLGHtIYe4Ru15YYYbOZOCWFdagaQK
	 CodHMeViiCIFAI7sgjb7vtZeB6j1aAuMYcQobU+3WWC7/4eM/KaPrW2haaKnCnTJROQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SyUZjsdb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB09F606A320;
	Thu, 19 Nov 2026 05:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SyUZjsdb
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795066175;
	b=yQ7iTRmO0bobqpKv7wXoE0A5qItoDRjac4VP5Hac3SGhWcQ6FfbAGdZHBnDjrqjZp+DN
	 zVvZcphxJr2qwljU3OTyFlKB9TRYvdp3aGb6oJyae7tGqPtZVNDo9z0dErLx7JjaUiDvq
	 TdsryFucoQ0sfiJh5QEOPI4DFT6Ni3liizM+ufYTDR3lmN5FJ7CzlZ32le6xAG6BB8m7W
	 Noh1lRCep1/dj9DDtS38dHlUOdTJUySHkHVohaKel+O7P9VbGRzceM2RHYUrELMSZAcgJ
	 SAAcsAJ5bJ5d69dACSHY94HxEBnLW/kjHSxwequTAmuFEkHNkhTDcfVLZ6X2SHCAh3g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795066175;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Qk/WiXag4NiAb7SQYrAI82ZXlfWM6gKQ6LP6PETB5Lk=;
	b=iHR5DEWv8v7AubdMJHk5RSgjVr3Sc0OwpDwR3sNmpMR14b0o6WlEOe/mVF2joHXuFQVD
	 u74z7N0CdIjLTbRWOKyEbMjtzXBkBWXMARBK7tBD7/zHqQbh4DT2ZPDCHo1DbTZv+kkPh
	 oj86OpQ9jE3/hB2cFnkSqhEL2LH0XhgA3wLCXDYxibWr/YiCczUIHcnitRV6ofkC5dsQY
	 AygoykOZrSCtcawJ4BFJb6TLEq0z+z/dKs7b8bN1z5fBZQPOa/pLKeIw0HiahT1YNcAGy
	 +j16ZHiDLIvtExXOe6dKWcHNg6edBDyI3UtyTANY7PuKy2L9DVZiCY9eCBIb1dPVMcg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B4AA91F000C5;
	Thu, 19 Nov 2026 05:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795066175;
	bh=Qk/WiXag4NiAb7SQYrAI82ZXlfWM6gKQ6LP6PETB5Lk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=SyUZjsdb08WIX5rkL/R6HiQQrJUgGpE3jZOrXoocxl+FHDQDemEzFCss122T7L8y+
	 gWOS2juA2dl+BSOaTSdROXmqB8gRS8N1Qru3JKYW2sAwAfDgsU94sYI0yaRC4jyR9J
	 +I7TCD2Zt5nEE1thlPByKlIj2EsAp2SxRLz7cJvRSbmO5mPjqciBYgNQyUsBizLPMw
	 TxQ4usbba2ix5DWmLLCrSfl5gdoXKVb3RBJkf1KiBORshYTXdidMPjtFe4v3i4N71h
	 a951WOFp6A+TXOn1+2f+KUeFZVU17StxKEmWpV+D254Bvwn5AqsOKWv8BYOG0/ULhN
	 16EPknnO5OdCQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 2EBCA4B111;
	Thu, 19 Nov 2026 05:29:34 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Thu, 19 Nov 2026 05:29:34 +0000
Subject: [PATCH v2 1/2] arm64: dts: allwinner: orangepi-zero2: Reference
 the SPI NOR by label
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
Message-Id: <20261119-zero2-spi-nor-dual-read-v2-1-185c87065e39@gmail.com>
References: <20261119-zero2-spi-nor-dual-read-v2-0-185c87065e39@gmail.com>
In-Reply-To: <20261119-zero2-spi-nor-dual-read-v2-0-185c87065e39@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: Andre Przywara <andre.przywara@arm.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795066173; l=1653;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=Q67hG4LUmhhGEHNYhzy/cl5VtGg3Fnoo9rBc5WdZgVg=;
 b=QrPHNczIJ3tpZjilTnMJlGmRdNz9hN+huIkd/Hg9qAHyJ105T47Sa1JjlqhqPvMgKnRUyLyt6
 51zPNn9l0f/AfQ8TFGJtpZfn/1vOovDcSIOaWnKJZ59LbZGkNAXKcf0
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

Andre Przywara suggested labelling the flash node, so the Zero2 sets its
supply through the label instead of nesting flash@0 in &spi0.

Suggested-by: Andre Przywara <andre.przywara@arm.com>
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi |  2 +-
 arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts | 10 ++++------
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi
index 0d3e761f6466..646d92e0f724 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi
@@ -104,7 +104,7 @@ &spi0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&spi0_pins>, <&spi0_cs0_pin>;
 
-	flash@0 {
+	flash: flash@0 {
 		#address-cells = <1>;
 		#size-cells = <1>;
 		compatible = "jedec,spi-nor";
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
index 90c25e12e189..59bbb09bcdbf 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
@@ -24,6 +24,10 @@ &emac0 {
 	phy-supply = <&reg_dcdce>;
 };
 
+&flash {
+	vcc-supply = <&reg_aldo1>;
+};
+
 &gpu {
 	mali-supply = <&reg_dcdcc>;
 };
@@ -147,9 +151,3 @@ &pio {
 	vcc-ph-supply = <&reg_aldo1>;
 	vcc-pi-supply = <&reg_aldo1>;
 };
-
-&spi0 {
-	flash@0 {
-		vcc-supply = <&reg_aldo1>;
-	};
-};

-- 
2.55.0



Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795174857;
	b=cgzE4a7gRZqIFxoxt1kTo/GVHF7u9B1HEADwXa/wjwPqhiZAnBpYXWcUE2Fw+RyzIO4/
	 bfTsxyFG81TZEr7rT8fKl+zrHAkLgRe4BFrrsIYpK98JJEifmCcZGxXUxYJthGkAS4aUt
	 6Ym3/HRN4giSB0qgClaZ2Lsf8EFY9Nm0Gj4qESMR8u78nY6b0PlFply/TYtRbsacupklG
	 lWUPupOHlFZsghNrI4VM+wOue1QuQT6oG7+sBaA+zZND8+0fO1Agx9ox5nSQOCcbOQpmE
	 xSIadhLUvt8N6PegkSYz9kfz0y44xd/YkAuiWFObvxG80xYAYUJ6lzekyyRzxRjKdQw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795174857;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=NkWuAoktz2jsTqcUkYdJz0Wvs9+5SwEtBq+3WiZduJ4=;
	b=S4MJhH4nhwZnv+1CwU+Fo3cPAhozMy/C58RTkCqC8fx4YrgwL5vxcFINDXzZ5EiR/aDP
	 TXcGvwHE5CnFgR1oBGPcA0tM1lHXtCq/wAbXQtag/HTxMchraCnnPqXYrrbq8TbrxSbjW
	 HWj4XIJ55KKZhqYreeKMkpn7rUQMKVZ+Wn5vRB4nDhIQ9ycJnOf+aoRDL1CgzVlWWiTXK
	 hpB4Qvucs5C/vnehaCXIJMO08cKTbtwye++4nwqxW4plcacYxTWVGTygiC31d+pVbi4n1
	 45YjenSs0VAXCkAirYe9lsVGCF5Bd+EnF0z9aW8m9Qo9MM8axpjRiiZMs2Zj715R+Kg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PbenfX9G;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C687606A325;
	Fri, 20 Nov 2026 11:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PbenfX9G
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795174856;
	b=jYqdgRzMX9QqPLIdRRJY1k9EC8ysvfZ00noaym9gb9NZXG8zvl5BjvX+BbCAR7uq+Qoc
	 A+CUrRv8jYfUcAFNACn/7luQMLndfXjgXejw1nibm8dKxoYR1MCF7uBwba++8Hkn0Di9v
	 IUZu7GAhz1iaxQB8escDE3LzGk34isy9ve9B3chpvi39DKAjVunXBkwFkx4lxG3e1nFec
	 WTsr1kQ0g0qq5nCYysZ2d5wgTp/61Sg2+6Z7NnU2FyAl1tiker0PW4hf5kuqdeZ3RYA7w
	 Fh1tY0NlJaqDvjpfXcBk4VPYXIRBgpAxuegJ4EYkqw2WDvnNQ2DfutetAjRp5WCuX1g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795174856;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=NkWuAoktz2jsTqcUkYdJz0Wvs9+5SwEtBq+3WiZduJ4=;
	b=Gll36bTveYl1MluAo/92V5ABAjf8tDsp2qq3EWVtz6JM9cB+1Ur16Fj2wuEjAspqDLqp
	 TUe3UiQIx40FJhu7AmOO4MLXutk5FkUCD7UTbMqUd4J6EMLjtWV+82KZid1jvw3ni5O4q
	 WXTJ/ZIibs9wW/6YuHEGOgMgU41t3OLgTjD/MsOvDKGYszrxnBZ79rhQOy9jl6a1YkVjL
	 FlzvufIX6/+nEALfZwHmirwb6GGRqODNVB1wr0XDzbgF8xxe+4XrfGA1/SlRSo/+im2Kw
	 8LMuRvYrqdU02hmlMqDg37jGGXV5oS/l367G0Fo6xVvJ6IZPLOgZUdiK/yeBrMetelA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1D0C01F000D3;
	Fri, 20 Nov 2026 11:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795174856;
	bh=NkWuAoktz2jsTqcUkYdJz0Wvs9+5SwEtBq+3WiZduJ4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=PbenfX9GLeOTyFDhCVDKorRlqAYPx+nFW873xbSzeq/jCeDm3HUaL/UI0ObSS2aDh
	 bhDpnkGTFXBI5Y3NFlkUxqtRHRAGg0vCNgaU4AsN6qTgwr+RCJRXDrGUmi1ciJ/H6H
	 sJXiY4KBtnWY6rSQdGIqmCnsArLxJI4mIRWf4F5TDPyPkFejhSWXNVGjj7ys07td02
	 /DktCh1Js1sQCxzP93WhXvRaPXqOMdtBIX1pn6X35bfjBnpep40OeGu73jJYVNG+At
	 Tsu+GzSPYa4zXb8e8tBxKznec01VksNTigHsk9K4OFF2tv0Cj9bfd0xcDT6zZl/9p9
	 1/XDOC4Y/NKMA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A7F474986B;
	Fri, 20 Nov 2026 11:40:46 +0000 (UTC)
From: Ivan Pfarher via B4 Relay <devnull+ipfarher.gmail.com@kernel.org>
Date: Fri, 20 Nov 2026 12:40:46 +0100
Subject: [PATCH 2/4] arm64: dts: allwinner: h5: orangepi-zero-plus2: Add
 AP6212 Bluetooth
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
Message-Id: <20261120-orangepi-zero-plus2-fixes-v1-2-ecd792189f27@gmail.com>
References: <20261120-orangepi-zero-plus2-fixes-v1-0-ecd792189f27@gmail.com>
In-Reply-To: <20261120-orangepi-zero-plus2-fixes-v1-0-ecd792189f27@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, Ivan Pfarher <ipfarher@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795174845; l=2073;
 i=ipfarher@gmail.com; s=20261120; h=from:subject:message-id;
 bh=N+gCZKSFdjvJNosqW8VyXfcloLRjV1OkNZSQDadOkiI=;
 b=tPfPEbATNv3mq+JDkKPCdtxG1k6VqvAhezObKAw6Yhbn9XisANtaKSEEGKFjIVb+0f4xtEo0b
 W/VY2mu9j1PDB5pZlH6mVg2X4CnPeiiXqlDLPeTr2H3lhmcb/StPSvF
X-Developer-Key: i=ipfarher@gmail.com; a=ed25519;
 pk=3DMYyz/xl+KRAx2TNGJpheG+5QUm7lqHhKXFqVu2TmY=
X-Endpoint-Received: by B4 Relay for ipfarher@gmail.com/20261120 with
 auth_id=1582
X-Original-From: Ivan Pfarher <ipfarher@gmail.com>
Reply-To: ipfarher@gmail.com
Content-Transfer-Encoding: 7bit

From: Ivan Pfarher <ipfarher@gmail.com>

UART1 is connected to the Bluetooth part of the AP6212 module, but the
controller itself is not described, so nothing powers it up and the
kernel never registers it.

Add it as a serdev child of UART1. BT_REG_ON is connected to PA10:
on the board, driving PA10 low makes the controller drop CTS and stop
answering, driving it high brings it back. It uses the same RTC LPO
clock as the WiFi part. The wake-up lines are not described because
they could not be identified.

Tested on an Orange Pi Zero Plus2 (H5) running Linux 6.6.160 with this
change applied: hci_bcm powers the controller, loads
brcm/BCM43430A1.hcd, switches the UART to 1.5 Mbaud and the adapter
works with BlueZ (scan finds nearby devices):

  Bluetooth: hci0: BCM43430A1 'brcm/BCM43430A1.hcd' Patch
  Bluetooth: hci0: BCM43438A1 26MHz AP6212A1_CL1 BT4.0 OTP-BD-0034

Build-tested only against current mainline.

This problem was investigated, and the patch drafted, in an interactive
session with an AI coding assistant (Claude by Anthropic). The submitter
reviewed the change and ran the tests described above.

Signed-off-by: Ivan Pfarher <ipfarher@gmail.com>
---
 .../boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts      | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
index 34d6c1468..5697251b9 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
@@ -128,7 +128,18 @@
 &uart1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart1_pins>, <&uart1_rts_cts_pins>;
+	uart-has-rtscts;
 	status = "okay";
+
+	bluetooth {
+		compatible = "brcm,bcm43438-bt";
+		max-speed = <1500000>;
+		clocks = <&rtc CLK_OSC32K_FANOUT>;
+		clock-names = "lpo";
+		vbat-supply = <&reg_vcc3v3>;
+		vddio-supply = <&reg_vcc3v3>;
+		shutdown-gpios = <&pio 0 10 GPIO_ACTIVE_HIGH>; /* PA10 */
+	};
 };
 
 &usb_otg {

-- 
2.43.0



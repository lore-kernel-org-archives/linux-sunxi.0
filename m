Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795174858;
	b=PLKhOfwb2hKyh4Tq65uYRSfLnnxAlr8b0ynrRdgQS5huwaxtdsiWZKdIdG+OGzchQRYB
	 IwudBPC1U4eueTmOQSp4Zs3ro5p7A5IQRplCFu9wCMXQikWxZwJermlhok0cvlaHTcIMo
	 0DKA0hJiv68eKI/m0M+8b+MDalE6hXkD6Xj4CyN2FRsXDlFk2BkK30zO6UYazBIfzoeoV
	 NaqQJOABPyFGUY3i0cnjlXxtzpXiP+0bRFX4JL+geD9itIkNCdZyU1oi70pI9L6ZvQ6PJ
	 ihO9QaYUaE3nWNpCL1KX4BS3aTOQipdYvy8sTTFdDNfmwRz5U2Xto+3D4y2WKJ4Nfrw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795174858;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=5sTfjmvRmInRg9bzSas7Pj5tLY1aYw/Q3j6D0qSG5DA=;
	b=11xVhuoRyjRk3yVsPqVprpujO68vxmOjfY8XCwHCeRtdvc/iyv0o34v68REkwK0SctiJ
	 1Rcz9zXyCCfwk5xfB18k32PxdXP/rnqexnf3McHoTGpnCBHPDmoMrSyeDfVTu3s+6zf8p
	 nE4vi+XULMFfTRS1oQXC3jc2KYVjIZwVpP2DSfIgU0pAmKhCRFuCChD8i/vhiq5xWR9E5
	 YY38Jes8F/HNrCrO+9iydjrJFBGRekI9TfcdWEaRfoe8v7gBmpa+x6Z2LD9L+D5ClWQkl
	 uGwfdJ0pH/SZwQQtA2M1LfycupT+MCf5+KRhOyxH1flmoXNH25irB1fa3vfket87J2Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R24ohYu5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AED6606A32C;
	Fri, 20 Nov 2026 11:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R24ohYu5
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795174857;
	b=fUGt+OKQRNKz/1th9wppEZt1u8YXemp90wMSR9TauROKSI9EWd19ntEayufc3xRf0wkY
	 niFaACZZlBSUUSrUYdNqf3F3odmywYpf0pobgsF6PotoQjRfT75orYLfWeiY1MHb0XpzX
	 2Cr3Wx69TveAvWzUDkZl0G72T7i/M9k6tnrvGgZZQfkFnvvDjmS8W4b+zuqHjLbAUX8al
	 9eBAvoWOcn1TnD/XAi2FRn+IgJV0psCwaPEqijmNF9tnotAXv8aVUd0z4pCfucTMO2V6/
	 9t524WrG3VJPGMmLoctGyhrtEZ/hBW+CBwF+VCyP5APO+5PKX7PLALxvlsDPpW07f1A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795174857;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=5sTfjmvRmInRg9bzSas7Pj5tLY1aYw/Q3j6D0qSG5DA=;
	b=o41U0kZrcYis4PmfFam5gh0uK1m+Of+zV8EMIQhpL3DVVKPYuDLMXCb2mrPeWotGtg3j
	 RrMKELRUMSj3IevzY9tDjUgy5BrYJdb3s9UlkCkgvUkC/7mfS0bhN7HZWQO3kic0A+VxS
	 Q8wB8iCgBigBH3JKu1IJjVOHxtNK6g7cR4a8U0Juh8uQY3j+gaZ6o3/xf9Wd99ISNY/Gy
	 7k1x4pczKWcKQ2VMiaS65kITtjdZTdSmGq79yCexqBFGk+W5p2SacfkxwHGJ2nh8TphxM
	 PAL9l96Bi3OKJHSv2bqniBekwBgzKdPhaLXkdXkM0CsopcjmZuCVUOjVvlxoKcbv3tw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 352CB1F000D8;
	Fri, 20 Nov 2026 11:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795174857;
	bh=5sTfjmvRmInRg9bzSas7Pj5tLY1aYw/Q3j6D0qSG5DA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=R24ohYu5kb/29/Mjxeu6qbnW+AxltB3RBuDFqYc9cz9O+2PUIVz+CW8SfGWTA7I7p
	 3Wvp0HRdKK2OnxhUZBSS6yM8MPtMHQByDGg8vqUsjuOGdkqR/h19QTHdNoilLCCckA
	 xMGl9f94+TSatX/2i/T9/i+zzOoULO0PIt+N9DUF5750Ga18xe6l6/cuOvGUz6vE30
	 VKdt/DWsqNxI3g4V5LX6wujxEW0uR7EOLyPd9ZVACsJtbd/U718LYKEgB8CCDVdGqn
	 /0VoLij2eP/LfcNMdBywNI9flmQELRS1sBD9/sAH8JHc7598UXhxIpEBvtuvwS8XnV
	 Ni3sY3SyswH9Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C039E4986F;
	Fri, 20 Nov 2026 11:40:46 +0000 (UTC)
From: Ivan Pfarher via B4 Relay <devnull+ipfarher.gmail.com@kernel.org>
Date: Fri, 20 Nov 2026 12:40:47 +0100
Subject: [PATCH 3/4] arm64: dts: allwinner: h5: orangepi-zero-plus2: Fix
 USB peripheral mode
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
Message-Id: <20261120-orangepi-zero-plus2-fixes-v1-3-ecd792189f27@gmail.com>
References: <20261120-orangepi-zero-plus2-fixes-v1-0-ecd792189f27@gmail.com>
In-Reply-To: <20261120-orangepi-zero-plus2-fixes-v1-0-ecd792189f27@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, Ivan Pfarher <ipfarher@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795174845; l=2079;
 i=ipfarher@gmail.com; s=20261120; h=from:subject:message-id;
 bh=xNp8GjP59av7t0jD0DKAR+qLGNBv0iVBKlMlHOJX/bQ=;
 b=LYdIeAg0Z6D9hFAlocH2PSZCyaBHHy6WLerO7QNpZyL8gPTX5MGhRlVA/p/PhMwtgBawPihCa
 rdmDDcSs/jAA4Ylcsg0pIyPD2nV8r7aCpwj4HNwPn8qfRJX8icDs9kq
X-Developer-Key: i=ipfarher@gmail.com; a=ed25519;
 pk=3DMYyz/xl+KRAx2TNGJpheG+5QUm7lqHhKXFqVu2TmY=
X-Endpoint-Received: by B4 Relay for ipfarher@gmail.com/20261120 with
 auth_id=1582
X-Original-From: Ivan Pfarher <ipfarher@gmail.com>
Reply-To: ipfarher@gmail.com
Content-Transfer-Encoding: 7bit

From: Ivan Pfarher <ipfarher@gmail.com>

The micro USB port is set to dr_mode = "peripheral" because it cannot
supply VBUS, but EHCI0/OHCI0, which share USB PHY 0 with the MUSB
controller, are enabled too.

When they register, usb_add_hcd() asks the shared PHY for host mode
(since commit e671765e521c ("usb: core: Try generic PHY_MODE_USB_HOST
if usb_phy_roothub_set_mode fails")), and phy-sun4i-usb switches PHY 0
to host ("Changing dr_mode to 1"). MUSB then stays in a_wait_vrise, the
UDC stays "not attached", and a gadget never shows up on the host.

The port cannot work as a host on this board anyway, so drop EHCI0 and
OHCI0.

Tested on an Orange Pi Zero Plus2 (H5) running Linux 6.6.160 with this
change applied: g_cdc enumerates on the PC (CDC ECM + ACM), the UDC
state is "configured" and MUSB is in b_peripheral. Build-tested only
against current mainline.

The H3 version of the board (sun8i-h3-orangepi-zero-plus2.dts) has the
same setup from the same commit but is not changed here, as it could
not be tested.

This problem was investigated, and the patch drafted, in an interactive
session with an AI coding assistant (Claude by Anthropic). The submitter
reviewed the change and ran the tests described above.

Fixes: 43aad09c7928 ("ARM: dts: orange-pi-zero-plus2: enable USB OTG port")
Signed-off-by: Ivan Pfarher <ipfarher@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
index 5697251b9..892723b46 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
@@ -66,10 +66,6 @@
 	status = "okay";
 };
 
-&ehci0 {
-	status = "okay";
-};
-
 &hdmi {
 	status = "okay";
 };
@@ -115,10 +111,6 @@
 	status = "okay";
 };
 
-&ohci0 {
-	status = "okay";
-};
-
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_pa_pins>;

-- 
2.43.0



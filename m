Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795174859;
	b=xH/1ZoZ7QEdaItsrnmQc/XiG9i2HJxFNT1/QLaA0XZgovsKQb9I0dulXrMjk2Da2nen9
	 FyuYrCLDTuaZiYCkBzsTp1IoCeYNAmjiToSNyfCGf4N4X0FZtw0hPF+yLeQBe5VgiECpX
	 uqIwr+8CCZ84NagMtq37aqBliGCwVn9pCznTccu1XY6OPP23GKs8j4Qy7Ugb9h2yC/epF
	 JZCHvJxt2L0gPx+/lC8uxGoqTupqgM/uCpCkSCVKgTejhy6C7NhiGxK+3g+zwfyIXjF67
	 Zl3s4Q43KqRehPQ4efz12CwuOD19YXfuK5FhLwA+TxAERvLPUMjKQpKpM2FqEYRvc2A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795174859;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=3hjpsQQN2Wrc7/hxg/+pcCIIGQ1HkqwD7EgDr+mzxCE=;
	b=UZX1+EoxX3WgZ4obrCejKBjkrWkObc+1XD3xOKlwuRokFrhWj+DYpp7c/ngyZx2FS7BG
	 2GpUOetBrWN/ofklI5ttV40VhSvnEBA46FXENNd2LVvcS1gk9NPsbiD6+u8BP/Yx6f/mE
	 rRFhLA1q4F+zUW6j44H0Ha9za1JEIVfVBKAhXYUqVyjiHJ9Wz2pvr2RqlBHaFdaFxD91E
	 DZugoDIGIUNGaIjWV7/qWIaZwqwduPV2yPI0EcySptkJsUHIYPBVX3Y2Q2+UpwRcckKYl
	 k1Nmyn/XoKTCI8yU9VevCe2Evrm0lrMFCA06aR2LH8RVPFX2MYi+hAavSS8v0gwHjSA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jwMQkOIk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537B4606A326;
	Fri, 20 Nov 2026 11:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jwMQkOIk
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795174858;
	b=WorYiQJ87REYkL14Fl3qt17KynX1nER1KZ8ji2T5PD+O7++DNPDsV63AAy/9j+LO++Vj
	 bju82Nbr6ijW4MPJO8BINLRT1/EJ52h3hcW7i/USqyAo/nvySRRAlzXJ+VLa6grfy/0qa
	 ImUoPbKKQfpF+8p1SEHBOb0wTfZRI3LKG46pZEpJ2tiYDRVzlCa/VQmJQJDVDDN9tBWeh
	 y713VdxUkDIZW63LSRDf5go5m5qUSJBDxUswj9ZJ8tC0bjw3I4x+xSqm48091Ta++Ycuv
	 OOIwiVfBFIPP1o57mTZqY8Z+WvP1RNZUPxSIKjTNLvRAHFk4L032yxEIHA8ArCeAjdA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795174858;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=3hjpsQQN2Wrc7/hxg/+pcCIIGQ1HkqwD7EgDr+mzxCE=;
	b=2KN7P8F9thsHlQJAs4STZ8S6rMrJZGv7W3KV2a8efwMKFZNiXTtfVa1VsRV4fR2exVXj
	 j+rmzG7N40BfSSK4RNaHZWEIecPCquvx0hjAerEkDQ5XVvCe5XwnxiAc44pJ5RpwARskm
	 uXwZzO9DO1ZvN8dFDZD95Lp2I1tYS2r4bLszHBMEy6yW0yI97XAfyrYpAVg8JzphS7knn
	 B4pCS6U9kr0EdewQvXB5uEyzKFmdH4rQfjEKe1fCFV5QP0mytseUUl6xJklQIps350jWM
	 07cwpnFXAis1KiklQtlbj95aWr2LPVU0zzvJcrWgBDhrTP/R5uUl22lAxwsl6YeV8mQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D48201F000C4;
	Fri, 20 Nov 2026 11:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795174858;
	bh=3hjpsQQN2Wrc7/hxg/+pcCIIGQ1HkqwD7EgDr+mzxCE=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=jwMQkOIkmAasuMd363UDUY4F9X7nqos5YKBlH/TYgAfQJmO3MLGh1HdindqM6RR85
	 Pw3BYUy2YXptE51rS45cbBPVJNcXS0+6QoYADe/s+E4xho6t/tezcTvj1Z9/avIx2x
	 VFZp78ciGF2tt3+cXmuIZQhewjgzY5Klj/0SkHctwk4DUtTNBnbNni1/DrbevzH6W7
	 yFoIivAiQheDi++mSWaWUwjOsIliygfUojnK4YR9XVs8LIDrfgJdg4XIamiTOMa89M
	 lUgAWbdgt3ecTmXhrJG/JBtpJZvOCt5XhNAJk2aJMydaWOJdEfDYQkXDRjShQ7LEpm
	 8h+9ZEmaV6lLQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 6AD4349868;
	Fri, 20 Nov 2026 11:40:46 +0000 (UTC)
From: Ivan Pfarher via B4 Relay <devnull+ipfarher.gmail.com@kernel.org>
Subject: [PATCH 0/4] arm64: dts: allwinner: h5: orangepi-zero-plus2: Fix
 Bluetooth and USB gadget
Date: Fri, 20 Nov 2026 12:40:44 +0100
Message-Id: <20261120-orangepi-zero-plus2-fixes-v1-0-ecd792189f27@gmail.com>
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
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALwxAGsC/x2LSQqAMAwAvyI5G2gDCvoV8eASNSC2JCii+Herx
 5lhbjBWYYM6u0H5EJOwJfB5BsPSbTOjjImBHJXek8Ogn42CF2vAuO5GOMnJhhWN7KrB98VUQPq
 j8h/S3rTP8wIiTPS3awAAAA==
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, Ivan Pfarher <ipfarher@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795174845; l=2806;
 i=ipfarher@gmail.com; s=20261120; h=from:subject:message-id;
 bh=8NDP5ZNmJidSCuINYDzvhJHNJXi8K2RXS0VdGYiDgfo=;
 b=fwAfu0dfR2ngc4aIhPPXVyWR5bhlGxXAzqv3mF4h8OXYi1vICRCu30qqI8QT4BDRKtmUWBF/7
 EUWKft9RMhEDuGYa0/VJ1BF2zar9tVd2HX8K/l551LcaHvOq+8GH1eu
X-Developer-Key: i=ipfarher@gmail.com; a=ed25519;
 pk=3DMYyz/xl+KRAx2TNGJpheG+5QUm7lqHhKXFqVu2TmY=
X-Endpoint-Received: by B4 Relay for ipfarher@gmail.com/20261120 with
 auth_id=1582
X-Original-From: Ivan Pfarher <ipfarher@gmail.com>
Reply-To: ipfarher@gmail.com

On the Orange Pi Zero Plus2 (H5), neither the Bluetooth part of the
AP6212 module nor the micro USB port in peripheral mode work with the
current device tree. This series fixes both and adds MMC aliases:

1. The AP6212 needs the RTC 32.768 kHz clock (osc32k-out) as LPO. It
   is not referenced, so it gets disabled as unused, and the BT ROM
   then answers nothing but HCI_Reset.
2. Describe the Bluetooth controller on UART1 (BT_REG_ON on PA10), so
   hci_bcm can power it, load its firmware and use it at 1.5 Mbaud.
3. EHCI0/OHCI0 share USB PHY 0 with the MUSB controller. When they
   register, the USB core switches the PHY to host mode, so the
   peripheral-only micro USB port never enumerates as a gadget. Drop
   them, as the port cannot supply VBUS anyway.
4. Add MMC aliases so the microSD card and the eMMC keep fixed numbers.

About patch 3: the root cause is that phy-sun4i-usb accepts the
host-mode request from the HCD even though the PHY's dr_mode is fixed
to "peripheral". Changing the PHY driver would also cover other
boards, but that is a separate discussion; this series only fixes the
board DT. The H3 version of the board (sun8i-h3-orangepi-zero-plus2.dts)
has the same USB and AP6212 setup and very likely the same problems,
but it is not changed here because I could not test it.

Testing: all four changes were tested on an Orange Pi Zero Plus2 (H5)
running Linux 6.6.160 (Yocto scarthgap, meta-sunxi) with the same DT
changes: Bluetooth comes up with firmware loaded and scans, the g_cdc
gadget enumerates on a PC, and the board boots with the microSD card
as mmcblk0 and the eMMC as mmcblk1. Against current mainline the
series is build-tested only: dtc gives no new warnings and dt-validate
reports nothing for the resulting DTB.

The issues were found and the patches drafted with the help of an AI
coding assistant (Claude by Anthropic), which also ran the diagnostics
on the board (raw HCI commands over the UART, GPIO and clock
experiments, USB PHY state). I reviewed and tested the changes.

Signed-off-by: Ivan Pfarher <ipfarher@gmail.com>

Signed-off-by: Ivan Pfarher <ipfarher@gmail.com>
---
Ivan Pfarher (4):
      arm64: dts: allwinner: h5: orangepi-zero-plus2: Add LPO clock for AP6212
      arm64: dts: allwinner: h5: orangepi-zero-plus2: Add AP6212 Bluetooth
      arm64: dts: allwinner: h5: orangepi-zero-plus2: Fix USB peripheral mode
      arm64: dts: allwinner: h5: orangepi-zero-plus2: Add MMC aliases

 .../allwinner/sun50i-h5-orangepi-zero-plus2.dts    | 25 +++++++++++++++-------
 1 file changed, 17 insertions(+), 8 deletions(-)
---
base-commit: 65e4fd942f72a9dba0e4e257290c4fa1aa756854
change-id: 20261120-orangepi-zero-plus2-fixes-92de09c1b5f5

Best regards,
-- 
Ivan Pfarher <ipfarher@gmail.com>



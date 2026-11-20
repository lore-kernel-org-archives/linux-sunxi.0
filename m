Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795174854;
	b=sSwv2+RAlQEOxlgvXnYrPttYfy3f7t712G8rx8p2WFlFdlnNoqJ/UuPDp/ZIUQfNfpc9
	 F2kYvNWw/uUUWIIpoHBHI4A4OSnsvcT/SFdgHqshy+BAOBOs+EMb/dbYP7TQGhZyJREg2
	 bDraFwdjfNBSujH9xsu+uua51VuvB00xHOEip3easq+0Ve4dOkB9V5IXi04vxFbnlNA71
	 3jjXdWf0ShhgiIRlBV2kDVWGOxHqbXiB8o5aI5WzLYLAFS2DSSp3MhzJcarWhs9xSqFSc
	 KnXx6hGBZ2Bxni9utGmxKNGlvLuG2JFvPTm8Ctcyt8Ug0ZZZZIntP6Tg7yh+beOzBiA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795174854;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=RHPlhdBNPxXzXTwkaRxmCp6HVueIFSTW7DRmFxWoNDk=;
	b=BFTIeEDRf8ezG9Fh1yyFj2h5H9w1pUkELlelye8z69xPdEYZPz17JVKdmSLFrSX9DR8p
	 nKCGoD5WCTdnVWllbM0u9zq03AwB5L+zVaOEwuPKKE6wxFRzwB6wHRDGa3ZXH8i5J4XcA
	 21KNQHtESnKctd7uCiOpdM3IO/0EnpajuHYfYiRcHyKzwD4E5AaQDcjKkpHfk0ctmAq2d
	 1OQHEtxppp83s5pnLBw0Ycft2TCv4GR+rrHO998ghYc2AzHehEsvGOD6FdtMdFPCCwZBj
	 +45kkUU4vaahFvXSU7uN412WREApoYboXIk6qeRoKKrbMAKTP9vo8XT9RDqZZbLTJ3Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jrj+iFOM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E270606A326;
	Fri, 20 Nov 2026 11:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jrj+iFOM
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795174853;
	b=gwX5PY75GLTzNLtYE50Us7SsgI6ifqfkW/fVPPOCJE2q4xeaHac3OBTJ8cXajf3/t1ik
	 iPlbl9fnR9fSYdSi2R/Tr6hddmlxsV43HHpdfoCmBiyVXw55AE8hfPNJwkm1C2+ZFVemn
	 ZyofWQo8z3yBJXorvDmj3AhTD5/DXfw5oHstlcT0afqcajxoyzK2FTv+NQij8r5XEuYpA
	 EOLSgUBZMrgHsdDGWoRI/0vX++4a2AZUhVGHi9o9JXjKCfC/IC9QOxLSlF5zJZxoVYVNp
	 oV1kvCCKaWyK5B+3dmnm4ytkcai8WRCEuEOsXz/d5mQdm7XVhd/6hn/QiCII7I5fuAg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795174853;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=RHPlhdBNPxXzXTwkaRxmCp6HVueIFSTW7DRmFxWoNDk=;
	b=gTa0t69lfO4fsiX1SC/O9Im+oMhzMilYaADhIQlsj7LFYJuF7ufWlFHwHqFwgKltZ1LF
	 cG441D6yeerRy/cbIu7bY8hO2NflodHgscZIq5Ggec403a4Lp/7VFjQkUmdHZ5ZyTujLV
	 X+zMyB82oR1ZO/4OTOZIxipLGcfmlkHxFVE8gptq5GfT77EbFL3O7i8IOyp+HasZtnigZ
	 CLQBsy3OF1lcuv4Xx6kRou12c8YfDyPQ3u8sPtFmBsh/4uqPl6q2TXLVaefCFNhrGkIod
	 xZg/gZkecOEHV7TNbugdXxJq59w8uFb3Fw+ptJco5owOHON3TYnj2JOLMOHJQkEHBZg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 013211F000D0;
	Fri, 20 Nov 2026 11:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795174853;
	bh=RHPlhdBNPxXzXTwkaRxmCp6HVueIFSTW7DRmFxWoNDk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=jrj+iFOMo8UJZjlJ+NdJsdiTgzLXJSh7al69m9lblPFt/bC68uGvu+HCM0hJ0yT7U
	 FS0OfOGDE5VZ9i+CoIT/gOTi0jJmPgUk/4P6HX8tjHcWbdBs3TM9FUzHdDkHkZhUU8
	 Qh08RYiRD504Pp0+HQCajoEcgp0UT2Wk1KWEFC4QcYR6oCLMklYAFuqgyYwNZkSpRG
	 TwRryOodEEJtbyvpfm1Bk0L6fUDzTS3GMvLBMbUyJqy60XZwbiumq8TL2flKgVTYsU
	 CxHzFflDPjnc4sH0EBc9dOVpb4NeDy4UGLMq31LLxh6GjjoVpNYnUgjgCH2btMf32Q
	 MA2CNWZKjEHvA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 8C9CF49863;
	Fri, 20 Nov 2026 11:40:46 +0000 (UTC)
From: Ivan Pfarher via B4 Relay <devnull+ipfarher.gmail.com@kernel.org>
Date: Fri, 20 Nov 2026 12:40:45 +0100
Subject: [PATCH 1/4] arm64: dts: allwinner: h5: orangepi-zero-plus2: Add
 LPO clock for AP6212
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
Message-Id: <20261120-orangepi-zero-plus2-fixes-v1-1-ecd792189f27@gmail.com>
References: <20261120-orangepi-zero-plus2-fixes-v1-0-ecd792189f27@gmail.com>
In-Reply-To: <20261120-orangepi-zero-plus2-fixes-v1-0-ecd792189f27@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, Ivan Pfarher <ipfarher@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795174845; l=2115;
 i=ipfarher@gmail.com; s=20261120; h=from:subject:message-id;
 bh=7KEtdKj9IY+64J+dCjZb1N3Us47orLdmi9i9eYZWsuM=;
 b=SOxTVC1DYhuLVEV7n+Im/3RiM9ou+VEHmEJgGfO8FSkz+Qz6pLswSgdzCSEG8p+bdVtsJUhhg
 We9IBq70qemCUoxa7CgvszjvEU/6ECL/sz79h+0mCFhVGJuWuuwmOTt
X-Developer-Key: i=ipfarher@gmail.com; a=ed25519;
 pk=3DMYyz/xl+KRAx2TNGJpheG+5QUm7lqHhKXFqVu2TmY=
X-Endpoint-Received: by B4 Relay for ipfarher@gmail.com/20261120 with
 auth_id=1582
X-Original-From: Ivan Pfarher <ipfarher@gmail.com>
Reply-To: ipfarher@gmail.com
Content-Transfer-Encoding: 7bit

From: Ivan Pfarher <ipfarher@gmail.com>

The AP6212 WiFi/BT module needs a 32.768 kHz low power oscillator (LPO)
clock, which on this board comes from the RTC clock output (osc32k-out).
Nothing in the device tree references that clock, so it is disabled as
unused during late boot.

WiFi keeps working without it, but the Bluetooth core does not: with the
LPO gated, the BCM43430A1 ROM answers HCI_Reset and nothing else (no
Read Local Version, no firmware download), so the controller can never
be brought up. Turning the clock output on by hand (RTC LOSC_OUT_GATING)
makes the controller answer normally.

Reference the clock from the WiFi power sequence, as other boards using
the same module do (e.g. sun8i-h2-plus-bananapi-m2-zero.dts).

Tested on an Orange Pi Zero Plus2 (H5) running Linux 6.6.160 with this
change applied: osc32k-out stays enabled and the Bluetooth controller
answers HCI commands. Build-tested only against current mainline.

This problem was investigated, and the patch drafted, in an interactive
session with an AI coding assistant (Claude by Anthropic). The submitter
reviewed the change and ran the tests described above.

Fixes: cf8e19e1ec15 ("arm64: dts: orange-pi-zero-plus2: enable AP6212a WiFi/BT combo")
Signed-off-by: Ivan Pfarher <ipfarher@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
index 3eb986c35..34d6c1468 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
@@ -5,6 +5,7 @@
 
 #include "sun50i-h5.dtsi"
 
+#include <dt-bindings/clock/sun6i-rtc.h>
 #include <dt-bindings/gpio/gpio.h>
 
 / {
@@ -54,6 +55,8 @@
 
 	wifi_pwrseq: pwrseq {
 		compatible = "mmc-pwrseq-simple";
+		clocks = <&rtc CLK_OSC32K_FANOUT>;
+		clock-names = "ext_clock";
 		reset-gpios = <&pio 0 9 GPIO_ACTIVE_LOW>; /* PA9 */
 		post-power-on-delay-ms = <200>;
 	};

-- 
2.43.0



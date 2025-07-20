Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF2B1E1A33
	for <linux-sunxi@lists.linux.dev>; Sun, 20 Jul 2025 08:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753001531; cv=none; b=JjU8xvobbKkaph3WySxEd0g4oydyremN4KLd00Lf5XjiKUVFDMSwdidFnON6c5gY+EFE9OviSSWt8kov45ohvmG9ZW4ZyzRNDhK4J/iOlB9OWzYuIzE0CyT5cYDUJMRmNWuDXnD7i9TItMYJisQi33Zq+Pvz0v7UdNuuyL62kT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753001531; c=relaxed/simple;
	bh=hBVECD6v64x4wU4QBxKRNFKwikcfoSHKLjX+DQj9vH0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rTQQnKiijwJ8zYNotUBuXrRny/m2C10rm01RSKgR3JLdbTCY2T7GqFgozHdaE7WnJA0ul1ZuzvFI8klcuNHbMMoAFyVBUcEmXJbRiTSPH7JcNMOWVytW74AxZCgs4wypL19GMvAJLjpNR4aUrWf6kqGPvj+qbQb9NcV3jDHqn1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=i/2sljGN; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=oIyfp+DZ; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="i/2sljGN";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="oIyfp+DZ"
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id B1A7F1D0016C;
	Sun, 20 Jul 2025 04:52:08 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Sun, 20 Jul 2025 04:52:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1753001528; x=
	1753087928; bh=z8FVm607UWKJAij5hCF0+BtaoAu3+mKeNPsz7+FKgJk=; b=i
	/2sljGNwWWvSTded8/dxuP/BJE8VvbxPh6HTAavZiyW6VBWtFXXmzzlXG45qZ3Y5
	Kd2I+Ee4GpKxyqMzpEW3aTwuq/Hl8bIn1W6A8RRbR4XqlmuasOdjltFtdPZzcbDK
	s1TAwAtV3hbDivMNFkyOcDkIc35mSY+wX4PR+XOoveiL+UqxK9Z4N7MpBjif6E37
	Vkj+DP3K/4qtKTGJxmXf1yGo9o0cXaXgc/4t1O+FimnzshR81z9qOjTrsnHZVdJk
	bJK+Fyimra8Eblrw6El0Pw0ky+gyWAX7HQcEG33J3fIpiRpoDn/u2O3AezlW6Max
	IArCWtujEMiF7ZJBAY2MQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1753001528; x=1753087928; bh=z
	8FVm607UWKJAij5hCF0+BtaoAu3+mKeNPsz7+FKgJk=; b=oIyfp+DZREimo8ERM
	Jg94cd8xQxuKLB2ES+aSu6hIqWaMgAq+aa/wklJF0aLAzP4eyaVWUU4TU6khYmkp
	bDlD27I2vRHh1ZJyzvy3W9d9rQ0FDGjCljL1n1CjfsK5EyCEmWPpbtc4vYnaqFpo
	XpCTEUeKuiPZo3gQTbiBR9MO/z//937BjqdZZN1kYe/wXxOs2Bd8AUnJhNRI63i3
	Xe9gNyHFJ/fel/SgMugqL7ciqmyWCmhJQ2bjZQNwrBkAsluOfya7GFvy6vWWEl71
	qLDrdLKC3Vx5vBXqrYOj0DPfj3BOK/yFCTIFcefAgePhtYwDO/OiWufuwkXSJ5cl
	c+ffQ==
X-ME-Sender: <xms:OK58aPk_vMZwoYvm5OUL837NF_p0aa_aOVh1Ao2UsBlXXKH6-4YnPg>
    <xme:OK58aDdjEAiaZENw4qoBdL1ybvnV9pjOnnd1uw8pKWQtsxmrjG1er7Clljw6yWXEy
    DFry5sClXRxoOuLNQ>
X-ME-Received: <xmr:OK58aAx4Y6fcj7AxZgn8HC68MqsDiTUv9QM4zfQfQuRpj56DXecbzmSHPQYhAxkFUSZzZWG4l2IG9bgN3hPdbHRPZNf3CA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeikeejjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefthigrnhcuhggr
    lhhklhhinhcuoehrhigrnhesthgvshhtthhorghsthdrtghomheqnecuggftrfgrthhtvg
    hrnhepffehieffgedtgfffjeetveegfeekleeileekveeuteffteetudffveegieeiheet
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprhihrg
    hnsehtvghsthhtohgrshhtrdgtohhmpdhnsggprhgtphhtthhopeduhedpmhhouggvpehs
    mhhtphhouhhtpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgu
    theskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfigvnhhssegtshhivgdrohhrghdprh
    gtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghilhdrtghomhdprhgtphht
    thhopehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgpdhrtghpthhtoheprghnughrvg
    drphhriiihfigrrhgrsegrrhhmrdgtohhmpdhrtghpthhtohepmhgrtghrohgrlhhphhgr
    kedvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepkhhikhhutghhrghnleeksehgmhgrih
    hlrdgtohhm
X-ME-Proxy: <xmx:OK58aMLv79AfZihFTXTIroDwppMAfAlsVCD6mSeKxWKVFrj-NYSkVw>
    <xmx:OK58aBvBHH6lO8sa73BHpE8mXSqjYdCTJd-F47NTqm3U675Oc3rGoA>
    <xmx:OK58aGQC8gqWYGaJ2nrJwkejIdV2cpRe3KdJEQY1OrQE8bbRoXZ9zQ>
    <xmx:OK58aKQa5-KkORSHUXQYHiIajEAPd17AaubqzSs-oAXWFZ-Mi86-4w>
    <xmx:OK58aE-TZIBbsJ8TvyXTb-jlq4JhgOhK2D6KBIGE4ns6j2NGKCnBmtvv>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 20 Jul 2025 04:52:04 -0400 (EDT)
From: Ryan Walklin <ryan@testtoast.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Chris Morgan <macroalpha82@gmail.com>,
	Hironori KIKUCHI <kikuchan98@gmail.com>,
	Philippe Simons <simons.philippe@gmail.com>,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v2 11/12] arm64: dts: allwinner: h616: add LCD and LVDS pins
Date: Sun, 20 Jul 2025 20:48:49 +1200
Message-ID: <20250720085047.5340-12-ryan@testtoast.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250720085047.5340-1-ryan@testtoast.com>
References: <20250720085047.5340-1-ryan@testtoast.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Allwinner H616 (and its H618, H700 and T507 package variants with
the same die) have 28 video output pins for RGB/SPI and LVDS display.
These are in GPIO Bank D and are multiplexed.

In RGB mode, pins PD0-PD23 are for 24-bit RGB pixel output, pins
PD24-PD27 are for clock, DE, HSYNC and VSYNC.

In LVDS mode, pins PD0-PD9 are for LVDS0 and pins PD10-19 for LVDS1, and
can be configured by the H616 display engine for either one high-
resolution (dual link) or two low resolution displays.

Add device tree nodes for the LCD and LVDS pins.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
[ryan@testtoast.com: add RGB and LVDS1 pin assignments]
Signed-off-by: Ryan Walklin <ryan@testtoast.com>

--
Changelog v1..v2:
- Remove PWM pin assignment as driver not implemented
---
 .../arm64/boot/dts/allwinner/sun50i-h616.dtsi | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
index e4209dc6b46b..1d4ad2adca7d 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
@@ -339,6 +339,32 @@ ir_rx_pin: ir-rx-pin {
 				function = "ir_rx";
 			};
 
+			/omit-if-no-ref/
+			lcd0_rgb888_pins: lcd0-rgb888-pins {
+				pins = "PD0", "PD1", "PD2", "PD3",
+				       "PD4", "PD5", "PD6", "PD7",
+				       "PD8", "PD9", "PD10", "PD11",
+				       "PD12", "PD13", "PD14", "PD15",
+				       "PD16", "PD17", "PD18", "PD19",
+				       "PD20", "PD21", "PD22", "PD23",
+				       "PD24", "PD25", "PD26", "PD27";
+				function = "lcd0";
+			};
+
+			/omit-if-no-ref/
+			lvds0_pins: lvds0-pins {
+				pins = "PD0", "PD1", "PD2", "PD3", "PD4",
+				       "PD5", "PD6", "PD7", "PD8", "PD9";
+				function = "lvds0";
+			};
+
+			/omit-if-no-ref/
+			lvds1_pins: lvds1-pins {
+				pins = "PD10", "PD11", "PD12", "PD13", "PD14",
+				       "PD15", "PD16", "PD17", "PD18", "PD19";
+				function = "lvds1";
+			};
+
 			mmc0_pins: mmc0-pins {
 				pins = "PF0", "PF1", "PF2", "PF3",
 				       "PF4", "PF5";
-- 
2.50.1


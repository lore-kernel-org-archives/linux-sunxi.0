Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91CD4188591
	for <linux-sunxi@lists.linux.dev>; Sun, 16 Feb 2025 09:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739698166; cv=none; b=JunFezPM87HvIrPM0ErzMxpNXD+1zghXYW9GiyMc2ibYED4O06Y9UN4M7LFu/KZtFDLQvfSizjDMQ+Ctnijral442Qrq6o60b+qeWPQHYmOdQd55U+eriR/Bisf3LVPPNjCU6NNzjSyO5OBAW0WB22bPdb6ZBsrwfpr/uS2XLnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739698166; c=relaxed/simple;
	bh=6tKq8oflsGYlfdpjpqkPt92oaOlA9raXjb3mWWMpmwM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lgF8AYQKJq3E+raVdQXehelzAPyAzLTYb73QlEzJuIV6hbK6Wbo/+YZKpW5v+0nb5jB0OWwwIVjminmDW6+Ilvb9p0V1oglcEX7W+uSXn8cHOqnAslm/dT/sQl1eEqyFKWkbyzDel9uIv5VOI3x1NUDsEwPTfJB+BIM+qFpnWj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=ibdSl4Ek; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=OSLuwLvl; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="ibdSl4Ek";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="OSLuwLvl"
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id 70E1A11400D3;
	Sun, 16 Feb 2025 04:29:23 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Sun, 16 Feb 2025 04:29:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1739698163; x=
	1739784563; bh=Gdu9lz+AtsVFHN67DPZRHLVJE+dZDTAnLETWPEJx46U=; b=i
	bdSl4Ek+LkRmCpuTOfb1vix2HkizNQFoYponRmNdkhqLQ5WUcSAhrcUDD5L359ki
	Ee8oRCuql16qNf3j4Ff0J9ZLWiPNRua/MO7xgzz4w1WkiTxJwb+S8g3UAOZwVXVU
	25c8AYzzR1GpNPwgXHJz0a9Ocr8Um7x/XM17eDT2heuqsAA2l/Ouj+C5Cuxd+XQJ
	TNXaOAqcYbJV77ZKK2i0wrRZBPGpTd9dNmHGUAeQPSP9FzW5FTsLtEZ/7/Iz975n
	XmcSSl++fpr++QM0yCMi3RJFCjN7SkKwray2UzL81A5HWGMMLEzHQbaDpYcmwzvr
	hvdk1tmVHnPXwKJib4kMA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1739698163; x=1739784563; bh=G
	du9lz+AtsVFHN67DPZRHLVJE+dZDTAnLETWPEJx46U=; b=OSLuwLvlpJl+8Q0f7
	Fofqup/1FdwoiWabTDjXSHdgyKwiwepPnD1zCAZ3UTyi/YErlbmMhHTLNbICwx4N
	Y0AIz+rUES9QgB7ngr/cIfEd3QXQxWyyDVOmBbPKKCGvSSon8LqaJsLS675gRmBc
	bo1vrFw/Lr+tVDW7/crgxn5mMmIEw3tBf+axyayyey7PvEZygGP+fjnrBcZB8Ec/
	qrjawyOh03N8o9M829J6NlqbCyQZ9+HxlSIYl8LTHS3uFWBZsQx6iVucIqMjintX
	DvGIpifgWWllxUyl+1nDDxQ5KxZ2fve3ky2E7fwFdlJQaAbyNYwn08nKkiBLVE/Y
	Cy+GQ==
X-ME-Sender: <xms:86-xZ96Rd7H1Kd_7eiI0kpmrKMb6uVRavBSbzPwA1LZ5Gp6Irkd_Ag>
    <xme:86-xZ66rlEG-04-ZxTmwSDoG5NB2V8jWqkWsaZJaEE1O9Ss7JKvC_e5WI65eQRWGo
    LcXvvJSQ93C8-mW6w>
X-ME-Received: <xmr:86-xZ0fFU54PrySe8-dNZPxbY3_7WNjufgiDm2QweVyLMa_jmPqwONmhuqHQJTcb-RqAxUjIGKeHZHczCJr0Pzl6byM9M0l5lh_wTnJ7FOd3>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehhedutdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddt
    necuhfhrohhmpefthigrnhcuhggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsth
    drtghomheqnecuggftrfgrthhtvghrnhepffehieffgedtgfffjeetveegfeekleeileek
    veeuteffteetudffveegieeiheetnecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrg
    hmpehmrghilhhfrhhomheprhihrghnsehtvghsthhtohgrshhtrdgtohhmpdhnsggprhgt
    phhtthhopedugedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprhhosghhsehkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfi
    gvnhhssegtshhivgdrohhrghdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtges
    ghhmrghilhdrtghomhdprhgtphhtthhopehsrghmuhgvlhesshhhohhllhgrnhgurdhorh
    hgpdhrtghpthhtoheprghnughrvgdrphhriiihfigrrhgrsegrrhhmrdgtohhmpdhrtghp
    thhtohepmhgrtghrohgrlhhphhgrkedvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepkh
    hikhhutghhrghnleeksehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:86-xZ2I1QGHNwdJn31pRmZjOMerMg98GNYPVvhY4YTITzMXze_inIQ>
    <xmx:86-xZxKL6IaiR04yttqvbtPL6SujpT9NKg2hnViPvmjI--UTlTaSfw>
    <xmx:86-xZ_z-c6-9rJ1HPibTJ7HR70DAJXaqNrenB34b4T_gd3Zs_TcUPA>
    <xmx:86-xZ9KKZ_Z_IkG55bPC8AwBafP48bcLsoJL1JjnKgc9Jw4D8i42jg>
    <xmx:86-xZzgnkSBvwd4qgEG_TjRDw05pPVBluLB07cAmkM38lh_mqFO6n998>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Feb 2025 04:29:19 -0500 (EST)
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
	Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH 8/8] arm64: dts: allwinner: rg35xx: Add GPIO backlight control
Date: Sun, 16 Feb 2025 22:27:15 +1300
Message-ID: <20250216092827.15444-9-ryan@testtoast.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250216092827.15444-1-ryan@testtoast.com>
References: <20250216092827.15444-1-ryan@testtoast.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The LCD backlight for this device can be exposed as a simple GPIO-
controlled device. It would be more accurately modelled using PWM to
enable brightness control, however the PWM driver design for the H616 is
not yet upstreamed.

Add a GPIO backlight node to the DTS.

Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 .../boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
index 388487d4720e2..29d1144fc3987 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
@@ -21,6 +21,12 @@ aliases {
 		serial0 = &uart0;
 	};
 
+	backlight: backlight {
+		compatible = "gpio-backlight";
+		gpios = <&pio 3 28 GPIO_ACTIVE_HIGH>; // PD28
+		default-on;
+	};
+	
 	battery: battery {
 		compatible = "simple-battery";
 		constant-charge-current-max-microamp = <1024000>;
-- 
2.48.1


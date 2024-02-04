Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 692A218E28
	for <linux-sunxi@lists.linux.dev>; Sun,  4 Feb 2024 09:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707039857; cv=none; b=fhrEvGsEC17FsFWImkHvWA3QMdiBuxuuYiKf8MvqIemJTqBn6nR2eV+EdS2mpXoJW7yp+MYj2zFtmdD7usfC4Ody7bAZXKIwg4KDiC/+QOxahSIPpSNJp30z+h6Q69z0eF1wmIUQnWZ3gCczCwdz3eWZFgLra679hqJpAC6EtBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707039857; c=relaxed/simple;
	bh=L4cRRzejhErml6uEQ4WXYU66jFIs7k47XTvxMEaIuTo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IoePPTqHMOpC1dpp3czA6xYAaLAwjeVIGI15ai/4sO5xEEE86Lepk7EswgDPmzli+EbBg4OCsXG/x1SVM2rgEHCLfdDZBumEphy2CDhk7jQhEv3mKBFL9vtRIZfnqCJqMqrYGs7BXu+BHSntzhQsH754XB/AjvsisOCIVIJk9iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D78511FB;
	Sun,  4 Feb 2024 01:44:56 -0800 (PST)
Received: from e110479.fosdem.net (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2643D3F738;
	Sun,  4 Feb 2024 01:44:11 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Nick Alilovic <nickalilovic@gmail.com>
Subject: [PATCH 0/3] arm64: dts: allwinner: Add Remix Mini PC support
Date: Sun,  4 Feb 2024 10:44:01 +0100
Message-Id: <20240204094404.149776-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These are the DT support patches for the Jide Remix Mini PC, a now
somewhat dated Mini-PC, once shipped with some kind of desktop Android OS.
It sports an Allwinner H64 SoC, which is basically the same as the
venerable A64.
To make it stick out of the crowd, the SoC has "secure boot" enabled,
which just means it needs a different (signed) boot code package, already
supported by mainline U-Boot. Fortunately there is no public key burned
into the SoC, so any key can be used: the U-Boot build system will just
make one up.
Apart from Ethernet (blocked by the AC200 PHY) everything should work,
including WiFi and Bluetooth.

Please have a look!

Cheers,
Andre

Andre Przywara (3):
  dt-bindings: vendor-prefixes: add Jide
  dt-bindings: arm: sunxi: document Remix Mini PC name
  arm64: dts: allwinner: Add Jide Remix Mini PC support

 .../devicetree/bindings/arm/sunxi.yaml        |   6 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../allwinner/sun50i-h64-remix-mini-pc.dts    | 357 ++++++++++++++++++
 4 files changed, 366 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h64-remix-mini-pc.dts

-- 
2.25.1


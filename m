Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795713785;
	b=tSWGXVXIadbdvwvcWlVpqbMoC4ThN63x8Qz3xr8uKOL1e633WL+Hxqy+AYgJH00XIBVd
	 PpkUGzZS+CF5XJqu87sKZj2yqoE41KINWNKScv9ZQYNBA7NodImXgSvJp6pXZYlSWZBmq
	 F7gUVKPjhs7sJpOOVjr9V6ayQrRwoY8PsgX5+5QLBNfEfW1MCTSWkdSSGj2gr5vXxeJ9w
	 F1iRC+dU/6nMf93GkAC7xPv9q/KzZCjc/XZsEuiI6J3myJUBEN/Ism9qKf6St0YM+zwkH
	 DftHiH+RTpnfdSzQ4lEHTMqYaJXEvhnPrbiTQQp32s8MZZ1JomM4R7bBGSqj2bOSKPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795713785;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=AazhS24I/7MuMOkh0TY7pWo5KAGFVFjGku5DM2Pt/BA=;
	b=mg1d1bxsXy+fjj0Rt0PBcWA+zrqBwxXQYWmK08OSkttt9iIUUBsQGOcFKeDG8h82YmuQ
	 ZFRi8pmXk3OViBsmvY5ALtToH2nqxD84p62HqdFSy3bpG350TmozuleR9LbPaoCg3oisS
	 Un61QtbYDkYtYsNMrIf/iC4mICRu2gv46nRDDfBVJQCIPfFTeTjpeGxVTJV+lt29nPLAd
	 I2BUE6Af+5tesAZrCysCvEHssRTAMkJSC2iSkf3PKQJiTHyjAJ0OrWrlgEAb5AKRvvyGI
	 tGPSssMeSqNvpLYbwCpEonOEGLdgoNqXE02AgAz+NNhrYx8ZuZn9s6o6IoP/Y4VjxGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=T2BEv0v4;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 037AB606A31E
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 17:23:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 037AB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=T2BEv0v4
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 562CA1BA8;
	Thu, 26 Nov 2026 09:23:01 -0800 (PST)
Received: from e142021.manchester.arm.com (e142021.arm.com [10.33.50.35])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B8CD03F632;
	Thu, 26 Nov 2026 09:23:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795713784; bh=ijv/jqvo5qY8ee8OXFhmAq8F26CDUX03x4X4GgLtBiI=;
	h=From:To:Cc:Subject:Date:From;
	b=T2BEv0v4xCvvpktZYfwPdzScfkP5S8lUNLojcxTQJzrRj3V3wx+NZtgnWawxisl9/
	 pTypmHyImALeo5sYPgA2jhp/716j6vDY+oioE0H2KRD8hf0pQYtxYdJvd1wtIY6Zu/
	 v9J12xwfMjIEdG0IPxMkjI6/meao1kZdWbF7jNSw=
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alastair D'Silva <alastair@d-silva.org>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Enzo Adriano <enzo.adriano.code@gmail.com>
Subject: [PATCH 0/2] arm64: dts: allwinner: add Radxa Cubie A7A board
Date: Thu, 26 Nov 2026 17:22:51 +0000
Message-ID: <20261126172253.1097838-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

this short series adds a devicetree for the Radxa Cubie A7A single board
computer. It's based on Enzo's basic A733 .dtsi and Cubie A7S series,
plus the other required binding patches, which are partly still in flight.
Patch 1 adds some I2C pins to the .dtsi, as the board connects some
external RTC chip there.
Patch 2 is the actual .dts, supporting just a very basic system - the
system peripherals like GIC and timer, plus the PMIC, SD card and the
UART. USB and Ethernet should be easy to add, though binding patches for
them are still in flight.

Tested on the board, with MMC including card detect IRQ working, also
the LEDs behave as expected. The EEPROM could be read via the sysfs
interface. The I2C-attached RTC probes, though I couldn't really use it,
as it reports an invalid calendar format. For booting, I needed the
sunxi/for-next kernel, plus the pinctrl fixes and the AXP318 patches.

Ideally this series should become part of Enzo's DT series, to avoid
unnecessary churn and avoid conflicts: patch 1/2 should be squashed into
the .dtsi, and patch 2/2 just added to his series.

Please have a look!

Cheers,
Andre

Andre Przywara (2):
  arm64: dts: allwinner: a733: add r_i2c1 pins
  arm64: dts: allwinner: add Radxa Cubie A7A board

 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../dts/allwinner/sun60i-a733-cubie-a7a.dts   | 385 ++++++++++++++++++
 .../arm64/boot/dts/allwinner/sun60i-a733.dtsi |   7 +
 3 files changed, 393 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7a.dts

-- 
2.43.0


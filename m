Received: from mail.netcube.li (mail.netcube.li [173.249.15.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71A61F428E
	for <linux-sunxi@lists.linux.dev>; Tue,  7 Jan 2025 19:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.249.15.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736277781; cv=none; b=khUBk+xNcZU3Uo1KhNjsaB5IFNjU2EG5ka5jG9655rn1tDQEqnCYJmlfVcoVBUVbzfzWGRIXpadb37xOH8NWVdlOo9mmJl2VVMlGbIOOObJ9MFT/zoZLg6KZsiGravFlV8ibQTkEi46CCEWeLfwvtvw0CNcK5MtW6CR6SBsRfsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736277781; c=relaxed/simple;
	bh=GQrNIs4lEXa5uxcuLuEiidbhziGDgSMzqtuOC6RmbJ8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GVdkpl8MJZ7TTV7Gbqw5blaADHkD/zcVHJ+So1WMnyARjGR5dv3/8q4NGYTAtnu1Oyp56orcvH9GELeDwxzssA1fFCD+2hBXK/WIHBK5P9p7D+TWHuqbA/1lOGvYIE9dsiI2pXpD5zDTrWTPJLRTfFwcpCQPZsz1RCf2E4OiSRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li; spf=pass smtp.mailfrom=netcube.li; dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b=o0WjyORe; arc=none smtp.client-ip=173.249.15.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netcube.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b="o0WjyORe"
dkim-signature: v=1; a=rsa-sha256; d=netcube.li; s=s1;
	c=relaxed/relaxed; q=dns/txt; h=From:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Transfer-Encoding;
	bh=ZOjzwL4gnlE+sZAmf17LjcUdaPDgmh9qOPz72urkf+Q=;
	b=o0WjyOReDNlIYxkNxmyEXHhXR86QFICWdKqUXzxBUl4Dyfv4V6p3BANQjmGXxW3fCO98ZXAtJ3PV1MRRlm19w1hI+sJzal6HNATjVjBiWog4bXxfE5rYk3ifvh6at4JSCq5ex8VmO5ehpmSKxs2rN3pRnRlZOUqJppPeR+kkMF4=
Received: from 854af3ed5e24.lan.sk100508.local (cm70-231.liwest.at [212.241.70.231])
	by mail.netcube.li with ESMTPA
	; Tue, 7 Jan 2025 20:22:11 +0100
From: Lukas Schmid <lukas.schmid@netcube.li>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: Lukas Schmid <lukas.schmid@netcube.li>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/4] Add support for NetCube Systems Kumquat
Date: Tue,  7 Jan 2025 19:18:38 +0000
Message-Id: <20250107191844.4151-1-lukas.schmid@netcube.li>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds dt-bindings and dt's for the NetCube Systems Kumquat
board.

Changes in v2:
  Fix the devicetrees according to the 
    "dt-schema" and "make dtbs_check W=1"
  Fix the License of the devicetree as requested
  Create a cover letter for the patch series

Changes in v3:
  Disable rtc inside the SoC again, as the rtc does not work on the
    board
  Add the gpio-reserved-ranges property to the pinctrl bindings
  Reorder the nodes in the devicetree to match the order of the nodes 
    in the sun8i-v3s.dtsi file

Changes in v4:
  Moved the dtsi change into a sperate patch
  Update commit messages to include better descriptions
  Add descriptions to the uarts and mmc nodes in the dts file
  Add missing newline at the end of the dts file
  Removed the gpio-reserved-ranges property from the dts and
    from the pinctrl bindings
  Remove the rtc status property from the dts file

Changes in v5:
  Remove the unused lradc node and it's regualtor, as they
    are not used on the board
  Add another alias for the SoC's rtc as 'rtc1'

Changes in v6:
  Add reason why DS3232+ is preferred over internal rtc
  Remove redundant pinctrls from mmc0, mmc1 and i2c0
  Reordered eeprom0 and spi0/flash@0 properties
  Reordered nodes by their node name alias

Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
---
Lukas Schmid (4):
  dt-bindings: vendor-prefixes: Add NetCube Systems Austria name
  dt-bindings: arm: sunxi: Add NetCube Systems Kumquat board
  ARM: dts: sunxi: add uart1_pe pinctrl for sun8i-v3s
  ARM: dts: sunxi: add support for NetCube Systems Kumquat

 .../devicetree/bindings/arm/sunxi.yaml        |   5 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm/boot/dts/allwinner/Makefile          |   2 +
 .../allwinner/sun8i-v3s-netcube-kumquat.dts   | 268 ++++++++++++++++++
 arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi    |   6 +
 5 files changed, 283 insertions(+)
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-v3s-netcube-kumquat.dts

-- 
2.47.1



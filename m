Received: from mail.netcube.li (mail.netcube.li [173.249.15.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB85D13959D
	for <linux-sunxi@lists.linux.dev>; Mon,  7 Jul 2025 18:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.249.15.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751913884; cv=none; b=XNyBh8SAHeCttMp7CWbc1MSr7YL+IgXyu88oJeDpQkq8xUfi7lzR7gEJQuGy1aL55/tjht4lqYBV46csIJsYVLaboPaJPH1OWKlwyBnXoo9pUZSpZkNr09vaU8ZIoNLGOiTlJtXTo7FV9NHZEd10FEr+1j3UYoUpthIvVtYoZ9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751913884; c=relaxed/simple;
	bh=M1ZViLM7NqgbmcK3XZ6B/433qKxpj9xglo4vIziF4tI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qN9svE3bPzF7ttmf5LLIS2krq/D2NWKiiHCUI/x5c+s8NRBOaH6p8YlPGrFBhXaimG0oA9u34HUsNBXVjJnZKdJ2CmPlksaVIvYJwt0Oz0OWZW0kYwxZG1EThgUOJicbpFO7p52+npiai/MkAzxApMc3PXmAmfU+d9BkuqkKcrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li; spf=pass smtp.mailfrom=netcube.li; dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b=0F72HcT3; arc=none smtp.client-ip=173.249.15.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netcube.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b="0F72HcT3"
dkim-signature: v=1; a=rsa-sha256; d=netcube.li; s=s1;
	c=relaxed/relaxed; q=dns/txt; h=From:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Transfer-Encoding;
	bh=nXnojJGU29m0hFOXhR2jYRK6bl5DCglZXHWgm+c9MAE=;
	b=0F72HcT37nPTuXXMO/qnx25gw/sIHQi5I5J7MkjnUr++gF3GEGZ/HpviU+EQskxSn6gia62m6OnUPD76udOMgqTEbArX05JwPv3Djag+HJ5EvBVs3NmbES0L1wxBcodvmz8f9sFOcmTkbvtVohBH2rEEBihua3QaH7wQvUTmkKU=
Received: from lukas-hpz440workstation.lan.sk100508.local (cm70-231.liwest.at [212.241.70.231])
	by mail.netcube.li with ESMTPA
	; Mon, 7 Jul 2025 20:44:40 +0200
From: Lukas Schmid <lukas.schmid@netcube.li>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Maxime Ripard <mripard@kernel.org>
Cc: Lukas Schmid <lukas.schmid@netcube.li>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 0/5] Add support for NetCube Systems Nagami SoM and its carrier boards
Date: Mon,  7 Jul 2025 20:44:12 +0200
Message-Id: <20250707184420.275991-1-lukas.schmid@netcube.li>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for the NetCube Systems Nagami SoM and its
associated carrier boards, the Nagami Basic Carrier and the Nagami Keypad
Carrier.

Changes in v3:
  - Add missing dcxo node to the SoM dtsi

Changes in v2:
 - Squash the binding patches into one patch
 - Fix formatting of the phy node in the SoM dtsi
 - Add description on where the phy is located in the SoM dtsi
 - Fix the phy address in the SoM dtsi
 - Move the carrier bindings into the same description as enums

Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
---
Lukas Schmid (5):
  dt-bindings: arm: sunxi: Add NetCube Systems Nagami SoM and carrier
    board bindings
  riscv: dts: allwinner: d1s-t113: Add pinctrl's required by NetCube
    Systems Nagami SoM
  ARM: dts: sunxi: add support for NetCube Systems Nagami SoM
  ARM: dts: sunxi: add support for NetCube Systems Nagami Basic Carrier
  ARM: dts: sunxi: add support for NetCube Systems Nagami Keypad Carrier

 .../devicetree/bindings/arm/sunxi.yaml        |   8 +
 arch/arm/boot/dts/allwinner/Makefile          |   3 +
 ...n8i-t113s-netcube-nagami-basic-carrier.dts |  63 +++++
 ...8i-t113s-netcube-nagami-keypad-carrier.dts | 165 +++++++++++++
 .../allwinner/sun8i-t113s-netcube-nagami.dtsi | 228 ++++++++++++++++++
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    |  36 +++
 6 files changed, 503 insertions(+)
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-nagami-basic-carrier.dts
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-nagami-keypad-carrier.dts
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-nagami.dtsi

-- 
2.39.5



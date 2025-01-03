Received: from mail.netcube.li (mail.netcube.li [173.249.15.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D519B1C175C
	for <linux-sunxi@lists.linux.dev>; Fri,  3 Jan 2025 20:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.249.15.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735937377; cv=none; b=cTJtVZqXbEzwQJfd3pg44NYWfc5z21bq27TRyjJK5iGQTI+dlUNmKxEwZStAigsh9BOSG2ZiN3BIqnaTrtGvD+ILS/Yu02xO20aSvRyBLcKjgj+eNIjRJfrgVQ8yfA/SJBYn0YM8NJFJi5+4nu/MlOFX57ggkuKr4Imp3jSDJII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735937377; c=relaxed/simple;
	bh=p5x8adSqxae4D+ZER/FeQ39Dc11jNJSsQzspvTApoqE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZS5iw17kOoT+EIGqThGuGvghWxgdhTTNGSEGwQXvM3wtFRL6rGz1OCOSo9CjgDlWaXpolzFx5vWbI241oeCjx1ssOEh82bn+tbV5NFuX9XlpKFews2itxNJdCNvgpsGrg9YO7OyqkKY7oPQNFV8S5eDul1eiVArylYD0dXhUGfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li; spf=pass smtp.mailfrom=netcube.li; dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b=N9u4nmbX; arc=none smtp.client-ip=173.249.15.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netcube.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b="N9u4nmbX"
dkim-signature: v=1; a=rsa-sha256; d=netcube.li; s=s1;
	c=relaxed/relaxed; q=dns/txt; h=From:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Transfer-Encoding;
	bh=lEMf3CP8j22OLEYK0x3+BkPmy31vySZlkgdmHbiAhtc=;
	b=N9u4nmbX4v2PvzZiNuwjtV4sAy71mMlALBjT6XYkHBpg7HQF0xsdfRnNjZSmG+B9kQ8OCgjaNOCuD76uDReRUT6sRA3W8dmkUmVzt2Fg+r6y58VpEB7HrH7AIpSJ3Vl5QjFgd7XAGmXo0W4v3PZTMFLoXfUDpRmkgIhA0O3pMNo=
Received: from 854af3ed5e24.lan.sk100508.local (cm70-231.liwest.at [212.241.70.231])
	by mail.netcube.li with ESMTPA
	; Fri, 3 Jan 2025 21:49:16 +0100
From: Lukas Schmid <lukas.schmid@netcube.li>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: Lukas Schmid <lukas.schmid@netcube.li>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v3 0/4] Add support for NetCube Systems Kumquat
Date: Fri,  3 Jan 2025 20:45:16 +0000
Message-Id: <20250103204523.3779-1-lukas.schmid@netcube.li>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds dt-bindings and dts for the NetCube Systems Kumquat board.

Changes in v2:
  Fix the devicetrees according to the "dt-schema" and "make dtbs_check W=1"
  Fix the License of the devicetree as requested
  Create a cover letter for the patch series

Changes in v3:
  Disable rtc inside the SoC again, as the rtc does not work
  Add the gpio-reserved-ranges property to the pinctrl bindings
  Reorder the nodes in the devicetree to match the order of the nodes in the
  sun8i-v3s.dtsi file

Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
---
Lukas Schmid (4):
  dt-bindings: vendor-prefixes: Add NetCube Systems Austria name
  dt-bindings: arm: sunxi: Add NetCube Systems Kumquat board
  dt-bindings: pinctrl: sunxi: Add gpio-reserved-ranges property
  ARM: dts: sunxi: add support for NetCube Systems Kumquat

 .../devicetree/bindings/arm/sunxi.yaml        |   5 +
 .../pinctrl/allwinner,sun4i-a10-pinctrl.yaml  |   5 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm/boot/dts/allwinner/Makefile          |   2 +
 .../allwinner/sun8i-v3s-netcube-kumquat.dts   | 290 ++++++++++++++++++
 arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi    |   6 +
 6 files changed, 310 insertions(+)
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-v3s-netcube-kumquat.dts

-- 
2.47.1



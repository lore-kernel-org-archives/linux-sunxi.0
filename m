Received: from mail.netcube.li (mail.netcube.li [173.249.15.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E3F3E121A
	for <linux-sunxi@lists.linux.dev>; Thu,  4 Jun 2026 11:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.249.15.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780573997; cv=none; b=Am6G+cYncSgHpytd3ZZbBgeQKcBTnXlL/7Dftr4c1eUpDcgWbNvdffqNAkyD9VzdBQdR95+LZ/bOlpub+R5nAlCvGk3VOY0AYnTH8ngYoMIq9cekTJs+EW1Q5h5ildO0npz/oZHiCQminsStvnET+yye37pwnWhEhwnhwTj7zEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780573997; c=relaxed/simple;
	bh=5b00GmUiSFv3WKhr9k8/OOcX9CZ8exV4Ba2rX9Ze1cI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KtX5c1akvWjwDOO2mq4EZ0idLzYkCJkM9MhGu9M9K1TNPnflCq1Qcc9zTQYxR8Gu0iMl7wa7nu2g4b8Fs8zwyVW0Hkrw5cLQo1aRsJN8Xz0J5qOW/IhepuJGWUiFvavE5QWeluZRNSuMoXNKmN4E0AGs2JV2h5GFJiOS7r4eIII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li; spf=pass smtp.mailfrom=netcube.li; dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b=EM/tXpU1; arc=none smtp.client-ip=173.249.15.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netcube.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b="EM/tXpU1"
dkim-signature: v=1; a=rsa-sha256; d=netcube.li; s=s1;
	c=relaxed/relaxed; q=dns/txt; h=From:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Transfer-Encoding;
	bh=oWMn64nYBWSIvUnLnrokvGf+sjSPmoshxyBWnGTXZ/E=;
	b=EM/tXpU1wlQHYFGsc/bUXmHgoo59oVfIKpgMEhB4dC3NlM3mPBkClH2fl95cIFZItsMAMGoZKnacPbFGf73FHd2Np1JvjyOHu3qraYCA+4GCPpXhfNYXc1YCW/ckbq9DhzJucu1OI3m+oJHfUqgejF//Z7oWi3SEHVnV5hLVGVw=
Received: from lukas-hpz440workstation.lan.sk100508.local (194-166-56-114.hdsl.highway.telekom.at [194.166.56.114])
	by mail.netcube.li with ESMTPA
	; Thu, 4 Jun 2026 13:53:06 +0200
From: Lukas Schmid <lukas.schmid@netcube.li>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <pjw@kernel.org>,
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
Subject: [PATCH v1 0/3] Add support for NetCube Systems OpenNMC (dobermann)
Date: Thu,  4 Jun 2026 13:52:31 +0200
Message-ID: <20260604115241.1358528-1-lukas.schmid@netcube.li>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for the NetCube Systems OpenNMC

Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
---
Lukas Schmid (3):
  dt-bindings: arm: sunxi: Add NetCube Systems OpenNMC (dobermann)
  riscv: dts: allwinner: d1s-t113: Add uart4 pinctrl required by NetCube
    Systems OpenNMC
  ARM: dts: sunxi: add support for NetCube Systems OpenNMC (dobermann)

 .../devicetree/bindings/arm/sunxi.yaml        |   1 +
 .../sun8i-t113s-netcube-dobermann.dts         | 149 ++++++++++++++++++
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    |   6 +
 3 files changed, 156 insertions(+)
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-dobermann.dts

-- 
2.47.3



Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61E5661FF2
	for <linux-sunxi@lists.linux.dev>; Mon,  5 May 2025 16:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746463682; cv=none; b=RZN9nASE373HFk9AKlBh8FzhsIQ8B/WWGmUnM4UHYU53pYMis2nM/i7GRyhDgxwpDu5D7GK53njb6rQqp4r2OYiVqonIucrR6R/AIU2mvTmszNgrlEXQJMb18FhNkxtgh9Ysew8s3dxfBahS/Y70IePE99x9L2JR0Aqda433bg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746463682; c=relaxed/simple;
	bh=6kgLLkSzbCsnkK7Wh83ln3Ro09UOIvCxzW63+HKgWiI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dfriU9mFa+lOZbwWDYbSfrb7ZUDD/5Valj/AC+4neBxlGAfgG1lHWW2f8K+gWJt+8uvw3p3jgAFt2Wt2kQuZ2ko2krqWSCQbuGPDdKeazN+EQSyYcujbJF+Bzd6oSAMy0uwGoW+TzyDXhlWEAkHBVe/rAced5SL1ks5nEexg4Ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 20F54339;
	Mon,  5 May 2025 09:47:50 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 000F63F673;
	Mon,  5 May 2025 09:47:57 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Cody Eksal <masterr3c0rd@epochal.quest>,
	Philippe Simons <simons.philippe@gmail.com>,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/3] arm64: dts: sunxi: Add Liontron H-A133L support
Date: Mon,  5 May 2025 17:47:26 +0100
Message-ID: <20250505164729.18175-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Liontron H-A133L is an industrial development board featuring the
Allwinner A133 SoC.
Alongside the usual standard connectors like USB and Ethernet ports,
it contains a number of dedicated JST connectors, to connect external
peripherals.

Add support for that board with the usual patch trinity: vendor prefix,
board name binding, board .dts file.

Please have a look!

Cheers,
Andre

Andre Przywara (3):
  dt-bindings: vendor-prefixes: Add Liontron name
  dt-bindings: arm: sunxi: Add Liontron H-A133L board name
  arm64: dts: allwinner: a100: add Liontron H-A133L board support

 .../devicetree/bindings/arm/sunxi.yaml        |   5 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../sun50i-a133-liontron-h-a133l.dts          | 214 ++++++++++++++++++
 4 files changed, 222 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l.dts

-- 
2.46.3


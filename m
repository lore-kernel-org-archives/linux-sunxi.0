Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57B8D18E08
	for <linux-sunxi@lists.linux.dev>; Sun,  4 Feb 2024 09:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707039195; cv=none; b=O8ehiFJl/au9P4Nr1mIqQT4Kv0a+G04Dgxm8E0/sw+wEoWpCVnLCvqmutqhQroY4w+MA8PBjLeYkquCDAISlkXPafz49kOi5kz83e/g++4I1rwBP0lTIbK84XyGjcdIBLAoQJqpd5GcDprEhSDpFU1T+bIyBRoBa5J1cAeNfKKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707039195; c=relaxed/simple;
	bh=6KxfOEJfLeLK0Giis09Z5345Dt7XsXUjhR3g6/6lIt0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SFmUlfQePqUyq1C9TYreVCS+wJyZLvy8CuNZHFC42sEa91rDUoh57CJ+6jfssDc/Ruzt8xxZWnIJpiFgElpy1rFlgXoQ4uxylbdBFRy4Jqs1rtftFZWkrcoxc9g4AVg17CBV2iCkhWF1Z7MTWBM2c3LbsBKsgp0gWp/tUecDm3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 24CA91FB;
	Sun,  4 Feb 2024 01:33:47 -0800 (PST)
Received: from e110479.fosdem.net (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 32B3D3F738;
	Sun,  4 Feb 2024 01:33:01 -0800 (PST)
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
Subject: [PATCH 0/2] arm64: dts: allwinner: Add Transpeed WiFi nodes
Date: Sun,  4 Feb 2024 10:32:53 +0100
Message-Id: <20240204093255.148972-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds the WiFi DT nodes for the Transpeed 8K618T TV box. It uses a
Murata module with a Broadcom 4335 chip, which works fine with the
mainline driver, given you provide the proper firmware files. We found
some in some LibreELEC repository.

Patch 1 adds the pinctrl node for the 32KHz clock fanout pin, patch 2
adds the actual SDIO WiFi node.

Please have a look!

Cheers,
Andre

Andre Przywara (2):
  arm64: dts: allwinner: h616: Add 32K fanout pin
  arm64: dts: allwinner: Transpeed 8K618-T: add WiFi nodes

 .../arm64/boot/dts/allwinner/sun50i-h616.dtsi |  5 ++++
 .../sun50i-h618-transpeed-8k618-t.dts         | 23 +++++++++++++++++++
 2 files changed, 28 insertions(+)

-- 
2.25.1


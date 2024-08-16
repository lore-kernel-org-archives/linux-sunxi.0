Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A8F42868D
	for <linux-sunxi@lists.linux.dev>; Fri, 16 Aug 2024 00:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723767524; cv=none; b=E7wWbcjt8usFECw5mtQDqwba/Kl+k9KAuI4gy4xgqU8C4swe58tI+JyZxMm+eDTa19wmgpSyqb0mfhGw/+v+lV2ZbTWEL88OXS6C7xHID30rUQzIQlPxTYmsZnxSAKgIEcn/SYSYuKV0GIo5dkQAGk2iY+Gpx/KTb/USlsMQ8f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723767524; c=relaxed/simple;
	bh=pHTFbeiH98+KNvJ6C9XjCRN7soUqfq9CvMzd82mA0H0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Bz0bOqXyJgQDA81Ulkrz1jJnlv90fzmZ/4ZFTiotxiScTZsDuw/WVNaEQTpyiA4u9JxJS6KuTMJbmAq/NgfjttGRrymYRTc1Osjdf+zqMgIJfRJMJkzM6Wx7hxkTgFqVl+sdLgLv2FnKV/0DUaaqi4OlBKhP4jR2YBxaFtAAhf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 56C3F14BF;
	Thu, 15 Aug 2024 17:19:06 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7D08B3F6A8;
	Thu, 15 Aug 2024 17:18:38 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Chris Morgan <macroalpha82@gmail.com>,
	John Watts <contact@jookia.org>,
	Ryan Walklin <ryan@testtoast.com>,
	Philippe Simons <simons.philippe@gmail.com>
Subject: [PATCH v3 0/3] regulator: Add AXP717 boost support
Date: Fri, 16 Aug 2024 01:18:21 +0100
Message-Id: <20240816001824.6028-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.39.4
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is remainder of the AXP717 fix series, containing support for the
boost regulator. This is meant to increase the battery voltage to the 5
volts required to provide the USB VBUS power.
It's the usual trinity of DT bindings patch (1/3), the MFD part
describing the PMIC registers (2/3) and the final patch to model the
regulator (3/3).
Compared to v2, this drops the merged patches, and just retains the
boost related parts. It also changes the internal name of the register
to AXP717_MODULE_EN_CONTROL_2, since there is another control register
we will need later for battery support.

Please have a look and test!

Cheers,
Andre

Changelog v2 .. v3:
- drop already merged fix patches
- rename control register name to make room for second control register
- rebase on top of v6.11-rc3
- add review tags

Andre Przywara (3):
  dt-bindings: mfd: x-powers,axp152: add boost regulator
  mfd: axp20x: AXP717: Add support for boost regulator
  regulator: axp20x: AXP717: Add boost regulator

 Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml | 2 +-
 drivers/mfd/axp20x.c                                       | 2 ++
 drivers/regulator/axp20x-regulator.c                       | 4 ++++
 include/linux/mfd/axp20x.h                                 | 3 +++
 4 files changed, 10 insertions(+), 1 deletion(-)

-- 
2.39.4


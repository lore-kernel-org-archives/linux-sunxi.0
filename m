Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3150641A88
	for <linux-sunxi@lists.linux.dev>; Wed, 15 May 2024 23:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715816972; cv=none; b=LM83mYJcONGzRefWcmVkNkHrD1MjMKZKc9tpQMo8YIlIddyB7/XFGn8I/2zn7EDDejxt1erI7FVyBKqXt4RnXeYny0qhAnVUJqdTDDLEIfXJ3LTDxFAQG89CBTc9SQkHt00aPFy1fyGk7CClhQG2l81ZaBbWn9kTuKqt76zQPfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715816972; c=relaxed/simple;
	bh=bkaxYgd/f4m6BJpaO7dB6jRJ7mGeiENUhOtt9R8kPBw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FGfroTUea64VrBkzH+XMGs5ONmv0vMfQnYChRF+7GD6M2QS7Zt76I16P7YzYgsZRg06aBLn49puE/IijrHGDK+9p5qDc82aM3QfjFDhhfJ+XD7byKN1gt3RmJ91xTADojwRozZYXsYlJgXgezvYv9p1QnaS0lSaSo42oItkWodU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 83EC5DA7;
	Wed, 15 May 2024 16:49:53 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AEEC03F641;
	Wed, 15 May 2024 16:49:27 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Tom Rini <trini@konsulko.com>,
	Jaehoon Chung <jh80.chung@samsung.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Chris Morgan <macromorgan@hotmail.com>,
	Ryan Walklin <ryan@testtoast.com>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 0/6] power: pmic: sunxi: consolidate AXP SPL drivers
Date: Thu, 16 May 2024 00:48:33 +0100
Message-Id: <20240515234839.26898-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.8
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

this is the first series in an attempt to clean up the X-Powers AXP PMIC
drivers used by the SPL for sunxi boards. So far we have a separate
driver file for each AXP variant, but the code was largely the same,
just differing by the regulator ranges.

This adds a new generic driver, which reads the regulator description
from an array of structs. This is similar to how the DM AXP driver used
for U-Boot proper works, but is simplified, since we won't need the full
feature set for the SPL, and we want to keep the code size small.

To help bisect-ability, and to simplify review, each of the simpler AXP
drivers covered by this approach is handled in a separate patch.
We just convert the AXP313, AXP305, AXP717 for now, and on the way add
support for the AXP707, just because it's now very easy, and we will
need it soon enough.
The other AXP SPL drivers are more complex, and support more regulators,
but my hunch is that we really just need the DC/DC converters in the
SPL. However I need to prove and test this, so I will convert the other
AXP chips later.

Please have a look and comment whether the approach in general is a good
idea.

Cheers,
Andre

Andre Przywara (6):
  power: pmic: sunxi: only build AXP drivers for SPL
  power: pmic: sunxi: introduce generic SPL AXP DC/DC driver
  power: pmic: sunxi: replace AXP717 SPL driver
  power: pmic: sunxi: use generic AXP SPL driver for AXP313
  power: pmic: sunxi: use generic AXP SPL driver for AXP305
  power: pmic: sunxi: add AXP707 support

 drivers/power/Makefile  |   8 +-
 drivers/power/axp305.c  |  82 ------------------
 drivers/power/axp313.c  | 133 -----------------------------
 drivers/power/axp717.c  |  92 --------------------
 drivers/power/axp_spl.c | 184 ++++++++++++++++++++++++++++++++++++++++
 5 files changed, 189 insertions(+), 310 deletions(-)
 delete mode 100644 drivers/power/axp305.c
 delete mode 100644 drivers/power/axp313.c
 delete mode 100644 drivers/power/axp717.c
 create mode 100644 drivers/power/axp_spl.c

-- 
2.35.8


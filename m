Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F70B23644D
	for <linux-sunxi@lists.linux.dev>; Thu, 12 Jun 2025 23:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749770397; cv=none; b=RbLAGXzX6ALUmq5hMB5wDIcC3mRhkKj1DVkHexiW07UWyVlBkikgZCtfsKEXAb2k7//z7HNfRbi4Ea1COymPs5N28vgHZuS4Gu7dd8jEM8zJXDXcwrkQdYHbBNEoqIhEKsZM7QpUTRkTaa1WEUYiN6CDaCg7MABwQWg95sUOeXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749770397; c=relaxed/simple;
	bh=mxKJgdFKmTd75T+y7nzGTEshodkMrH6mcJiO0VB14uo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LO0ZPrT/bYUK04QGwGfFk4H9MNgAkxPiPVTdErACuZd0JUU8JPtTQlrYJEx88ttzki8+He0QFhRvD5Js3DO6ROb8dN4WGcl25XDHIWZu2WWyaTjU8rPkjU7a63W/ortjsQ4yTO2spP8iGnnL60v6mCiUs4rGfFTMwz6wJbBQp/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EF9C41CDD;
	Thu, 12 Jun 2025 16:19:33 -0700 (PDT)
Received: from e134369.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 208633F59E;
	Thu, 12 Jun 2025 16:19:52 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: u-boot@lists.denx.de
Cc: Tom Rini <trini@konsulko.com>,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 0/2] sunxi: add YuzukiHD Chameleon board support
Date: Fri, 13 Jun 2025 00:19:43 +0100
Message-ID: <20250612231945.981893-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Chaemeleon board is an Open Source hardware devboard developed by
YuzukiHD, featuring an Allwinner H618 SoC.
Import the devicetree, recently merged into the Linux kernel tree, and
add the defconfig, to allow mainline U-Boot on this board. Since the SoC
is quite well supported, there is not much else to add at this point.

Cheers,
Andre

Andre Przywara (2):
  arm64: dts: allwinner: h616: add YuzukiHD Chameleon support
  sunxi: H616: add support for YuzukiHD Chameleon board

 configs/yuzukihd-chameleon_defconfig          |  30 +++
 .../sun50i-h618-yuzukihd-chameleon.dts        | 222 ++++++++++++++++++
 2 files changed, 252 insertions(+)
 create mode 100644 configs/yuzukihd-chameleon_defconfig
 create mode 100644 dts/upstream/src/arm64/allwinner/sun50i-h618-yuzukihd-chameleon.dts

-- 
2.43.0


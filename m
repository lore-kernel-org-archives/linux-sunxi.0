Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B6A43CFF45
	for <linux-sunxi@lists.linux.dev>; Mon, 27 Apr 2026 13:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777298307; cv=none; b=k/xI4rf4UHdH1pMQERBdZRMI51Cpr6gK79D4PZonSngQL/hHnIz26Ac0oitLULGJ655xbVQtKy8yFssGFP22u0oSFhHXl/4OfC2yz6w2TCuScKJhMoCPIVO7Fko+Kq4aWQRVBmouJOHTOK+d7wQ0HJDgdlP+t2ZYLB2tHN5TRKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777298307; c=relaxed/simple;
	bh=dyihYbwMvXKYdp3CZnjWD1HdmuQWHDIWFRFll7ya8jY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TC7Rf/cZQG8gh/gg4hgIT7mbh3WtCdDA89sWTkMP042CoBFZ/O3RPZoQuskZaQtLlrJunXwAeeISZgXfRztUOAOMczWL9YpQyEIvxGpuFkgTD38Nt0PiWP+LfqDLgNll3oM+F8gqX6AoblGq3NoeCo4wVAozcmhceijk4bYDNdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=fZ42R2kL; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="fZ42R2kL"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 651EC1684;
	Mon, 27 Apr 2026 06:58:20 -0700 (PDT)
Received: from e142021.munich.arm.com (e142021.arm.com [10.41.150.145])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 218233F763;
	Mon, 27 Apr 2026 06:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777298305; bh=dyihYbwMvXKYdp3CZnjWD1HdmuQWHDIWFRFll7ya8jY=;
	h=From:To:Cc:Subject:Date:From;
	b=fZ42R2kLPvuMyQu18nh42i8Wo1CpbojXpL3I4eGs5qv8c1g3KlNdIarCZihgpFFVc
	 wnaXX9tXUocbyaT3MXgg1A3sgkplWnpBba8SFkiSdo/NI8KcfpZi833levxqM9tYGa
	 QgMTW6X5q6ywDpC8nH0mvpwXOBPEjajlOs4C1Bhc=
From: Andre Przywara <andre.przywara@arm.com>
To: u-boot@lists.denx.de
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Philippe Simons <simons.philippe@gmail.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	linux-sunxi@lists.linux.dev,
	Mikhail Kalashnikov <iuncuim@gmail.com>,
	Cody Eksal <masterr3c0rd@epochal.quest>
Subject: [PATCH v3 0/2] sunxi: H616: DRAM: Fix TPR6 parameter parsing
Date: Mon, 27 Apr 2026 15:58:17 +0200
Message-ID: <20260427135819.2577234-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As multiple people reported, the TPR6 DRAM parameter is parsed wrongly
for the H616 DRAM setup. Fix that and clean up the confusing default
value on the way.

Many thanks to Philippe for pushing this upstream!

Cheers,
Andre

Andre Przywara (1):
  sunxi: H616: dram: drop default TPR6 Kconfig value

Jernej Skrabec (1):
  sunxi: H616: dram: fix LPDDR3 TPR6 parsing

 arch/arm/mach-sunxi/Kconfig            | 1 -
 arch/arm/mach-sunxi/dram_sun50i_h616.c | 2 +-
 configs/orangepi_zero2_defconfig       | 1 +
 configs/transpeed-8k618-t_defconfig    | 1 +
 configs/x96_mate_defconfig             | 1 +
 configs/x96q_defconfig                 | 1 +
 6 files changed, 5 insertions(+), 2 deletions(-)

-- 
2.43.0


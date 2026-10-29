Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793317051;
	b=creGdfIVef45MwY25C9tpbgaisGZxlE9NO+xHrzr38SMNCUFdDZAnY0DwJQ4j4e5fTsd
	 01HjUpjGe5ixrx78LSoh/Ln0q2yO+lT4jKWd8Dcx5czPVMcA9WEhB+RJW8N7FuNgCx11x
	 sLh5xQMHaqQFb69MH9B7tz9kH+6qu7RpQHGODeH4q2IQ8NQyCIV+DaUiq3f76/xTZNfbS
	 sNyM2vjD5DeCirFT0kQ7OrQtG3BimRF0XSmlE6lSVU+ZDgPUF7VsUYdZ+u95dzxSBzHH2
	 BeQ2J5pLGXoX8rZQ9x3i8in+mEFywavy3FjMMYie5oO/yrtcK8J40N0YQqpYju7wQbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793317051;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=h4EHtT42E9fxCmMCfHhCo9qlVpIdENZks2MJ/ypPxCI=;
	b=Z1eehSN5OtoMhoMlmgWnYgzrvakdad4D4oWo7m2j2b6AEKSEt3HQ4sdfj+gO/rFT7iDU
	 Q6F5/o4iB4fVpoI4ZUMjLxp7kHjBK/jZJa5hsSjyTHL4JkOaljoGvW1IWQFLv1Bl+3SVw
	 rtqogPMeKCjjkCelVa8WiaLodCJfCpcEv4AdoQvysxiLQUPity8vuGsvaA2kH7RijxhaR
	 /Bfm/UW7GPwl3weBcDjHlAipPLSH1goc9DJuBB7eiT960wXAj7wgC3AtWAP+91LiMh+zJ
	 bpIE4siveUplyVfqRNgAqfe4KTMyj4uq1zLxdzVEipOPdB0Fh1pjv89qlPOO2/oZF7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b="QohDs/kB";
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B27D9606A32D
	for <linux-sunxi@lists.linux.dev>; Thu, 29 Oct 2026 23:37:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B27D9606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=QohDs/kB
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CDF2D169E;
	Thu, 29 Oct 2026 16:37:25 -0700 (PDT)
Received: from ryzen.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C75423F59E;
	Thu, 29 Oct 2026 16:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793317049; bh=3Ym+7OXgoB1jhbh23cS78JR00sMp5M3zAMvukTjisfU=;
	h=From:To:Cc:Subject:Date:From;
	b=QohDs/kBl6veGHfUy0WSmt+P1DWvC7zdZBR4N8xrUAW1TelRS1wJeHltzHNdC0Brj
	 tH78X23NshyofXQUqkzwhZ12KGscrk7mbao48ox4jNeDU/Vh4rWlpHlP/ciSbJcvod
	 mUl3tSCSB1YeRpWTbL5oQT3a7GInLFTzwsCAO38g=
From: Andre Przywara <andre.przywara@arm.com>
To: u-boot@lists.u-boot-project.org
Cc: linux-sunxi@lists.linux.dev,
	Paul Kocialkowski <paulk@sys-base.io>,
	Mikhail Kalashnikov <iuncuim@gmail.com>
Subject: [PATCH] sunxi: a133: adjust TF-A load address
Date: Fri, 30 Oct 2026 00:37:20 +0100
Message-ID: <20261029233720.8411-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.4
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When development of the Allwinner A133 TF-A port started, BL31 was put
in SRAM, like on the similar H6 SoC. Consequently we used the same SRAM
address as the H6 in the Kconfig stanza of the A133 U-Boot port.

Later we realised that the SRAM space will become too tight, in fact it
was already spilling over into SRAM C, which we cannot use any more at
runtime, once the display engine is used. So the mainline TF-A port
eventually put BL31 in DRAM, which of course requires a different load
address.

Adjust the BL31 load address to use the same DRAM location as the (almost
SRAM-less) H616, by just adjusting the match pattern, to not let the A133
fall through to the SUN50I_GEN_H6 symbol.
This allows U-Boot to use the now merged mainline TF-A port for the A133.

This is unfortunately a breaking change, but there is not much we can do
about it, and since U-Boot packages TF-A in our booting scheme, we have
that under control.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm/mach-sunxi/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-sunxi/Kconfig b/arch/arm/mach-sunxi/Kconfig
index b0c5d3cd903..b7ee14c6678 100644
--- a/arch/arm/mach-sunxi/Kconfig
+++ b/arch/arm/mach-sunxi/Kconfig
@@ -267,7 +267,7 @@ config SUNXI_RVBAR_ALTERNATIVE
 config SUNXI_BL31_BASE
 	hex
 	default 0x00044000 if MACH_SUN50I || MACH_SUN50I_H5
-	default 0x40000000 if MACH_SUN50I_H616
+	default 0x40000000 if MACH_SUN50I_H616 || MACH_SUN50I_A133
 	default 0x00104000 if SUN50I_GEN_H6
 	default 0x00054000 if MACH_SUN55I_A523
 	default 0x0
-- 
2.46.4


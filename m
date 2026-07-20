Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC6473B95EC
	for <linux-sunxi@lists.linux.dev>; Mon, 20 Jul 2026 21:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784583744; cv=none; b=R1jxwiqBNHYs1yY+KVL7gHKKNZrkg6QSWvbbINAK2fO1LbiyhmEymKtp1tO28NsHoItH3V9BjqXw31rRiy9Mnc7rr2jR5+GcA98PcvJ0O0LhyWwIUvwPmMazxYHNfvcCT3GKEJLjTxT3cIFLLFC9gqVbT+RSI5Hh+eYf5MmKYTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784583744; c=relaxed/simple;
	bh=7GPCEpWSp6hdvoiZp/dWDlRlQZkpNncKgtqSVs5WpVQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HTeIV2gkjayzq44FPt/qUy1o08Tb9xv48PVxHXwLBCPfcrYXloDXGD9/Kq4KnD8vVfQT7LWtXs0TgwpKkikg73NJ7Hkcg1wcDAPDR/DGVOouMyZHsfzKUbVYS6LExx6pq5m67imRs1gXS0PvloIJcbZpZpSDWFipU1wdgIMvsE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=l8iAgLJz; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="l8iAgLJz"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A3366143D;
	Mon, 20 Jul 2026 14:42:17 -0700 (PDT)
Received: from ryzen.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9DC563F66F;
	Mon, 20 Jul 2026 14:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784583741; bh=7GPCEpWSp6hdvoiZp/dWDlRlQZkpNncKgtqSVs5WpVQ=;
	h=From:To:Cc:Subject:Date:From;
	b=l8iAgLJzV7Gh3mwE/JMxyp/TMqv1GUgNiObXadU2jzw1/5vwKGwxnPdQewXZ9dYDu
	 WjFH5fDtXjJQN8vlY6tcX3U9ypgFZk1wmHI8SjrQSnCnB7AGmkgjh6OmhIOtWeLD24
	 /eUxAXDjbLj0L+RW23StDNOoNAUYlriflwcAUjpE=
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: allwinner: a523: x96qpro+: overvolting eMMC
Date: Mon, 20 Jul 2026 23:38:32 +0200
Message-ID: <20260720213832.3763-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.4
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On the X96QPro+ TV box, the eMMC wasn't working properly: the chip would
be detected, but most requests failed, leaving it unusable. Some
"solutions" were circulating downstream, one "popular" one is severely
limiting the clock frequency, with a drastic performance impact.

Instead slightly bumping the I/O voltage on PortC from the canonical
1.8V to 1.9V seemed to do the trick: the eMMC now works and reaches the
expected 120MB/s performance.

Adjust the respective regulator voltage in the .dts to enable eMMC
operation on that device.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
Hi,

I am not super happy with this patch, but it seems to be a pragmatic and
the least hacky solution I have seen.

Cheers,
Andre

 arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts b/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
index a96927fbdadd5..5636e95312218 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
@@ -194,8 +194,8 @@ reg_bldo4: bldo4 {
 
 			reg_cldo1: cldo1 {
 				regulator-always-on;
-				regulator-min-microvolt = <1800000>;
-				regulator-max-microvolt = <1800000>;
+				regulator-min-microvolt = <1900000>;
+				regulator-max-microvolt = <1900000>;
 				regulator-name = "vcc-codec-sd";
 			};
 
-- 
2.46.4


Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A56B617B502
	for <linux-sunxi@lists.linux.dev>; Sun, 15 Dec 2024 21:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734297988; cv=none; b=Op4xjNtuVFO/tTCA2WQYhHLNqXh9kysn4tpwAd3/1LENqlvERsSBq5PE2Zo0QvHRuFz9DzO8eMUL9uDFARwK5gru74P/UNEDK23uSnAmcll68MnZv4QYlrr9VRmseZAIzr976veUVO/iveqZC34Oz26DMP7nYWX7xttukLLLaao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734297988; c=relaxed/simple;
	bh=ycQXUsWGD8UNsfE/tjbBy9XnS8Vhb5OJSquEAyMFQnY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bfllIxN6lW6Vw+ABX0DM82mtKjODVBzMeACRfRtTyGFm/2uTMxUqm6jsa9I8wgkm9yTqIixiX7H8mVBzdpXhc3H7Gio5laFo4j17dSxVSJdPaJppF7wcaq+Jh6B12aSfaceJYEy0owJYz/XnXwMZZYqxt9+KDUhWp9p7jzuh8EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DAB0E1424;
	Sun, 15 Dec 2024 13:26:52 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 763DF3F720;
	Sun, 15 Dec 2024 13:26:23 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH] arm64: dts: allwinner: h313: enable DVFS for Tanix TX1
Date: Sun, 15 Dec 2024 21:25:33 +0000
Message-ID: <20241215212533.12707-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.2
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The merging of the Tanix TX1 .dts file overlapped with the introduction
of the CPU OPP .dtsi file, so the TX1 wasn't covered by the patch
enabling DVFS for all boards.

Add the missing include of that OPP .dtsi file, to allow the box to run
at up to 1.3GHz, and enable power saving by using lower OPPs.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h313-tanix-tx1.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h313-tanix-tx1.dts b/arch/arm64/boot/dts/allwinner/sun50i-h313-tanix-tx1.dts
index bb2cde59bd03..622f4290057a 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h313-tanix-tx1.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h313-tanix-tx1.dts
@@ -6,6 +6,7 @@
 /dts-v1/;
 
 #include "sun50i-h616.dtsi"
+#include "sun50i-h616-cpu-opp.dtsi"
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
-- 
2.25.1


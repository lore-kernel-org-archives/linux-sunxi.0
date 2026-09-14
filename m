Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DA1B33ADBA
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Sep 2026 21:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789419966; cv=none; b=q5cqpAii9t5axhN8lcJ/7yxLZPgFOcnAzrWDDL8RpKzfll5xdHSJpL533J+Ku+/xBypDGGulRM09oqoxiDJ5hI5QgAv3EM6mJOS6hSPIcyalNYtmDPVIOePMhka5suST6WvfI0aimAAdkl9V8LtDuqXvJ9FXJsd8Ke2X31IVrcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789419966; c=relaxed/simple;
	bh=GPDglMrUvp1/a5hB1mzHog+aNgREgnTzuWpD07EduTk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ObmAovas1uIIhRnRXYkEntrrgw4tCuUHmEl/kClsOobKpNHNNlhnu0cRTzZmisHLlXxWi3sKr2hJ/mE7/f5YoYPVqs5FOz/UVgf60KU1VHHXoncKW3S/SB80gD5XDg74tDrMEM0nOMsppPsD4vZjjQzjRSMEqt9qG9y+T6JOn04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=DCHpIrmR; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="DCHpIrmR"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 398A91CC4;
	Mon, 14 Sep 2026 14:05:59 -0700 (PDT)
Received: from ryzen.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E673A3F882;
	Mon, 14 Sep 2026 14:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789419962; bh=GPDglMrUvp1/a5hB1mzHog+aNgREgnTzuWpD07EduTk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DCHpIrmRrJTLFPVTDAmorET/6Uwk8U3gRP3sOr+MtePKQwJbMh1tRCeX/G5AIBHJT
	 6uwGalCbcpQWywvWmcLwONB4g8wf+x4wr75G/bntdgI9ZRrVGW+SBhMUaWhQGOdiY4
	 Ili0T03KVTOujjACPoFGLhHEKNAo8+r3M/VAGg8g=
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Paul Kocialkowski <paulk@sys-base.io>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 1/3] dt-bindings: vendor-prefixes: Add vendor prefix for Teclast
Date: Mon, 14 Sep 2026 23:01:13 +0200
Message-ID: <20260914210115.28151-2-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.4
In-Reply-To: <20260914210115.28151-1-andre.przywara@arm.com>
References: <20260914210115.28151-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Teclast [1] is a Chinese company manufacturing tablets, laptops and mini
PCs, using chipsets from various vendors, covering both the x86 and Arm
world.

Link: https://www.teclast.com [1]
Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba20029693734..6da733d465a31 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1722,6 +1722,8 @@ patternProperties:
     description: Thundercomm Technology Co., Ltd.
   "^thwc,.*":
     description: Shenzhen Tong Heng Wei Chuang Technology Co., Ltd.
+  "^teclast,.*":
+    description: Teclast
   "^ti,.*":
     description: Texas Instruments
   "^tianma,.*":
-- 
2.46.4


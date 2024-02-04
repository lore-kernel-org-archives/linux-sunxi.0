Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07AA418E2A
	for <linux-sunxi@lists.linux.dev>; Sun,  4 Feb 2024 09:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707039861; cv=none; b=e2yGtvGi08XmqyPy5jG56ieazDB+zwtnz38vA6m2OzugmH0FfiyrExn1NnjdOowRPFrizR8r0C1tHy0Gmb46jra9xGJRMWYCV0Z9DlrphwdXlMh35d+75rSTcrsYrVPsmyon48ocbn/uqPKmB/tQVxveg9lX+EQcRM8B4wOUD5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707039861; c=relaxed/simple;
	bh=SzIk5uOwPqCcEa3otgEgu+zY4KWuvVCHpUZUkQTHmUI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZHWAlIdri8c5QQTRs6SZRqdWjHIU7W1C+5in4PCPwJeuNCAoKCgxOpssneLXNKYvfvbpzNFs68DbyLEK1lMEVDNpJwfd/f0RDwZCCWeL/ZDEVC5pEgZBWcJwQJV6e2BWRT8B7/rsKHkACoKVeQ0QrSAwJsyiHY3uNcYcPFN2TOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 75253113E;
	Sun,  4 Feb 2024 01:45:01 -0800 (PST)
Received: from e110479.fosdem.net (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 104553F738;
	Sun,  4 Feb 2024 01:44:15 -0800 (PST)
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
Subject: [PATCH 1/3] dt-bindings: vendor-prefixes: add Jide
Date: Sun,  4 Feb 2024 10:44:02 +0100
Message-Id: <20240204094404.149776-2-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240204094404.149776-1-andre.przywara@arm.com>
References: <20240204094404.149776-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Jide tech once create the Remix OS Android system, and shipped it on
some custom hardware. Add their name to the bindings.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 1a0dc04f1db4..dfb834a9279f 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -719,6 +719,8 @@ patternProperties:
     description: JetHome (IP Sokolov P.A.)
   "^jianda,.*":
     description: Jiandangjing Technology Co., Ltd.
+  "^jide,.*":
+    description: Jide Tech
   "^joz,.*":
     description: JOZ BV
   "^kam,.*":
-- 
2.25.1


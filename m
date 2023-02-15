Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B2B539D
	for <linux-sunxi@lists.linux.dev>; Wed, 15 Feb 2023 20:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=bld27SLtxMpempS0AaLEC71g3ll0gb2LqYxVJXQMgP0=; b=C/vR31YwgO+/9WE/MfvwDcX6nl
	MnOQzf4x8MbdFEQB/AixPa6/aCOBB7KsaVZE7peLeV6+ZIKafhWfRj9lxwMIFYxurdyU9kYfJKIrP
	Uu0BDr6K9IkhzsCwoNahkucR+eXdsGS3WUdCiI0O0KwfR7yP3PkJ7pFzMbeOHWrqJhqbTR8OgMRon
	jg4br3a3eYwwIS445ahRgsRKRW4AJaTEaIE4Bp3Zhm2U/wMUslrHgT8ORSfhG3kAgfZhkQk+A3SDv
	GaKcCll97bTezdz5+VafSytGoEg26gw8CC5gUvEDHA1RhHgfZydx6votexyfD7BuVEgs9Jry2ywro
	ddFwyiOg==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <bage@debian.org>)
	id 1pSOWj-002j5f-2I; Wed, 15 Feb 2023 20:37:17 +0000
From: Bastian Germann <bage@debian.org>
To: Wilken Gottwalt <wilken.gottwalt@posteo.net>
Cc: Bastian Germann <bage@debian.org>,
	Ohad Ben-Cohen <ohad@wizery.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Samuel Holland <samuel@sholland.org>,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org
Subject: [PATCH v2 2/5] dt-bindings: hwlock: sun6i: Add #hwlock-cells to example
Date: Wed, 15 Feb 2023 21:37:07 +0100
Message-Id: <20230215203711.6293-3-bage@debian.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230215203711.6293-1-bage@debian.org>
References: <20230215203711.6293-1-bage@debian.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Debian-User: bage

The dt-bindings tools will compile the yaml dt examples
and this prevents an error about this node not existing.

Signed-off-by: Bastian Germann <bage@debian.org>
---
 .../bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml b/Documentation/devicetree/bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml
index 01b1bbb3061f..38478dad8b25 100644
--- a/Documentation/devicetree/bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml
+++ b/Documentation/devicetree/bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml
@@ -48,5 +48,6 @@ examples:
         reg = <0x01c18000 0x1000>;
         clocks = <&ccu CLK_BUS_SPINLOCK>;
         resets = <&ccu RST_BUS_SPINLOCK>;
+        #hwlock-cells = <1>;
     };
 ...
-- 
2.39.1


Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.154.54.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C68D51F
	for <linux-sunxi@lists.linux.dev>; Wed,  2 Aug 2023 22:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=biqu3d.com;
	s=tfld2305; t=1691014043;
	bh=IyuQtdrcOrT2L9y8aZe6ItaRI/HFLInO7ui6Yh133S8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=kudDl+1ciuFYRtwVnNAzmOsaWVYYWszVylSA8yTKKQLNlookgSWuLOEzNC87HeY9v
	 JpECC+OV5SEXpxt5fDb2mC/7iavnZoydcbzUEbjCVEk4qRIKNZySV436zks+Ah6L2L
	 hj+vrgBcgJ6uP8gdNskyzs5RLKwT2g+wO0JWGRy8=
X-QQ-mid: bizesmtp89t1691013827t3lhs1iz
Received: from TimeMachine.lan ( [178.41.211.221])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 03 Aug 2023 06:03:33 +0800 (CST)
X-QQ-SSF: 01400000008000301000B00A0000000
X-QQ-FEAT: q+yjhizk/eI0E/AJXypCJ5+jUHPz2Jl9cX52hkDc0l5X4XJW9Z87Q2DngIJm5
	f1gpuwqdC7BpShAsFhFhv3sZm/mWCq8s712FcfUvwAGKwGRrK6XTkvNK56e9dCkNZgk/iHH
	Bts88aNx9hH3Op12Gq+PBX5e+YtVopjsXSlTdqXFV5ncVp1WNDZ2QBKPFco/1sGd1zjQ2Pw
	JCYMrYEmdBJm3UaL3ZV5gLM0jYHUhvMqe13Fcadz+fIsPAZPy8pAp02e90jJ6dV7c8XTCHJ
	et7nSOTSYYmAubxJUaGBP7JW1ucvxYqXCx384zNj0BoNGsfvFImz7vVTk89uRQCZ54lvUvw
	xAYdSo/Pfwjk9mucXCGxtGyTI1zf/NKewW4JxakzGnsvt4y1Qc=
X-QQ-GoodBg: 2
X-BIZMAIL-ID: 2213657009978695455
From: Martin Botka <martin@biqu3d.com>
To: 
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Jami Kettunen <jamipkettunen@somainline.org>,
	Paul Bouchara <paul.bouchara@somainline.org>,
	Martin Botka <martin.botka@somainline.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Icenowy Zheng <uwu@icenowy.me>,
	Ludwig Kormann <ludwig.kormann@ict42.de>,
	Heiko Stuebner <heiko@sntech.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Chris Morgan <macromorgan@hotmail.com>,
	Jagan Teki <jagan@edgeble.ai>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/6] dt-bindings: vendor-prefixes: Add BigTreeTech
Date: Thu,  3 Aug 2023 00:02:34 +0200
Message-ID: <32C9B4A9A60647F1+20230802220309.163804-2-martin@biqu3d.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230802220309.163804-1-martin@biqu3d.com>
References: <20230802220309.163804-1-martin@biqu3d.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:biqu3d.com:qybglogicsvrgz:qybglogicsvrgz5a-1

From: Martin Botka <martin.botka@somainline.org>

BigTreeTech is a company based in Shenzhen that makes
3D printers and accessories.

Add prefix for it.

Signed-off-by: Martin Botka <martin.botka@somainline.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index af60bf1a6664..1d5f86e3f099 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -194,6 +194,8 @@ patternProperties:
     description: Beckhoff Automation GmbH & Co. KG
   "^bitmain,.*":
     description: Bitmain Technologies
+  "^bigtreetech,.*":
+    description: Shenzhen BigTree Tech CO., LTD
   "^blutek,.*":
     description: BluTek Power
   "^boe,.*":
-- 
2.41.0


Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.154.54.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46C9D51F
	for <linux-sunxi@lists.linux.dev>; Wed,  2 Aug 2023 22:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=biqu3d.com;
	s=tfld2305; t=1691013937;
	bh=8CSQBeXOdEE/Zh5c0zLbjpVV1nRhTw8BsOCYPcLZTJI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=mcRvgLhF7CzdxDiMIBb+bxnpKu1yoAKZv2cd93kHKteZQfIi/MoeertDAQJvSUVbQ
	 LOHojlUldV5teNGoM9cMnxc65HcFuYcX5ceUIXI9Em2xI2gUrmzDTavAtdQ+qt39C0
	 7hyscJFR3DTs4R+BXDY5+eTUJUXrIDKE7YSzVoRg=
X-QQ-mid: bizesmtp89t1691013878t1w1c38q
Received: from TimeMachine.lan ( [178.41.211.221])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 03 Aug 2023 06:04:23 +0800 (CST)
X-QQ-SSF: 01400000008000301000B00A0000000
X-QQ-FEAT: LE7C6P2vL8Q5wpFtfg3/aaua6ZH2wPDH+4TEzZucfCDKGde4wCnPvt9mPkE/6
	0g27KuTnW6wyEu9S/klBSBfhRQqkEPTKSqVumDtpS1Q4Y03mmeNqhQOoSGFl7HbepBOrghH
	YQ4hK2wxatOHJpvJemYnT4seGsYx/9NALJJWFVjqUip7w4gz8qBpMMqMld5nLXjJpCz6H8C
	QaRO4110poRdXfaFhoV6kuWg2TMjqmVNfxg/NSzgIq/HsTzp91FvBWMQocxtEKzDf5utp6F
	Crhw5lzCA7+LtedGm8qX74EfQMolkw/lYTTkC1T56RusuRcWa5GzHKMeLXzjWNPX8ws083t
	misKiXrzllL33ppPX1BBcIsvlrxF2rpNGE18ewM
X-QQ-GoodBg: 2
X-BIZMAIL-ID: 13327976358446763736
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
	Ludwig Kormann <ludwig.kormann@ict42.de>,
	Icenowy Zheng <uwu@icenowy.me>,
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
Subject: [PATCH v1 4/6] dt-bindings: arm: sunxi: Add BigTreeTech Pi
Date: Thu,  3 Aug 2023 00:02:37 +0200
Message-ID: <060E0BA986DEDEBE+20230802220309.163804-5-martin@biqu3d.com>
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

Add name & compatible for BigTreeTech Pi board

Signed-off-by: Martin Botka <martin.botka@somainline.org>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index e9e46434dd1a..2b527653a303 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -162,6 +162,11 @@ properties:
           - const: bigtreetech,cb1
           - const: allwinner,sun50i-h616
 
+      - description: BigTreeTech Pi
+        items:
+          - const: bigtreetech,pi
+          - const: allwinner,sun50i-h616
+
       - description: Chuwi V7 CW0825
         items:
           - const: chuwi,v7-cw0825
-- 
2.41.0


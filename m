Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B2D2F41
	for <linux-sunxi@lists.linux.dev>; Fri, 25 Nov 2022 23:47:04 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 5A05E5C0102;
	Fri, 25 Nov 2022 18:47:03 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Fri, 25 Nov 2022 18:47:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1669420023; x=1669506423; bh=oc
	0vqOxK1/ubxsXqJRc0i0XePMXd2FLoXsdGEJA3VdU=; b=cDOSrn7HJKWbmYj7r/
	9yI5ULM0q+StizVKU0Eq6TuZgOr038kWzW+LwnaREwNYbe0IqAKGYiVZ0Hzoxtuw
	LyfpyF2E9cDwqxcAVJrjnRv8Zfpitsi38QNyLhKhh5zwd3ZypU8XGS1npbrxAfg0
	TWFV7k9ZLIy/qADf88zj+84/J/MePN+ogfPYuvEIIlevFXbpCgb4iDv//FO1foYg
	JzXSLDU9DHduLBeAdE6M/LJg5LiMMwmAiI3Oo0TmCG3lWjWK+4NUCwkYFW7FhXKL
	1MDUIwJPOjdZvQDoS2RGcImJPh5P5pIlLd4bJdg5LC4mXPiDDbtYUOpFWnmaZjiV
	/DAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1669420023; x=1669506423; bh=oc0vqOxK1/ubx
	sXqJRc0i0XePMXd2FLoXsdGEJA3VdU=; b=p0wuJvSCFfV8OqAkErXyz6sNTILUa
	Isyr6j1qXYU5XbxNbCrw105TVGMhovDkZJneWU3glcnV/15GYBJ5WbQru6uAksbS
	UZ0tIncqCEPzYDcEKwFFFPQFyKmMJSVv1/BtEi83WJov7o2gnURiX7yzPyvnAvYg
	0bBbw78Q1ux53e5FrZEefUXk7mHi29oJ6X7deAPhBYC5dZVBA8aVu3rD6KiJs4jM
	Lhq1mhFprenNOte4rRSlFzAxa4WZSkX0XzwLR7UqVlc1nu2hbcoWKrQqAWgAF50b
	D7vipOHt9N2++N3Sj/EB+zMED+CUjtN0vyHIFIh5IbnjcsMA8hJXmNUUQ==
X-ME-Sender: <xms:91OBY_lnoVcXCG2ckxn2_ffmkzT_dd7n_NMq1QN04KWQuIQ1cueuPQ>
    <xme:91OBYy0XpWJzNtTTSmcHPiTVI0mj7julC6p56LaahzLrC7SOalnkw2KLzKT_k4Y7K
    ulbDkfOM1L1YXeA_Q>
X-ME-Received: <xmr:91OBY1qk-a3rApzP1B2p88dd2MqyQjj3dCalGe8S8uuRY6MEiIF-jIt5oI8nBrlhA-As2_tx_453lwg170BAK51PA08KpYnd4NkNBDOSALHfKeAGpDB62c0HIdPN9WDZ52o2CQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrieeigdduudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
    hrlhcuvffnffculdejmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddt
    necuhfhrohhmpefurghmuhgvlhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllh
    grnhgurdhorhhgqeenucggtffrrghtthgvrhhnpeelvedtvddvveeikeeiffejgffgueei
    teeileevlefhueekjedvvdfgieevkeelfeenucffohhmrghinheptghlohgtkhifohhrkh
    hpihdrtghomhdpmhgrnhhgohhpihdrtggtnecuvehluhhsthgvrhfuihiivgeptdenucfr
    rghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:91OBY3lCzzB5ZtRN5gFkHsOwpJOTPbbGt0T7HWQMwQc5QxlxiPsf1Q>
    <xmx:91OBY93Hx2_F1fIClOG1ZYCndOe2mI7xOGmipAHBNmsUFBsn42MuZg>
    <xmx:91OBY2tDQ3yxaioSF5X9dxplY7LV0Tv0I7k-ZP3aww0GRDdjLIsHMw>
    <xmx:91OBY4G7255r_PrbDHaXUzNQKKvzrFvsVoR1v6tVz8dfYVDHrdLInQ>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 25 Nov 2022 18:47:02 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-sunxi@lists.linux.dev,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor@kernel.org>,
	linux-riscv@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Jisheng Zhang <jszhang@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	Samuel Holland <samuel@sholland.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	Christian Hewitt <christianshewitt@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Stanislav Jakubek <stano.jakubek@gmail.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v2 02/12] dt-bindings: vendor-prefixes: Add Allwinner D1/D1s board vendors
Date: Fri, 25 Nov 2022 17:46:46 -0600
Message-Id: <20221125234656.47306-3-samuel@sholland.org>
X-Mailer: git-send-email 2.37.4
In-Reply-To: <20221125234656.47306-1-samuel@sholland.org>
References: <20221125234656.47306-1-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some boards using the Allwinner D1 or D1s SoC are made by vendors not
previously documented.

Clockwork Tech LLC (https://www.clockworkpi.com/) manufactures the
ClockworkPi and DevTerm boards.

Beijing Widora Technology Co., Ltd. (https://mangopi.cc/) manufactures
the MangoPi family of boards.

Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Samuel Holland <samuel@sholland.org>
---

(no changes since v1)

 Documentation/devicetree/bindings/vendor-prefixes.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 592e43911a07..f2c67b7418e4 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -262,6 +262,8 @@ patternProperties:
     description: Cirrus Logic, Inc.
   "^cisco,.*":
     description: Cisco Systems, Inc.
+  "^clockwork,.*":
+    description: Clockwork Tech LLC
   "^cloudengines,.*":
     description: Cloud Engines, Inc.
   "^cnm,.*":
@@ -1430,6 +1432,8 @@ patternProperties:
     description: Shenzhen whwave Electronics, Inc.
   "^wi2wi,.*":
     description: Wi2Wi, Inc.
+  "^widora,.*":
+    description: Beijing Widora Technology Co., Ltd.
   "^wiligear,.*":
     description: Wiligear, Ltd.
   "^willsemi,.*":
-- 
2.37.4


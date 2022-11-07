Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C32E23BF
	for <linux-sunxi@lists.linux.dev>; Mon,  7 Nov 2022 05:35:57 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 3B67E5C00E9;
	Mon,  7 Nov 2022 00:35:56 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Mon, 07 Nov 2022 00:35:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1667799356; x=1667885756; bh=U/
	ywLtSrQavtT5ylYj1CEGcLt1CRHte7fNbDPyPxvAk=; b=kj9zvcWvXLzQX0KtSa
	JWQLIBtGCuKms9tsRopHUP9j6Y3ew0TqAZBnFMiTkpHWWx9IFviqpHTzo8US8wpW
	ivz/UIH76R1Fgq9280ALOQkIVyt+PKEHlFlhsy29+3RdBHnE9DiYl/JCZTa47SrG
	3aAbedVTdqRs+xIjFCBHthcTZOmNARDe+5gCxD5IW0VipW4MYwLfHdpTeyD0mlo7
	Ek/6HnW+KD7//lnfXzWx0dVq3+nnfidqoPABI0qyWJ6EIvW16jvHZcFVoiMqg2O6
	1wzTv+dXAWHuBGHUHl+AQHrkx0vGaz4/rDNsTLLnQsW+NNnAlzD4ut0aRvJVZIaJ
	EEZw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1667799356; x=1667885756; bh=U/ywLtSrQavtT
	5ylYj1CEGcLt1CRHte7fNbDPyPxvAk=; b=MI/oacq5X9xPoxAcrHyX7aHAfbAgX
	ZdKRERY8+WbwjFpWaXAS0ZJ5z5SNR726lYEI7S7aK+ITJj1laohrLgKoiJTpUf1w
	XeJIYwvsoh7kloBrW134DLCv1tO0pNaRaSqedTFhMS9+5mwzXMn12SEupVQulu4j
	P54gHXBdNUAb7S6e7Q+UBEygmgnB4Gc6UwQfTiIxrGmEkUvvSVcH73UPs6/JhsaR
	9Hl5OfMtSsY7Bqn8NH9BaDpTx8hXV6lpePG6gQ9cOn9u7MkMxBTigfjTyKfCzOOc
	deQYIMiMxsdabLELYwTTHjDvEcDI+RcNxPI72dIMq8z7ZDeHbsCfyAEew==
X-ME-Sender: <xms:PJloY84Li1upK7MXXoogLbX9lQ5jAudyxv7gpBLQvB1nRZkcvxwwWQ>
    <xme:PJloY942rbQqJ9vQ0qw3YmoEsIoe9g9by7bmJJm3dQlalzorJdzdxa-E1rVQxJmMu
    HrOxksYigaZctJZ7w>
X-ME-Received: <xmr:PJloY7coFJ3i5kBvBEbq6Jdjoyto76iwA0yeyvnJPsXeg9kIvqNJMrNRC7LMJlrW6OgY0b073GbabKJPxgTF8lxnBu9gwmZwVLyfteWrDbY-I7ic4OZNWtRYwDYGyE3dDWT2Jw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvdejgdekhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
    lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
    frrghtthgvrhhnpedukeetueduhedtleetvefguddvvdejhfefudelgfduveeggeehgfdu
    feeitdevteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:PJloYxIswX2kqggjmAtsIOsJDbGpsAMl89IelxJzSGyGCdavls5bnA>
    <xmx:PJloYwK0s5Eg2-UA5M-YZI96UioCKGhuNplt6M8pmOVo1-jAqMVKrg>
    <xmx:PJloYywN_KttcXt_KPa6Q5szmGopgepfYHq1Homv9w7SadWHAtr5Zg>
    <xmx:PJloYzYLtRbWGWcUYBA1qH_inYA5bxFxUTm9svXJcoNQi6n-HlVaSg>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Nov 2022 00:35:55 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maxime Ripard <mripard@kernel.org>
Cc: Samuel Holland <samuel@sholland.org>,
	Daniel Vetter <daniel@ffwll.ch>,
	David Airlie <airlied@gmail.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/4] dt-bindings: display: sun6i-dsi: Fix clock conditional
Date: Sun,  6 Nov 2022 23:35:49 -0600
Message-Id: <20221107053552.2330-2-samuel@sholland.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221107053552.2330-1-samuel@sholland.org>
References: <20221107053552.2330-1-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The A64 case should have limited maxItems, instead of duplicating the
minItems value from the main binding. While here, simplify the binding
by making this an "else" case of the two-clock conditional block.

Fixes: fe5040f2843a ("dt-bindings: sun6i-dsi: Document A64 MIPI-DSI controller")
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Samuel Holland <samuel@sholland.org>
---

(no changes since v1)

 .../bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml b/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml
index 7910831fa4b8..bf9bfe8f88ae 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml
@@ -78,16 +78,10 @@ allOf:
       required:
         - clock-names
 
-  - if:
-      properties:
-        compatible:
-          contains:
-            const: allwinner,sun50i-a64-mipi-dsi
-
-    then:
+    else:
       properties:
         clocks:
-          minItems: 1
+          maxItems: 1
 
 unevaluatedProperties: false
 
-- 
2.37.3


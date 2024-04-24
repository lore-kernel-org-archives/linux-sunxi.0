Received: from fout8-smtp.messagingengine.com (fout8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98CC615A49B
	for <linux-sunxi@lists.linux.dev>; Wed, 24 Apr 2024 11:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713957199; cv=none; b=ULVtVi7UFiQFVWOMX7Od4ZM8aW4JiQeq/PbfHl0gkz1GYCtcIsP+N2XIV8QDDrI0IQjj7muRKQBjTO7BEpKHWqT9cQBZQOfrsWQ/Ve6llkrJZ7fTc4iv22/eG0EH6OO/Y2PlQViK/gVo8hVgeHelSNzuXawT5jpp2fldyiYTG00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713957199; c=relaxed/simple;
	bh=CysdE3EhypL7GVo8RuquCABJ2inZOTRjeRyMjAhRqGc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YuBlMI3d3W84r78/rwZ9UTRurLzHyBvypIT31/vaJhazP8N5lITRaBWQrYtzrfw6M9YN/BjIJzVE5/ztJ0Z0CoH7Zp2YdfrSm2l+790ESJ93dvdu4Fs5aJ96QJ8exc46C5fA+UXwfmtwfp9Zx6baWSooo6B+7WNr2RrJUHexI+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=wnDDTNut; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=LNTHSBhA; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="wnDDTNut";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="LNTHSBhA"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailfout.nyi.internal (Postfix) with ESMTP id AFE8B1380124;
	Wed, 24 Apr 2024 07:13:15 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Wed, 24 Apr 2024 07:13:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1713957195; x=
	1714043595; bh=zxB2kH+kdXdfo6Gn/8m+vqnDdwmgorJPCP5uSjnxdas=; b=w
	nDDTNutcx15YWdjH4kK9EecWYe7O32+dmvHl8dEgoaY3FU9xtKgK4SKWtLQIOIff
	uJiuOoY7WFd8Lv2ZONM7CDs5acB3f2jXJ+s4apS+NNUvhVxYkoqKigBK3w0zfUBb
	ajojnmgZ0H4PW2VJsksPmflppkZwzYaYk52irvjYGUF0JPyftj3n1G8FmJcKE/vi
	uAC2906bmVE0RA+jlZF01/cg2mfHe2zmoEOo4O9a6qvcbGI5ULa8iKaNR4G3UTLJ
	9GMOTzBpb/6RgIWXcR8bDJ9+Mr4QOvRL1cSjRKK9uA+Hs/TKMeCTqheSkBVRmvhX
	8/OZXGPTX4ZloFEhcqcEA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1713957195; x=
	1714043595; bh=zxB2kH+kdXdfo6Gn/8m+vqnDdwmgorJPCP5uSjnxdas=; b=L
	NTHSBhA2hZZ/EU92mbrVuoZn+emWQ+gyQbtLzQndIX9wkJd/bRUHxMu4hgBIqfam
	Pm98Aqfw5hMg9w2INAVCi9RT32eEppA4Jt1hkiESPs+aRlpVl0ZGgc7zjN/+EGeM
	0vFb+zke4SgYonNhkP5ALSZRtyE6+E6Kd7GU32aKJU81oCweX3cYksSV7MB5QsWP
	Lr3HT2y5xf98t7eSt4Gp96RSt8N7iHzJH+M3BP9BI4OjvgTGrmEEyfAkDlPmmRZ1
	pClRaRWJTgLDBci3+xbW/YVtCfrc1G66Un408kU89O2WPJH2nmuUujgONMNKxaHg
	E42UOtGbKKpVZXk8upWQA==
X-ME-Sender: <xms:S-koZstP9WKYR0qQzj2jOn5s0h2u12t5FGlYuP-cPKx2LNcc1aJgDQ>
    <xme:S-koZpd3PWkOEEnCW3zfwe0wAEfO9L7coQNTjUQBXJsT9tIBktx0ulfm8wb5ZO2rl
    xaICJ0ornyiTB5hSw>
X-ME-Received: <xmr:S-koZnztMTH1KNfSJ6fljiCModsUuhOGnBSnRMAsact1dYMGgK6ibqXI5ZGf1nQEliyg5pn5Yp8XXP95O3gZ1h_3jXRZsT2EswN5kKjUJksPFHfR>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudelgedgudefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheptfihrghn
    ucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrdgtohhmqeenucggtffrrg
    htthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieelkeevueetffetteduffevgeei
    ieehteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hrhigrnhesthgvshhtthhorghsthdrtghomh
X-ME-Proxy: <xmx:S-koZvPx0ogaV96fEH3dCAgogJI5sSXmrD2lw7JQiyeBATeklV0wgg>
    <xmx:S-koZs8aeclMgU5rl4KtlS7HYMNnKapcJ27tlQKL29kFE9sYSeCwag>
    <xmx:S-koZnUAYVDc15arJNsGH5A2SICKQhVLpocibxAJki1OyQcQvvYmVw>
    <xmx:S-koZlfhL7SntxWAnjnJCAwBu4OIjyLsAo64O0JV37M5OcDezHIdNQ>
    <xmx:S-koZnXlAoJVy0E9UREj3YINFbwoyGBH44BkmQe01i8A5W0EFrXQzfpi>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 24 Apr 2024 07:13:11 -0400 (EDT)
From: Ryan Walklin <ryan@testtoast.com>
To: Andre Przywara <andre.przywara@arm.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Chris Morgan <macromorgan@hotmail.com>
Cc: devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Ryan Walklin <ryan@testtoast.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 1/4] dt-bindings: arm: sunxi: document Anbernic RG35XX handheld gaming device variants
Date: Wed, 24 Apr 2024 23:09:44 +1200
Message-ID: <20240424110947.9057-2-ryan@testtoast.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240424110947.9057-1-ryan@testtoast.com>
References: <20240424110947.9057-1-ryan@testtoast.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RG35XX 2024: Base version with Allwinner H700
RG35XX Plus: Adds Wifi/BT
RG35XX H: Adds second USB port and analog sticks to -Plus in horizontal form factor

Use three separate device descriptions rather than enum as per existing sunxi binding style.

Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 09d835db6db5..fc10f54561c9 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -56,6 +56,21 @@ properties:
           - const: anbernic,rg-nano
           - const: allwinner,sun8i-v3s
 
+      - description: Anbernic RG35XX (2024)
+      - items:
+          - const: anbernic,rg35xx-2024
+          - const: allwinner,sun50i-h700
+
+      - description: Anbernic RG35XX Plus
+      - items:
+          - const: anbernic,rg35xx-plus
+          - const: allwinner,sun50i-h700
+
+      - description: Anbernic RG35XX H
+      - items:
+          - const: anbernic,rg35xx-h
+          - const: allwinner,sun50i-h700
+
       - description: Amarula A64 Relic
         items:
           - const: amarula,a64-relic
-- 
2.44.0


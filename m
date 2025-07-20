Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10A61E51EC
	for <linux-sunxi@lists.linux.dev>; Sun, 20 Jul 2025 08:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753001484; cv=none; b=fmpUYLRFV9/klfB2Z8tm/gyRlFabacX2DCAnJkn2QpeXOx74tmgAY/qeuLpmyD60JaFYG0j5X0pcxaMuSWNaF92rdfNDvysrM4VUdjnkbLsKyn1JcoHziGXF+o2Mua+PQjGc6oQBjFjxG/nOLekKMtwV1Jd+7tWF/I49k7iEUts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753001484; c=relaxed/simple;
	bh=tooDNa1YspogcOFTMTXgTuMgtT+jql4at8socFhjjlQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=usf+f+sO0sKOCo/pTmiqnEpmTRW8x4SpxrL/v2CFH6YxYQ3l2g2AZJS6S46iM5eXv1AXKevp3roZBfS/QIq0kqJlNhcWh1EBRLEsKV5/kjr8Ud4Y/9MdKLg0av7FXePBPNS2gFwFwTRxhibRbGZs5WhK/LCGBC4K7Vm2hbWk7BY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=Krau3LBY; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ELuXtyxe; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="Krau3LBY";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ELuXtyxe"
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 599377A015F;
	Sun, 20 Jul 2025 04:51:20 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Sun, 20 Jul 2025 04:51:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1753001480; x=
	1753087880; bh=0Udlp4ocv8KpmIVXbeOHVNYW3cA1AnHLAImNbn95Z4I=; b=K
	rau3LBYoueXNHUOx/gE6C7dS8wdOmCgr+85KqQVn6LPvIJjxA6qCU4/3XJuk8dAB
	3pnqj2uZ9OgC2PFrEob84DG0d+/kFEfRlqZKChM9SubL0Er6DRtSsn4LPJ8+5OJU
	0F89JCbgEwu4Btbe3thYH3c4mPcpQclzLlMV5yhPswthvHGHXUm4KWfI/JKR2W+Y
	REUSqhIUsRaTdVKT8v0QDeacA23axZWNCT3ZxoUb7JY7PhXz7e3brDqI8rGNctjW
	Cw8eF73zBiBMSSSijcJJ5OwK6ygDpItBOndH08tP4jDXbpg5v1atjlnc41/Frw41
	Tr6lFldPDN869dMJj648A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1753001480; x=1753087880; bh=0
	Udlp4ocv8KpmIVXbeOHVNYW3cA1AnHLAImNbn95Z4I=; b=ELuXtyxeQSEI8FrXK
	FiYoOlmkmviYMMxyVYERgY6H9gS1Vqhhrje7H34pANINJasEXTBaff/TuSv7TW1n
	ZkH60GzCyX4q78epp0sXAvIwBbWA1z3Rxtd+SGgtzJ/bgwch+wPCSwo/K57jQH+E
	Tr07bHJgp6qtf2wBfM7exoMA2ykmhMos095o/4cLMzmsoVf/AjU6MgZUZJsgbCQ7
	kxm1xRxAw0QU5PanbJVUjsx1yM2teJAINmz5Fk6J02zOQmtIDBhw3soy+JizczCi
	r1nIStWNC1OmDiAWFkytK+cTIBh4A2i88922lc0tGhE6k8uZVPp4+716WkbVIA3n
	s4kQA==
X-ME-Sender: <xms:B658aL5GVUVwgP_wUiXwFZyeVPxQOO-klUmfKASnP7WnZUDCMCNZFg>
    <xme:B658aLzuAZS2M-eK3MvwsXaulTz23z1QbseHNxQaenxJRpSliexDF-wqhXpkgecmO
    bH7KsF4-VwU6YoRiA>
X-ME-Received: <xmr:B658aMrZBbDf8NqHumHzHSp4XdxUZnR0I_Jg4-FpouqIsYJWy3xmt_Hqzx6fhdYVmYAyFFJCK1tVM9nqLMmlQDt-2d7QcA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeikeejiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefthigrnhcuhggr
    lhhklhhinhcuoehrhigrnhesthgvshhtthhorghsthdrtghomheqnecuggftrfgrthhtvg
    hrnhepffehieffgedtgfffjeetveegfeekleeileekveeuteffteetudffveegieeiheet
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprhihrg
    hnsehtvghsthhtohgrshhtrdgtohhmpdhnsggprhgtphhtthhopeduiedpmhhouggvpehs
    mhhtphhouhhtpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgu
    theskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfigvnhhssegtshhivgdrohhrghdprh
    gtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghilhdrtghomhdprhgtphht
    thhopehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgpdhrtghpthhtoheprghnughrvg
    drphhriiihfigrrhgrsegrrhhmrdgtohhmpdhrtghpthhtohepmhgrtghrohgrlhhphhgr
    kedvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepkhhikhhutghhrghnleeksehgmhgrih
    hlrdgtohhm
X-ME-Proxy: <xmx:B658aN10YPYrjfe8o-N3-zsj3UfpC9ERSTvmFHAXFErcRdRhiE5npw>
    <xmx:B658aFDOBC6NC2fbcOocCvLxswbGShz7oMUTha-LTKwOzI97DeHSjw>
    <xmx:B658aOO91FledQP2aWMUMBLKy-pfrJ3Us8Hk8zmetSwn4F929-fd2w>
    <xmx:B658aJSV9PYKHAY1uyPLWdPs47imEK-SqMzJU56UoFa-TkRSfkTFfA>
    <xmx:CK58aI3SvIxdFtBWEV-8WcS45Z3RfXcvuAmpCgKuUXfO-dA_jS2Erv5o>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 20 Jul 2025 04:51:15 -0400 (EDT)
From: Ryan Walklin <ryan@testtoast.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Chris Morgan <macroalpha82@gmail.com>,
	Hironori KIKUCHI <kikuchan98@gmail.com>,
	Philippe Simons <simons.philippe@gmail.com>,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	Chris Morgan <macromorgan@hotmail.com>,
	Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v2 02/12] dt-bindings: allwinner: add H616 DE33 bus binding
Date: Sun, 20 Jul 2025 20:48:40 +1200
Message-ID: <20250720085047.5340-3-ryan@testtoast.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250720085047.5340-1-ryan@testtoast.com>
References: <20250720085047.5340-1-ryan@testtoast.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

The Allwinner H616 and variants have a new display engine revision
(DE33).

Add a display engine bus binding for the DE33. Note that the DE33
requires 3 register blocks instead of 1. To keep things simple
remove the maxItems value for registers for the child nodes and instead
rely on the bindings for the child nodes such as
allwinner,sun8i-a83t-de2-mixer.yaml to enforce the max values.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 .../devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml  | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml b/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
index 9845a187bdf6..9d9418c40b95 100644
--- a/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
+++ b/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
@@ -24,7 +24,9 @@ properties:
     oneOf:
       - const: allwinner,sun50i-a64-de2
       - items:
-          - const: allwinner,sun50i-h6-de3
+          - enum:
+              - allwinner,sun50i-h6-de3
+              - allwinner,sun50i-h616-de33
           - const: allwinner,sun50i-a64-de2
 
   reg:
@@ -47,9 +49,6 @@ patternProperties:
   "^[a-zA-Z][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+$":
     type: object
     additionalProperties: true
-    properties:
-      reg:
-        maxItems: 1
 
     required:
       - reg
-- 
2.50.1


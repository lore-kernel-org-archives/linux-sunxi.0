Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44FBB68
	for <linux-sunxi@lists.linux.dev>; Fri, 19 Nov 2021 05:27:07 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 784393201C3C;
	Fri, 19 Nov 2021 00:27:06 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Fri, 19 Nov 2021 00:27:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=fm1; bh=fztnz9ebH2Z8X
	AncDvDDQXIXEHRz7cyMJmuXrcHT3Jc=; b=DjZ80vijCglKJw/oYsjzdGA5NoAzv
	FoNkKEAKzmFnMxN1DcAYFdySK2FAIg8z2pIcQ64HGJK0DQVFPzmYGJQ5phVYyaYu
	p/1infxJC0XI5L3Ay4L3LyhIt7/nlqLJRb4BK42SLqyATwm5pjdR4rzudeY3aMQ7
	tv4URKa8+WGhjcnKnPv8WLmI7dy9BQYHBkA8tRv4LH7lGHKGquIU56wcfC0TsxkP
	3WPfd3UEzLQZETFOF2NNAjrjoeHUArGOfaP7CVo6h0qZ4gZWp0EK7qI34ZwJqj9S
	7mUvIgjA5cXEe/3AHMFxjDLkYXSrl/Egk94nBu5KWtmCdocKA+hDcsdtg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; bh=fztnz9ebH2Z8XAncDvDDQXIXEHRz7cyMJmuXrcHT3Jc=; b=BH5puHpj
	/oBLjm9tvOpCZyDgG141qoQj565UV7ZNGCsGbsMzjrDuCOmYkCgjJc+U89AIkNl/
	9RehO6B5fycPimMYKbJ0qNacgJUavJudWGo73aPi38MMJ6wi/c+c51aBv/AUH6yM
	w7Fro4H9fSsLS0EEmSiH6b+1BdGl0ZHHegaQU8tK52WsPkutJ/4YHeuPs2tHeCYB
	BSOWaEr/a0J5muFsv9Is1pma0HnBdo+4Uqa+mDflvFSimjCiIo9CppBmNL30QMPO
	+ZRG2r/MKxORMEC3aTjyyxkVuZhJdFi5muwjYiCA/cbrANXjGkuHe1KgQLJHt7jj
	1R78GKCeL0m8nw==
X-ME-Sender: <xms:qTWXYaFzP0PaVV8stcUiJvEKsNUCfy4lwqBVDV3DpieyWLBQCQo1OQ>
    <xme:qTWXYbX9SCKP0o2fKjoaUZgaH7-inSB_UjPw2nt-FKhU8-jbXhkMqNERWXHzzSKRp
    5EEBZ_04OkfTV74pA>
X-ME-Received: <xmr:qTWXYUL8QP2tGA_tMbtCazlPkBai8Ad3NpqRbFV5bifdGzGpt7N-3NmcU2ooiuB9WXCHDIzcPypEWv0JcXpnRB2wMglZEv9WEFAqqlDW5Bt5oLIJuqM2CRJIbLeTzLv9I-V2Bg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrfeejgdekudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
    ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrf
    grthhtvghrnhepudfhjeefvdfhgfefheetgffhieeigfefhefgvddvveefgeejheejvdfg
    jeehueeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:qTWXYUEgCkVpdF-mgrypU-P26180rLNGJAAOftrN42sjMb5A2f9mxg>
    <xmx:qTWXYQXmedRin8WMiyThpI6x0jDxk36xDZ5a0ppLkZdo8VW4omUmJA>
    <xmx:qTWXYXMKEuByfSit2jk3OqGvswLYRu6vX9riPE-ZDJ2HTUZGanJ9zw>
    <xmx:qjWXYTFf8Q7E5YJrWuQz0lhzMNhXE_QuThqmf9mKYSFwnELG7nF1Hw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 19 Nov 2021 00:27:05 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Vinod Koul <vkoul@kernel.org>,
	dmaengine@vger.kernel.org,
	Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-sunxi@lists.linux.dev
Cc: Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Samuel Holland <samuel@sholland.org>
Subject: [PATCH 1/4] dt-bindings: dma: sun50i-a64: Add compatible for D1
Date: Thu, 18 Nov 2021 23:26:58 -0600
Message-Id: <20211119052702.14392-2-samuel@sholland.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211119052702.14392-1-samuel@sholland.org>
References: <20211119052702.14392-1-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

D1 has a DMA controller similar to the one in other Allwinner SoCs.
Add its compatible, and include it in the list of variants with a
separate MBUS clock gate.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 .../bindings/dma/allwinner,sun50i-a64-dma.yaml           | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/allwinner,sun50i-a64-dma.yaml b/Documentation/devicetree/bindings/dma/allwinner,sun50i-a64-dma.yaml
index b6e1ebfaf366..ff0a5c58d78c 100644
--- a/Documentation/devicetree/bindings/dma/allwinner,sun50i-a64-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/allwinner,sun50i-a64-dma.yaml
@@ -20,9 +20,11 @@ properties:
 
   compatible:
     oneOf:
-      - const: allwinner,sun50i-a64-dma
-      - const: allwinner,sun50i-a100-dma
-      - const: allwinner,sun50i-h6-dma
+      - enum:
+          - allwinner,sun20i-d1-dma
+          - allwinner,sun50i-a64-dma
+          - allwinner,sun50i-a100-dma
+          - allwinner,sun50i-h6-dma
       - items:
           - const: allwinner,sun8i-r40-dma
           - const: allwinner,sun50i-a64-dma
@@ -58,6 +60,7 @@ if:
   properties:
     compatible:
       enum:
+        - allwinner,sun20i-d1-dma
         - allwinner,sun50i-a100-dma
         - allwinner,sun50i-h6-dma
 
-- 
2.32.0


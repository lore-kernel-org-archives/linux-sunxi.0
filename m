Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127E91E3DFD
	for <linux-sunxi@lists.linux.dev>; Fri, 14 Feb 2025 22:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739570606; cv=none; b=fO+lNz9N55zdJuk2GcuI1yxf5cctd5Y/lmZNc3MfYXGcaAlynBPTWFIdK0H4fBblKy38GeXtGt/+QR2GzlqxSrW0WHJqdx1tCFzUIIF0I8+pk9ALKoqpANpjC94zkDYooIYOUFt54lL/uvZ1JgkzKQNiGMZ1hYKl1YeScxVm13o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739570606; c=relaxed/simple;
	bh=hMNSrAQZw5JT8eDQy3bSzHsPzON3V5WqUMY8R0Dx0TM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ussv2wG1no1Q9U5CThkmCr0V8tb2Z6dlRWD92wfWo/5P9q3CYO6wl8DOgbMxh7gOBVvVoHWxfKcQJ+5BIDSVTgCXYv37PdIjUIK+7Ob3p1LW5udEEphP2sc5xyhYmcXQQKaMaAQ8vXx5F1A+uPiZvs4rT242u/u0hydnVhB4KBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=q5LayLcQ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=oFoUqNNb; arc=none smtp.client-ip=202.12.124.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="q5LayLcQ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="oFoUqNNb"
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 210CE2540160;
	Fri, 14 Feb 2025 17:03:24 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Fri, 14 Feb 2025 17:03:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1739570603; x=
	1739657003; bh=PjC5DK6n9nLBAmpsaRuvFi1ggdVIu+83ktUYSLFQX1o=; b=q
	5LayLcQWqxxpzDzMFRmJPbIk6QfntwKo/FbTbHNkkzkRvAs++EL5f/zQCqPMDwTY
	crZ5UFAqywyk9I1Aqg+obAfJewNVvN285SvAX53BC+f5EyXRTsomUGkm29ql++OF
	aHC12J82wxhlWLkTDVvv0YkWIAVHWdljsRYIccwro2xGXdhkdC24rVJhx+WhQFmC
	31J8mY9QUZHtllb+E45dwpqlSoEaaJTL1vtPUivqAxRce6K6hcKWa8zJgahZh7Pv
	mSnM0gr6IzA0mk0MxH6kLbkO6mjNWhob5eiaqjmXf/nPh6cyQaAaLqbEggBAXiPm
	boFkaG5YQylLknpMS4Iqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1739570603; x=1739657003; bh=P
	jC5DK6n9nLBAmpsaRuvFi1ggdVIu+83ktUYSLFQX1o=; b=oFoUqNNbWjnuvB4eu
	HlUpXR04VMD8P05MXIy5n4hMUoSwLwM8qEl7ZaiGRxFmACc68SeSnIINGLJIBJEK
	qm8xDK7Gq94038ge2i0UuiDxrJuw1IHN5dzv+VTJpywSu4sOWj7GngqIipvrj42h
	zRMHxEnWEAvS9t1YtwwQXHawgGGFzus7wxt9AUwweQrbJDKssODTxeIUUeeSOv4C
	IhMk+n6jV9I098Fx0m1HAKSKQs6MC/eMihgdmZivtEuPVHjSqAN4Qo3poabYhQ4A
	1wu6NjOP5Gt1+UYe0iKpvTLXPeS176ntWL063rIY/J+ToFriSB8Y1FjO23JKf1kF
	WS4rA==
X-ME-Sender: <xms:q72vZ6B95s8hr-o13vSU9x5qsrcPFOYAfKeKO97kevI45OqMVEdlRw>
    <xme:q72vZ0hZd3FLY7rB5f1xY4-6CrolJUzD4eY6wISz8sJHMHdnLFY97kxVN9jpqWds1
    NQ1Xx7IyYSDyWK3fw>
X-ME-Received: <xmr:q72vZ9kLyD9Gb-5orgddzlqmF90yBMJYbY0l9RH24aQ3Bnd19sW8lMn4BpwyPLy5qOYuoTtzkOv84l_71jNhpjbBbYqYn7PeWUbfxf-wthxf>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehtdektdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddt
    necuhfhrohhmpefthigrnhcuhggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsth
    drtghomheqnecuggftrfgrthhtvghrnhepffehieffgedtgfffjeetveegfeekleeileek
    veeuteffteetudffveegieeiheetnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrg
    hmpehmrghilhhfrhhomheprhihrghnsehtvghsthhtohgrshhtrdgtohhmpdhnsggprhgt
    phhtthhopeduhedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhgihhrugifoh
    hougesghhmrghilhdrtghomhdprhgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehpvghrvgigsehpvghrvgigrdgtiidprhgtphhtthhopehtih
    ifrghisehsuhhsvgdrtghomhdprhgtphhtthhopeifvghnshestghsihgvrdhorhhgpdhr
    tghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhlrdgtohhmpdhrtghpth
    htohepshgrmhhuvghlsehshhholhhlrghnugdrohhrghdprhgtphhtthhopehlihhnuhig
    qdhsohhunhgusehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugi
    dqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-ME-Proxy: <xmx:q72vZ4xtwUFTi9ZFIfAtF_Iqo2QzdJc_5b-KlC5642plGy206m4CKA>
    <xmx:q72vZ_QwG2mW1klU4CN51zPYCkrWXrkBWhvjWcu39gIq6wF_k26uFA>
    <xmx:q72vZzasZWg-m9n84US9m-NpeuyKMhdy0T7izO1dcp_hALHqgEfgNw>
    <xmx:q72vZ4RoaNQv-XX38J7yz2ezzo0lQ4J3dt_NNCfSf1SObDOKOVruvw>
    <xmx:q72vZwh-4WeDLKhukE54E5g75C-AHGdwk6KUYiJ87Qd58uhbOtNhLZmN>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 14 Feb 2025 17:03:19 -0500 (EST)
From: Ryan Walklin <ryan@testtoast.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	Chris Morgan <macromorgan@hotmail.com>,
	Rob Herring <robh@kernel.org>,
	Philippe Simons <simons.philippe@gmail.com>,
	Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v3 4/5] arm64: dts: allwinner: h700: Add hp-det-gpios for Anbernic RG35XX
Date: Sat, 15 Feb 2025 11:02:26 +1300
Message-ID: <20250214220247.10810-5-ryan@testtoast.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250214220247.10810-1-ryan@testtoast.com>
References: <20250214220247.10810-1-ryan@testtoast.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add support for headphone insertion detection via GPIO for the
RG35XX series, and add the corresponding routing to the codec node.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Tested-by: Philippe Simons <simons.philippe@gmail.com>

--
Changelog v1..v2:
- Remove vendor prefix from GPIO description.
- Whitespace fix

Changelog v2..v3:
- Add Tested-by tag
---
 .../boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts  | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
index a231abf1684ad..b482fdf1fdba8 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
@@ -178,8 +178,11 @@ reg_vcc5v: regulator-vcc5v { /* USB-C power input */
 };
 
 &codec {
-	allwinner,audio-routing = "Line Out", "LINEOUT";
+	/* Both speakers and headphone jack connected to 74HC4052D analog mux*/
+	allwinner,audio-routing = "Speaker", "LINEOUT",
+				  "Headphone", "LINEOUT";
 	allwinner,pa-gpios = <&pio 8 5 GPIO_ACTIVE_HIGH>; // PI5
+	hp-det-gpios = <&pio 8 3 GPIO_ACTIVE_HIGH>; // PI3
 	status = "okay";
 };
 
-- 
2.48.1


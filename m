Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF90C185B73
	for <linux-sunxi@lists.linux.dev>; Sun, 16 Feb 2025 09:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739698130; cv=none; b=QiOUlsiino3E9b40WxCobYs925/gUgfcR+3HEWc4oJWQa+mPFSA9uHzha3VGm9pGoiE6jA6F06yVx0f1Xyf6hj0Vc07SXfN4fgiIi3ySyB0WMJKEtMakah3ANjpQJVZ6xMCxoMMisH6nwhXtloDqpFUf5wVWLE9Dtk8pk7g5i1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739698130; c=relaxed/simple;
	bh=qKoTdl7MqQXmUNgaOKlwx8KLMb29aHqU5Nhu4ptqQRI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nZu/Pa+j1vLwpXO/CSUjTM51zx1KPHMJxY6lKbN6aqtytqlC8y0gy4IccCcJvw75xOIvZ9MUHWcnqmM3pXANzO0h/7U6uuCSkyl1ssur/nC4n8Jpk75uPmf5Us+Yhxt3N1OXBC9HZ8rEAEfBdA7rMWLcimcsF94+g2WQx117RfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=FiAUkBTq; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=gQGO6X/v; arc=none smtp.client-ip=202.12.124.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="FiAUkBTq";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gQGO6X/v"
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id A55842540115;
	Sun, 16 Feb 2025 04:28:47 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Sun, 16 Feb 2025 04:28:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1739698127; x=
	1739784527; bh=gPbxwCyH4yC6dtOlRIW7+ZjzgpjAHcZbbIEzFv6rlEs=; b=F
	iAUkBTqZVGRLSor4M03Bu3KKk/saSl/IcrnSJEoje3okIHchFotCixmrDte60R8I
	8P4A1oS1heh3W+lGH8a5GHnW3wvijn9v3iRs3xV8EHIbRTucigLQeSmyO7xT2zuo
	/htnRI4cbDb58NpHQZXCVqqiUVhfqeh8YnlKAY4wcEAb+lZuZXI/nf9SSJE+Fh7L
	zVNxKhdCfZ5+tHJ2BScJNpBqotfKPA7ohShdlXI7Y/4uKLXWJX82JyVwqfeQYQ8b
	JfNZGRx30oSTw/ajVaTfsN37bj4qHR/tdRp2s9Bat1KIwIm8wk4Yh1KZLRsRATwh
	KJXv+8/adUA7vZFjpZD1A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1739698127; x=1739784527; bh=g
	PbxwCyH4yC6dtOlRIW7+ZjzgpjAHcZbbIEzFv6rlEs=; b=gQGO6X/vUUa+tvRC2
	ESUcAkkvEtpili0EgtTkDylvMcWHyNbAsjZqdbfWqQetWG65plUpIV3j3mqAkOXQ
	l6ZmcmHyUM6MWSq1GDUtURIhP7ncCp7ADeGCEtUCJnfelyOjqdDiHx6iltllHshp
	5EhpziKFPL1pqUz1wftyJGvseqxB3drAGvRyxFdnQ6OWZiSTKle9yKyKY9lurBti
	UjnAYdDUJGDKw1CchKubzNvxhysSv/MMw0jGOmzGSl53YiMJ1kQr+xDLz9P6vv6B
	G8qiRp5SCsZeOGsfeqqecyNNFWmDE1eS1K2R/n7CK0GU4pc2SQCTvC3nM26iXb0N
	LzzfA==
X-ME-Sender: <xms:z6-xZ9Ly0kuZhVLDNkR52nxmQ1IRaH3JVBr65Qg-_4o4EpCKVxNbLQ>
    <xme:z6-xZ5IriAxKt5bu_doDV4tVP1N3_fvVhw40_751ME5DdFCRtDjRMkldgvzUs7HQ1
    oSvLnfD0taMvnXEhQ>
X-ME-Received: <xmr:z6-xZ1sRGGsPV6_LrRCMAxyfU_12DtG1zyQVaD_WsB-IVwCs_o3N14wPDovcwfTr1i5F2uNG-mdw0bLqXTy1n9I_JTEt4joLN3nqePFCGdzF>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehhedutdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddt
    necuhfhrohhmpefthigrnhcuhggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsth
    drtghomheqnecuggftrfgrthhtvghrnhepffehieffgedtgfffjeetveegfeekleeileek
    veeuteffteetudffveegieeiheetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprhihrghnsehtvghsthhtohgrshhtrdgtohhmpdhnsggprhgt
    phhtthhopedugedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprhhosghhsehkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfi
    gvnhhssegtshhivgdrohhrghdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtges
    ghhmrghilhdrtghomhdprhgtphhtthhopehsrghmuhgvlhesshhhohhllhgrnhgurdhorh
    hgpdhrtghpthhtoheprghnughrvgdrphhriiihfigrrhgrsegrrhhmrdgtohhmpdhrtghp
    thhtohepmhgrtghrohgrlhhphhgrkedvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepkh
    hikhhutghhrghnleeksehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:z6-xZ-aRnmdjcjTnRhPr1biK7DcIWSdEK5Mky9yKrdGu-LN9UIsjtw>
    <xmx:z6-xZ0aH5MU_7RdG4XMKzAw03oQjJKrnDNQtyEGUB3YXxuIeedj2zA>
    <xmx:z6-xZyAZRX25bxCHcrCXP8Leb2irXvBa7DuL3Mdl33xh06ncllZA7g>
    <xmx:z6-xZyYEHMf6p50oQJo5Ypruvunzgg9qMLlgOuH_N0OeRhzen9dKog>
    <xmx:z6-xZ6z3PR5AMP95jkTIAtqgWlUOMBjntY7kDKqbR62DVVU5IBPkhT4o>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Feb 2025 04:28:43 -0500 (EST)
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
	Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH 1/8] bus: sun50i: add DE33 compatible string to the DE2 bus driver
Date: Sun, 16 Feb 2025 22:27:08 +1300
Message-ID: <20250216092827.15444-2-ryan@testtoast.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250216092827.15444-1-ryan@testtoast.com>
References: <20250216092827.15444-1-ryan@testtoast.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Allwinner H616 series includes a newer display engine (DE33). Add a
compatible string to the existing bus driver.

Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 drivers/bus/sun50i-de2.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/bus/sun50i-de2.c b/drivers/bus/sun50i-de2.c
index dfe588179acab..47c87d51a603b 100644
--- a/drivers/bus/sun50i-de2.c
+++ b/drivers/bus/sun50i-de2.c
@@ -31,6 +31,7 @@ static void sun50i_de2_bus_remove(struct platform_device *pdev)
 
 static const struct of_device_id sun50i_de2_bus_of_match[] = {
 	{ .compatible = "allwinner,sun50i-a64-de2", },
+	{ .compatible = "allwinner,sun50i-h616-de33", },
 	{ /* sentinel */ }
 };
 
-- 
2.48.1


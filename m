Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1323F1102
	for <linux-sunxi@lists.linux.dev>; Mon, 15 Aug 2022 07:47:22 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 13BC25C00D2;
	Mon, 15 Aug 2022 03:47:22 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Mon, 15 Aug 2022 03:47:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1660549642; x=
	1660636042; bh=OnzTt4pruZ3L4T2HKOxYu4nUoD1Em4jmDGDdwTSkh30=; b=N
	+e6eyutdVPaoOD7V6P+Wi9p3qeEK/0gzVQhl7GpKE3pM0gpkXBwOrCDW1prr7uUD
	O2IJnOsOtqxbJDIW38FP8wtFoL1wPrKUhm+b3mfqO3wYBjXgQtfjab3MxoHPtDnU
	j7HPa1qGjncEige4XN7TTxBaFosRa4rGry0ljUWOMbg0ayc1V5Bwp1dkqEHP9axF
	rjtPNPNsLuH2DQmcZzN9Neu2LfsfYNlcOkOWbb2BKeb3P6KApOqe1pfHDZ0UnFug
	ZH3Tz36UVxo9PKhXMU8+Wz0tWFrkP/LA/s0FH3MLhJJQkhXmAZB/jpaMQIBqsp5v
	eRx+7cdkN/m1P/5jVvA0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1660549642; x=
	1660636042; bh=OnzTt4pruZ3L4T2HKOxYu4nUoD1Em4jmDGDdwTSkh30=; b=f
	FtDgOBTaNim5Zm0U08O3CxzG2/nWT5da6HtA1kLpxwdPtpzSOWcoP+hIAVIUoZiM
	P7FmXIOoFPG2oFS9ZPvkZSWeami7QLtbpRTdzOpor2qtSBWsyi4jEyeqZ9Hzu2qd
	Ij89OlGQcHc3rwnz6A23dOrdyV9VolGW61+tt79yKE8MNMs2OeOpF/ZH1JSINLVy
	alJFzxSkyn+CgehwWKj01yT1SxJXCWRXTvsg4nxs7+ryQ3SRyp1YQiBZ08ABQq+L
	j/z1cS9G1PMFHgKxkug6ilISoNEnpI9/t9BWye0EBOg1zsHK/mG50jOdxOMqJOd2
	nMrSHDozih/jcA1o96O7Q==
X-ME-Sender: <xms:Cfr5Yj54RrTJNIv-KeHsxZbubLd3ViIwZJe0bdYI2HIPT9WJPpTF3w>
    <xme:Cfr5Yo4CJ_fNv8VWF69yrNLiso3DSM1oQhM0rvOhS24LFHQcDguFgD2aZWnM-LHsr
    fZHAaJIQXXObmbt4As>
X-ME-Received: <xmr:Cfr5YqcCML6Aq-Scd-oYinwxS9kJ47ICki9N1itzysOQ_NIDJJ1OnOhdWX3m>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehuddguddvjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhggtgfgse
    htkeertdertdejnecuhfhrohhmpeforgigihhmvgcutfhiphgrrhguuceomhgrgihimhgv
    segtvghrnhhordhtvggthheqnecuggftrfgrthhtvghrnhepueeigefghfffffeifeehud
    eiuedvteegueefffevgfetvdffheehkeffvedufeeinecuvehluhhsthgvrhfuihiivgep
    tdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:Cfr5YkKXqqVFfdNZyuqxrSXsVBnWdaari1f6Xvj2qdTAvmkUcZLmEQ>
    <xmx:Cfr5YnJ3o7ahUBJrAoHNrxPw8ULhfFQNqQooUH7hDyCM6ntKSLhsuA>
    <xmx:Cfr5Ytzj6BquWNVthB2Y3YKZbKzt_yTpGK98c5cZpZjsCBTMv8L3nw>
    <xmx:Cvr5YhAvrgA1KcVI5R_R0DGzgzFUI0zk2xeSJjPd3tI1ti5CXkv-4g>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 Aug 2022 03:47:21 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: jernej.skrabec@gmail.com,
	wens@csie.org,
	samuel@sholland.org,
	mripard@kernel.org
Cc: Maxime Ripard <maxime@cerno.tech>,
	robh+dt@kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	airlied@linux.ie,
	daniel@ffwll.ch,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	krzysztof.kozlowski+dt@linaro.org
Subject: Re: [PATCH] dt-bindings: display: sun4i: Add D1 TCONs to conditionals
Date: Mon, 15 Aug 2022 09:47:15 +0200
Message-Id: <166054963291.173470.14288210772904805877.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220812073702.57618-1-samuel@sholland.org>
References: <20220812073702.57618-1-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 12 Aug 2022 02:37:02 -0500, Samuel Holland wrote:
> When adding the D1 TCON bindings, I missed the conditional blocks that
> restrict the binding for TCON LCD vs TCON TV hardware. Add the D1 TCON
> variants to the appropriate blocks for DE2 TCON LCDs and TCON TVs.
> 
> 

Applied to drm/drm-misc (drm-misc-fixes).

Thanks!
Maxime

Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9831B2C82
	for <linux-sunxi@lists.linux.dev>; Tue, 16 Nov 2021 15:15:24 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id 5B6863200B5E;
	Tue, 16 Nov 2021 10:15:23 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Tue, 16 Nov 2021 10:15:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding; s=fm1; bh=
	D/F/AfKJj86ZhqS1GUEtYPWSp/tbVPMVzBI2O66iYyc=; b=FUB4sSWwRVNqsilb
	fZmI9XtNqXz6MG87K5hZT/vSZyl516CMOvX5rGBUkHwKAvY+cXy++gFDzK+iu9Dr
	qPbvrbGtQ+26pybwUzQAt26Hflc2qxjDmKgYvN98ehS3k/uA1su8W145BwGDVCtT
	xXYL8Wc3HTcxdplWO2rBPZanDLtd4Q9MMtSsSEdZarQq4M3hzhIaCzoBr+HeRQqK
	TCzFClZ6UK+PVLIr/NOsc/wvX+0/Tdzb9ehU8ykQCW+U7AIu9uiXplrP2MbDFXIU
	8gF3dXhblWsD7cKx1MbSBT+G6lnCk8QoR9aXsyz3+n8qaignwvD2S6c/ZMiLFl6k
	AkaIHA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; bh=D/F/AfKJj86ZhqS1GUEtYPWSp/tbVPMVzBI2O66iY
	yc=; b=B5rq4vkw61plJhKQ7IsSuNdliHQDU18cUTRLmy1U4/um7IyYi7CH+im6x
	r8VF8mHnzpiW47tYO7KSvhv5KGq9WLQm8eVLcOPTNFUq9heWydcQLNm7gg5npfeb
	5A2wRnxh+ETZc+BbaU6SvOcRoV5SecJtQ/vgoLBKIg+HbVoougVgGMXNewZktpRN
	2hp/dcedSdXQqK4hAE2eKK6jGf3Eg2eADwjPRfIklZ4ZWLUBxeQzDpAA2SvlxB1y
	qlPKB+s5a4CFtFUXrkrQQC2KV3cNMIHfA+YjrZphWp4qFXo5ICFdiusitDjx77OQ
	kejSkuGAWRVLefuztjjyd+3UKvV/Q==
X-ME-Sender: <xms:CsuTYR1yW4i08qbJNEs1XGva81QzQtMMDTTaJXgwqjjVjzqXrgX1ow>
    <xme:CsuTYYHAJ9gIcclcfWoxWa9LuArcyTjzdRsh_WqDOKkOh_5P1etMJuRohOERKU35Y
    KzqFuSqHFne6Y0-Mbs>
X-ME-Received: <xmr:CsuTYR41LQycxY82s63jqa9BBMBWrJ-NZ9SXKE0HgOHHQEWshWfQJZf1xH2EbGxw7Ieu7ziPCuuWy8mBVY4hnZQoyr5CJJFEAx8qUHi2>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrfedvgdejvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepjeeugfegkeffgfeuvedtvddufffhjeffjeejvddvudduteehhfefhfefgeei
    keeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:CsuTYe39gw19agJVDDE5nbF69w2M8UIAoo6lsTqfFsBXjDbQlY7ilg>
    <xmx:CsuTYUHQFTC8HEzMo5Cxh1p41XrTQYAxTzEiLO2TD7I-y3DkZjdrhg>
    <xmx:CsuTYf-tNu2F60tBb2sW2nMaXgcpbIoxdxx8G2zFhHJnaD9ANEFtxg>
    <xmx:CsuTYf1sdr4rbAd-v8fiRWNKlrpewoCg5mu8GXkwD2wpaaj5A6sNmA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Nov 2021 10:15:21 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: wens@csie.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	mripard@kernel.org
Cc: Maxime Ripard <maxime@cerno.tech>,
	linux-sunxi@lists.linux.dev,
	robh+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: (subset) [PATCH] arm64: dts: allwinner: h6: tanix-tx6: Add SPDIF
Date: Tue, 16 Nov 2021 16:15:19 +0100
Message-Id: <163707571157.389306.3979022331947907978.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211115201112.452696-1-jernej.skrabec@gmail.com>
References: <20211115201112.452696-1-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 15 Nov 2021 21:11:12 +0100, Jernej Skrabec wrote:
> Tanix TX6 board has SPDIF connector in form of 3.5 mm jack.
> 
> Add support for it.
> 
> 

Applied to sunxi/linux.git (sunxi/dt-for-5.17).

Thanks!
Maxime

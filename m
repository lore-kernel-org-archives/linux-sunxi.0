Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com [64.147.123.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5E0AD49
	for <linux-sunxi@lists.linux.dev>; Tue,  7 Mar 2023 15:30:09 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailnew.west.internal (Postfix) with ESMTP id A97B92B071D6;
	Tue,  7 Mar 2023 10:30:06 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Tue, 07 Mar 2023 10:30:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1678203006; x=1678210206; bh=MRcKO6pD8Tc+Ex6F7GSZYpROWLf8RaYsLIo
	/Rd7Ddn4=; b=VLeRC4RRakZxwsCBaCfdbEijLT5NIOhOjuKdOzlcSq3CeFWt4hc
	/Y+yUgKmGxQrqD5b+JJ+/zTP4DLh8zxL6Us0kLorJNzpAcIgp3ukw3Vwnrxvn8Xg
	QA70bbfC6dpk4J9qR+Oi0u9zs9M2rzYaeKG0+cf/eftU7uCv1i1TpXo6XN8gMGMs
	4WzKUbffHBIoQ+IyGF1RoyS5Z49Uc1OEQSHJxaVhQVDrK7QGyMIxLnVkerji1U85
	eLXwfby8p5dq8XCvolTNuRLC0ydlfViVQxCssi0uYA723yaidQ/75hSL03TBfFYk
	79HiHX1dPSFUbVKqRMgWgekjGdpB6aIVaWQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1678203006; x=1678210206; bh=MRcKO6pD8Tc+Ex6F7GSZYpROWLf8RaYsLIo
	/Rd7Ddn4=; b=MoUg8SUoJjhWmcJyn+qEZoysvXzlay61F4eG+nuZE+hjqrqO1tN
	Ab4lEqRtCC+CEK37DGEq3QlITo7QxZLy1Lka47OlacwD2XLgbKOkVmeYl7NnRh0x
	jL5XcbMRHYiv4QAgzGs2gLAWrJvaKMrJB8qEhfqp+LxSwThSVoiJjtUtm17IQQ0e
	xZBZ84FNPz1t7Cu90PkGaWa/hdqaoWAuFulDN2Azvf9KoO++tmiQ2cRC/MGfvBhk
	Unvscwx0T6jTLWfCrvCxlUodrnQ/sUQE7azvK2djNaaJviFM3u6dU6ddpAAnGSr7
	y9SsWikCWucWNUoQCQH+439jqpgToKEMGPw==
X-ME-Sender: <xms:fVgHZC6ag0xA6TP6Yz4rYMVqHyyq9mpPjQTJRyCTpQ7Smv8kXiiDoA>
    <xme:fVgHZL4V7B4H6jCYhacSk73BFS6UpgZzIkLt3IV5rci8TRPIzygjUZng1tCXVJcGE
    t1uwQi6UzMaCOiR_4o>
X-ME-Received: <xmr:fVgHZBdOlgx0ZsE0G8N5FkrfWFawCHrc4AyTw6pXG30FWjny7NqeLcVbHuutUJ8PaB-oTaTpY9qdy6fOXuWPo712xhQjti0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddutddgjeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvegjfhfukfffgggtgffosehtjeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepleeifffgvdetjeejueejieehuedvteeigeehtefhhfeifeegleekudek
    teegueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:fVgHZPJVP5ryypiRBzeseFg74QqhrObdWuXlWGsKt4RYsjf__-0Ajw>
    <xmx:fVgHZGLIiucFzjFD66_RMAJ2zX5CDho8p_HyTkMOGhB1j7nxQAF1xA>
    <xmx:fVgHZAz6XX3yaGDasZaVrlkgOgcFNBiDKnALVFEgqdDwMwhv9HyGYg>
    <xmx:flgHZL4HCc8QZ-_C5ww9Am64rj9EehJZMHrG9hdusoO5TCLd8VCGPZ6UcQk>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 7 Mar 2023 10:30:04 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Johan Hovold <johan+linaro@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Boris Brezillon <bbrezillon@kernel.org>, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <20230306103242.4775-1-johan+linaro@kernel.org>
References: <20230306103242.4775-1-johan+linaro@kernel.org>
Subject: Re: (subset) [PATCH] drm/sun4i: fix missing component unbind on
 bind errors
Message-Id: <167820298545.105326.9045991101528563547.b4-ty@cerno.tech>
Date: Tue, 07 Mar 2023 16:29:45 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.1

On Mon, 06 Mar 2023 11:32:42 +0100, Johan Hovold wrote:
> Make sure to unbind all subcomponents when binding the aggregate device
> fails.
> 
> 

Applied to drm/drm-misc (drm-misc-fixes).

Thanks!
Maxime


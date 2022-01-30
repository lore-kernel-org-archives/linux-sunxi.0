Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0A92CA5
	for <linux-sunxi@lists.linux.dev>; Sun, 30 Jan 2022 16:29:35 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 1FF225C00EB;
	Sun, 30 Jan 2022 11:29:34 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Sun, 30 Jan 2022 11:29:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; bh=dBxhQOjCUDSpCg
	dJXpTrnjRt+78pd1rV2WgYCCxfaMk=; b=kyMtbSEBtKj6VDBAJRTPZcQ1wMoAX6
	pyP7OG59lM2PRBGG5ZH705zYe65B/qNbzBnbtTwbcDQv/zvgN8qDEnaX1RPpyynb
	ZDJ1+y1Iflknt0H/KDnXoEfvLnR3U5ut1dqml9fjVousz+1JgqYNBvalY0onYPWJ
	VDRHLbypQiZCzsU2tXs2DBc5+uj9toFIGnmQL3pvbHPyiRoAExsv6G1+I5QwqoCP
	1r4+GSA1Xsdu7x+GnIf6wvYlYu9A8FrGH5AIVtpqwJo62auOVod2JJtaPC3aM48J
	JUdt8uebF3BmaaA9q39gTvBB/ITVuwj0oNSHenzyaUfcIkcO9kjSFRAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; bh=dBxhQOjCUDSpCgdJXpTrnjRt+78pd1rV2WgYCCxfa
	Mk=; b=VTI+nFXpLcBjuEEgzCexijsA+okkUtTCkKUo4DV8wtJHebTGoAuj5WcYi
	2zZKqDn4K82saw3vCQ/bAfhkDnRomFba1byyQctS2eekV7iiwRjqDaeA1Zixl+F4
	jBTiA1LOZny4jLsv/rN8mg0XcbrHHhTn36QiKL1Jb9KOQx/oAi36mRI4+lzIWRoL
	HNxeY+aNLulpW1ztcwwMYZf+tHadVzNOov/d0tG7Hrvx6O/Z7CC9gocKwDhkB+Q0
	9HHs5dRPdaS/8rj2Xer+HITWbdlADCvqpcW0O5RTvJnbpLFYW6iO3Sri+I4uqCn6
	Szttn34YoHZGWNjoB40eQZ8+P4d5A==
X-ME-Sender: <xms:7bz2YbSjGkRFdPQUF808eXpz7nVopiJv3Ha6uhMawjxx6q759cv_hg>
    <xme:7bz2YcyHUThx7uQpkM2MB_-e4_iKZvBMcS2KzWpb6fFQ_SC0vf80EA2KagBhdvKAg
    k9b1ODd_iVNhn2Wjg>
X-ME-Received: <xmr:7bz2YQ1yKEp_-MwFJ7L1syeCWSXkn26-N1t6wCohHVEkY9PnBDJGMwePwAMuAnmUI_De7p41eWrXCExkYiOX7A69dLdTIY6b-sDGumDx91HSiHYgqM7M_POHZw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrfeelgdeltdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefuvfhfhffkffgfgggjtgfgsehtjeertddtfeejnecuhfhrohhmpefurghmuhgv
    lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
    frrghtthgvrhhnpefgveffteelheffjeeukedvkedviedtheevgeefkeehueeiieeuteeu
    gfettdeggeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:7bz2YbCpj5iSVISTWJG0Y-ghR169yYOAsmPqY4dGRAJqPuo_vz_AaA>
    <xmx:7bz2YUgkI1LiJbzttBTkRAyA-yza11urh7pL1XLG7B8Bdv0YcJMQmg>
    <xmx:7bz2Yfq-1e6ni6pWBIYVAkdFs0VyuYCqi7ZpvWHYoaqqIgNgJkKVQg>
    <xmx:7rz2YdtJ9VBzZdnhvzMdiI3KCzURXQtvbgRghQQcaM-C62godv6Eqw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 30 Jan 2022 11:29:33 -0500 (EST)
Subject: Re: [PATCH 1/3] sunxi: prcm: Add a few registers
To: Jernej Skrabec <jernej.skrabec@gmail.com>, jagan@amarulasolutions.com,
 andre.przywara@arm.com
Cc: u-boot@lists.denx.de, linux-sunxi@lists.linux.dev
References: <20220130142715.291427-1-jernej.skrabec@gmail.com>
 <20220130142715.291427-2-jernej.skrabec@gmail.com>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <f5690887-06fb-7579-7e3b-899d414162da@sholland.org>
Date: Sun, 30 Jan 2022 10:29:32 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20220130142715.291427-2-jernej.skrabec@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 1/30/22 8:27 AM, Jernej Skrabec wrote:
> H6 and H616 SPL code has a few writes to unknown PRCM registers. Now
> that we know what they are, let's replace magic offsets with proper
> register names.
> 
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Samuel Holland <samuel@sholland.org>

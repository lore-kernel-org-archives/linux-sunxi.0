Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D35B2F27
	for <linux-sunxi@lists.linux.dev>; Thu,  3 Feb 2022 01:07:37 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 902AB5C0062;
	Wed,  2 Feb 2022 20:07:36 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Wed, 02 Feb 2022 20:07:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; bh=i6gS2Flinf6q54
	jaaiEwUUnoL0V1x39QK7C9pCwJcQc=; b=DVVy7qzTfteabP/XL4hzMo8Eudt1Pc
	zz20gQCwxiGOzrYcWwfPF1R+0jzNyz4pjyaJGha9YwEcFGf/hTOTm1aBEU3hfKT9
	8cyFr7M2Uq2iNNULjUZnzS4CIdexzNSQmyCjYBpaOpgxP3T0A/mZgWLMc0cbnjze
	J16QvMt7pax1ZOm3raTVcgRguQ0evIWWvVzKYB1Zc+njbVx5vACBMprz6hK6jwPl
	w02HfF4mk+SRDzG1zhtvwy04tCeJ+PYwSerWjtUuEnXNxMJsh2NAq9h5AnJHpG67
	rph5+0zg+OsyV9wWpcmyLytmF4OUXSpfqrr8gIjs7IudIFBGmAJAYf5Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; bh=i6gS2Flinf6q54jaaiEwUUnoL0V1x39QK7C9pCwJc
	Qc=; b=ZzzuKMwhh0i0HsPe3/puzgr/X5D6vRjYSA3Vm8bsNRcKLjW4RvCfeepTF
	9g/IURkuzYLkRXP9kP/h7Rwf75PBBkDCWKwR2ZfzebMwLsVmdhIL80lI63yBizED
	dFuJB+aiZJ88a06y0mNij/SpvFaadUokop+KHCq6kjDFhAXWls2OqPby0NekhiY6
	/pMzmBjI1chzIz4i40vBYeIy8oPAGCotYccapJ7LdJ/DBAGHW9KWDvZ+V5t8hsAV
	RY0bVyjDrVQ/ZMFJYXSFwfzlPSo4G6jrWXnE2fhpJFgcN6ePcOh5IJvVKioUosPa
	5yhJEOMqrVZbKp4cPRjUOWyni8KOg==
X-ME-Sender: <xms:2Cr7YUpqu7kz3SYlUAk58Z1IR4VjZnQVq8Lml0R_6yXYKAPmpRTfCw>
    <xme:2Cr7YarZeOYZfuefvVsnYHtXeKdBzpAHIuuv5i22UVNr5s3Y-wg-8VjhnKMZcU7OQ
    K0Es2sPD3pN6bkcHQ>
X-ME-Received: <xmr:2Cr7YZPBG8E9KeMw3AVwnTHTsYN0pKJ-7NHUUtWPOVpZCZiXZpDZq6H6hTTLqqvf-xFC90ognwOSVMVHMFJV2ALxq70h-6agOmGoMo7xWzJUhe7EI16ISLbDYg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrgeeigddvlecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefuvfhfhffkffgfgggjtgfgsehtjeertddtfeejnecuhfhrohhmpefurghmuhgv
    lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
    frrghtthgvrhhnpefgveffteelheffjeeukedvkedviedtheevgeefkeehueeiieeuteeu
    gfettdeggeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:2Cr7Yb7pIlu0D8BbP4bPqOCKpZD7ineaZdhKsIE_1u-lK3ZpbtBkJw>
    <xmx:2Cr7YT7-Sad70ZLt3eIieQXOTrruGSRKra1WyevsdwgH0yHTagO4ig>
    <xmx:2Cr7YbiQ-1okiTg6wkDPehHcUd4Yh0fpscb6skQYZbXRKXGVGul-wQ>
    <xmx:2Cr7Yds02k0mhb4cO-5RMEK2xkPS74HAUfFLi598l7giwVuayXizFA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Feb 2022 20:07:35 -0500 (EST)
Subject: Re: [PATCH v2 5/5] sunxi-common.h: remove pointless #ifdefs
To: Andre Przywara <andre.przywara@arm.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>, Tom Rini <trini@konsulko.com>,
 Simon Glass <sjg@chromium.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Icenowy Zheng <icenowy@aosc.io>,
 Jesse Taube <mr.bossman075@gmail.com>, u-boot@lists.denx.de,
 linux-sunxi@lists.linux.dev
References: <20220201014116.25864-1-andre.przywara@arm.com>
 <20220201014116.25864-6-andre.przywara@arm.com>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <c576cb00-ae94-d196-d98e-0ba6119dfe79@sholland.org>
Date: Wed, 2 Feb 2022 19:07:35 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20220201014116.25864-6-andre.przywara@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 1/31/22 7:41 PM, Andre Przywara wrote:
> Remove some pointless #ifdefs from this file, as there are quite too
> many of them already.
> 
> Some definitions don't really hurt to have in any case, so remove the
> pointless CONFIG_MMC guard around CONFIG_MMC_SUNXI_SLOT.
> 
> The BOARD_SIZE_LIMIT applies regardless of ARM64 or not (now), so remove
> that guard as well. The maximum number of MMC devices does not depend on
> CONFIG_ENV_IS_IN_MMC, so move that out to simplify the file.
> 
> Last but not least CONFIG_SPL_BOARD_LOAD_IMAGE serves no real purpose
> anymore: it's unconditionally defined for all sunxi boards, and protects
> nothing applicable outside of sunxi code anymore. Just remove it.
> 
> Reviewed-by: Samuel Holland <samuel@sholland.org>
> Reviewed-by: Simon Glass <sjg@chromium.org>
> Tested-by: Simon Glass <sjg@chromium.org>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Even with the SMPEN code missing from SPL, for the series:

Tested-by: Samuel Holland <samuel@sholland.org>
Tested-on: Orange Pi Plus 2E

Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5410E1C06
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Jan 2023 06:23:49 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id AB5773200A52;
	Thu, 26 Jan 2023 01:23:47 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Thu, 26 Jan 2023 01:23:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1674714227; x=
	1674800627; bh=bVGid+ER1LNuoL6uEE0efjpWBFLA+eM9Awet6ouzX/s=; b=h
	+OOw80b9S53ItxzbnOYNhJOAXSOuJiU7F51/n0ORtCDK2vpVGHLVOkoFVRRRRG4y
	I/zhfBAOHEQG/vRBHAaivJU9x7CKTR4WxH2lIsDAujXDkvl/CnE39A4XVryX54rO
	ibopr0cs7Rm/tNzLfUe6Sxm0+bpS/wqVhmKvNb+s4fM0VHmWN8wVtf3pgGw25ol+
	AbBmb5XTjK5IE0bcenYdo0uzuhDslxGaSp2ItJ2cRf93jkwWIaFpIAqrBYSxbFb1
	aBnSAa4jIO8RYExLN9zdl4B766JRmop1jfK8IV/Y1Qg21LJa9C7IcFI2gwnfhNli
	TcHF/DlDAia0STEoht4Jw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1674714227; x=
	1674800627; bh=bVGid+ER1LNuoL6uEE0efjpWBFLA+eM9Awet6ouzX/s=; b=P
	8lvJR8gcHWxerGl+ewvatfjZ9qXNKjrIPI94vzyYTpcgtKTQTIm4dpVxCY42O/vo
	uRZylX+acRAR167quxCGyjdP0U2doT0d2B14UAUjxAxMKuIrpOCcYyFh/BBiFu8a
	O/opdqswSEY2YJ6U2Md8D+AMXYO2XaGOHCxYg57BjKTiE3ho+psQn+JZJ8TAt1gS
	vV8t43rhSYZOhK/d8Zv4seR4jPHczV4yGhDi3ByrSoz6qKTqHq2Z31akvR2pw4Ym
	ZBJ6SzoO/+mYyunrRsuL4Uq6SZ0DoPiZNjtnR5MpnWwpCM7jUIIYkwctBluWK4P5
	qfr49vuEjGeo+D6RywSqQ==
X-ME-Sender: <xms:chzSY0Y1oFJERa6T5XZgGCFVfbZ7yC1cu_SwQlfUl1l7VaDq_ngPvw>
    <xme:chzSY_aukTazpzKsjJCRHFDWOJT3HFCg0QwZUbN0ahjS6B6C2xieI04Q_zzcwSRFr
    ow8tCp4aj6DQu7rdQ>
X-ME-Received: <xmr:chzSY-_aYLVVrUN3Phs3W1m3lMQq30N0wjPWcIsOQFSykbkhFMKPPFHeVns1j0KDVuWc-hq1kTejsVanuNTOgfBoE4SmtWGmj9bY-Iu3RwvuPeGAV0jplNfL-Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddvfedgleegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtfeejnecuhfhrohhmpefurghm
    uhgvlhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenuc
    ggtffrrghtthgvrhhnpefgtdfgleffkeevledvueetteefgfellefhjeetieeuhfehteeu
    feefgfehfeevfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:chzSY-pdJ5qZIkrv-gMsSlyJ9NMoYVQs9I7-00FKJT4BTBLKmWUs1A>
    <xmx:chzSY_r8Hr3qEre6_avhaKFA4MERswNjT2EI1Ef_B4X1PgYmMMW3PQ>
    <xmx:chzSY8Tu2OD5VUt3bg30xaSCupCavZzt9a3vTGGQTvXV6GNaex3WOg>
    <xmx:cxzSY7LiPHjKkY8d9IOWrXDbDEgK8yA9UQ9wG5SyAItyBztcNNXIXg>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Jan 2023 01:23:46 -0500 (EST)
Message-ID: <c0e6f74c-7255-fdae-66d7-ca38037136e7@sholland.org>
Date: Thu, 26 Jan 2023 00:23:48 -0600
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH 0/2] Allwinner power domain support
Content-Language: en-US
To: =?UTF-8?Q?Jernej_=c5=a0krabec?= <jernej.skrabec@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>
References: <20221231160402.16157-1-samuel@sholland.org>
 <1915282.PYKUYFuaPT@jernej-laptop>
From: Samuel Holland <samuel@sholland.org>
In-Reply-To: <1915282.PYKUYFuaPT@jernej-laptop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Jernej,

On 1/5/23 10:34, Jernej Škrabec wrote:
> Dne sobota, 31. december 2022 ob 17:04:00 CET je Samuel Holland napisal(a):
>> This series adds support for the power controller found in D1 and other
>> recent Allwinner SoCs. There is no first-party documentation, but there
>> are a couple of vendor drivers for different hardware revisions[1][2],
>> and the register definitions were easy to verify empirically.
>>
>> I have tested this driver on D1 with the video engine. There is no DT
>> update patch here to avoid dependencies between series. The example in
>> the binding is what will go in the D1 DT.
> 
> So such driver is needed for H616 for GPU? Or is power domain handling 
> different there?

H616 does not appear to have a PPU. The PRCM gates otherwise match A100,
but there are no settable gate/reset bits at 0x17c, and the registers at
0x7001000 read as zero, even after being written. I believe H616 uses
only GPU_PWROFF_GATING_REG in the PRCM.

Regards,
Samuel


Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402561859
	for <linux-sunxi@lists.linux.dev>; Sun,  8 Jan 2023 20:40:11 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id 380A132000D9;
	Sun,  8 Jan 2023 15:40:10 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Sun, 08 Jan 2023 15:40:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1673210409; x=
	1673296809; bh=UsAp4oHTS0IIuVugEbMWousZz+QLvAcO3GadGRriApM=; b=d
	u1G809UsJzAZHpYsbOoa5utHahDni2Wv+eyySEEs2zPvKmvpv6frNHlALGgobyxZ
	f1vAtvdJEi5iuizctS7+xSMVCAMRp0kLW/0oIHVWk3CdK6UoXZwT54MbZXt6pY0e
	ZCaKaViQu+wzojNEnMO2FmRyWZJO9s1E6e5MMb6ZFyWDw9OCGT3StjGOQIlZHtfD
	qNo+3PqPsoTkzSk/hSVNINNEnTHhr28R8YmA9shPOZHPim2sGb8hNuBveJK3OgLK
	Q3NIcHi+IEIiLzkZVRnZ7akro0WefT/xtAgmXXGyrQzYcOZzcuItlA18D5XH4b22
	A/Qx1xoMdqfc7eqHVUaKA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1673210409; x=
	1673296809; bh=UsAp4oHTS0IIuVugEbMWousZz+QLvAcO3GadGRriApM=; b=P
	LPTwEzO4MVSo6Wf741RLFcmnNry9QFqQjTOhze8V5LZ56niuTSX3GhTvRoiPDMXd
	pyVUxrRgqo/zzxGk0/eXYyYk9+dQVfHw0o3K9dPcdjAlIFtW+GjBqFndJvqty2b5
	6ni3zDbZ2kAsjBcYcmM1tAlUldMr79AgDmBVSgHHThvjXAnkAmmAk2LUV+sr7aIb
	aX55WIQecyEntoXl64HnIegXXVQ437HEUwe493p1hfESEowfK3+3Q2w3l4MpBpjp
	Dx+/E/OqVgyapafHLNWrt0UG1Vo1EFRsKi0Z13tRC9AofY1HT2LIAHjlRP76wpCk
	AiEmGa1NyGIjAETUxVY/A==
X-ME-Sender: <xms:KSq7Y491zk7wV8rXO6nBSMJVbvBu7HbZwiEu6drZW6SgD8zKox7TjQ>
    <xme:KSq7YwukULUSopUIb4PH9xUmbFOMxX_Ut4R7ZNByu8ee0LkO45bbIWQW36vQHz17a
    g-fm6p-Q0h54ZCfBA>
X-ME-Received: <xmr:KSq7Y-ASPGLLuT5DX8l7P4Oslgc3xNx1Db4oZ-qQNz-xR3SafQyuDgtSdQE_ICKte2ZgX88jeLHb1V7XHTPJ8o_3pEcQvyNE5BtBuemv10Zj-0JGD4d8Q0mMrg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrkeeggddugeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtfeejnecuhfhrohhmpefurghm
    uhgvlhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenuc
    ggtffrrghtthgvrhhnpeekjeelleefiedthfdtgfekgeehudefudeugeffvdfhudekleel
    fedtteejhedutdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:KSq7Y4e17LdZe9uF6yL877F-EcOuX9mtlyp4b9fLfx5mAUK4j5GnIA>
    <xmx:KSq7Y9NYmKHtSBrCskgnkRb38YnFx9aCTPx5Ridcsn8BliTagQnB_g>
    <xmx:KSq7YykAFgt_hTk6MTm3EkASP7UtykJ5um1vtOPcWsQoIYc-eMjQiA>
    <xmx:KSq7Y-rhhHpHtghPLluXgR6odYXXHcIGvuNKbnOlUhkdDJoIDHGyjg>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 8 Jan 2023 15:40:09 -0500 (EST)
Message-ID: <89dd680b-729d-e969-dffe-60639ee36cbb@sholland.org>
Date: Sun, 8 Jan 2023 14:40:08 -0600
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH 3/3] sunxi: fel: drop redundant "control register"
 save/restore
Content-Language: en-US
To: Andre Przywara <andre.przywara@arm.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, linux-sunxi@lists.linux.dev,
 u-boot@lists.denx.de
References: <20220713152758.56929-1-andre.przywara@arm.com>
 <20220713152758.56929-4-andre.przywara@arm.com>
From: Samuel Holland <samuel@sholland.org>
In-Reply-To: <20220713152758.56929-4-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/13/22 10:27, Andre Przywara wrote:
> For some reasons shrouded in mystery, the code saving the FEL state was
> saving the SCTLR register twice, with the second copy trying to justify
> itself by using its ancient "control register" alias name.
> 
> Drop the redundant second copy, both from the fel_stash data structure,
> and also the code saving and restoring it.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  arch/arm/cpu/armv7/sunxi/fel_utils.S | 4 ----
>  arch/arm/mach-sunxi/board.c          | 1 -
>  2 files changed, 5 deletions(-)

Reviewed-by: Samuel Holland <samuel@sholland.org>
Tested-by: Samuel Holland <samuel@sholland.org>


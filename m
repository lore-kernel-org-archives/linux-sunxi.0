Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C4417CB
	for <linux-sunxi@lists.linux.dev>; Mon, 27 Jun 2022 00:59:57 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id B9B675C00C5;
	Sun, 26 Jun 2022 20:59:56 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Sun, 26 Jun 2022 20:59:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1656291596; x=
	1656377996; bh=r07BJodBwdwVV/AUM0aP36k3lKcF9i5eMUh7opPf5T8=; b=S
	ltnaWqlI3uu92ZtsxUoK4+7i04PQvuQQd48da6lzgVrOE/wo/uwN7CcFKaA2mTE4
	egrb40aC7wc7og0a5BYj8vwxftfNfs5/adIVrVKNVK8NIdNgyXYmBwilTW9+jvP4
	QQTSsHCDC+ByQo3GzEy+QF0hjYd6ANYPI6tncTkaBC5OvYiL0etphKBAZBlhQHTK
	SipQAC8mQXfrkBZmq3jUgs4b5MMXVQJT4d/qoIUffG7VPssfEr/qSjv0oMYZWdXP
	5N7nlWg0GE5W1FSgiVlNIfiM1DWmZFaW1j19pNVNsaSgGS3k50dxRVwOW1fWcFhT
	4i8VGE7B/zEdCVgaDt42A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1656291596; x=
	1656377996; bh=r07BJodBwdwVV/AUM0aP36k3lKcF9i5eMUh7opPf5T8=; b=Q
	ijtVqmtcldEbNn+jLVPu5H44Q9qeUBCJu0Y9BssDxVhZJdzU8NRLRCocvRPtjPJU
	7AT6J3v49S4vmIzAm+uiB7CDXol0bMyodZgNTdAopopnPsJvm5kKDJLimgig581m
	ODQHjYzw9vay5+NRoTLBz7sBFJVyhtufWpk/Ywl8fNCSFm3fSuPRmNUdvnyP40yh
	orWxFNbN96rCLobqPWkuY4cTWlrbY7CvsIIS1kos/QaXvnYAyBqcnoBAmSkXC429
	87fCNqe48OE8FA3oXQ2Z3vZsNdtg6WkYZ1zKSpR1hPfTUTs/ldHAXnMaxb85qTit
	PiDmzTgVQ5zad9a0R/6tQ==
X-ME-Sender: <xms:DAG5YgiFcY0FUUcK6wywZQ2-qGyJ5d8loYllvmV32uo5u6beaqha_A>
    <xme:DAG5YpDwMBJn3K4638GY-uuypUxY_OhfVP6DHcn5Y7xqJBfin7AeTB89GotYU3A8O
    QfxL4CdpmzLvbspTw>
X-ME-Received: <xmr:DAG5YoElGFOlSzsCaFVCOL-4ryrQ7CI8BiRNOtLh157dvws-W0V4wXSP_H0wLTdJHTb_2-7exUzsb-bz3cV2xrnZ3Fcke0jpR3LUW2XJh33-_qQHoy9boCS2Iw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeggedgfeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepuffvvehfhffkffgfgggjtgfgsehtjeertddtfeejnecuhfhrohhmpefurghm
    uhgvlhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenuc
    ggtffrrghtthgvrhhnpefftdevkedvgeekueeutefgteffieelvedukeeuhfehledvhfei
    tdehudfhudehhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:DAG5YhRKychbzMRVC7n4RD4QmFGNAyngOlovbxPKbjgGJlonSQIbEQ>
    <xmx:DAG5YtxG9jQ0nZHMd13MfHU1dXl891RcIUmOpVvdybnTVU104lSPVw>
    <xmx:DAG5Yv5vPGwpzc53Anml52aNfXao7hQ5zKyry9FFl_v_tDkoYH4SUA>
    <xmx:DAG5Ykk86r_q3x2nlCFZh9n8d15ugfKZNbAUTMXQsOGeq5Axwp3EUQ>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 26 Jun 2022 20:59:56 -0400 (EDT)
Subject: Re: [PATCH v2] sunxi: fix initial environment loading without MMC
To: Andre Przywara <andre.przywara@arm.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>, Simon Glass <sjg@chromium.org>,
 Tom Rini <trini@konsulko.com>, Chris Morgan <macroalpha82@gmail.com>,
 u-boot@lists.denx.de, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-sunxi@lists.linux.dev
References: <20220624161209.1644097-1-andre.przywara@arm.com>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <e359a8ff-0075-92d8-a2de-b16ea161d735@sholland.org>
Date: Sun, 26 Jun 2022 19:59:55 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20220624161209.1644097-1-andre.przywara@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Andre,

On 6/24/22 11:12 AM, Andre Przywara wrote:
> From: Samuel Holland <samuel@sholland.org>
> 
> Commit e42dad4168fe ("sunxi: use boot source for determining environment
> location") changed our implementation of env_get_location() and enabled
> it for every board, even those without MMC support (like the C.H.I.P.
> boards). However the default fallback location of ENVL_FAT requires MMC
> support compiled in, so the board hangs when trying to initially load
> the environment.
> 
> Change the algorithm to only return configured environment locations,
> and improve the fallback algorithm on the way.
> 
> The env_init() routine calling this function here does not behave well
> if the return value is ENVL_UNKNOWN on the very first call: it will make
> U-Boot proper silently hang very early.
> Work around this issue by making sure we return some configured (dummy)
> environment location when prio is 0. This for instance happens when
> booting via FEL.
> 
> This fixes U-Boot loading on the C.H.I.P. boards.
> 
> Fixes: e42dad4168fe ("sunxi: use boot source for determining environment location")
> Reported-by: Chris Morgan <macroalpha82@gmail.com>
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> [Andre: fix FEL boot case by not returning ENVL_UNKNOWN when prio==0]
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
> Hi Samuel,
> 
> I cheekily added your Signed-off-by:, as I made this your patch (since
> you came up with it in that email reply some weeks ago). I hope that's
> fine.

Yes, this is fine with me.

Regards,
Samuel

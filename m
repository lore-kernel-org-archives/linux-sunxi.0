Received: from fhigh8-smtp.messagingengine.com (fhigh8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4798C42045
	for <linux-sunxi@lists.linux.dev>; Wed, 29 May 2024 02:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716950872; cv=none; b=uEWET95In/XxqNTuqwT9VPI3WrTpNrOKHNkyUwL2hTx00yl9I65VQgRlrTXzk18Uq4odzTv5EsJgPCTuEMeGgw6nUQy2YAEov52b8sbK+eVmGMwLgA8ZJ2NzR5gFVpqSbk/m9+8TvpBPouwzHGtu1tAf1H1LRJQkqXbKWaZq7Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716950872; c=relaxed/simple;
	bh=BvBDPauIC1DYkzBNK1wKsa/FTIBZeyAC9LV4tlQkQ+4=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=TZxwWU7AWtbQztV2rYwY4qZWkGKVj6zGQuHl20uSd72uXwALF6HEIzFNdd1K0ztswSH7LWJt09RndZiJ8jPwTT6WCYiUbYqmuxMRvEDVkrK7bprDOK/slvtfmOMMuF5jTDVy74HF2UBCmDmaLZOepvb/iZ1Fgid0HVzQ2dZWTLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=nPnzWxFF; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=TET9+Ue6; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="nPnzWxFF";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="TET9+Ue6"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 430E811400E1;
	Tue, 28 May 2024 22:47:49 -0400 (EDT)
Received: from imap47 ([10.202.2.97])
  by compute5.internal (MEProxy); Tue, 28 May 2024 22:47:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1716950869; x=
	1717037269; bh=BvBDPauIC1DYkzBNK1wKsa/FTIBZeyAC9LV4tlQkQ+4=; b=n
	PnzWxFFsOYYFpviKOvCSRMSzhokRr7xXLNf7jxo7tDlOXStYG0GsaiPmbQpBj14X
	GBgt2XxnFEuyQJVfOFetQUS6hWur8fRHsT37R/EhAl15HU6aKV/YVB7U1SV+6Nkm
	tOPBGaRRwC9sazVZL7bu86VyRVGMBhy3j1c/5fFiaO9UY8YHRSftXkogcynVz82j
	OMKQYrxM5nHDW0hnik5i4dWLh8zzna3zBXrUtXXwOUaKUIGD6oFruyukhVO8kwld
	cUaEolmVgpia1Wo2Krr2DyvvpUd+CepAFijNp7Dnr6N3tOcQOMiAE4aOu+LkA590
	7pwKhslRT6cNs9tb0AJcw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1716950869; x=1717037269; bh=BvBDPauIC1DYkzBNK1wKsa/FTIBZ
	eyAC9LV4tlQkQ+4=; b=TET9+Ue6JY2LdlHIlacDrkKQcP4B23ZS3nA2NoMrUnND
	+9r1uukYqafRU+DIoLKsdihf62O3ISA5hePLXNLBy4bB2ULXu09eOhgib7smRUyG
	YSoAgXvUx4vj68RC4URGv0VGCs/rLXvPwzpbT6Axa0yDzCpN663mAbxu0moaMppa
	bH8ZOxD3B6mtJ9kFLwTmc3LcsSBylIAnxUjHZScnvqMdnpF0Cd0zJXacUiV/M+Lm
	ZkTM4Z8TphCnN73ViKd5B1q8g6kO1xTqSJkLD1Wow5jG6jybj+MTA7o4VH0cH0r+
	hHYrqYMAXThmMtzl5pIkB04HI4HbG8Oe9ZJ/oDTtxA==
X-ME-Sender: <xms:VJdWZiVMawFH1FZFSF8pSw77D1EFYgLrrZkmt_XmFo3qKUT30uJydQ>
    <xme:VJdWZunFKpFmQ0xso5U_556C7hTC9PXzcmNfAAh76Z72h9fptWqqb2kxQyNBVH7Je
    bR_fRGXu_XHOjMnCQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdejledgiedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftfih
    rghnucghrghlkhhlihhnfdcuoehrhigrnhesthgvshhtthhorghsthdrtghomheqnecugg
    ftrfgrthhtvghrnhephedvveeigedujeeufeegffehhfffveduhfeijefgtdffteelgfet
    ueevieduieejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homheprhihrghnsehtvghsthhtohgrshhtrdgtohhm
X-ME-Proxy: <xmx:VJdWZmbyMbUFZc-Tezk_WzLuCQU70SpM3LlhbiCUZIEhzWAvfMYA0w>
    <xmx:VJdWZpVF9zSQtIxl05-MxzvSkgqlQ-lPkOeW1bHrLSzVRAdSA95Wkg>
    <xmx:VJdWZslCbE1lTq-7mSbU_ZsoOa2j006Ms23y6hoLm1nNbMmOKGnBhg>
    <xmx:VJdWZuehS5uyDqFDNnCpi-SzjGzplB6slwEeDxKLF-DVfgFp_r4TkA>
    <xmx:VZdWZtC01HEiE2XQ0dljeyOtCY2YqCmpozWyP1FQsRLYZobN-XmS4q9Y>
Feedback-ID: idc0145fc:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id D1DEFA60078; Tue, 28 May 2024 22:47:48 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-491-g033e30d24-fm-20240520.001-g033e30d2
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <e71e336b-a621-4c11-93b5-2485fe24bbaa@app.fastmail.com>
In-Reply-To: <20240509231316.11391-1-andre.przywara@arm.com>
References: <20240509231316.11391-1-andre.przywara@arm.com>
Date: Wed, 29 May 2024 14:47:28 +1200
From: "Ryan Walklin" <ryan@testtoast.com>
To: "Andre Przywara" <andre.przywara@arm.com>,
 "Jagan Teki" <jagan@amarulasolutions.com>
Cc: u-boot@lists.denx.de, linux-sunxi@lists.linux.dev,
 "Chris Morgan" <macromorgan@hotmail.com>
Subject: Re: [PATCH] sunxi: spl: h616: fix booting from high MMC offset
Content-Type: text/plain



On Fri, 10 May 2024, at 11:13 AM, Andre Przywara wrote:

> Extend the existing offset calculation code to consider the different
> sector offset when running on an H616 SoC. This allows to load U-Boot
> on any H616 device when the SPL is not located at 8KB.

Thanks Andre,

Confirmed with an H700-based board and u-boot at the 512-sector/256KB offset.

Tested-by: Ryan Walklin <ryan@testtoast.com>

Regards,

Ryan

Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE5E14A82
	for <linux-sunxi@lists.linux.dev>; Tue,  2 Jan 2024 15:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="uJxskKfc";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="GwPvekm6"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 378165C01B2;
	Tue,  2 Jan 2024 10:49:30 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Tue, 02 Jan 2024 10:49:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1704210570;
	 x=1704296970; bh=re3c7L/ex/cGX+8IVF1hTke8J+Eh67r1EKZXujf+t58=; b=
	uJxskKfc+9AkHj8XcfzhTj7mB53Ei3uNsXecyGAlVY0SQXWrPo0j9kj/Jk4DELex
	ewiTeXF//gXhQaEOkUM/HHWLfVB6MoHkv9DHIw+JXrENPQQpdO7DOU4+Di9DH3xY
	5EnyN4a4B2JTvvmNazHJ7QSRq4X+tUDgecxB/Val3aj97nwfa28jme1uDkz34TN9
	K+ZTUXlsBQh1dEQcb2Ri4AlqXHlDExEK51YGtED/9qwpubb6FikrAfxHJspz+8CN
	V9V2aXFS/VWCDj1noSynJIAoHMpYdfs4ujp54oZt8MrAqhsxmgqIqwa43N0TvnpY
	DKV9TWOrnBXDycM0M4kgZA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1704210570; x=
	1704296970; bh=re3c7L/ex/cGX+8IVF1hTke8J+Eh67r1EKZXujf+t58=; b=G
	wPvekm6YFc01Poa3lgIHZJ+K44P8VRoRKTGEHMmZmZ0sjcoxLkWeeP2w9x/bowCj
	1oCNjZrlKAbmn5gUPe5kRrPt7v7PtfOMTLBe/T9g3lOUK5Bw822vU5DOYB9gY0cs
	7UkCc/BjSSKVd08OJZkUIZR6gPmEquLx4etNEB92UU4y6ARW5RrBI9u6fiF/unTt
	dYhb0QfC1pa/Vg5I1njJbUwssdl3h5EmgnnGM8EYJ12SQfCSg4m2buAdrlkyIk0I
	Qr6WGUZbCWhzNeX7Bfdot6Dwg7CWDIJChWx6Hm8EAm50VjqQ1Nq667it3UmiSpZC
	RUI/C4NKol0eeOzmlBwHw==
X-ME-Sender: <xms:iTCUZcKpCDWXg7gWPy0Sq6pq6jDg9upZBhg2PWqqEj_qWUpvw37c1g>
    <xme:iTCUZcKvAmBfwT8jwPIvgSG5RGZ-0IFRQ6EXDx4oNX5dtIMMDKw6dR30xGN5dmX7x
    8GSuHHJccBmR44e4pM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdegfedguddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpefgkeeuleegieeghfduudeltdekfeffjeeuleehleefudettddtgfevueef
    feeigeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:iTCUZct5RYX0ERgWrt9-v4OlQ_RhIHzHiKyU6bHbpfuJlfKCfakkAg>
    <xmx:iTCUZZapCMDBQHt3hb4Jcub5mlsvdK-MI3boeQ5Pi4cWCzUnWnohDA>
    <xmx:iTCUZTa9mDJC4-Pwuvf8Sd-OiA6GxEODx-H6jN1o-vf3_yLQmyrFFg>
    <xmx:ijCUZRNrQukWmTHp80zgkBSDelVKM1zSN8Wnjgso5jq5aEjnD_yXDQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 96C50B6008D; Tue,  2 Jan 2024 10:49:29 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1364-ga51d5fd3b7-fm-20231219.001-ga51d5fd3
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <952ceeab-de16-434e-b69f-a45522feb79b@app.fastmail.com>
In-Reply-To: 
 <CAGb2v66dvTZdRZF+yrdiAsjHVLAQkusyAx=Z5f=UxMNYBAY80A@mail.gmail.com>
References: <20231228193903.9078-1-wahrenst@gmx.net>
 <20231228193903.9078-2-wahrenst@gmx.net>
 <CAGb2v66dvTZdRZF+yrdiAsjHVLAQkusyAx=Z5f=UxMNYBAY80A@mail.gmail.com>
Date: Tue, 02 Jan 2024 16:49:07 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Chen-Yu Tsai" <wens@csie.org>, "Stefan Wahren" <wahrenst@gmx.net>
Cc: "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 "Samuel Holland" <samuel@sholland.org>, "Maxime Ripard" <mripard@kernel.org>,
 =?UTF-8?Q?Myl=C3=A8ne_Josserand?= <mylene.josserand@bootlin.com>,
 linux-sunxi@lists.linux.dev, soc@kernel.org,
 "Florian Fainelli" <f.fainelli@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 "Nick Desaulniers" <ndesaulniers@google.com>
Subject: Re: [PATCH V2 2/2] ARM: sun9i: smp: fix return code check of
 of_property_match_string
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 2, 2024, at 15:59, Chen-Yu Tsai wrote:
> On Fri, Dec 29, 2023 at 3:39=E2=80=AFAM Stefan Wahren <wahrenst@gmx.ne=
t> wrote:
>>
>> of_property_match_string returns an int; either an index from 0 or
>> greater if successful or negative on failure. Even it's very
>> unlikely that the DT CPU node contains multiple enable-methods
>> these checks should be fixed.
>>
>> This patch was inspired by the work of Nick Desaulniers.
>>
>> Link: https://lore.kernel.org/lkml/20230516-sunxi-v1-1-ac4b9651a8c1@g=
oogle.com/T/
>> Cc: Nick Desaulniers <ndesaulniers@google.com>
>> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
>
> Reviewed-by: Chen-Yu Tsai <wens@csie.org>
>
> Arnd, would it be possible to apply the two fixes directly to the soc =
tree?

Yes, I've merged them into the arm/fixes branch now. These
are currently the only fixes I have queued up but I should
be able to send them before the v6.7 release.

   Arnd

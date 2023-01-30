Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8650D79F7
	for <linux-sunxi@lists.linux.dev>; Mon, 30 Jan 2023 21:24:39 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 9FF755C0110;
	Mon, 30 Jan 2023 16:24:38 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Mon, 30 Jan 2023 16:24:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1675113878; x=
	1675200278; bh=7xdenzLzMQPHBAr8r+fprB9Rs7AkyS5ZxIOcLLnC+7w=; b=e
	8ZytCfwt+bkxQXPOYEDTpY2F8NsTlUhlZ60ChsGwiZQLfXdVMAZsmrW3h4p62Nq/
	VFXXzuw6BB6GBXQyFkBcViXgFFm5nR2PcfRz47E2kMGEOtU3Nm2TfZ1Sa0r/n6JH
	h+tKHkTeCR7KEzEBW8k7EGun7D/EI7MZ/1Bf0y4oRfY9Uzcu9ddavB87bXfV6uU2
	Ih4GZ/8IijMlZw/zgSnEm1efpAFQ9rDGIhJhltCiJQ44tzDUcGbk6/jZmArj8pEA
	1rPolzhgnUvXtqJ/rlQ/PpTSy5eFifMYnqRteSBiqh/agyhU2q+R7bSFvLkACVVO
	SZaoEC6+2B0gTQ5oId2TA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1675113878; x=
	1675200278; bh=7xdenzLzMQPHBAr8r+fprB9Rs7AkyS5ZxIOcLLnC+7w=; b=g
	KJ+iOOF5plYxC0NVNJJDM0akrUQkN9yL4rBiy+4fPA2y/F41X/pOOYeSBnRMhP6N
	Y6d14h5HoG/v7+jpYPupT2HPunlk5dJZdv1hTwWCDWxYsLTcOn1gos1LMbf8qEQg
	jdSXOOAMEvgQXGMk0IbTeOmToZPb25x5HLdpqRYIMHB/9bhC7ckIhraepbywm1BE
	xNya4l5Tx5A+2I8OuJ2XKMIQAYD+Sw1gKfWSdJwgfqEjRm9ibLBDqHhqQmlcqTeu
	ivaiVqxDDATz/MgMBa3/6oR3pRQanOyI37hA0H9umDmjsBBJnbl08yvEpfSaM9HJ
	mhowc3fJNHm6LYAy/65Wg==
X-ME-Sender: <xms:ljXYY8KMZKjOEke4NG878fzIg4dvbl11QIzIhr8TjBhBwwqKM59Gkg>
    <xme:ljXYY8JWFFDge7Az_23fNVrwAOFC0-ZB02swXmyqcWOxjdnjFJdhGwTsAqgcaRW_9
    kg4Sjco3inuKkQkTE0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudefvddgudehudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedf
    tehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrf
    grthhtvghrnhepgeefjeehvdelvdffieejieejiedvvdfhleeivdelveehjeelteegudek
    tdfgjeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:ljXYY8uU04zeKmsBxdUdp35vZ_Mc3gsXGpglfsAVB9FHESnTXBTUTQ>
    <xmx:ljXYY5YozIeYIQqEGVP21TD-ou0zm8LWB82fagvEEMLGhWd65ty8WQ>
    <xmx:ljXYYzbQ7_hnG1VsAW7134hjTs_xIZJx-VU8PkRXE2Y2A6YyfRDajw>
    <xmx:ljXYYyXazqnRshGfvBqfAw_wUJrViQSrnHrdlRT-agkWVdakidToVQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 2533DB601AF; Mon, 30 Jan 2023 16:24:38 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-106-gfe3ab13a96-fm-20230124.001-gfe3ab13a
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Message-Id: <d8cbab64-497b-4595-ba5e-62854d7bfb01@app.fastmail.com>
In-Reply-To: <4802479.31r3eYUQgx@jernej-laptop>
References: <20230130130453.379749-1-arnd@kernel.org>
 <4802479.31r3eYUQgx@jernej-laptop>
Date: Mon, 30 Jan 2023 22:24:18 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 "Chen-Yu Tsai" <wens@csie.org>, "Samuel Holland" <samuel@sholland.org>,
 "Arnd Bergmann" <arnd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: sunxi: select CONFIG_PM
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 30, 2023, at 22:18, Jernej =C5=A0krabec wrote:
> Dne ponedeljek, 30. januar 2023 ob 14:04:47 CET je Arnd Bergmann napis=
al(a):
>> From: Arnd Bergmann <arnd@arndb.de>
>>=20
>> Selecting CONFIG_PM_GENERIC_DOMAINS without CONFIG_PM leads to a
>> build failure:
>>=20
>> WARNING: unmet direct dependencies detected for PM_GENERIC_DOMAINS
>>   Depends on [n]: PM [=3Dn]
>>   Selected by [y]:
>>   - SUN20I_PPU [=3Dy] && (ARCH_SUNXI [=3Dn] || COMPILE_TEST [=3Dy])
>>=20
>> drivers/base/power/domain_governor.c: In function 'default_suspend_ok=
':
>> drivers/base/power/domain_governor.c:85:24: error: 'struct dev_pm_inf=
o' has
>> no member named 'ignore_children' 85 |         if
>> (!dev->power.ignore_children)
>>=20
>>       |                        ^
>>=20
>> drivers/base/power/domain.c: In function 'genpd_queue_power_off_work':
>> drivers/base/power/domain.c:657:20: error: 'pm_wq' undeclared (first =
use in
>> this function) 657 |         queue_work(pm_wq, &genpd->power_off_work=
);
>>=20
>>       |                    ^~~~~
>>=20
>> Unfortunately platforms are inconsistent between using 'select PM'
>> and 'depends on PM' here. CONFIG_PM is a user-visible symbol, so
>> in principle we should be using 'depends on', but on the other hand
>> using 'select' here is more common among drivers/soc. Go with the
>> majority for now, as this has a smaller risk of introducing circular
>> dependencies. We may need to clean this up for consistency later.
>>=20
>> Fixes: 0e30ca5ab0a8 ("soc: sunxi: Add Allwinner D1 PPU driver")
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
>
> Although, would it be better if commit in question is fixed and anothe=
r PR is=20
> issued? That way we can avoid issue with broken config.

Agreed, merging it into the original commit would have been ideal.
unfortunately the half of my brain that does the pull request
didn't talk to the half that wrote the bugfix, so I already pulled
it in after I sent the fix for linux-next...

I'll just add the fix with your Ack on top then.

    Arnd

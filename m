Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ADDA6AA3
	for <linux-sunxi@lists.linux.dev>; Mon, 30 Jan 2023 17:20:03 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 2A0D85C0289;
	Mon, 30 Jan 2023 12:20:02 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Mon, 30 Jan 2023 12:20:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1675099202; x=1675185602; bh=AQam6bn2Nw
	3GR5VSngexibyvjc04dKqvmnTkA+DGI44=; b=YMe1EQGeKYGUFnCUiBY/uXJeVR
	7luAqIQ7W7+uskF5aWnjMqY2agvLyqRSNb4tP1qqhFiPVp1KLLe6Hi/z6yITzOi5
	TfmG2KxuONdl1rhMay1JOQjnMdr9/+OL0lIQH9hys0l/fNJzNRHXabo/bKxZjjUx
	0esV/2Y3hbONuEI8uN3XelkEKxHQT7QtefS9XhMozr8h9ccFLc9KFs0ZtYs8NLi+
	JHRldXGnH/RWUZCN0+WpNgmcgv7ESqDPBcGXElX7xieEGxDqvD2+2M16Q8AzhREV
	PgB4/tWV0ZN0joV/XnVK4nmZQwXg/5GGiuEEW//bmbVrwTjtPPCFxuqoo5qA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1675099202; x=1675185602; bh=AQam6bn2Nw3GR5VSngexibyvjc04
	dKqvmnTkA+DGI44=; b=DWK/Edy5RT8TsWiroeAcd8ooYTxFVXhWXliueNfu2bsa
	nlIdGKV8r/Z15G9jG4sItqYFWvOmRwvPcsV4F7XxRcPP4h4mMSGUA3/x/fDmnz52
	7uF/1gliTN7tiMI1Yv5yaNzrc3X8YuDTRlPB4VJZgkD+mk43UL0EsF6iKD4lJTEN
	ukBuJ4bP01oh+pWRebRQPcocvY3ApQsN8Ckzv7evjJ4faw9AeuYVxxOtFXog/Aki
	+iqKTMTsEd5TZEj/T088HQAEeoliobZt06AiPYX5fLVWDYCbV3jGuWScRLFOCY7x
	s16T8rmVA3t6Zoe6SIk6erxJNR/IanBqXTgHnwyGxA==
X-ME-Sender: <xms:QfzXYz8zzIqN5e_GthUYF5-f0U8EvIwdad9RvvNWWHZj1sR7xbYHhg>
    <xme:QfzXY_uHBreAx6VKJynSshr8dNxfkLLNLFJ9vIexE3RcGn1p2NxL8tf5-mbT_GQ54
    zuJ86NCPpkM2Oa_zaY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudefvddguddtvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeevhfffledtgeehfeffhfdtgedvheejtdfgkeeuvefgudffteettdekkeeu
    feehudenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:QfzXYxDAt8jyKsIN8Dzb7sa_KMiieA9TTRRzsdarvcmG9OOtibh4oQ>
    <xmx:QfzXY_eSbsA_58ExkXu38P8_P_27ZbsOrZa05zgpeXPPEnbMZzB2Lg>
    <xmx:QfzXY4NBFjHvLS6IfHZ9XrCc7ILYZrdiCYNkUEqeGWBAanYTQLyABg>
    <xmx:QvzXY1oyuxIxwanU8z5CcWvz-CSlHByf3ZdIxnlf5QG_NoYrAJlAFA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id A2861B60089; Mon, 30 Jan 2023 12:20:01 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-106-gfe3ab13a96-fm-20230124.001-gfe3ab13a
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Message-Id: <161e4bee-e1c3-4fb1-ab3a-aab5d81796c5@app.fastmail.com>
In-Reply-To: <Y9Raak4mhdtL0L8e@jernej-laptop>
References: <Y9Raak4mhdtL0L8e@jernej-laptop>
Date: Mon, 30 Jan 2023 18:19:42 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Jernej Skrabec" <jernej@kernel.org>, arm <arm@kernel.org>, soc@kernel.org
Cc: "Chen-Yu Tsai" <wens@csie.org>, "Samuel Holland" <samuel@sholland.org>,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [GIT PULL] Allwinner device tree changes for 6.3
Content-Type: text/plain

On Sat, Jan 28, 2023, at 00:12, Jernej Skrabec wrote:
> Hi!
>
> Please pull following device tree changes for 6.3. Note that this PR
> depends on following immutable tag:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git 
> soc2arch-immutable
>
> Let me know if I should split this PR into two, one for ARM and another
> for RISC-V.
>
> Best regards,
> Jernej
>
> The following changes since commit 3af577f9826fdddefac42b35fc5eb3912c5b7d85:
>
>   RISC-V: stop directly selecting drivers for SOC_CANAAN (2022-12-27 
> 18:01:40 +0000)
>
> are available in the Git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git 
> tags/sunxi-dt-for-6.3-1
>
> for you to fetch changes up to dca36f7b3dd7eb574f0958484d3d21cfd8af2651:
>
>   riscv: dts: allwinner: d1: Add power controller node (2023-01-27 
> 23:21:06 +0100)

Something looks wrong here, I get an error when pulling this:

ERROR: commit-id mismatch between pull request and remote
       msg=dca36f7b3dd7eb574f0958484d3d21cfd8af2651, remote=3af577f9826fdddefac42b35fc5eb3912c5b7d85
Topmost hash is not the same. Expected dca36f7b3dd7eb574f0958484d3d21cfd8af2651

Can you check what happened and then either push the correct branch
or send a new pull request, depending on which one has the intended
commit?

     Arnd

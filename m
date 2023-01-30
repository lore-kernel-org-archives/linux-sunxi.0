Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0FBF6AA3
	for <linux-sunxi@lists.linux.dev>; Mon, 30 Jan 2023 17:24:41 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id DBE355C0249;
	Mon, 30 Jan 2023 12:24:39 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Mon, 30 Jan 2023 12:24:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1675099479; x=1675185879; bh=HdYqkwwYzO
	/7jj6czR+YN6tobe95y5jxPqL1M7qlJpo=; b=pwP8j/6gwCWB6Or/+HLFtAucQ7
	FOOc6MahZa/+0VQGbmNo89hIHajlEALuxhlIpTnQxcNq95pYpVieYuG/5MBF/C2D
	YoCdu2TiH0UINPlhv7XyTMMhXylL6H4R3F2TDV6PQO843aGBh6ZHk1PstMbsrMc5
	Fd2cLw1x1GAWcppmzY5w7jJ7v8EJcyekkPBLFutp1r1Tu1u/rA5waiQvN0PFzX/k
	s3Ii94a1GLGJoVL01cEIwq+yOhW/4dSt4XBB/kSOaaS9+6K6B4KHCJ1815sVIuYt
	aR5Auua0cK6w7FRNENNXp+Cv30SiYPmtERVACNnR1NoagWOQ2isCLSvbrIEQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1675099479; x=1675185879; bh=HdYqkwwYzO/7jj6czR+YN6tobe95
	y5jxPqL1M7qlJpo=; b=QEf+Qc4X57otx6LQYN8rqNKuCkbXK7ZuFnW+6i5e24b/
	YeJj+4x4aMXonuAkyKrqMZPF9QMlF9G30pVZ5VR3KurqUiTnAacMyUOkAWk5wjUd
	JYkn0J5t2kb33cCBl7KtPYojRVjPJgGkYmWy4RFYWYmAOaMIgLz/6sI3DiRtYEaD
	2HkGeftV7Q2H/OF3bL6wmJk2YzPXbN5W6MhtsCoJnaGLV9cF7k8kk4BZOl2HiaP4
	PFzbnrk+XYdqUBU9+HlzRzVOx1PvMWjiza1FyH89b64CiS6eEff0I1R/bunzoLcN
	6XzhwlkZa8Iml0g1v+BIj8gMbAwqyhXTb0AotKYdlg==
X-ME-Sender: <xms:Vv3XY8fbt2IBqgGVrHTkjrDBWJNSu2GaDztG48Nn2AOe-oGBcXupWQ>
    <xme:Vv3XY-N5J63Zg7m8aCDoJAZQNcnnqxdRLTj1BfPH9jpxGKiBP1T90MmAtSeoBU7_C
    lUz2mTdELLa1tmJ_d8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudefvddguddtfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeevhfffledtgeehfeffhfdtgedvheejtdfgkeeuvefgudffteettdekkeeu
    feehudenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:Vv3XY9gv9V9KkLwpSifa0TLPB__IYm6CnCIOIkAyB2f0AFQmr3Vlzg>
    <xmx:Vv3XYx_bZNRMRJlF0EGJvVKSBDQwzUL-xFP7DBHeBXGTPj0hJNI5xw>
    <xmx:Vv3XY4vqpirxZtAjy-ZRF48dtY_354YE4zvxIkG5n43-tIwVYrODCA>
    <xmx:V_3XY6IXECQMtB7l3aRnszgL79YWkbLg8mSOJlNtotijItV2xvudgw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 843C8B60086; Mon, 30 Jan 2023 12:24:38 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-106-gfe3ab13a96-fm-20230124.001-gfe3ab13a
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Message-Id: <3fbab696-2c32-41c6-ac29-86ca302258cb@app.fastmail.com>
In-Reply-To: <161e4bee-e1c3-4fb1-ab3a-aab5d81796c5@app.fastmail.com>
References: <Y9Raak4mhdtL0L8e@jernej-laptop>
 <161e4bee-e1c3-4fb1-ab3a-aab5d81796c5@app.fastmail.com>
Date: Mon, 30 Jan 2023 18:24:19 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Jernej Skrabec" <jernej@kernel.org>, arm <arm@kernel.org>, soc@kernel.org
Cc: "Chen-Yu Tsai" <wens@csie.org>, "Samuel Holland" <samuel@sholland.org>,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [GIT PULL] Allwinner device tree changes for 6.3
Content-Type: text/plain

On Mon, Jan 30, 2023, at 18:19, Arnd Bergmann wrote:
> On Sat, Jan 28, 2023, at 00:12, Jernej Skrabec wrote:
>> Hi!
>>
>> Please pull following device tree changes for 6.3. Note that this PR
>> depends on following immutable tag:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git 
>> soc2arch-immutable
>>
>> Let me know if I should split this PR into two, one for ARM and another
>> for RISC-V.
>>
>> Best regards,
>> Jernej
>>
>> The following changes since commit 3af577f9826fdddefac42b35fc5eb3912c5b7d85:
>>
>>   RISC-V: stop directly selecting drivers for SOC_CANAAN (2022-12-27 
>> 18:01:40 +0000)
>>
>> are available in the Git repository at:
>>
>>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git 
>> tags/sunxi-dt-for-6.3-1
>>
>> for you to fetch changes up to dca36f7b3dd7eb574f0958484d3d21cfd8af2651:
>>
>>   riscv: dts: allwinner: d1: Add power controller node (2023-01-27 
>> 23:21:06 +0100)
>
> Something looks wrong here, I get an error when pulling this:
>
> ERROR: commit-id mismatch between pull request and remote
>        msg=dca36f7b3dd7eb574f0958484d3d21cfd8af2651, 
> remote=3af577f9826fdddefac42b35fc5eb3912c5b7d85
> Topmost hash is not the same. Expected 
> dca36f7b3dd7eb574f0958484d3d21cfd8af2651
>
> Can you check what happened and then either push the correct branch
> or send a new pull request, depending on which one has the intended
> commit?

nevermind, I see what happened: the script parsed the pull
request incorrectly and tried to pull the soc2arch-immutable
tag instead of your tags/sunxi-dt-for-6.3-1 tag.

I can handle that here and fix it up then, it's not your fault.

Combining the risc-v and arm bits is fine as long as this makes
sense as a branch overall. If you have too many different things
in one branch, it makes sense to split it up along some boundary,
but that does not have to be between architectures, just based
on what makes the most sensible changelog text in each pull
request.

     Arnd

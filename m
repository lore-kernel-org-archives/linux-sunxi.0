Received: from fw2.prolan.hu (fw2.prolan.hu [193.68.50.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172931494B2
	for <linux-sunxi@lists.linux.dev>; Wed, 27 Nov 2024 07:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.68.50.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732691546; cv=none; b=dq54DSRofMjZywIy4AZHZ4+dadvMXGT/503qnkq2swwA7ZDx+48N4CDbQOp31RNPs2E0jAFyAvbUT0echNVRjpaiC53hr+jby6AR3uGjYo4JMEuVZud2phjT4Hfnk/ePdgdNuTvsyNuF5Sfrhbe+qhmSOo9JvpMm/Nq1D07R4qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732691546; c=relaxed/simple;
	bh=DQ8NgbSKIk2393Iv25ChBGcnvTgnFEGSnzdzgr0SRUM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=XBxPP3mLwaDUEIFiEjwOFNw4N8Jqb+1JEYtMnhRtpesk8kR/cBHfDfwH3HhVczWarCy9n4vyuZMKh1vmDfdl5wFuWv25Exkjc4a2gmawWRkdh1OJVpCGhn4fY+I9Aer5qFi6GZ2B3DtFd46AaCYuTRcx/zg2BJDTDJdOgspJSMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prolan.hu; spf=pass smtp.mailfrom=prolan.hu; dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b=R6hqUfMX; arc=none smtp.client-ip=193.68.50.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prolan.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=prolan.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b="R6hqUfMX"
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id A1DB3A06EB;
	Wed, 27 Nov 2024 08:12:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=BH5mL4wRTiW49fY5TXH3
	cCb7VB9lpyJqEtwCttH2FW4=; b=R6hqUfMXnZ+Zn7nY1F21IEQ2ivu4jGDH+c36
	eeIia4n3sF3imo7exXZM6JEBkP7zeDYRHAO+xCgYHIQti4y8UZKCEKnhiLxDN+78
	kIBmYJt0j+RC6pLDHRQubvjs35YAKuYaVDuC1/O4ZK+1HQ6NNNrWSIYPURZPsr/t
	r7BLhAHAnb60rCVIWNuaIdmKSsqR7CqkGGedvePUYG51HnAE3BKNsIM357djU2BD
	34d+PRao6xV4X4SpPzPGYHl423Ts8hhLaS+uBy0aYZo2D6KdZvEZr5NEuOhWnboP
	JiaOeuwyFUd3wrqJIcPgDDHDlN+eAGsZAeDa+mbViP9dthwA3KBMEfHvWmr1aT2+
	U3q9x86pGNdLwNmsSrOkYbIFpGIaz6OLrmOQ3FGeJItWt5ULfpMo7hItNXCtt6sa
	Ewx+5bCTjOrlMQ24wcsTVBLjU82t1GLlvwHvIdaXsU04xpR+7KAgAmr/X3bHsEgG
	kuZ9+me9UtKV4Sw7Lx9RnrXe6+uzuHAaas5n6X1kUo67sd1I+/WZP3hM6fWad69P
	6VUyCdljZ2bwYJJc6ek6LqOskboWgoZzpZbnSxb/fEwUFWbVZoqAqF2LlnVxHcgJ
	658L38zIuTluCn2jhn3DXyCcV3/aBrQ9upWh9jHJxVPTabLILaBg/ATmu8xLTz4C
	Jhk007o=
Message-ID: <60f52d54-da36-4223-9063-b833451781ea@prolan.hu>
Date: Wed, 27 Nov 2024 08:12:11 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/5] ASoC: sun4i-codec: Add support for Allwinner suniv
 F1C100s
To: Mark Brown <broonie@kernel.org>
CC: <linux-sound@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-sunxi@lists.linux.dev>, <linux-kernel@vger.kernel.org>, Mesih Kilinc
	<mesihkilinc@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Chen-Yu Tsai
	<wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
	<samuel@sholland.org>
References: <20241123123900.2656837-1-csokas.bence@prolan.hu>
 <20241123123900.2656837-4-csokas.bence@prolan.hu>
 <d0ecce33-25e2-4711-8311-7788c77b7d2d@sirena.org.uk>
Content-Language: en-US
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
In-Reply-To: <d0ecce33-25e2-4711-8311-7788c77b7d2d@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ATLAS.intranet.prolan.hu (10.254.0.229) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94855637465

Hi,

On 2024. 11. 26. 13:18, Mark Brown wrote:
> On Sat, Nov 23, 2024 at 01:39:02PM +0100, Csókás, Bence wrote:
> 
>> Signed-off-by: Csókás, Bence <csokas.bence@prolan.hu>
> 
> When you write your signoffs like this with the , but no "" (like in
> your From:) it confuses software and causes everything after the , to
> get deleted.  Probably just including the quotes is the best option to
> match the email header.

Git handles it fine since 2.46, before that there was some weirdness in 
send-email not adding it to the Cc: correctly, but git am & co. worked 
fine. b4 still has issues with it unfortunately.
Link: https://github.com/mricon/b4/issues/50

However, the real problem I think is that git format-patch doesn't add 
the quotes. What's worse, you'll have a real hard time trying to git 
config --global user.name "a quoted string". Git tries *really* hard to 
remove surrounding quotation (and is further aided by the shell). I'll 
see what I can do.

Bence


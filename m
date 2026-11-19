Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795087762;
	b=yDSSehWznrF0ntDdlMARkOb8Ks33qAlRKF2l7Rbq061SZier+oyoJBNfc015XGq9NRv2
	 D+ByXiGLGoiUx4YkUfsLnMHQw9JsXDEeKrkcjbbrBMFUaSrGFUtOD2/KMSVALSTpO0Eqr
	 sWgOyiIKIB8LIIC0tH1nMJAPKbqQFyHqndXihrmu74/z3GPtX8xDGTCXNm/WAJAsmDJUJ
	 qwp69Pkb19NAsvKnYlTeSLvlQO0uVOxThJFSl9HqWwU8xzRqYUQgq8iXEqGO7MMbiFaeC
	 SGg3474g6aZOetg3r04RDoTE05G8PL0e9uddM6CY7dBUQOPxWsS8/Z1kmV1IrpmazyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795087762;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=TMPFQPDqGQV8ewezpOQ17DVWVzcGJGg/lf19o6pAFCI=;
	b=IBIrAgNV/joe7CJvFlqrwPk3D3heGIw0hxxIODChmi4Wl8CNsmcovRpKdkd0XAfQEFEa
	 qpllwvkCjlRfWpatO4R96LInNGBgOlbnxBww35nilgJS4g6SEZYE6s8cj/8A+JobFWTCd
	 oV16abBFeOsTLywlWnBvsyK5mS/8VUADhqTTXYIwMd5PDb6Caq/n7S3HLvvqxXxBeZ6aI
	 t/B0zYbUqrEQOgSSPiOe80DYdRCgNjD2dFpjwStJdGcuHSXlt37ejU5JZ5VCZFVqfWvHU
	 mJbQ85NH5SkqoFBLqiODJtq+gTACFMn4QRdVlts67P4Q2a7ujvc0V58H3wQd9l124vA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=GTXBj8EB;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 216ED606A320
	for <linux-sunxi@lists.linux.dev>; Thu, 19 Nov 2026 11:29:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 216ED606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=GTXBj8EB
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 763381575;
	Thu, 19 Nov 2026 03:29:18 -0800 (PST)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 46E163F882;
	Thu, 19 Nov 2026 03:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795087761; bh=PFeJkeoFMevWZRxqYpWH4qnI2a/e8R2Bp9q+TorgFGo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GTXBj8EBsv9tO6lb6EYOKVcz1RbYc0yxpAUUtLdb099vJ3QuZ/pfd3yp+QBNIAtPQ
	 2O1yhLyv8ydPzNx4lO1i4qahrQMAMqW128agChzggimMTJHCYsmyS8uz4bUG9GEGJy
	 Uj5z8r/kkpMp/kPPxIiRZYL4n9odH4FkIOfJUj+8=
Message-ID: <435b0f23-134f-4d52-8a08-7cde51f7de38@arm.com>
Date: Thu, 19 Nov 2026 12:29:10 +0100
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] sunxi: A133: Add CPU speed grade detection and OPP
 table
To: Rajan Yadav <rajanyadav0307@gmail.com>,
 Paul Kocialkowski <paulk@sys-base.io>
Cc: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 linux-sunxi@lists.linux.dev
References: <20261104-a133-series-v1-0-58217cb33a87@gmail.com>
 <d4d89cf9-884d-424b-927d-5b6692f50327@arm.com>
 <CANxy8yTiJoGJe5uz_R5hTdmT9A8ZsxAphB6qWSB4_SDuLSHSaA@mail.gmail.com>
 <CANxy8yTA7Nqmggk=qn7tCnXn50vS2ceHdZYZC0_OancmZhnKcg@mail.gmail.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <CANxy8yTA7Nqmggk=qn7tCnXn50vS2ceHdZYZC0_OancmZhnKcg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 11/18/26 12:26, Rajan Yadav wrote:
> Hi Paul,
> 
> A short follow-up on this. v2 of the OPP series is out now [1], so the
> K5C DT can use the A133 OPP table.
> 
> Do you already have a K5C DT, or plans for one? If so, I am happy to
> test and review yours on my board (PCB V1.3) instead.
> 
> If not, I would send mine as an RFC in about two weeks, with you in Cc.

Just a heads up: if you send a first version in two weeks, it will most 
likely miss the v7.4 merge window, which would be a shame.
If you could consider sending something earlier, even if it's not 
perfect, we could start the review already, and maybe can then meet the 
deadline for the next release.

> It passes dtbs_check against 7.4-rc1 apart from the missing board
> binding and "kickpi" vendor prefix. Some regulators are still open,
> because I do not have the schematic: which AXP803 rails the board
> really uses, and whether USB0 VBUS is switched by the PMIC. If you have
> the schematic, or know KickPi's registered company name for the vendor
> prefix, that would help.

For the regulator assignment, try to look at a running BSP kernel, 
checking /sys/kernel/debug/regulator/regulator_summary, if available.
Or look at the vendor DT if you find any hints on the regulator 
assignment. If nothing hits, it's probably save to see if the other A133 
DTs agree on a specific regulator, and copy that.
Also it might be possible to turn a specific regulator off, to see if 
the component still works, to get some confirmation.

Cheers,
Andre


> 
> [1] https://lore.kernel.org/all/20261118-a133-series-v2-0-8bcec9c9aadf@gmail.com/
> 
> Thanks,
> Rajan


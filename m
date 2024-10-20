Received: from omta40.uswest2.a.cloudfilter.net (omta40.uswest2.a.cloudfilter.net [35.89.44.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7804EEC5
	for <linux-sunxi@lists.linux.dev>; Sun, 20 Oct 2024 11:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.89.44.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729424806; cv=none; b=sg09iVeZA17j2h53t1Zy56R/DCpI5TU99T3NQaJixM24sH+dwCHNpIgZybMKb1urv+7ChmLEGJ7EwGoobMajDSw6QHxtI7Wp9BGnTmfivYpdwAunTZPXy6aNXS3qnL84VJ5xiiQtNWT7aVZy2nyG/uzRlf59cUzwEfv8MGSefOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729424806; c=relaxed/simple;
	bh=upnip+KNwQAs5nEMTYdsPkAdO8L2+BUAYtZm7wVhLGo=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=p/5Sg4eTO6k7Ptt8kJ/+vEVLbhWEIJFOGtSCj1riImM/OsuS78l3DC0VX1UVoE4SN/jSpnaP88rCSH4D0HeTjdpDFyPAE2QRdSdiLJsnOd8I/ZCqZKFRJY1l4nAJFxuUsUw6Ignimfy1XyGpPOxb70pXAT+ZCs2ygm0QL/6JKKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com; spf=pass smtp.mailfrom=linumiz.com; dkim=pass (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b=WYQYnjCw; arc=none smtp.client-ip=35.89.44.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linumiz.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b="WYQYnjCw"
Received: from eig-obgw-6005a.ext.cloudfilter.net ([10.0.30.201])
	by cmsmtp with ESMTPS
	id 2SPtttoBAvH7l2UORtOVlj; Sun, 20 Oct 2024 11:46:43 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182])
	by cmsmtp with ESMTPS
	id 2UONtKHgzxK8v2UOPt0aR3; Sun, 20 Oct 2024 11:46:41 +0000
X-Authority-Analysis: v=2.4 cv=T/9HTOKQ c=1 sm=1 tr=0 ts=6714eda1
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=geAcWm3dhgwnT0Pjoka1yw==:17
 a=IkcTkHD0fZMA:10 a=DAUX931o1VcA:10 a=-pn6D5nKLtMA:10 a=vU9dKmh3AAAA:8
 a=VwQbUJbxAAAA:8 a=6Ujbnq6iAAAA:8 a=YmDlHjd7AAAA:8 a=jMfKuDRYAAAA:8
 a=M0D2_HLXQKRqHRaDSZIA:9 a=QEXdDO2ut3YA:10 a=8eZOVWP4HKkA:10
 a=rsP06fVo5MYu2ilr0aT5:22 a=-sNzveBoo8RYOSiOai2t:22 a=jsfG_yEu7aiiUYXEnMLs:22
 a=-3YgmSAAc2L1nfTqJm0e:22 a=ZCPYImcxYIQFgLOT52_G:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Lz4/Flhiw6ewyWon5kfy+3sj4U87pQQGDwuFZrLscXQ=; b=WYQYnjCwhv483UaeNE8qLymQDZ
	SFyS/Xde4oCN7DFDEAO1Sf3H0EwiFCUqfKU8/ZcJFpadRGL3BouIiBQbzSv2oFnzdjdVkSKxTr7JK
	/YHp8faeASFgteLudjzlLIk9V9L6HD17nAakmBgQGXv3UfYKFgy678k100LUmgCd7Du8hUAHxDS2m
	7ASCQigTNvdzXNxcOulM0I9oA90eZ8Q9mccf8N1uedRwKMqfUsBj6icBqq3y6geYHjWavtBudpn4U
	/IAeZFoBNzKu0Y1UYLYcSZ6d7C06yU0rVaAbzdxPy56iEGesiAVqYlZRCYgnDE/n3XR6/vHV7GyTr
	sXrI67Yw==;
Received: from [49.206.112.194] (port=10981 helo=[192.168.0.206])
	by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <parthiban@linumiz.com>)
	id 1t2UOM-003DWo-1N;
	Sun, 20 Oct 2024 17:16:38 +0530
Message-ID: <a6226742-72e9-456a-a2fa-c4d4e73ee9be@linumiz.com>
Date: Sun, 20 Oct 2024 17:16:35 +0530
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: parthiban@linumiz.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, wens@csie.org, jernej.skrabec@gmail.com,
 samuel@sholland.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, masterr3c0rd@epochal.quest
Subject: Re: A133 support
To: Andre Przywara <andre.przywara@arm.com>
References: <2dc2c052-8fde-4656-8dbf-a6980cd968ae@linumiz.com>
 <20241020122321.141727c7@minigeek.lan>
Content-Language: en-US
From: Parthiban <parthiban@linumiz.com>
Organization: Linumiz
In-Reply-To: <20241020122321.141727c7@minigeek.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - md-in-79.webhostbox.net
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - linumiz.com
X-BWhitelist: no
X-Source-IP: 49.206.112.194
X-Source-L: No
X-Exim-ID: 1t2UOM-003DWo-1N
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.0.206]) [49.206.112.194]:10981
X-Source-Auth: parthiban@linumiz.com
X-Email-Count: 3
X-Org: HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfPt/zEKBpdSG9iqqOPmG3yYLBDxKj+grMmL0lLKNHMO9K0ZYqE50nnY8lyin9VLWV8QSYJNyKLDgMa3W/6eRdTwcjMvK1dTGKYL8fQLKQyuAtl3lmBCD
 FCEyywjR0oPIk9L6mObO3YoXeDbDDrBiq9cBBDjIVrjN2tMa2gwx5YLQz9tJgYenm14n1EFZJjl7MP5/7DLL+7FdIVnvQXb/gd4=

On 10/20/24 4:53 PM, Andre Przywara wrote:
> On Sun, 20 Oct 2024 15:06:46 +0530
> Parthiban <parthiban@linumiz.com> wrote:
> 
> Hi,
> 
>> Am currently adding support for Allwinner A133 SoC based on A100.
> 
> Many thanks for picking this up, but what do you mean exactly by
> "adding support"? As you probably have seen, there is already some

By meaning using the existing compatible and preparing devicetree for
[1].

> basic support for the A100 in the tree, and since we assume that both
> SoCs are basically identical, there wouldn't be too much left to do,
> would there?
> For reference, there is some leftover patch series from the original
> A100 upstreaming attempt, which you could rebase and rework:
> https://lore.kernel.org/linux-arm-kernel/cover.1604988979.git.frank@allwinnertech.com/

Yeah, I did pull few things which were dangling in the series.

> 
> I haven't checked in a while, but some patches in there have either
> been merged or are superseded by other patches, and I guess the others
> need at least a rebase, but it's certainly something worthwhile to work
> on.
> 
>> Based on the [1],
>> A100 and A133 uses same IP across. But there is no public available datasheet or
>> user manual for A100.
> 
> Indeed there has never been, and back then we relied on information
> provided by those Allwinner employees sending the patches.
> For now we assume that the A133 manual describes the A100 as well.
> 
>> Should A100 kept as base and A133 dtsi needs to added on top or A133 can be duplicated
>> into a new devicetree?
> 
> As far as we know, the A133 is the better bin of the A100, so they
> should be identical from the software perspective. This seems to be
> similar to the H616/H313 situation. At some point the A100 totally
> disappeared from Allwinner's documentation (in an almost "Orwellian
> 1984 fashion"), and they only mention the A133 ever since.
> 
> So, since the A100 is already in, and was the first one, I'd say:
> - Keep using an allwinner,sun50i-a100 prefix for any compatible string.
>   Rationale: it's the base model, and was the first one, and we have
>   compatible strings with that in, so we should keep using that for
>   consistency.
> - There is no need for any kind of a133.dtsi, since they are probably
>   identical.
> - If you add a board with an A133, use that name in the root compatible
>   string, but include the a100.dtsi. See the H616/H313/H618 situation,
>   for instance as in sun50i-h618-transpeed-8k618-t.dts.

Thanks for the details. That helps.

> 
> Hope that helps, and thanks for your efforts on improving support for
> that chip! Please come back to the #linux-sunxi IRC channel on OFTC,
> there is someone (MasterR3C0RD) actively working on some A133 board as
> well, and he even has a working DRAM driver for U-Boot. So you should
> coordinate any upstreaming efforts.

Great, am still stuck with 2018 tree from vendor, this will help.

[1]: https://szbaijie.com/index/product/product_detail.html?product_id=23&language=en

Thanks,
Parthiban N
> 
> Cheers
> Andre
> 
> 
> 
> 
>>
>> [1]: https://linux-sunxi.org/Linux_mainlining_effort#Status_Matrix
>>
> 
> 


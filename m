Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793631442;
	b=w2cOANTK7PH4sGuJ/35/SOWGu1ZaciCEk9DZV+46vycxz9YRrjl4E72emuNej61qkb9m
	 fA/zh7CX+wcmkiLbkrbWZ1k6dr/WqufglI+ZiqqHON9jfGtZLiXnBsONEMRmB0T8fK0V8
	 54RFitA8E+K3yBth2LTUGJescmqAby0xGAf72ss+YcvHe5sPsSbNXyIMEDKjFi5u7DB4p
	 WLbRjvuc6GK1QVN4Tb9RKUbXsti2jdg9aeLnlEz6bBDW8BRsnvSJCdroobJyshNyu7f61
	 M79ffvcP+rGKuNHeo5L8nA8QCoRW+2dVc4DkC7FmnHefZntiAwNnbBaoidGryTz+MKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793631442;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=B2beon+Pup25sDG+SjYjRtoecAPqMns8MF1LmxMk16g=;
	b=CNvKDq/Qj3eip3p8sY3OeZmoukjEQ4VN2KIZn1Dl3xQgZCmer7duDl02LZDJlNf0DpZN
	 NOcJiBmmAd524YyzLGYYeOtTLQu7X5k18pqPFYHaedMYJIRRkr01pdz8wDKncX1ITnUO2
	 tkrPG6vFBUPMKXmbilJaEMu2N0qISpidacM6pC4Oxg/vOXyBdoGhBdELv7Vz+BhgEK0mx
	 FeyOoJUt8P+n5D+8THLOf0IyqVI5Nt+0J3+Yb5mXCkaOP6fM9qBepDyQOqVelcPrxbPYi
	 O1rivvXakE1rMzsdWXvYazwljrVBVGR42l52GSuzC5l04jWu+s+K9Mthtq5KSKs1fSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=cwVgl66F;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93F1B606A59B
	for <linux-sunxi@lists.linux.dev>; Mon,  2 Nov 2026 14:57:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93F1B606A59B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=cwVgl66F
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9FB201576;
	Mon,  2 Nov 2026 06:57:17 -0800 (PST)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9EF573F59E;
	Mon,  2 Nov 2026 06:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793631440; bh=+Tn4OtGI6YEQPxYG9LL7ufXWOG9wN6boPLoR0yBa418=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cwVgl66FHJKC3Ob8jeGYH6z2EHwGzxztri7DEPi+M2YzZuSE0m0Dkplk+PUapcCQf
	 yHyP5llqGD2X+buTWBx+GX7YGeEVHxXMbVoL3Hwj0/Za8trXe7zVUm/xnl+nXPuEJc
	 gapgynBSWPZHKPnkq4pBr06R65OSUCdrI1Cq4D0M=
Message-ID: <d220155f-78cc-4c23-a801-8b1fb0962a3a@arm.com>
Date: Mon, 2 Nov 2026 15:57:18 +0100
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
Subject: Re: Pull request: u-boot-sunxi/master for 2027.01
To: Quentin Schulz <quentin.schulz@cherry.de>, Tom Rini <trini@konsulko.com>
Cc: u-boot@lists.u-boot-project.org, linux-sunxi@lists.linux.dev,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Paul Kocialkowski <paulk@sys-base.io>,
 Christian Ratzenhofer <christian.ratzenhofer@cdnm.at>
References: <20261102114733.3468703-1-andre.przywara@arm.com>
 <20261102144240.GS3309461@bill-the-cat>
 <a4934306-eb4d-4a0b-b693-82b8f8d831b8@cherry.de>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <a4934306-eb4d-4a0b-b693-82b8f8d831b8@cherry.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Tom, Quentin,

On 11/2/26 15:53, Quentin Schulz wrote:
> Hi Andre,
> 
> On 11/2/26 3:42 PM, Tom Rini wrote:
>> On Mon, Nov 02, 2026 at 12:47:33PM +0100, Andre Przywara wrote:
>>
>>> Hi Tom,
>>>
>>> please pull these sunxi changes into main. Please note that's the master
>>> branch on the remote side, the main branch is immutable, so I couldn't
>>> push a fix there again.
>>
>> Ah. On that note, I think the answer is you should start using a branch
>> name (for-tom, whatever) or tag, rather than just pushing to "main" or
>> "next".

That makes sense, I was already wondering what's the best practice here, 
so thanks for that!

> Maybe check in https://git.u-boot-project.org/u-boot/custodians/u-boot- 
> sunxi/-/settings/repository#js-protected-branches-settings if main is 
> protected, then you can unprotect if you really want to (or adapt it to 
> match what you want). Just telling you how to make it modifiable again, 
> but maybe Tom would really prefer a different branch name as requested 
> in his previous mail.

Yes, I guess I do it at least once, to get it unstuck, and allow it to 
follow the "main main" again.

Thanks for the heads up!

Cheers,
Andre

>>> Not much to report here, some cleanup for some older V3 SoCs, also a 
>>> PMIC
>>> fix for some Olimex A20 board.
>>> H6 boards with 3GB of DRAM now work again, and the A133 build process 
>>> gets
>>> adjusted to the now mainlined TF-A support.
>>>
>>> There are bigger changes lined up, but they depend on DT bindings which
>>> have not been merged to the kernel repo yet.
>>>
>>> Gitlab CI timed out, but worked fine until then.
>>
>> Ah, I thought I had adjusted everyones projects to have 2h be the
>> timeout, but I see I missed at least u-boot-sunxi, I've fixed that now.
>>
> 
> FYI, I had to bump mine to 3h a few months back, but maybe the infra is 
> more stable/faster than it used to and we don't need that anymore?


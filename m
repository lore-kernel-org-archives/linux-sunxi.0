Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637F82E7F20
	for <linux-sunxi@lists.linux.dev>; Fri, 24 Oct 2025 07:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761292367; cv=none; b=hA/GSoPN3KtAqzZcR0fsF7VidBYDEpy1MnCD0oEn0RTuiQAmyJEKskxkb5TiQbXyHVqJiWEWGeRXliK/ApJA5pMiuZ+GsHV+Jy5lc6SZwojKTNgtd97H/jx+UkKIL0r4OSXGwXBLM1majJnOJzi/9gY5LruYLDso8tHJKsJoWZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761292367; c=relaxed/simple;
	bh=wN/ZHj0gPap24mXI/QvGzzaeAUFcv8BSPPEXC6QecJU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=razHAVDXg1CHXE/TcroTWC/HAd6E0H1fRjuw1BjI5kOH3j/lBOeeCHmTrLsMIM6IbVaF9y+TvVgV0ghyHMeSJJz9UD6utIcELvkX2rZeWIjDnh6LSigovx+cGZT5GySJXLdlAH/u7jhgTIsTFWwcwMvFer5MtZ0uX4Zq4hPd9NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=r2dtT+ba; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="r2dtT+ba"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B09504E412D1;
	Fri, 24 Oct 2025 07:52:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7B92960703;
	Fri, 24 Oct 2025 07:52:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 73F97102F23EC;
	Fri, 24 Oct 2025 09:52:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761292360; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=5ORYaQDkijF7os/6QWengA8q7tbB0Mw5sGUM65DCgW0=;
	b=r2dtT+baNbNBquHdAut5IY/5GURVJRkMnkhCpDIazOsLkNOBMSg9a8XjqlTTdgK7Rao36n
	QaiSjjcspFfgNJ3lWHkqT0lB6CPk/z4eErWvmXrcgc4PoQNWlb8klJf19n9bMVLLEpz35m
	tvzSZMtU4MnmhRi/3KdQUuAwki+jH10HEA7wLi/+zYTZ9ENq3vj0XiN9CH8zDtJVXy40sO
	VYZdadazMXQP96iNzcQJcjalhcNTATvJNR92ni8Hp1LMi+PrPNeZfIQguK1X78P7mLfFu5
	LZKY22AT2zCcLdLyTJKs3XrYIcQky6Dow93q3vw3X8RN8f/4NfLEQGTudUQJ6w==
Message-ID: <afd40022-012a-4fa5-90f1-a27f11aa9549@bootlin.com>
Date: Fri, 24 Oct 2025 09:52:27 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/15] mtd: rawnand: sunxi: introduce ecc_mode_mask in
 sunxi_nfc_caps
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Wentao Liang <vulab@iscas.ac.cn>, Johan Hovold <johan@kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20251020101311.256819-1-richard.genoud@bootlin.com>
 <20251020101311.256819-8-richard.genoud@bootlin.com>
 <87jz0ntigx.fsf@bootlin.com>
From: Richard GENOUD <richard.genoud@bootlin.com>
Content-Language: en-US, fr
Organization: Bootlin
In-Reply-To: <87jz0ntigx.fsf@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi,
Le 22/10/2025 à 11:05, Miquel Raynal a écrit :
> Hi Richard,
> 
> On 20/10/2025 at 12:13:03 +02, Richard Genoud <richard.genoud@bootlin.com> wrote:
> 
>> The H6/H616 ECC_MODE field is not at the same offset, and has not the
>> same size.
>> So move the mask into sunxi_nfc_caps.
>>
>> No functional change.
>>
>> Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
>> ---
>>   drivers/mtd/nand/raw/sunxi_nand.c | 13 +++++++++----
>>   1 file changed, 9 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
>> index 70c940840dda..4118307cac15 100644
>> --- a/drivers/mtd/nand/raw/sunxi_nand.c
>> +++ b/drivers/mtd/nand/raw/sunxi_nand.c
>> @@ -29,8 +29,9 @@
>>   #include <linux/iopoll.h>
>>   #include <linux/reset.h>
>>   
>> -/* non compile-time field get */
>> +/* non compile-time field get/prep */
>>   #define field_get(_mask, _reg) (((_reg) & (_mask)) >> (ffs(_mask) - 1))
>> +#define field_prep(_mask, _val) (((_val) << (ffs(_mask) - 1)) &
>> (_mask))
> 
> This could probably require a mention in the commit message, as for the
> introduction of the field_get() helper.
> 
> No need to resend just for this either.
Ok, will do.

> 
> Thanks,
> Miquèl
> 
Thanks!

-- 
Richard Genoud, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

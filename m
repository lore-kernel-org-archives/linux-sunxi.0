Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9886830B509
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Mar 2026 09:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772702769; cv=none; b=rnwBpySsq/SRRNujifYjtoVBNk2Oh5jfEPPMaij859Ua6a5P6ZdvQvBkOs+myQMAkTRwTFl76fvU4u8xiwCub/ScfxduBDTPYloEgxk8RzKrgiLMaizABg0BZJvTQwCgPmAU+TDks6G1a4V7V4TzCsoapVH0dCag5NUkB3uleSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772702769; c=relaxed/simple;
	bh=xRJMWvXWCmoDAOZ2QpFZfVmtyxn6DGIPikbPaDQDhfs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bNcttGNCIyrYHJ36w8/ftBV17E6I5XujrYDZda2uZQBqapo0wlDD/ZPMcUkTxW1Kk5AxUlrKPf3MEmhmiqV+kgEgmIiS35fvJtRYQP4u0AdcZnw4A1fIVSnQot6sMkdgUKDK104wkSVkxlEmRUjVhNL3Docp0nHw3xkionTEfR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=XEQqk9le; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="XEQqk9le"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1CA4A4E42567;
	Thu,  5 Mar 2026 09:26:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D42755FDEB;
	Thu,  5 Mar 2026 09:26:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 905521036984E;
	Thu,  5 Mar 2026 10:25:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772702763; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=xdQrU4qXjTQ+7Me9O0jc4BQBHlE/G3e5V9tAzTNavKA=;
	b=XEQqk9leLVrIMuzk8bu7Hj6g5wiJ3yEC0RKVMO8iNt9vdNP9G705szS3WVJblHVezb+wqQ
	knRXsgJUpwXDcxt5LoA/+JHO+6D9EEohgAlgfqNL9KkER5FiXq1ZLhrNj5NNw3uTPWnmTs
	t60qOH/4vi76epX0K3q2ieHpmKKQnm1JXDW7+Nk1Nes2tXOJQMB+QeKKFU0TJRnNtVt9Ei
	Cvvb/na82PeG0J8h89D24oR8fTwfpCYmlAEjjUgLcopF/2InzieX8bq104U9VCdgtIGAME
	8//EWQik54BRtDpQ9YeDG8AbFsTMmwqlYzONPvxoMQAEzZY6vxFj1oyLCtavfA==
Message-ID: <2d65c928-8b4e-4224-93db-a1430945d719@bootlin.com>
Date: Thu, 5 Mar 2026 10:25:57 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] mtd: rawnand: sunxi: fix sunxi_nand_ooblayout_free
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>
Cc: Wentao Liang <vulab@iscas.ac.cn>, Maxime Ripard <mripard@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260220161011.999642-1-richard.genoud@bootlin.com>
 <20260220161011.999642-2-richard.genoud@bootlin.com>
 <5967652.DvuYhMxLoT@jernej-laptop>
From: Richard GENOUD <richard.genoud@bootlin.com>
Content-Language: en-US, fr
Organization: Bootlin
In-Reply-To: <5967652.DvuYhMxLoT@jernej-laptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Le 21/02/2026 à 10:13, Jernej Škrabec a écrit :
> Dne petek, 20. februar 2026 ob 17:10:06 Srednjeevropski standardni čas je Richard Genoud napisal(a):
>> The available length is really USER_DATA_LEN - 2 instead of just 2 (the
>> user data length minus the BBM length)
>> That doesn't change anything now, but if USER_DATA_LEN changes, it will.
> 
> s/USER_DATA_LEN/USER_DATA_SZ/
> 
>>
>> Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
> 
> If this is really a fix as subject suggest, then Fixes tag is in order. However,
> this looks more like code refactor as end result is the same. So maybe
> reword subject?
Yes, it's more a code clarification, I'll reword that.

Thanks!

> 
> Best regards,
> Jernej
> 
>> ---
>>   drivers/mtd/nand/raw/sunxi_nand.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
>> index 9dcdc93734cb..c420909b944b 100644
>> --- a/drivers/mtd/nand/raw/sunxi_nand.c
>> +++ b/drivers/mtd/nand/raw/sunxi_nand.c
>> @@ -1761,12 +1761,12 @@ static int sunxi_nand_ooblayout_free(struct mtd_info *mtd, int section,
>>   
>>   	/*
>>   	 * The first 2 bytes are used for BB markers, hence we
>> -	 * only have 2 bytes available in the first user data
>> +	 * only have USER_DATA_SZ - 2 bytes available in the first user data
>>   	 * section.
>>   	 */
>>   	if (!section && ecc->engine_type == NAND_ECC_ENGINE_TYPE_ON_HOST) {
>>   		oobregion->offset = 2;
>> -		oobregion->length = 2;
>> +		oobregion->length = USER_DATA_SZ - 2;
>>   
>>   		return 0;
>>   	}
>>
> 
> 
> 
> 

